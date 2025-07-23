.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x7, h0_start
jalr x0, x7, 0
h0_start:
                  li x5, 0x40001105
                  csrw 0x301, x5
kernel_sp:        
                  la x2, kernel_stack_end

trap_vec_init:    
                  la x5, mtvec_handler
                  ori x5, x5, 0
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
                  li x0, 0x7d7c2b6b
                  li x1, 0xffa9db65
                  li x3, 0x4b5819e7
                  li x4, 0xb
                  li x5, 0xfbd75e52
                  li x6, 0x7
                  li x7, 0x80000000
                  li x8, 0xf7cdb936
                  li x9, 0xc1d1e7b2
                  li x10, 0x1
                  li x11, 0xf03fe866
                  li x12, 0x5
                  li x13, 0x0
                  li x14, 0x4
                  li x15, 0x8b2bcb81
                  li x16, 0x0
                  li x17, 0x80000000
                  li x18, 0x2
                  li x19, 0x64e8d58f
                  li x20, 0xf37cc580
                  li x21, 0xf9d2a466
                  li x22, 0x80000000
                  li x23, 0xe7c8b51b
                  li x24, 0x133ee3ad
                  li x25, 0x0
                  li x26, 0x0
                  li x27, 0x0
                  li x28, 0x0
                  li x29, 0x80000000
                  li x31, 0x0
                  la x30, user_stack_end
main:             c.lui        a4, 23
                  la           t1, sub_1
                  slt          tp, s3, a2
                  remu         tp, t0, s9
                  c.lui        gp, 1
                  sra          s7, a1, a3
                  mulhu        s9, a1, t2
                  addi         t1, t1, -352
                  srai         ra, a4, 19
                  c.nop
                  c.srai       a5, 8
main_j2:          jalr         a0, t1, 353 #jump main -> sub_1
                  la           a0, region_1+1074 #start load_store_instr_stream_1
                  lbu          ra, 9(a0)
                  lbu          a6, 4(a0)
                  la           t0, region_1+1588 #start load_store_instr_stream_2
                  sb           ra, -10(a0)
                  sb           a3, 76(t0)
                  lb           s3, -6(a0)
                  la           s11, region_1+642 #start load_store_instr_stream_0
                  lbu          tp, -12(a0)
                  sb           gp, -3(t0)
                  sh           s0, 2(a0)
                  lh           gp, -16(s11)
                  lbu          s5, -2(a0)
                  lb           s1, 97(t0)
                  lbu          gp, -13(s11)
                  lb           s6, -15(a0)
                  sb           s2, 37(t0)
                  lbu          tp, 7(a0)
                  lb           s9, -7(s11)
                  lh           a3, -6(t0)
                  lb           s0, 3(s11)
                  lbu          s4, -5(a0) #end load_store_instr_stream_1
                  sb           s1, -202(t0) #end load_store_instr_stream_2
                  lb           t4, -11(s11) #end load_store_instr_stream_0
                  la           s3, region_0+804 #start riscv_load_store_hazard_instr_stream_0
                  c.xor        a4, a2
                  sh           a1, 8(s3)
                  lw           a3, 8(s3)
                  sra          s10, a6, zero
                  sw           s6, 8(s3)
                  div          t0, s2, t6
                  lb           t0, 8(s3)
                  sh           zero, 8(s3)
                  lh           a2, 8(s3)
                  sb           t6, 8(s3)
                  c.srai       a1, 9
                  lh           s11, 8(s3)
                  lhu          s0, 8(s3)
                  lbu          s0, 8(s3)
                  lbu          a5, 8(s3) #end riscv_load_store_hazard_instr_stream_0
                  la           a2, region_0+1139 #start riscv_load_store_rand_instr_stream_0
                  lh           t4, 15(a2)
                  lw           s8, -39(a2)
                  lh           s7, 59(a2)
                  lh           a7, 35(a2)
                  sltu         s4, s10, s11
                  andi         zero, t2, 152
                  sb           s10, -48(a2)
                  lb           ra, 0(a2)
                  c.mv         s7, tp
                  c.nop
                  sltu         t4, s2, s9
                  mulhu        s8, a4, tp
                  lhu          gp, 39(a2)
                  lh           s3, -31(a2)
                  sh           a5, 47(a2)
                  lb           a5, 41(a2)
                  mulhu        s10, a1, a2
                  lh           a3, -5(a2)
                  lb           s9, 55(a2)
                  lh           ra, -43(a2)
                  lbu          s11, 58(a2)
                  lb           a6, 0(a2)
                  sb           s10, 38(a2)
                  sh           s7, -31(a2)
                  sb           gp, -56(a2)
                  add          s7, s11, t5
                  div          ra, s0, t6
                  ori          a1, s1, -746
                  lb           a5, 27(a2)
                  lbu          a6, -40(a2)
                  mulhu        a1, s11, s8
                  sltiu        a0, a5, -1721
                  slt          a7, zero, a3
                  lb           s6, 44(a2)
                  sb           s11, 25(a2)
                  c.andi       a1, 5
                  lw           s7, -23(a2)
                  sh           a0, -13(a2)
                  sb           gp, -41(a2)
                  sb           gp, -60(a2)
                  lbu          s6, 14(a2)
                  auipc        a1, 869131
                  sb           a2, 60(a2)
                  c.nop
                  sltiu        a5, a1, -1609
                  rem          s6, t2, t4
                  lh           s5, 31(a2)
                  nop
                  lbu          s6, 58(a2) #end riscv_load_store_rand_instr_stream_0
                  la           gp, region_0+572 #start load_store_instr_stream_0
                  la           s1, region_1+312 #start load_store_instr_stream_1
                  lhu          s10, 222(s1)
                  sb           s4, -1(gp)
                  sh           t3, 1086(s1)
                  sb           a1, -10(gp)
                  sb           t0, 6(gp)
                  sb           s0, 974(s1)
                  lb           t1, 3(gp)
                  lbu          a2, 1582(s1)
                  lb           t3, -127(s1)
                  sh           a1, -6(gp)
                  lw           s10, 640(s1)
                  lbu          s5, 63(s1)
                  lb           s0, 1393(s1)
                  lb           t1, -14(gp)
                  lbu          s10, 1519(s1)
                  sh           a3, 564(s1) #end load_store_instr_stream_1
                  sb           ra, -16(gp) #end load_store_instr_stream_0
                  la           a3, amo_0+60 #start riscv_lr_sc_instr_stream_0
                  xor          t0, zero, s0
                  or           ra, s10, a0
                  lr.w          s11, (a3)
                  srli         a0, t0, 19
                  nop
                  slli         zero, t6, 30
                  c.mv         t3, s7
                  and          s10, t2, a4
                  c.addi       s1, -1
                  c.srai       a0, 28
                  xor          s8, a0, sp
                  andi         t0, s8, 645
                  c.srai       s1, 6
                  ori          a6, t0, -1684
                  sc.w.rl       a6, s11, (a3) #end riscv_lr_sc_instr_stream_0
                  la           tp, amo_0+4 #start riscv_amo_instr_stream_0
                  amomin.w      ra, a3, (tp)
                  c.lui        t4, 12
                  mulhsu       zero, zero, s5
                  amoxor.w      t6, s4, (tp)
                  amoadd.w.aq   s9, ra, (tp)
                  amoand.w.rl   a5, s11, (tp)
                  amoswap.w.aq  gp, s1, (tp)
                  amoswap.w     a1, s9, (tp)
                  amoor.w.aq    s0, a0, (tp)
                  addi         s6, gp, 1349
                  amomaxu.w.rl  s4, s9, (tp)
                  c.srli       s0, 13
                  slt          a2, s2, t4
                  mulhu        t0, s5, s6
                  nop
                  amoswap.w     s2, t3, (tp) #end riscv_amo_instr_stream_0
                  addi         a5, zero, 0 #init loop 0 counter
                  xor          a7, s0, t6
                  addi         gp, zero, -16 #init loop 0 limit
                  nop
main_5_0_t:       or           a1, sp, t5
                  addi         a5, a5, -2 #update loop 0 counter
                  c.li         a2, 21
                  auipc        a4, 147070
                  c.mv         a7, s9
                  bne          a5, gp, main_5_0_t #branch for loop 0
                  c.slli       a1, 14
main_2:           jal          a0, 25f
0:                c.j          8f
1:                c.jal        29f
2:                c.j          26f
3:                jal          ra, 5f
4:                jal          ra, 7f
5:                c.j          6f
6:                jal          t1, 20f
7:                jal          a0, 28f
8:                jal          ra, 22f
9:                jal          s9, 4b
10:               c.j          15f
11:               c.jal        2b
12:               c.j          9b
13:               jal          t1, 21f
14:               c.jal        11b
15:               jal          ra, 3b
16:               c.j          19f
17:               c.j          10b
18:               c.jal        23f
19:               jal          ra, 0b
20:               c.j          24f
21:               c.jal        1b
22:               c.jal        27f
23:               jal          ra, 14b
24:               c.jal        18b
25:               jal          ra, 17b
26:               c.j          12b
27:               jal          s10, 13b
28:               c.jal        16b
29:               mulhsu       gp, s9, zero
                  la           s9, region_0+428 #start riscv_hazard_instr_stream_0
                  sb           s1, 19(s9)
                  sltu         a2, t4, a5
                  auipc        a4, 182372
                  c.srli       a2, 6
                  sw           a4, -96(s9)
                  lb           a4, 14(s9)
                  xori         s1, s1, 1873
                  lbu          a5, 29(s9)
                  sb           a2, -186(s9)
                  slt          a4, t4, a2
                  mulh         a4, t4, a4
                  sb           s1, -21(s9)
                  sb           a2, 251(s9)
                  c.li         a2, -1
                  c.addi       a4, 7
                  sltu         a4, a4, a4
                  c.and        a4, a4
                  sb           a4, -183(s9)
                  lh           s3, -154(s9)
                  sh           a2, 104(s9)
                  and          s1, t4, a5
                  ori          t4, t4, -550
                  lw           a2, -148(s9)
                  c.or         a5, a4
                  nop
                  sh           a2, -104(s9)
                  sb           t4, 65(s9)
                  sltiu        a5, a2, 1615
                  sb           s1, 198(s9) #end riscv_hazard_instr_stream_0
                  c.srli       a3, 13
                  sltu         s4, s4, t3
                  ori          s1, t2, -839
                  c.sub        a5, a5
                  ori          tp, tp, -1515
                  xor          a7, s11, gp
                  c.and        s0, a5
                  auipc        t6, 591151
                  c.or         s0, s0
                  or           a0, gp, t4
                  c.and        s1, s1
                  c.mv         ra, t5
                  lui          a7, 627326
                  c.mv         tp, t5
                  divu         a2, a2, t6
                  mul          t1, s7, s2
                  xori         ra, s1, -1033
                  slti         a7, a3, -321
                  srl          s11, s8, s3
                  bge          s2, a3, 26f
                  c.nop
                  sltu         s6, a7, t0
                  bgeu         t2, s6, 23f
23:               sltiu        t3, a3, -1706
                  xori         zero, s4, -1271
                  xor          s0, t1, t2
26:               c.li         a6, 7
                  sub          t4, s4, s2
                  c.addi       s3, -1
                  c.add        s9, a7
                  rem          s5, a4, tp
                  c.beqz       a0, 43f
                  srl          t0, s3, s6
                  remu         tp, t4, t3
                  sub          a7, s0, sp
                  or           gp, t3, a5
                  c.and        a0, a0
                  sltiu        s10, s6, -1410
                  c.slli       s10, 21
                  c.sub        a5, a5
                  auipc        a7, 465984
                  la           s11, sub_1
                  addi         s11, s11, -313
                  c.addi       ra, 15
                  slt          s5, s7, s5
                  mulhsu       zero, s8, tp
                  beq          t6, s11, main_j1 #branch to jump instr
                  addi         s7, t5, 964
                  andi         t1, s9, -1844
main_j1:          jalr         a0, s11, 313 #jump main -> sub_1
                  c.slli       t4, 27
                  bge          t4, s7, 43f
                  mulhu        s11, s9, a2
43:               mulhsu       zero, sp, s8
                  la x7, test_done
                  jalr x0, x7, 0
test_done:        
                  li gp, 1
                  ecall
sub_5:            addi         t5, t5, -16
                  sw           a0, 4(t5)
                  c.mv         s4, a0
                  c.add        s0, s1
                  mulh         a4, s2, s5
                  c.addi       a3, -1
                  la           s8, amo_0+16 #start riscv_amo_instr_stream_6
                  la           s9, amo_0+32
                  amomax.w.rl   s6, t0, (s9)
                  amoxor.w      a7, s6, (s8)
                  c.li         t3, -1
                  nop
                  amoand.w.aq   t3, s4, (s9)
                  amomaxu.w.aq  a7, t3, (s8)
                  mulhsu       s4, t4, t2
                  srl          s10, sp, a0
                  amoadd.w.aq   a1, s6, (s8)
                  mulhu        a1, t0, s9
                  amomin.w.rl   s4, s9, (s8) #end riscv_amo_instr_stream_6
                  la           s3, region_0+781 #start load_store_instr_stream_2
                  la           s5, region_0+806 #start load_store_instr_stream_0
                  sb           s8, -334(s3)
                  la           s8, region_0+1514 #start load_store_instr_stream_3
                  lb           ra, -41(s8)
                  lbu          a1, 47(s5)
                  lbu          a3, -159(s3)
                  la           t4, region_0+1661 #start load_store_instr_stream_1
                  lbu          t3, 63(s5)
                  sw           tp, 867(s3)
                  sb           a7, -16(t4)
                  lb           t3, 3(t4)
                  lhu          t6, -18(s8)
                  lhu          ra, -8(s5)
                  lbu          s4, -33(s8)
                  sb           a2, -2(t4)
                  lb           s2, -6(s8)
                  lb           zero, 36(s8)
                  sb           a6, -12(t4)
                  lbu          a2, 6(t4)
                  lb           s9, -240(s3)
                  sb           a0, 41(s5)
                  sb           s10, 6(t4) #end load_store_instr_stream_1
                  lbu          t0, -39(s8)
                  lb           s11, 55(s5)
                  lbu          gp, 463(s3)
                  lh           zero, -107(s3) #end load_store_instr_stream_2
                  lb           t3, 3(s8)
                  lbu          s0, 3(s5)
                  sh           s0, 18(s5)
                  lbu          s2, 64(s8) #end load_store_instr_stream_3
                  lb           s10, -3(s5) #end load_store_instr_stream_0
                  la           a3, region_1+26 #start load_store_instr_stream_0
                  la           s11, region_0+1664 #start load_store_instr_stream_1
                  sh           a1, 322(s11)
                  lbu          s7, 199(a3)
                  sw           s6, -1280(s11)
                  lbu          t3, 107(s11)
                  sb           tp, -705(s11)
                  lh           t1, 74(a3)
                  sb           t2, -924(s11)
                  sb           a7, 37(a3)
                  lw           a6, 234(a3)
                  lw           s7, 174(a3)
                  lb           t0, -41(s11)
                  lbu          a1, 134(a3)
                  sb           a6, 137(a3)
                  sb           a1, -393(s11) #end load_store_instr_stream_1
                  lbu          s3, -11(a3)
                  lhu          s0, -12(a3) #end load_store_instr_stream_0
                  la           t4, region_0+588 #start riscv_hazard_instr_stream_7
                  and          t3, s1, a6
                  remu         s7, a5, a5
                  lb           a6, -442(t4)
                  lbu          s7, 476(t4)
                  slt          t3, s1, a1
                  lui          a5, 28685
                  lb           s1, 535(t4)
                  xor          a6, a6, a1
                  andi         t3, a6, -922
                  srl          s7, s1, a1
                  lb           s7, -575(t4)
                  lw           s1, 1208(t4)
                  slt          s7, s7, s7
                  srai         s7, a6, 9
                  sh           a6, -20(t4)
                  c.addi       a1, -1
                  c.nop
                  auipc        s1, 945260
                  c.srai       a5, 3
                  or           s1, s7, s7
                  c.nop
                  slt          s7, s1, s1
                  c.srli       a5, 29
                  lhu          t3, 944(t4)
                  mul          s1, s1, a6
                  lbu          s7, 331(t4)
                  lb           s1, 1118(t4)
                  ori          t3, a6, -1536
                  c.srai       s1, 30
                  c.andi       s1, 6
                  lhu          s7, 606(t4)
                  lh           a1, -242(t4)
                  sh           s7, 1024(t4)
                  srai         s7, t3, 24
                  srli         a1, a1, 18
                  c.lui        t3, 19
                  sub          a6, a1, a1
                  lb           a5, -218(t4)
                  mul          s7, s1, t3
                  lb           t3, -489(t4) #end riscv_hazard_instr_stream_7
                  la           s6, region_0+487 #start load_store_instr_stream_0
                  la           s7, region_1+1315 #start load_store_instr_stream_1
                  sh           t3, -67(s6)
                  lh           s1, 21(s6)
                  lbu          s9, -1(s7)
                  sb           zero, -213(s6)
                  lbu          gp, -11(s7)
                  lbu          s0, -27(s7)
                  sb           t6, 179(s6)
                  sb           a5, -7(s7)
                  lb           t0, 44(s7)
                  sh           a7, -9(s7) #end load_store_instr_stream_1
                  lb           s1, 72(s6)
                  sh           s8, -159(s6) #end load_store_instr_stream_0
                  la           a3, region_0+136 #start riscv_hazard_instr_stream_18
                  lui          a6, 195676
                  sltu         t0, t0, a6
                  add          t0, s2, a6
                  lw           gp, 164(a3)
                  sb           t0, 239(a3)
                  lbu          a1, -106(a3)
                  xor          a6, a1, s2
                  c.add        a6, gp
                  mulhu        a6, gp, a6
                  xor          gp, a6, s1
                  addi         t0, a6, -120
                  lh           a1, 78(a3)
                  lh           a6, -18(a3)
                  lbu          t0, -90(a3)
                  lb           a1, -83(a3)
                  lb           s2, 199(a3)
                  sb           gp, 165(a3)
                  sll          a6, s1, s2
                  lb           s2, 3(a3)
                  sb           s1, -19(a3)
                  lh           s1, 148(a3)
                  c.xor        s1, s1
                  lbu          t0, 149(a3)
                  remu         gp, gp, a1
                  lb           t0, -67(a3)
                  sh           s1, 10(a3)
                  sb           s1, 45(a3)
                  c.add        a1, a6
                  lw           a1, -56(a3)
                  rem          a6, a6, gp
                  lb           s2, -18(a3)
                  sw           s2, 64(a3)
                  nop
                  slti         gp, a6, -967
                  sb           s2, -73(a3)
                  sb           s2, 36(a3)
                  sltiu        s1, gp, -316
                  rem          a1, a1, s2
                  add          s1, s1, gp
                  sb           gp, 146(a3)
                  or           t0, t0, s1
                  lb           s1, -117(a3)
                  c.and        s1, s1
                  lbu          gp, 31(a3)
                  sh           a6, 254(a3)
                  sb           a1, 169(a3)
                  remu         gp, t0, s1
                  mulh         gp, a6, t0
                  lb           t0, -51(a3)
                  lb           s1, 118(a3)
                  lb           a1, -101(a3) #end riscv_hazard_instr_stream_18
                  addi         s1, zero, 10 #init loop 1 counter
                  sub          t4, a5, a0
                  and          t6, t6, s9
                  nop
                  addi         zero, zero, 0 #init loop 1 limit
sub_5_100_1_t:    mulh         s0, s3, s5
                  addi         s1, s1, -10 #update loop 1 counter
                  c.srli       a2, 16
                  addi         s2, zero, -8 #init loop 0 counter
                  c.srai       a5, 12
                  addi         s9, zero, 5 #init loop 0 limit
                  c.sub        a3, a1
                  slti         s4, t5, -1271
sub_5_100_0_t:    c.sub        a5, a5
                  andi         s6, gp, 1757
                  addi         s2, s2, 4 #update loop 0 counter
                  sltiu        s5, t4, -1665
                  add          s4, s6, s0
                  srl          s6, gp, s7
                  bltu         s2, s9, sub_5_100_0_t #branch for loop 0
                  sub          a4, s5, s1
                  mul          a0, sp, s2
                  c.bnez       s1, sub_5_100_1_t #branch for loop 1
                  xori         s3, s11, 1033
                  la           s7, region_1+1899 #start riscv_hazard_instr_stream_0
                  c.li         tp, 8
                  add          a4, s1, a4
                  c.or         s1, s1
                  sw           s9, -927(s7)
                  lb           a4, -1033(s7)
                  sub          s9, s1, t0
                  c.and        a4, a4
                  sltiu        s1, a4, -371
                  ori          s1, s1, 1809
                  lb           t0, -1470(s7)
                  slli         s1, a4, 8
                  sb           s1, -222(s7)
                  lw           t0, -851(s7)
                  lb           s9, -1160(s7)
                  lhu          ra, -1547(s7)
                  addi         s9, tp, 1274
                  c.mv         tp, t0
                  sb           tp, -1064(s7)
                  slt          a4, tp, t0
                  lh           ra, -617(s7)
                  sb           s9, -923(s7)
                  andi         tp, t0, 470
                  lb           s1, -142(s7)
                  lb           ra, -1414(s7)
                  lb           tp, -927(s7)
                  sb           s1, -322(s7)
                  auipc        a4, 606816
                  lh           a4, -1001(s7)
                  lbu          tp, -692(s7)
                  lui          t0, 180799
                  mul          t0, a4, s9
                  lb           s9, -877(s7)
                  sw           s1, -1599(s7)
                  lhu          a4, -401(s7)
                  lhu          s9, -1829(s7)
                  divu         tp, a4, s1
                  sb           s9, -854(s7)
                  lbu          tp, -1834(s7)
                  sb           s9, -1616(s7)
                  sb           s1, -586(s7)
                  c.add        tp, a4
                  slti         ra, s1, 1979
                  sb           ra, -1863(s7)
                  slt          s1, ra, s1
                  lb           s1, -212(s7)
                  c.lui        tp, 3
                  mulhu        s9, s9, a4
                  srai         s9, t0, 12
                  c.or         a4, a4
                  sltiu        ra, s1, 1637
                  lb           t0, -1463(s7) #end riscv_hazard_instr_stream_0
                  la           s11, region_0+1335 #start riscv_hazard_instr_stream_9
                  lh           tp, 3(s11)
                  lbu          a1, 16(s11)
                  c.srai       a1, 16
                  div          s5, tp, s6
                  lh           t1, -5(s11)
                  ori          tp, a5, -219
                  ori          t1, tp, 1104
                  c.andi       a5, 26
                  mulh         t1, s5, tp
                  sb           t1, 16(s11)
                  lb           a1, -4(s11)
                  lbu          s5, -10(s11)
                  c.add        s5, a5
                  sb           s5, -1(s11)
                  c.xor        a5, a1
                  sub          a1, a1, tp
                  lh           a1, -1(s11)
                  auipc        s5, 582177
                  lbu          s5, -12(s11)
                  sb           a1, -5(s11) #end riscv_hazard_instr_stream_9
                  la           gp, amo_0+0 #start riscv_amo_instr_stream_13
                  la           a5, amo_0+52
                  la           t3, amo_0+28
                  sub          a1, s6, t2
                  amomaxu.w     tp, a7, (t3)
                  amomax.w      s10, s2, (a5)
                  amoadd.w.aq   s1, t4, (t3)
                  mul          s2, s11, t6
                  amoswap.w.aq  t6, sp, (a5)
                  amominu.w     s5, a1, (a5)
                  mul          a4, t1, s4
                  sltiu        t4, a7, 1533
                  c.slli       s3, 10
                  amominu.w.aq  s5, s0, (a5)
                  nop
                  amoadd.w.rl   t6, t1, (t3)
                  amoor.w       ra, a5, (gp)
                  amoadd.w.aq   a7, zero, (a5)
                  slli         t1, t6, 14
                  amominu.w     a3, s1, (gp) #end riscv_amo_instr_stream_13
sub_5_36:         jal          a0, 12f
0:                c.jal        8f
1:                jal          ra, 16f
2:                jal          ra, 11f
3:                jal          a7, 9f
4:                c.jal        10f
5:                c.j          2b
6:                jal          ra, 4b
7:                jal          a4, 13f
8:                jal          s7, 15f
9:                c.jal        1b
10:               c.jal        14f
11:               jal          t0, 3b
12:               jal          gp, 0b
13:               jal          ra, 6b
14:               jal          a7, 5b
15:               c.j          7b
16:               divu         s2, a3, s9
                  addi         a1, zero, -10 #init loop 1 counter
                  addi         a6, t5, 1030
                  auipc        s9, 1047296
                  andi         s6, s0, -1788
                  slt          a5, a2, t6
                  lui          s5, 827907
                  addi         s7, s5, -2018
                  nop
                  mul          a3, t5, s11
                  addi         zero, zero, 0 #init loop 1 limit
                  ori          a0, t5, 1854
                  srl          t1, s4, a6
sub_5_92_1_t:     c.addi       t4, 19
                  addi         a1, a1, 10 #update loop 1 counter
                  addi         t6, zero, -5 #init loop 0 counter
                  c.sub        a3, a5
                  remu         t0, s3, tp
                  addi         a4, zero, 13 #init loop 0 limit
sub_5_92_0_t:     c.andi       a5, -1
                  c.srai       a5, 11
                  lui          a0, 745038
                  rem          s1, a5, s3
                  sub          s11, s7, t3
                  div          s11, s11, s1
                  addi         t6, t6, 9 #update loop 0 counter
                  sra          tp, ra, a7
                  xor          a2, t6, s8
                  srli         t4, ra, 3
                  mulhsu       a5, tp, a2
                  bne          t6, a4, sub_5_92_0_t #branch for loop 0
                  remu         s10, a3, a1
                  c.bnez       a1, sub_5_92_1_t #branch for loop 1
                  c.nop
                  addi         a2, zero, -5 #init loop 0 counter
                  xori         s4, a3, 680
                  c.and        a0, a1
                  c.xor        a4, s0
                  addi         t1, zero, 15 #init loop 0 limit
sub_5_91_0_t:     c.addi4spn   a3, sp, 32
                  rem          zero, t5, zero
                  c.srli       a3, 24
                  c.and        a0, a4
                  srli         a3, s4, 2
                  addi         a2, a2, 10 #update loop 0 counter
                  c.slli       s0, 13
                  c.xor        a0, s1
                  xori         zero, t3, -1911
                  and          gp, s8, a4
                  srli         a3, s4, 13
                  srai         ra, a0, 21
                  srl          ra, s6, a7
                  xor          s4, gp, t1
                  mulhu        s2, t0, s9
                  mulh         a5, t2, a4
                  or           s1, t1, s8
                  srl          a3, t1, a6
                  nop
                  beq          a2, t1, sub_5_91_0_t #branch for loop 0
                  ori          a5, a0, -1025
                  la           tp, region_1+927 #start riscv_load_store_rand_instr_stream_6
                  lh           t3, 41(tp)
                  slt          s2, s5, s9
                  lw           ra, -243(tp)
                  divu         a7, a0, t0
                  srli         a4, a7, 10
                  lbu          a7, -68(tp)
                  sh           t5, -57(tp)
                  lb           t6, -253(tp)
                  lb           s9, -34(tp)
                  c.srli       a3, 3
                  lbu          zero, -123(tp)
                  lb           s8, 219(tp)
                  c.li         s10, -1
                  mulhsu       s9, a4, s10
                  lbu          a3, 195(tp)
                  c.add        s6, s1
                  c.and        a1, s0
                  lb           s6, 132(tp)
                  c.add        a0, a5
                  mulhu        a2, t3, a7
                  lbu          t0, 120(tp)
                  lb           a7, 40(tp)
                  sw           t6, 121(tp)
                  sra          a3, a7, sp
                  mulhu        s1, ra, a4
                  lb           gp, -6(tp)
                  c.andi       s1, 3
                  sll          s0, sp, sp
                  lhu          s10, 9(tp)
                  lb           a0, -174(tp)
                  remu         a3, s5, t0
                  lbu          s6, 208(tp)
                  lbu          t3, 37(tp)
                  or           t6, t6, s10
                  lb           a3, -106(tp)
                  lbu          a7, 194(tp)
                  remu         a7, s2, t6
                  auipc        ra, 919686
                  lbu          a5, -150(tp)
                  mul          s5, sp, s7
                  lh           t4, -163(tp)
                  lh           t0, 135(tp)
                  c.add        s6, t6
                  add          s9, t5, gp
                  lb           t1, -66(tp)
                  c.sub        a3, a2
                  lbu          ra, 46(tp)
                  c.lui        s8, 2
                  lbu          t4, 197(tp) #end riscv_load_store_rand_instr_stream_6
                  addi         a5, zero, 4 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
                  c.or         a1, s1
sub_5_97_0_t:     xor          a4, s11, sp
                  addi         a5, a5, -2 #update loop 0 counter
                  c.beqz       a5, sub_5_97_0_t #branch for loop 0
                  c.and        a1, a0
                  la           gp, region_0+589 #start load_store_instr_stream_0
                  sb           a2, -1(gp)
                  la           a7, region_1+1732 #start load_store_instr_stream_1
                  sb           s4, 9(gp)
                  lbu          t6, -221(a7)
                  lb           s7, -10(gp)
                  sb           ra, 6(gp)
                  lh           zero, -38(a7)
                  lb           s2, 159(a7)
                  sb           a4, -103(a7)
                  lh           t6, -11(gp)
                  sb           t2, -178(a7)
                  lb           a2, 57(a7)
                  lhu          a3, -80(a7)
                  lb           s1, 8(gp)
                  lhu          t4, -14(a7)
                  lb           t6, 2(gp)
                  lb           a0, 222(a7)
                  sb           s2, 5(gp)
                  sw           t5, 188(a7) #end load_store_instr_stream_1
                  lh           t1, 1(gp) #end load_store_instr_stream_0
                  la           s7, region_0+481 #start riscv_hazard_instr_stream_14
                  mulhsu       a2, a5, a6
                  slli         a2, a2, 24
                  c.li         t1, 14
                  mulh         a6, t6, s2
                  mul          t1, s2, t6
                  sb           s2, 29(s7)
                  c.lui        t1, 25
                  c.addi       a5, 1
                  ori          s2, s2, 1886
                  sb           a6, -72(s7)
                  c.and        a5, a2
                  c.srai       a5, 12
                  c.li         a6, -1
                  lui          a6, 790765
                  c.andi       a5, -1
                  slli         s2, s2, 0
                  c.srli       a2, 4
                  xori         a6, t1, -839
                  lb           a2, -250(s7)
                  add          s2, t6, a5
                  srai         a5, s2, 0
                  slti         t1, t1, -1602
                  sb           a5, -255(s7)
                  mulhu        a6, t6, s2
                  sb           t6, 181(s7)
                  lbu          a5, 96(s7)
                  lbu          t6, -208(s7)
                  c.andi       a2, -1
                  lhu          t6, 129(s7)
                  sb           t1, -246(s7)
                  addi         s2, a5, -447
                  sll          s2, t6, t6
                  lbu          t1, -68(s7) #end riscv_hazard_instr_stream_14
                  la           ra, region_1+1912 #start riscv_load_store_rand_instr_stream_7
                  lbu          s6, 34(ra)
                  lw           a3, 36(ra)
                  sb           gp, -51(ra)
                  c.mv         a5, s8
                  mulhsu       s4, t0, ra
                  srl          s3, zero, s10
                  sb           s9, -183(ra)
                  lb           a0, -4(ra)
                  c.or         a2, a5
                  sra          gp, s9, s7
                  lbu          a6, -19(ra)
                  xori         s7, s8, -839
                  sb           tp, -245(ra)
                  auipc        s1, 446948
                  lb           s8, -131(ra)
                  lui          tp, 452929
                  sw           t2, -72(ra)
                  sub          a3, tp, s4
                  slli         s10, a6, 19
                  lb           s1, -137(ra)
                  lui          s7, 637472
                  sw           gp, -180(ra)
                  sra          s6, t6, t4
                  sh           a7, -52(ra)
                  sb           t2, -4(ra)
                  lh           s8, -200(ra)
                  c.nop
                  lb           a0, -129(ra)
                  sll          s11, a6, t6
                  lb           s10, -83(ra)
                  lb           gp, 47(ra)
                  andi         s4, a4, 1487
                  slt          s0, s3, a0
                  c.srli       s0, 13
                  sltu         s8, s8, t5
                  sw           a7, 72(ra)
                  sh           a5, 60(ra)
                  lhu          t1, -142(ra)
                  divu         a4, a0, a5
                  rem          s4, zero, s3
                  sh           s8, 30(ra)
                  sw           a0, 76(ra)
                  lh           s0, -230(ra)
                  c.mv         t1, s7
                  xor          tp, a0, a1
                  sb           a4, -137(ra)
                  ori          s10, s10, -1798
                  lbu          s4, -15(ra)
                  srli         s5, tp, 9
                  lb           s8, 33(ra) #end riscv_load_store_rand_instr_stream_7
                  la           a4, region_0+1348 #start load_store_instr_stream_1
                  la           a7, region_0+665 #start load_store_instr_stream_2
                  lb           a3, 9(a4)
                  la           tp, region_0+1453 #start load_store_instr_stream_0
                  sb           zero, 56(a7)
                  lbu          t3, -78(tp)
                  sb           s1, 20(a7)
                  sb           s9, -4(a7)
                  sw           t5, 95(tp)
                  lb           s4, 16(a7)
                  lhu          s4, -241(tp)
                  lb           s4, -83(tp)
                  sb           gp, 11(a4)
                  lbu          ra, -107(tp)
                  lbu          zero, 60(tp)
                  lbu          s2, 177(a4)
                  lh           s10, -71(tp)
                  sb           s4, 33(a7)
                  lh           s1, -5(a7)
                  lbu          s0, 32(a7)
                  lbu          a0, 181(tp)
                  sh           a0, -94(a4)
                  lb           t4, 49(a7) #end load_store_instr_stream_2
                  lbu          a2, -134(tp)
                  lhu          s8, 122(a4)
                  lbu          a0, -50(a4) #end load_store_instr_stream_1
                  sb           t2, -104(tp) #end load_store_instr_stream_0
                  addi         a1, zero, -7 #init loop 1 counter
                  slli         a6, s6, 24
                  srai         s10, s9, 24
                  c.srli       s1, 5
                  c.and        a2, s1
                  c.or         a3, a2
                  or           ra, s1, a6
                  mulhu        s3, a1, a0
                  c.andi       s1, -1
                  sltu         t0, a1, gp
                  slt          s11, t5, s8
                  sra          a7, s5, t2
                  addi         zero, zero, 0 #init loop 1 limit
                  nop
                  auipc        s1, 35726
                  srai         a2, t3, 3
sub_5_99_1_t:     c.mv         s4, a6
                  addi         a1, a1, 1 #update loop 1 counter
                  c.slli       s10, 14
                  addi         a5, zero, 5 #init loop 0 counter
                  c.andi       a0, 2
                  addi         s9, zero, 13 #init loop 0 limit
                  mulh         t0, a1, a7
sub_5_99_0_t:     ori          a2, t1, 1303
                  slli         t6, ra, 29
                  mulhu        a2, s0, tp
                  slt          s8, t2, a1
                  addi         a5, a5, 1 #update loop 0 counter
                  c.or         s0, a1
                  blt          a5, s9, sub_5_99_0_t #branch for loop 0
                  rem          tp, t6, s1
                  c.bnez       a1, sub_5_99_1_t #branch for loop 1
                  srl          a4, s5, s1
                  la           t3, region_0+311 #start riscv_load_store_hazard_instr_stream_11
                  lhu          gp, 1(t3)
                  sb           s2, -5(t3)
                  lb           a2, -1(t3)
                  lb           s9, 14(t3)
                  lb           a4, 1(t3)
                  sb           s3, -8(t3)
                  lb           t4, 14(t3)
                  sb           t6, 10(t3)
                  mul          gp, a7, s9
                  slli         s6, t0, 3
                  sb           a3, 10(t3)
                  sltiu        tp, s0, -1079
                  lb           s3, 10(t3)
                  sh           t0, -9(t3)
                  sb           t1, 3(t3)
                  lbu          a5, 6(t3) #end riscv_load_store_hazard_instr_stream_11
                  la           t1, amo_0+44 #start riscv_amo_instr_stream_9
                  amomin.w.aq   t3, t3, (t1)
                  amominu.w.aq  a1, s5, (t1)
                  div          s5, t0, zero
                  c.xor        a3, a5
                  amomax.w.rl   a2, t4, (t1)
                  amomaxu.w.rl  t3, ra, (t1)
                  amoand.w.rl   a5, a7, (t1)
                  c.slli       s3, 31
                  amoor.w       s4, s10, (t1)
                  amoswap.w.aq  t6, a7, (t1) #end riscv_amo_instr_stream_9
                  la           s10, region_1+1797 #start load_store_instr_stream_1
                  la           tp, region_0+1602 #start load_store_instr_stream_0
                  lb           s3, 11(tp)
                  sh           t1, -101(s10)
                  lb           a5, 152(s10)
                  lb           t6, -16(tp)
                  lb           ra, 191(s10)
                  lbu          s1, 100(s10)
                  sb           a2, -3(tp)
                  lhu          zero, -10(tp)
                  lw           s6, -221(s10)
                  sb           tp, -7(tp)
                  lb           a7, -156(s10) #end load_store_instr_stream_1
                  lb           a1, -13(tp)
                  lbu          s2, 1(tp)
                  lb           s3, 5(tp) #end load_store_instr_stream_0
                  la           t0, region_0+1706 #start riscv_load_store_rand_instr_stream_17
                  srli         s10, a5, 9
                  lui          t6, 67775
                  c.mv         a5, t0
                  lbu          s2, -41(t0)
                  sh           ra, 48(t0)
                  mulhsu       a4, a1, a7
                  mulhu        a1, a0, s8
                  lb           a0, -49(t0)
                  lb           t4, 49(t0)
                  sb           s11, 5(t0)
                  lbu          t4, 21(t0)
                  c.xor        a4, a5
                  lb           s6, -63(t0)
                  lbu          s0, -10(t0)
                  srai         s11, t5, 5
                  sh           s11, -18(t0)
                  lh           t1, 56(t0)
                  rem          zero, a3, t5
                  lui          s10, 806998
                  c.xor        a3, a1
                  lhu          zero, 12(t0)
                  lb           tp, -15(t0)
                  c.slli       s2, 5
                  lb           s5, -7(t0) #end riscv_load_store_rand_instr_stream_17
                  la           a0, region_1+1416 #start riscv_load_store_rand_instr_stream_12
                  rem          a3, a2, t3
                  lb           a6, 11(a0)
                  sb           s4, -7(a0)
                  sll          zero, a0, ra
                  c.andi       a2, 25
                  lb           t3, 7(a0)
                  sll          s10, a5, s10
                  sb           s3, -3(a0)
                  sll          s5, s2, s8
                  sh           s8, -10(a0)
                  lb           gp, 7(a0)
                  sb           s4, -7(a0)
                  mul          tp, s5, t5
                  sll          zero, a2, t1
                  lb           s1, 1(a0)
                  lb           s5, 16(a0)
                  andi         a4, t4, 1431
                  sh           a1, 12(a0)
                  sh           s4, 8(a0)
                  sh           t3, 0(a0)
                  lb           s6, -6(a0)
                  mulhsu       tp, a5, t5
                  c.slli       t1, 13
                  auipc        a1, 39720
                  lbu          s11, -5(a0)
                  slti         a6, s8, -640
                  auipc        a7, 806706
                  auipc        a2, 695656
                  sw           s7, -12(a0)
                  lb           a3, 16(a0)
                  mulh         a5, a7, t3
                  lw           ra, 12(a0)
                  c.add        t3, a2
                  sb           s4, 7(a0)
                  lui          a1, 553679
                  srai         t1, zero, 19
                  sra          a1, a0, sp
                  lh           t0, 2(a0)
                  lhu          t4, -14(a0)
                  auipc        s11, 499460
                  lh           s7, 8(a0)
                  slt          s6, a3, a1
                  srai         t1, s8, 24
                  lb           a6, -1(a0)
                  sw           s1, -12(a0)
                  sb           s1, -1(a0) #end riscv_load_store_rand_instr_stream_12
                  la           tp, amo_0+16 #start riscv_lr_sc_instr_stream_7
                  add          s2, a2, t3
                  lr.w.aq       s9, (tp)
                  sc.w          s9, a6, (tp) #end riscv_lr_sc_instr_stream_7
                  la           s1, region_1+1479 #start riscv_load_store_rand_instr_stream_9
                  c.nop
                  lb           s8, 0(s1)
                  sb           t4, 16(s1)
                  c.nop
                  lbu          t6, 9(s1)
                  c.lui        s6, 3
                  lb           t4, 2(s1)
                  mulhu        t1, t5, s6
                  addi         t4, t4, -1508
                  sh           s10, -3(s1)
                  lb           t6, 10(s1)
                  lbu          zero, 5(s1)
                  sltiu        a7, t3, -476
                  lbu          t0, 14(s1)
                  sb           t4, -13(s1)
                  sb           a3, -10(s1)
                  sra          a7, s5, s8
                  mul          a7, s3, s11
                  sb           s4, 9(s1)
                  slli         s7, t6, 24
                  slli         a0, a2, 13
                  c.nop
                  xori         s7, t5, 237
                  sb           a2, 7(s1)
                  c.slli       a7, 23
                  or           ra, s2, t2
                  slti         a4, t3, 1594
                  c.add        s7, a0
                  rem          a0, s4, t0
                  mulh         s10, t5, t5
                  srli         s8, s1, 31
                  lbu          tp, 8(s1)
                  sb           s3, -13(s1)
                  sb           s8, 0(s1) #end riscv_load_store_rand_instr_stream_9
                  la           s1, region_1+1617 #start riscv_load_store_hazard_instr_stream_8
                  sb           s5, -44(s1)
                  slti         s2, a5, -298
                  lbu          zero, -44(s1)
                  lb           t1, -44(s1)
                  lbu          s8, -44(s1)
                  lbu          zero, -44(s1)
                  c.srai       a3, 29
                  lb           a4, -44(s1)
                  sb           s9, -44(s1)
                  lb           t0, -44(s1)
                  lb           s2, -44(s1)
                  lh           t0, 29(s1)
                  lbu          s3, 29(s1)
                  c.or         a3, a5
                  srl          a0, s6, s3
                  lbu          a0, 29(s1)
                  sb           t3, 29(s1)
                  mul          a6, s9, t3
                  lb           s0, 29(s1)
                  sb           t0, 29(s1)
                  sra          t1, a4, s10
                  sh           s11, 29(s1)
                  lhu          a4, 29(s1)
                  sh           a5, 29(s1)
                  lb           t6, 29(s1) #end riscv_load_store_hazard_instr_stream_8
                  la           t4, region_1+1076 #start riscv_load_store_hazard_instr_stream_2
                  lbu          a7, 768(t4)
                  lw           s4, 768(t4)
                  lui          zero, 990558
                  lb           s11, 768(t4)
                  mul          gp, s6, s4
                  lhu          a0, 768(t4)
                  remu         s7, s9, a7
                  lh           a3, 768(t4)
                  lbu          t6, -757(t4)
                  sb           ra, -757(t4)
                  lbu          s0, -757(t4)
                  lb           a0, -757(t4)
                  lbu          tp, -757(t4) #end riscv_load_store_hazard_instr_stream_2
                  la           s11, amo_0+20 #start riscv_amo_instr_stream_10
                  amomax.w.rl   a7, a7, (s11)
                  mulhu        tp, s5, t1
                  sub          a4, a7, a4
                  c.li         s7, -1
                  amoand.w      tp, a3, (s11)
                  amoand.w.aq   t4, a1, (s11) #end riscv_amo_instr_stream_10
                  la           s7, region_0+1275 #start load_store_instr_stream_0
                  la           a0, region_1+1984 #start load_store_instr_stream_1
                  sb           tp, -219(a0)
                  lbu          s6, -198(a0)
                  lb           a3, -204(s7)
                  sb           a0, -107(a0)
                  lbu          s0, -226(a0)
                  sb           s5, -144(s7)
                  lbu          t4, 3(a0)
                  lhu          tp, -198(a0)
                  lhu          s1, 213(s7)
                  sb           s11, -86(a0)
                  sb           s11, -121(a0)
                  sb           sp, -148(s7)
                  lb           a5, -127(a0) #end load_store_instr_stream_1
                  lbu          s1, -224(s7) #end load_store_instr_stream_0
                  la           a4, amo_0+0 #start riscv_amo_instr_stream_2
                  addi         t6, s2, 1996
                  slli         s10, a2, 28
                  mulhu        s6, gp, s9
                  amoadd.w.aq   s1, a2, (a4)
                  amomax.w      s1, s5, (a4)
                  or           s10, s4, a3
                  amoadd.w.aq   t4, s5, (a4)
                  amomax.w.aq   t6, tp, (a4)
                  amomaxu.w.aq  t0, s6, (a4)
                  amomin.w      a7, s9, (a4)
                  amomin.w      t1, t3, (a4)
                  amoxor.w.aq   a7, s10, (a4)
                  add          a3, s8, a4
                  ori          s0, sp, -1026
                  ori          a1, t0, 1076
                  xori         s8, s9, -1821
                  amoswap.w.aq  t6, a1, (a4) #end riscv_amo_instr_stream_2
                  la           t4, region_0+1098 #start riscv_load_store_hazard_instr_stream_14
                  lbu          a2, -533(t4)
                  c.or         s1, s1
                  lui          s6, 226173
                  lbu          a3, 441(t4)
                  div          s4, s8, a5
                  sh           s10, -986(t4)
                  lh           a1, -608(t4)
                  c.li         t0, 30
                  sb           tp, -608(t4)
                  lb           a4, 331(t4)
                  lbu          s4, -221(t4)
                  lhu          s9, -42(t4)
                  lbu          a7, 70(t4)
                  lbu          s7, 70(t4)
                  lh           s0, -648(t4)
                  c.andi       a1, -1
                  lb           gp, -479(t4) #end riscv_load_store_hazard_instr_stream_14
sub_5_34:         jal          a0, 16f
0:                c.jal        14f
1:                c.j          0b
2:                c.j          1b
3:                c.j          21f
4:                c.jal        8f
5:                c.j          12f
6:                c.j          17f
7:                jal          t1, 15f
8:                jal          ra, 19f
9:                jal          t1, 20f
10:               jal          s4, 3b
11:               c.j          7b
12:               c.j          11b
13:               c.jal        2b
14:               c.jal        9b
15:               jal          t1, 13b
16:               c.jal        18f
17:               c.j          10b
18:               jal          ra, 5b
19:               jal          s1, 6b
20:               jal          ra, 4b
21:               c.slli       gp, 10
                  la           s7, region_0+116 #start riscv_load_store_hazard_instr_stream_15
                  lbu          s9, 141(s7)
                  lb           a1, 141(s7)
                  slli         a0, s4, 20
                  lbu          a6, 205(s7)
                  lb           s11, 205(s7)
                  sh           gp, 150(s7)
                  lh           tp, 150(s7)
                  sb           a7, 103(s7)
                  lb           gp, 103(s7)
                  lbu          s9, -3(s7)
                  lb           s4, -3(s7)
                  lbu          s2, -3(s7)
                  lbu          s6, -3(s7)
                  c.and        a2, s0
                  lbu          a0, -3(s7)
                  lb           a4, 61(s7)
                  sub          a5, s1, ra
                  and          a5, s9, a3
                  lbu          s0, 61(s7)
                  lui          a2, 708908
                  lb           a1, 61(s7)
                  lb           s3, 41(s7)
                  sb           s9, 41(s7)
                  slti         ra, zero, -1296
                  sw           a6, 156(s7)
                  c.or         s0, s1
                  sh           s3, 156(s7) #end riscv_load_store_hazard_instr_stream_15
sub_5_35:         jal          a0, 5f
0:                c.j          27f
1:                c.jal        12f
2:                c.jal        4f
3:                c.j          14f
4:                c.jal        17f
5:                c.jal        13f
6:                c.jal        10f
7:                c.j          11f
8:                jal          ra, 0b
9:                c.jal        28f
10:               c.j          8b
11:               c.jal        25f
12:               c.j          16f
13:               c.jal        18f
14:               c.jal        29f
15:               c.j          1b
16:               c.jal        22f
17:               c.jal        9b
18:               jal          ra, 26f
19:               jal          ra, 15b
20:               c.jal        23f
21:               c.j          20b
22:               jal          ra, 21b
23:               c.jal        24f
24:               c.jal        7b
25:               c.jal        6b
26:               jal          ra, 19b
27:               c.j          2b
28:               c.j          3b
29:               c.srli       s0, 1
                  la           a7, region_0+225 #start load_store_instr_stream_0
                  lb           t0, 96(a7)
                  la           a0, region_1+1874 #start load_store_instr_stream_1
                  lbu          t0, 15(a0)
                  sb           gp, 0(a7)
                  sh           tp, -10(a0)
                  sh           s8, -51(a7)
                  lb           a1, 213(a7)
                  lbu          a6, -16(a0)
                  lhu          a5, 73(a7)
                  lbu          a2, 0(a0)
                  sb           s1, 5(a0)
                  sb           t2, 13(a0) #end load_store_instr_stream_1
                  sb           a7, -40(a7) #end load_store_instr_stream_0
                  la           t0, region_1+1679 #start load_store_instr_stream_1
                  sb           tp, 47(t0)
                  lbu          s7, 56(t0)
                  la           a7, region_0+703 #start load_store_instr_stream_0
                  lb           a5, 52(a7)
                  sb           tp, 30(a7)
                  sb           tp, 54(t0)
                  sh           a6, -37(t0)
                  lh           a6, -33(a7)
                  lhu          a6, 31(t0)
                  sb           s1, 52(t0)
                  lb           t1, -24(t0)
                  sb           ra, -6(a7)
                  lbu          gp, -19(t0)
                  lb           a2, 223(a7)
                  lb           zero, 47(t0) #end load_store_instr_stream_1
                  lb           gp, 251(a7)
                  lh           a4, 31(a7) #end load_store_instr_stream_0
                  addi         s0, zero, -7 #init loop 1 counter
                  andi         s11, a6, -112
                  addi         zero, zero, 0 #init loop 1 limit
                  divu         s4, t1, a6
                  srli         a2, s3, 18
                  c.li         a0, 26
sub_5_101_1_t:    andi         s4, s3, -624
                  auipc        a0, 610524
                  addi         s0, s0, 7 #update loop 1 counter
                  add          s5, s4, s8
                  addi         s3, zero, -8 #init loop 0 counter
                  c.add        s4, s10
                  addi         t3, zero, 4 #init loop 0 limit
                  c.addi       s6, -1
sub_5_101_0_t:    lui          t4, 504808
                  addi         s3, s3, 7 #update loop 0 counter
                  ori          s2, t5, -386
                  c.or         a2, a3
                  blt          s3, t3, sub_5_101_0_t #branch for loop 0
                  slli         a2, s5, 9
                  c.or         a0, a1
                  c.andi       a1, 28
                  mulhu        a0, s3, t3
                  slli         s7, zero, 1
                  slt          t1, t5, t4
                  c.bnez       s0, sub_5_101_1_t #branch for loop 1
                  slli         t6, a5, 3
                  la           s2, region_1+638 #start load_store_instr_stream_2
                  la           s10, region_1+1171 #start load_store_instr_stream_1
                  sb           a7, -51(s2)
                  la           t6, region_1+1204 #start load_store_instr_stream_3
                  la           a5, region_1+1482 #start load_store_instr_stream_0
                  lbu          a2, 64(t6)
                  lhu          ra, -371(s10)
                  lw           s6, -375(s10)
                  lbu          s1, 62(t6)
                  lw           ra, -14(s2)
                  sw           a3, 334(a5)
                  lhu          a3, -509(s10)
                  sb           t5, 2(t6)
                  lb           zero, -31(s2)
                  lh           s11, 46(s2)
                  lbu          t3, 29(t6)
                  lb           s0, -60(s2)
                  lh           s11, -62(t6)
                  lb           s3, -956(s10)
                  lh           a6, -1454(a5)
                  lhu          s0, -197(s10)
                  lb           s11, 35(s2)
                  sw           sp, -58(s2)
                  lbu          t3, -348(s10)
                  lb           s1, 20(t6)
                  sw           a7, 38(s2)
                  sh           a7, -128(a5)
                  sb           a2, -56(s2)
                  lhu          s0, -787(s10)
                  lhu          s7, -14(s2) #end load_store_instr_stream_2
                  sb           s2, 313(a5)
                  sh           tp, -8(t6)
                  lbu          s5, -498(s10)
                  lw           a0, -143(s10)
                  sh           gp, -63(s10) #end load_store_instr_stream_1
                  lb           s0, 4(t6) #end load_store_instr_stream_3
                  sb           sp, -763(a5) #end load_store_instr_stream_0
                  la           a3, region_1+228 #start riscv_load_store_hazard_instr_stream_17
                  lh           zero, -64(a3)
                  c.mv         t4, s10
                  lbu          a6, 15(a3)
                  lbu          s5, 15(a3)
                  lbu          s11, 15(a3)
                  lbu          zero, 55(a3)
                  sb           zero, 52(a3)
                  lb           t3, 21(a3)
                  lbu          zero, 21(a3)
                  c.sub        a5, s0
                  sb           a6, -22(a3)
                  lb           s7, 15(a3)
                  mulhu        a2, gp, s3
                  lb           a5, 15(a3)
                  lbu          a2, 15(a3) #end riscv_load_store_hazard_instr_stream_17
                  la           t3, region_0+1561 #start riscv_load_store_hazard_instr_stream_5
                  c.srai       s1, 19
                  sll          a4, s0, t5
                  lbu          a0, -4(t3)
                  lb           zero, 13(t3)
                  sb           s8, 13(t3)
                  mulhsu       s6, s9, gp
                  lbu          a5, -3(t3)
                  lbu          zero, 13(t3)
                  sh           t0, 9(t3)
                  c.xor        a3, s0
                  lh           ra, 9(t3)
                  sb           t4, 9(t3)
                  lhu          zero, 9(t3)
                  sb           a6, -14(t3)
                  lbu          s6, -14(t3)
                  sb           t2, -14(t3)
                  lb           tp, 5(t3) #end riscv_load_store_hazard_instr_stream_5
sub_5_44:         jal          a0, 13f
0:                jal          a6, 14f
1:                c.j          17f
2:                c.j          15f
3:                c.j          18f
4:                jal          ra, 11f
5:                c.j          12f
6:                jal          ra, 16f
7:                jal          ra, 8f
8:                jal          gp, 2b
9:                jal          ra, 7b
10:               jal          ra, 1b
11:               c.jal        10b
12:               c.jal        6b
13:               jal          ra, 4b
14:               c.jal        9b
15:               c.jal        3b
16:               jal          ra, 0b
17:               jal          t3, 5b
18:               mulhu        a5, t0, s11
sub_5_43:         jal          a0, 2f
0:                c.j          7f
1:                c.jal        9f
2:                jal          ra, 3f
3:                jal          ra, 5f
4:                c.j          6f
5:                jal          t6, 0b
6:                c.j          1b
7:                c.j          4b
8:                jal          ra, 10f
9:                c.j          8b
10:               auipc        gp, 674419
                  la           s5, amo_0+24 #start riscv_lr_sc_instr_stream_1
                  c.slli       s2, 3
                  c.li         a2, -1
                  lui          s4, 155767
                  sra          t0, t0, s3
                  lr.w          s3, (s5)
                  addi         s6, a2, 422
                  slt          s3, a6, s5
                  c.add        a5, ra
                  srli         t6, s0, 20
                  c.srli       s0, 10
                  sra          a7, a2, s5
                  andi         s0, gp, 390
                  c.nop
                  lui          s10, 217447
                  xor          a6, s11, sp
                  c.mv         s10, a3
                  sc.w.aq       tp, sp, (s5) #end riscv_lr_sc_instr_stream_1
                  la           s2, region_0+714 #start riscv_load_store_rand_instr_stream_14
                  mulhsu       s5, s0, s8
                  lb           ra, -41(s2)
                  sb           tp, 8(s2)
                  lh           zero, 24(s2)
                  c.and        a4, s0
                  sb           t5, 46(s2)
                  lb           s8, -52(s2)
                  xori         s3, a6, -1084
                  mulhu        s8, s10, s0
                  mulh         t0, a5, s6
                  slti         t4, a2, 956
                  c.sub        a2, s0
                  lbu          a4, 37(s2)
                  lbu          a7, 54(s2)
                  nop
                  c.lui        s6, 14
                  lbu          s4, -21(s2)
                  sw           a0, 14(s2)
                  lbu          a0, 47(s2)
                  sb           t6, 36(s2)
                  lw           s7, 46(s2)
                  addi         t3, s6, -278
                  c.and        s1, a1
                  lbu          t3, -57(s2)
                  lb           s1, -57(s2)
                  sb           t4, -53(s2)
                  auipc        s11, 1035346
                  sb           s9, 53(s2) #end riscv_load_store_rand_instr_stream_14
                  la           t0, region_0+1116 #start riscv_load_store_hazard_instr_stream_18
                  lb           s7, -9(t0)
                  lb           a0, -9(t0)
                  sll          s4, s1, t2
                  sb           s1, -9(t0)
                  lb           t3, -9(t0)
                  lb           s3, -9(t0)
                  c.li         t4, -1
                  sb           a2, -9(t0)
                  mulh         gp, s4, s5
                  lbu          ra, -9(t0)
                  lbu          t6, -9(t0)
                  lbu          t3, 7(t0)
                  lbu          a3, 7(t0)
                  lb           a6, 7(t0) #end riscv_load_store_hazard_instr_stream_18
                  la           t3, region_1+1066 #start riscv_load_store_hazard_instr_stream_16
                  lbu          a1, 7(t3)
                  sb           a5, 7(t3)
                  addi         a0, t2, -1661
                  lb           s7, 7(t3)
                  srai         a4, s11, 31
                  lb           a5, 31(t3)
                  c.add        a7, a3
                  lh           t0, 8(t3)
                  lh           s10, 8(t3)
                  sh           s9, -42(t3)
                  lb           s7, -42(t3)
                  nop
                  lb           t6, 38(t3)
                  sb           s1, -11(t3)
                  sw           s5, 50(t3)
                  sh           gp, 50(t3)
                  lbu          t4, 50(t3)
                  lbu          s5, -30(t3)
                  lb           a0, -27(t3)
                  sb           s8, -27(t3)
                  lbu          a0, -27(t3)
                  sb           a1, -27(t3) #end riscv_load_store_hazard_instr_stream_16
                  la           gp, region_0+1149 #start load_store_instr_stream_1
                  la           s11, region_1+54 #start load_store_instr_stream_0
                  lbu          s2, -519(gp)
                  sb           s0, 146(s11)
                  sb           s8, -19(s11)
                  sh           s3, -189(gp)
                  lhu          s6, 220(s11)
                  lb           s7, 688(gp)
                  sb           s1, 25(s11)
                  lb           s7, -184(gp)
                  lw           s4, 379(gp)
                  lb           t6, 64(s11)
                  sb           t5, -795(gp) #end load_store_instr_stream_1
                  sb           t5, 180(s11)
                  sb           a3, 200(s11)
                  lh           a2, 200(s11) #end load_store_instr_stream_0
                  la           a0, region_0+84 #start load_store_instr_stream_1
                  lhu          s8, 22(a0)
                  la           t4, region_0+1636 #start load_store_instr_stream_0
                  la           s9, region_0+902 #start load_store_instr_stream_3
                  sb           t4, 249(a0)
                  la           t1, region_0+1231 #start load_store_instr_stream_2
                  lbu          tp, -195(t4)
                  lbu          s5, 30(t1)
                  lw           tp, -30(s9)
                  sb           s4, 212(t4)
                  lb           s0, -163(s9)
                  lhu          a5, 19(t1)
                  lb           a3, -199(s9)
                  lbu          a5, -253(t4)
                  lhu          s2, 54(s9)
                  sh           s1, 164(a0)
                  lb           zero, -111(s9)
                  sb           gp, 93(t4)
                  lbu          s7, 237(t4)
                  lbu          gp, -20(t1)
                  sb           gp, 95(a0)
                  lb           ra, -163(s9)
                  lbu          s8, -47(s9)
                  lbu          a2, 13(t1)
                  sh           s0, 16(t4)
                  lbu          a3, 26(t1)
                  lb           s10, 41(s9)
                  lh           a4, 59(t1)
                  sh           s1, -54(a0) #end load_store_instr_stream_1
                  sh           gp, 3(t1) #end load_store_instr_stream_2
                  lbu          a2, 45(t4)
                  sb           a0, -51(s9) #end load_store_instr_stream_3
                  lb           a1, 11(t4) #end load_store_instr_stream_0
                  la           s1, amo_0+36 #start riscv_lr_sc_instr_stream_2
                  c.slli       s5, 23
                  slli         a4, tp, 25
                  lr.w.aq       s10, (s1)
                  sc.w          t6, t2, (s1) #end riscv_lr_sc_instr_stream_2
                  la           gp, region_1+795 #start riscv_hazard_instr_stream_13
                  c.li         s9, -1
                  c.and        a1, a1
                  sw           a1, 9(gp)
                  lh           s9, -9(gp)
                  sh           s9, 11(gp)
                  lh           ra, -15(gp)
                  lb           zero, -5(gp)
                  lbu          ra, -14(gp)
                  c.srai       a1, 2
                  sra          zero, a1, s9
                  rem          ra, a1, s9
                  lw           a1, 13(gp)
                  lb           t3, 16(gp)
                  c.sub        a1, a1
                  mul          s9, a1, ra
                  lbu          ra, -10(gp)
                  addi         zero, ra, -1597
                  lbu          s9, 16(gp)
                  lbu          ra, -4(gp)
                  and          zero, s9, t3
                  lbu          a1, -4(gp)
                  sb           ra, -15(gp)
                  lb           t3, -12(gp)
                  sb           ra, -10(gp)
                  ori          a1, ra, -57
                  xor          s9, ra, a1
                  lh           t3, -3(gp)
                  lb           zero, -5(gp)
                  lb           s11, -4(gp)
                  lb           zero, 0(gp)
                  mulhsu       a1, s9, a1
                  ori          s11, ra, 207
                  lhu          a1, 5(gp)
                  c.xor        a1, a1
                  slt          t3, s9, zero
                  lhu          s9, -11(gp)
                  c.xor        a1, a1
                  lb           s9, 11(gp)
                  c.lui        s9, 4
                  sll          s9, s11, a1
                  lw           zero, -11(gp)
                  sh           ra, 9(gp)
                  slli         zero, ra, 11
                  sh           s9, -7(gp)
                  lbu          a1, 0(gp)
                  c.addi       t3, 18
                  andi         t3, zero, -656
                  rem          s11, ra, t3
                  remu         zero, t3, zero
                  c.lui        t3, 9
                  sh           zero, 15(gp)
                  div          a1, ra, zero
                  sb           zero, 10(gp)
                  addi         s11, t3, 634
                  c.srai       a1, 21
                  c.andi       a1, 21
                  lb           ra, 6(gp)
                  sb           a1, 9(gp) #end riscv_hazard_instr_stream_13
                  la           a0, amo_0+40 #start riscv_lr_sc_instr_stream_12
                  c.or         a2, a1
                  nop
                  lr.w.aq       s3, (a0)
                  c.srai       s0, 9
                  c.or         a2, a3
                  c.xor        s0, a2
                  sc.w.rl       gp, a6, (a0) #end riscv_lr_sc_instr_stream_12
                  la           s7, region_1+1595 #start load_store_instr_stream_0
                  la           ra, region_0+1118 #start load_store_instr_stream_1
                  sb           s7, -245(ra)
                  lb           s6, -828(s7)
                  lhu          s11, 20(ra)
                  lhu          t1, -733(s7)
                  sb           a7, -578(s7)
                  lb           a1, -241(ra)
                  lb           s2, -44(s7)
                  lw           t6, -186(ra)
                  lhu          s9, 62(ra)
                  sw           s8, -66(ra) #end load_store_instr_stream_1
                  lb           s9, -555(s7) #end load_store_instr_stream_0
                  la           tp, region_1+19 #start riscv_load_store_rand_instr_stream_5
                  slti         s9, a5, -19
                  addi         a5, a2, -1579
                  lbu          s4, 1859(tp)
                  c.sub        s0, a3
                  auipc        s1, 176274
                  or           t6, t5, a3
                  div          s7, s4, s1
                  sra          s5, a0, zero
                  sb           t2, 1811(tp)
                  sub          a1, a7, t2
                  sb           t2, 1862(tp)
                  sltiu        s9, a6, -467
                  lb           s5, 512(tp)
                  c.nop
                  lb           s3, 1959(tp)
                  lh           gp, 1179(tp)
                  c.mv         a3, a5
                  lhu          s3, 621(tp)
                  srl          s8, s3, s2
                  auipc        s5, 948736
                  lh           s0, 1193(tp)
                  lhu          t0, 7(tp)
                  mulhsu       s4, s6, a0
                  sb           t6, 1476(tp)
                  sb           s2, 1267(tp)
                  sb           tp, 917(tp) #end riscv_load_store_rand_instr_stream_5
                  la           s7, amo_0+60 #start riscv_lr_sc_instr_stream_5
                  c.srai       a4, 16
                  slt          a0, zero, t6
                  srli         t6, t6, 10
                  lr.w.aq       ra, (s7)
                  c.addi       t6, 28
                  c.sub        s0, s0
                  sc.w          s1, a5, (s7) #end riscv_lr_sc_instr_stream_5
                  la           a5, amo_0+20 #start riscv_amo_instr_stream_4
                  la           t1, amo_0+0
                  la           s1, amo_0+24
                  la           t3, amo_0+24
                  c.mv         t6, s1
                  lui          s0, 734009
                  c.nop
                  amominu.w.rl  a2, t4, (a5)
                  amoswap.w.aq  s0, s8, (s1)
                  amoadd.w      s5, t3, (t1)
                  amomaxu.w.rl  s0, gp, (a5)
                  slti         tp, s4, 977
                  amomin.w      s4, a3, (a5)
                  c.or         a0, s0
                  amoand.w      s8, zero, (t3)
                  add          a7, a7, t1
                  remu         t0, t1, a4
                  amoor.w.aq    tp, t0, (s1)
                  andi         a3, s11, -684
                  amoand.w.aq   gp, s0, (s1)
                  amominu.w     s10, s11, (t3) #end riscv_amo_instr_stream_4
                  la           a0, region_1+451 #start riscv_load_store_rand_instr_stream_15
                  sub          a7, t4, s7
                  lbu          s2, 4(a0)
                  sll          t6, s8, a6
                  lb           a7, -6(a0)
                  c.srai       s1, 9
                  lui          s2, 449561
                  c.xor        a4, a5
                  mulh         a5, t1, s2
                  nop
                  ori          a6, s11, 104
                  c.and        a4, a1
                  sb           s5, -5(a0)
                  sll          gp, a6, s9
                  lb           a7, 8(a0)
                  xor          a6, s5, s11
                  lb           s9, -12(a0)
                  lbu          zero, -12(a0)
                  ori          s4, s8, -547
                  sw           a5, 5(a0)
                  andi         a3, t4, -506
                  c.srli       a3, 20
                  c.nop
                  lhu          tp, 11(a0)
                  sh           gp, 7(a0)
                  c.and        a1, s1
                  sh           t5, -3(a0)
                  mulh         s7, a1, t4
                  sb           a2, -10(a0)
                  c.lui        a2, 28
                  sb           s11, -14(a0)
                  lb           t1, 6(a0)
                  slli         t6, a6, 17
                  c.slli       t0, 28
                  c.or         a3, a5
                  c.andi       a2, 11
                  lbu          s0, 9(a0)
                  c.or         a1, s1
                  c.andi       a1, 1
                  c.add        a3, a6
                  ori          s3, t3, -1772
                  c.nop
                  c.nop
                  auipc        s3, 996617
                  lh           s9, -15(a0) #end riscv_load_store_rand_instr_stream_15
sub_5_41:         jal          a0, 3f
0:                c.j          23f
1:                jal          ra, 22f
2:                c.jal        21f
3:                c.jal        14f
4:                jal          t1, 20f
5:                c.jal        4b
6:                c.jal        1b
7:                c.j          15f
8:                c.j          12f
9:                c.j          17f
10:               c.jal        18f
11:               jal          ra, 16f
12:               c.j          11b
13:               jal          a4, 5b
14:               c.jal        10b
15:               c.j          8b
16:               jal          ra, 9b
17:               c.jal        19f
18:               c.j          6b
19:               jal          ra, 0b
20:               c.jal        2b
21:               jal          gp, 7b
22:               c.j          13b
23:               rem          s3, t0, s0
                  la           a1, region_0+330 #start load_store_instr_stream_2
                  la           ra, region_0+1373 #start load_store_instr_stream_1
                  lb           s11, -133(a1)
                  sb           a4, 98(a1)
                  la           a6, region_0+1421 #start load_store_instr_stream_0
                  lbu          t6, -252(a1)
                  lbu          s0, 418(ra)
                  lh           a4, 3(ra)
                  lw           s11, 179(a6)
                  lbu          zero, 143(a1)
                  sb           s10, -226(a6)
                  lbu          s2, 268(ra)
                  lb           s8, 154(a1)
                  lbu          tp, -70(a6)
                  lbu          a3, -1(a6)
                  lb           t0, -362(ra)
                  sh           a2, -81(a6)
                  lhu          s1, -123(a6)
                  sb           a7, -172(a6)
                  lb           gp, 35(a1)
                  lbu          gp, 243(a6)
                  sh           a6, 69(a6)
                  sb           s9, -1183(ra)
                  lh           a4, -180(a1) #end load_store_instr_stream_2
                  lbu          a4, -289(ra) #end load_store_instr_stream_1
                  sw           a0, 3(a6) #end load_store_instr_stream_0
                  la           gp, region_1+5 #start riscv_load_store_hazard_instr_stream_7
                  auipc        s7, 102322
                  lbu          t6, 975(gp)
                  lhu          t3, 975(gp)
                  sb           t5, 975(gp)
                  c.mv         s0, s6
                  lh           a2, 975(gp)
                  lhu          a5, 975(gp)
                  lw           s7, 975(gp)
                  addi         a0, gp, 791
                  sb           s1, 975(gp)
                  c.or         s1, a5
                  lhu          a1, 975(gp)
                  lbu          a2, 975(gp)
                  lb           s0, 975(gp)
                  add          s6, a7, s10
                  c.or         a4, a0
                  sw           t4, 975(gp)
                  c.xor        a1, s1
                  lbu          t6, 975(gp)
                  lh           t3, 975(gp)
                  sw           a6, 975(gp)
                  lh           tp, 975(gp) #end riscv_load_store_hazard_instr_stream_7
                  la           a2, region_1+511 #start load_store_instr_stream_1
                  la           t0, region_1+1180 #start load_store_instr_stream_0
                  lb           s2, -5(a2)
                  lbu          s9, -829(t0)
                  lhu          zero, -1074(t0)
                  sb           a3, -40(a2)
                  lhu          t1, -626(t0)
                  sb           a6, 315(t0)
                  sb           t0, 50(a2)
                  lbu          a6, 281(t0)
                  lb           s4, 702(t0)
                  lbu          s6, -123(t0)
                  lh           s3, -694(t0)
                  lbu          a5, -3(a2)
                  sb           s1, 14(a2) #end load_store_instr_stream_1
                  lhu          a3, -176(t0)
                  lb           s4, 1(t0) #end load_store_instr_stream_0
                  la           a5, region_1+710 #start riscv_hazard_instr_stream_2
                  sb           a0, 11(a5)
                  lw           s10, -2(a5)
                  lb           a0, 1(a5)
                  lhu          a0, 12(a5)
                  sb           s10, 1(a5)
                  c.slli       a7, 1
                  c.addi       a4, -1
                  lbu          s10, 13(a5)
                  lbu          a7, 3(a5)
                  lhu          a4, -16(a5)
                  lw           gp, 6(a5)
                  c.sub        a0, a0
                  c.li         a4, -1
                  lbu          s10, -13(a5)
                  ori          s10, s10, -1320
                  sb           a7, 2(a5)
                  lb           s11, 13(a5)
                  c.addi       a7, 24
                  sh           a7, -4(a5)
                  lbu          a0, -7(a5)
                  sw           gp, 6(a5)
                  lbu          gp, 6(a5)
                  xori         a7, a0, 1968
                  lhu          a4, -8(a5)
                  lh           a7, 16(a5)
                  lbu          a4, -8(a5)
                  lb           s10, -9(a5)
                  lbu          a0, 13(a5)
                  sb           gp, -10(a5)
                  xori         a4, s11, -211
                  sb           gp, 15(a5)
                  c.add        gp, a0
                  sltiu        a4, a7, 111
                  sb           a4, -3(a5)
                  lb           a7, -12(a5)
                  sh           s11, 12(a5)
                  lbu          s11, 15(a5)
                  addi         a7, s11, -1799
                  slti         s11, a7, 1339
                  lb           a7, -5(a5)
                  sh           a0, 14(a5)
                  sh           s11, 4(a5) #end riscv_hazard_instr_stream_2
sub_5_42:         jal          a0, 0f
0:                c.jal        12f
1:                c.j          8f
2:                c.j          13f
3:                c.jal        6f
4:                c.j          5f
5:                c.j          1b
6:                c.jal        4b
7:                jal          ra, 10f
8:                c.j          20f
9:                jal          tp, 7b
10:               c.jal        18f
11:               c.jal        2b
12:               c.jal        9b
13:               c.j          17f
14:               c.j          11b
15:               c.j          19f
16:               jal          s3, 15b
17:               jal          ra, 16b
18:               jal          ra, 14b
19:               c.j          3b
20:               c.srai       a1, 18
                  la           s3, region_0+1395 #start load_store_instr_stream_1
                  la           s8, region_1+1442 #start load_store_instr_stream_0
                  lbu          a7, 2(s3)
                  lh           a0, 7(s3)
                  sw           a0, -11(s3)
                  lb           s2, -4(s3)
                  lb           s4, -716(s8)
                  lhu          s5, 98(s8)
                  lbu          s11, 0(s3)
                  sb           gp, -5(s3)
                  sb           a3, -175(s8)
                  lb           s4, -10(s3)
                  sb           a3, 383(s8)
                  lb           s11, -10(s3)
                  lhu          t6, 13(s3)
                  lh           a2, 15(s3) #end load_store_instr_stream_1
                  lb           t6, -621(s8) #end load_store_instr_stream_0
                  addi         a1, zero, 10 #init loop 0 counter
                  c.lui        t6, 5
                  sub          a7, s6, s6
                  add          tp, t1, s4
                  c.or         a3, a0
                  slli         gp, t5, 27
                  c.li         a3, -1
                  sra          s8, tp, s0
                  slt          s0, s3, s5
                  c.xor        a3, a0
                  addi         zero, zero, 0 #init loop 0 limit
                  mulhsu       s6, gp, t2
                  andi         a3, a7, 1581
sub_5_95_0_t:     sub          a3, s10, s9
                  c.li         s2, 29
                  mulh         a6, a6, s3
                  c.li         s8, -1
                  addi         a1, a1, -10 #update loop 0 counter
                  xori         s8, s10, -1077
                  c.slli       t3, 25
                  c.nop
                  srai         a0, gp, 30
                  div          gp, a2, t0
                  rem          s0, s6, s9
                  rem          s10, tp, s10
                  c.beqz       a1, sub_5_95_0_t #branch for loop 0
                  c.mv         s0, s4
                  la           s9, region_0+1941 #start load_store_instr_stream_1
                  la           a5, region_0+236 #start load_store_instr_stream_0
                  lbu          s4, 1(a5)
                  la           gp, region_0+802 #start load_store_instr_stream_3
                  lb           s8, 15(gp)
                  la           s1, region_0+1147 #start load_store_instr_stream_2
                  lbu          s10, -3(a5)
                  sh           s2, 10(a5)
                  lb           a3, 11(gp)
                  sb           gp, -3(a5)
                  sh           s8, 10(gp)
                  lbu          ra, 7(a5)
                  lb           s6, 12(s9)
                  sh           t4, 4(gp)
                  lbu          t3, -4(s9)
                  lb           a6, 36(s1)
                  sh           s1, 10(a5)
                  lw           t4, -14(gp)
                  sh           s4, 6(a5)
                  lbu          zero, -41(s1)
                  lbu          a1, -64(s1)
                  lbu          a7, 3(gp)
                  lb           s8, -4(s9)
                  lh           a0, -8(gp)
                  lhu          s3, -35(s1)
                  lbu          a7, -13(s9)
                  lb           s6, 7(gp)
                  lb           zero, -6(s9) #end load_store_instr_stream_1
                  lh           s0, -2(gp) #end load_store_instr_stream_3
                  sb           s1, -47(s1) #end load_store_instr_stream_2
                  sw           a4, 0(a5) #end load_store_instr_stream_0
                  la           tp, region_0+1032 #start riscv_hazard_instr_stream_8
                  lb           a0, 5(tp)
                  lbu          a3, 9(tp)
                  c.and        s0, a0
                  sh           a0, 14(tp)
                  slti         gp, s0, 1834
                  andi         a0, s6, -1488
                  slt          s6, a3, s6
                  sltiu        s0, s0, 298
                  srli         gp, s11, 3
                  c.or         a3, a3
                  lb           s0, -3(tp)
                  lhu          s11, -12(tp)
                  c.xor        a3, a3
                  remu         gp, gp, s0
                  sub          a0, a0, s6
                  c.srli       a3, 1
                  slti         a3, s11, 889
                  sltu         s0, s11, gp
                  addi         gp, gp, -953
                  lb           s0, -13(tp)
                  lh           s11, 6(tp)
                  c.lui        a3, 4
                  sb           a3, -3(tp)
                  lbu          a3, 13(tp)
                  lbu          a0, -15(tp)
                  mulh         gp, s6, a3
                  c.lui        s6, 31
                  and          a3, a0, s11
                  c.or         a0, a0
                  lb           a3, -15(tp)
                  sb           a0, -6(tp)
                  lb           s6, -9(tp)
                  lh           gp, 4(tp) #end riscv_hazard_instr_stream_8
                  la           a6, region_0+500 #start riscv_hazard_instr_stream_4
                  c.xor        a5, a0
                  sltiu        a0, s0, 1444
                  xori         s10, a0, -613
                  mul          s0, s0, s4
                  sb           a0, 4(a6)
                  sll          a5, s0, s10
                  sb           a5, -63(a6)
                  divu         a1, s0, s4
                  lbu          s4, -44(a6)
                  sb           a1, 31(a6)
                  sb           a0, -13(a6)
                  sh           a0, 8(a6)
                  lbu          a1, 49(a6)
                  lhu          a5, -16(a6)
                  lbu          s0, -43(a6)
                  mul          a0, a1, a0
                  lb           s0, -18(a6)
                  remu         s10, a1, s4
                  lb           s4, -51(a6)
                  rem          a1, a1, s4
                  lb           a5, 53(a6)
                  lb           a0, -15(a6)
                  sb           a0, -29(a6)
                  lw           s4, 8(a6)
                  lb           a5, -53(a6)
                  auipc        a0, 115522
                  lb           s10, -39(a6)
                  sb           s0, -39(a6)
                  lbu          a1, 23(a6)
                  lbu          s4, 9(a6)
                  lbu          s0, -60(a6) #end riscv_hazard_instr_stream_4
                  la           s5, amo_0+56 #start riscv_lr_sc_instr_stream_10
                  c.slli       a5, 19
                  xor          a1, a2, a4
                  c.andi       s1, -1
                  lr.w.rl       s2, (s5)
                  sc.w.aq       s9, t5, (s5) #end riscv_lr_sc_instr_stream_10
                  la           a5, region_0+342 #start load_store_instr_stream_2
                  la           s3, region_0+1882 #start load_store_instr_stream_0
                  la           s0, region_0+1917 #start load_store_instr_stream_1
                  lb           ra, 1357(a5)
                  lhu          t6, 6(s3)
                  sh           a2, -200(a5)
                  lbu          s4, -10(s0)
                  lbu          t1, 351(a5)
                  lbu          s10, 591(a5)
                  lhu          a0, -181(s0)
                  sb           s9, 705(a5)
                  lh           ra, 6(s3)
                  lbu          s4, -293(a5)
                  sb           t6, -8(s3)
                  lb           t1, 30(s0)
                  lh           ra, 25(s0)
                  sb           t6, -15(s3)
                  sb           s7, 75(a5)
                  lbu          s6, -283(a5)
                  lhu          t3, 33(s0)
                  lw           s7, 7(s0) #end load_store_instr_stream_1
                  lbu          t6, 605(a5) #end load_store_instr_stream_2
                  lb           s10, -11(s3)
                  lbu          s2, 3(s3)
                  lb           s11, -5(s3) #end load_store_instr_stream_0
sub_5_50:         jal          a0, 7f
0:                c.jal        17f
1:                c.jal        6f
2:                jal          t1, 24f
3:                c.jal        25f
4:                c.jal        16f
5:                c.jal        21f
6:                c.jal        19f
7:                jal          tp, 20f
8:                c.j          5b
9:                jal          ra, 15f
10:               c.j          22f
11:               c.j          23f
12:               jal          ra, 13f
13:               c.jal        3b
14:               jal          ra, 12b
15:               c.j          18f
16:               c.jal        11b
17:               c.j          2b
18:               c.j          0b
19:               jal          ra, 14b
20:               c.j          9b
21:               c.j          10b
22:               c.jal        4b
23:               jal          ra, 26f
24:               c.jal        1b
25:               c.j          8b
26:               c.jal        27f
27:               c.nop
                  la           t6, region_0+1020 #start riscv_load_store_rand_instr_stream_11
                  c.add        s3, s6
                  auipc        a4, 315126
                  c.sub        a5, a2
                  c.addi       a2, -1
                  sw           t0, 8(t6)
                  mulh         t3, a1, s6
                  lb           ra, -9(t6)
                  sll          tp, s0, t5
                  add          gp, t3, a5
                  c.or         a1, s1
                  lbu          t0, 14(t6)
                  c.mv         a5, ra
                  remu         s10, t1, a6
                  lb           t4, 4(t6)
                  sltu         s5, a7, gp
                  c.and        a0, s0
                  lw           s4, 16(t6)
                  srl          a4, s1, a6
                  c.xor        s1, a4
                  c.srai       a3, 31
                  c.sub        a2, a1
                  lbu          s10, -4(t6)
                  sb           t1, 13(t6)
                  c.li         s7, -1
                  nop
                  lh           a2, 2(t6)
                  lbu          t4, 14(t6)
                  srli         s5, s6, 17
                  lb           s1, -16(t6)
                  c.or         a1, a1
                  sb           a3, -15(t6) #end riscv_load_store_rand_instr_stream_11
                  la           gp, amo_0+56 #start riscv_amo_instr_stream_7
                  la           a4, amo_0+8
                  la           s8, amo_0+44
                  la           a5, amo_0+60
                  mulhu        s9, s7, s3
                  amoand.w      s4, a3, (gp)
                  amoswap.w     ra, t5, (a4)
                  amoor.w.aq    t4, a5, (gp)
                  xori         zero, t5, -1269
                  amomax.w.rl   s9, tp, (gp)
                  amomaxu.w.rl  a1, a2, (a5)
                  sltu         s5, t2, a5
                  amoswap.w.aq  t3, s3, (gp) #end riscv_amo_instr_stream_7
                  addi         a3, zero, -8 #init loop 1 counter
                  c.xor        a2, s0
                  c.li         s3, 9
                  div          a6, a7, s5
                  c.mv         s7, ra
                  c.xor        a2, a4
                  c.slli       tp, 3
                  addi         zero, zero, 0 #init loop 1 limit
sub_5_94_1_t:     div          a6, s7, a2
                  c.add        s11, tp
                  addi         a3, a3, 8 #update loop 1 counter
                  srl          s6, t0, t4
                  addi         s10, zero, 10 #init loop 0 counter
                  and          s2, s10, s4
                  addi         t4, s4, -1132
                  mulh         t4, s3, t6
                  srl          t3, s11, s0
                  div          s5, a0, s6
                  rem          s8, t4, s6
                  addi         t6, zero, 17 #init loop 0 limit
                  c.slli       ra, 18
sub_5_94_0_t:     mulhsu       a7, a4, a7
                  c.nop
                  addi         s10, s10, 8 #update loop 0 counter
                  lui          t1, 629797
                  blt          s10, t6, sub_5_94_0_t #branch for loop 0
                  c.srai       s1, 8
                  c.beqz       a3, sub_5_94_1_t #branch for loop 1
                  sltu         s0, s10, a2
                  la           s8, region_0+479 #start riscv_load_store_rand_instr_stream_2
                  and          s1, a2, t6
                  or           a0, t4, t6
                  lb           s3, -24(s8)
                  lh           zero, 5(s8)
                  c.slli       s7, 17
                  sb           a5, 35(s8)
                  sb           s0, 35(s8)
                  lhu          t0, 63(s8)
                  c.lui        gp, 22
                  lh           s7, -5(s8)
                  lb           a0, -33(s8)
                  lw           a1, 49(s8)
                  srai         s11, t5, 5
                  lhu          s7, 61(s8)
                  sb           s10, -57(s8)
                  sb           gp, -28(s8)
                  mulhu        a1, t2, s5
                  remu         s7, gp, s2
                  sb           s11, 31(s8)
                  c.add        a1, s8
                  sb           a6, 58(s8)
                  lb           s9, -62(s8)
                  lui          s9, 888092
                  sb           t5, 56(s8)
                  lb           s11, 2(s8)
                  lbu          a1, -40(s8)
                  sb           a4, 41(s8)
                  ori          t1, gp, -1194
                  lb           t6, -64(s8)
                  lbu          a7, -50(s8)
                  c.andi       a0, 12
                  lw           s3, 1(s8)
                  lbu          a1, -28(s8)
                  c.and        a0, s1
                  auipc        a6, 705396
                  lh           s0, 19(s8) #end riscv_load_store_rand_instr_stream_2
                  la           t1, region_0+1431 #start riscv_load_store_hazard_instr_stream_4
                  sb           t1, 58(t1)
                  lbu          zero, -36(t1)
                  sw           t5, -7(t1)
                  c.sub        a4, a2
                  lb           a1, -7(t1)
                  lbu          tp, 55(t1)
                  lb           a0, -54(t1)
                  lhu          s0, 39(t1)
                  lbu          s11, 39(t1)
                  lb           s10, 31(t1)
                  lbu          s3, -50(t1)
                  lb           a5, -45(t1) #end riscv_load_store_hazard_instr_stream_4
                  la           s3, region_1+1785 #start riscv_load_store_hazard_instr_stream_1
                  lhu          t6, -17(s3)
                  lh           t3, 87(s3)
                  sh           a1, -185(s3)
                  lw           tp, -137(s3)
                  sb           t2, -154(s3)
                  lb           t4, -154(s3)
                  xori         s8, s6, 555
                  lb           t4, 102(s3)
                  nop
                  lh           s4, 159(s3)
                  sb           a1, -8(s3)
                  lb           a3, -6(s3)
                  lb           s6, -198(s3)
                  c.li         s10, -1
                  lb           s0, -156(s3)
                  lb           a1, -156(s3)
                  slti         s4, s2, -1994
                  lb           a1, -156(s3)
                  c.xor        a3, s0
                  addi         s10, a1, -99
                  lb           t3, 125(s3)
                  sb           s10, 6(s3)
                  lbu          gp, 6(s3)
                  sb           t2, 6(s3) #end riscv_load_store_hazard_instr_stream_1
                  la           s5, amo_0+12 #start riscv_lr_sc_instr_stream_0
                  lr.w          s3, (s5)
                  c.xor        a4, s0
                  c.addi       s2, 3
                  addi         s4, s2, 1756
                  auipc        s6, 870915
                  add          a7, zero, s3
                  srai         s10, a6, 31
                  c.srai       s1, 6
                  c.xor        a3, s1
                  srli         a6, t6, 1
                  sltiu        s0, a2, -1068
                  c.sub        a2, a5
                  sc.w.rl       t6, a6, (s5) #end riscv_lr_sc_instr_stream_0
sub_5_39:         jal          a0, 6f
0:                c.j          15f
1:                c.jal        9f
2:                c.j          11f
3:                jal          ra, 8f
4:                c.j          16f
5:                jal          ra, 3b
6:                c.j          7f
7:                jal          t1, 4b
8:                c.jal        12f
9:                c.jal        18f
10:               c.jal        0b
11:               c.jal        10b
12:               jal          ra, 1b
13:               c.jal        5b
14:               jal          t3, 2b
15:               c.j          13b
16:               jal          s0, 17f
17:               c.j          14b
18:               add          t4, s4, s7
                  la           t0, region_0+879 #start load_store_instr_stream_0
                  lb           gp, -202(t0)
                  la           s10, region_1+1021 #start load_store_instr_stream_1
                  lbu          s4, 770(s10)
                  lb           s9, 55(s10)
                  lb           a7, 965(s10)
                  sb           tp, 150(t0)
                  lh           s1, -181(t0)
                  lbu          s1, 97(s10)
                  sb           a5, -81(t0)
                  lbu          s11, -366(s10)
                  lbu          t3, -840(s10) #end load_store_instr_stream_1
                  lbu          gp, -195(t0) #end load_store_instr_stream_0
                  la           s0, region_0+105 #start load_store_instr_stream_1
                  la           s3, region_0+520 #start load_store_instr_stream_0
                  lb           s7, 1(s0)
                  lbu          a5, -213(s3)
                  lhu          a2, 244(s3)
                  sb           s11, -16(s0)
                  sb           t2, 14(s0)
                  lbu          s11, 97(s3)
                  lb           s4, -8(s0)
                  lhu          s5, -15(s0)
                  lbu          a3, 254(s3)
                  sh           s6, -78(s3)
                  lb           s6, 6(s0)
                  lb           a4, -87(s3)
                  lw           s10, 3(s0)
                  lb           s11, -134(s3)
                  lbu          s7, 143(s3)
                  sh           a3, -13(s0)
                  sb           a0, -3(s0) #end load_store_instr_stream_1
                  sb           s8, -111(s3)
                  lhu          s11, -244(s3) #end load_store_instr_stream_0
                  la           t0, region_0+628 #start riscv_load_store_rand_instr_stream_0
                  lbu          s0, 576(t0)
                  sb           s8, -347(t0)
                  lb           t1, -482(t0)
                  sll          zero, s0, gp
                  mulhu        s0, a7, a2
                  sb           zero, 371(t0)
                  sltiu        s7, a2, -497
                  c.sub        s0, s0
                  sb           s4, -373(t0)
                  lbu          a6, 353(t0)
                  sw           t4, -84(t0)
                  lb           s2, -325(t0)
                  add          s5, t2, a6
                  mulh         s7, t0, s8
                  c.add        a1, sp
                  auipc        s4, 847307
                  c.lui        t1, 27
                  sll          t3, a2, tp
                  sb           t3, 448(t0)
                  srl          a0, s3, s5
                  sb           a7, 435(t0)
                  lb           s5, 871(t0) #end riscv_load_store_rand_instr_stream_0
                  la           t4, region_0+151 #start riscv_hazard_instr_stream_11
                  sb           a4, -60(t4)
                  c.add        a0, t6
                  c.slli       a0, 22
                  ori          s7, a1, 286
                  lbu          a1, 4(t4)
                  sb           a4, -15(t4)
                  mul          t6, a0, s7
                  auipc        a1, 433547
                  div          a0, a4, a0
                  c.mv         a4, a3
                  sb           t6, 26(t4)
                  lb           t6, -45(t4)
                  c.addi       a0, 31
                  sb           t6, 54(t4)
                  andi         a4, a1, -388
                  mulhu        s7, a4, s7
                  divu         a3, s7, a1
                  lw           a0, -55(t4)
                  lb           t6, 18(t4)
                  c.lui        a0, 3
                  sub          a4, a3, a4
                  mul          t6, a4, a4
                  lbu          t6, 19(t4)
                  sb           a0, 18(t4)
                  lw           a1, 37(t4)
                  slti         a4, a1, 1220
                  lbu          a0, 48(t4)
                  xori         s7, s7, -613
                  lbu          a4, 58(t4)
                  xor          a3, a3, t6
                  lhu          a4, 63(t4)
                  add          t6, a1, a3
                  lh           a1, -7(t4)
                  c.andi       a3, -1
                  and          a0, a0, a4
                  sh           a0, -41(t4)
                  lhu          a4, -7(t4)
                  c.xor        a3, a3
                  sltu         a1, a0, a3
                  lb           a0, -20(t4)
                  lb           a1, -52(t4)
                  lhu          a3, -5(t4)
                  auipc        a1, 35350
                  sb           a0, 0(t4) #end riscv_hazard_instr_stream_11
                  la           a3, amo_0+0 #start riscv_amo_instr_stream_5
                  la           a1, amo_0+60
                  la           a5, amo_0+56
                  la           s10, amo_0+4
                  amomaxu.w     a0, t4, (a3)
                  c.addi       s3, -1
                  srai         s9, t3, 18
                  amominu.w.aq  a6, a4, (a1)
                  amominu.w     s7, s6, (a1)
                  divu         s0, t2, ra
                  c.nop
                  amoand.w.rl   t6, t5, (a1)
                  amoxor.w.aq   s9, t6, (a1)
                  amomax.w.rl   t3, a0, (a1)
                  c.slli       a2, 1
                  amoswap.w.rl  a7, a5, (a1)
                  amoor.w.rl    a6, s8, (a3)
                  amoadd.w.aq   t4, a2, (s10) #end riscv_amo_instr_stream_5
                  la           s8, region_0+1544 #start load_store_instr_stream_0
                  la           a7, region_0+1320 #start load_store_instr_stream_1
                  lb           s7, -7(a7)
                  la           s9, region_0+1364 #start load_store_instr_stream_2
                  sb           s5, -154(s8)
                  sb           s5, 13(s9)
                  sb           s4, -17(a7)
                  lhu          t0, -180(a7)
                  lh           s3, 116(s8)
                  lbu          t1, 31(s9)
                  lb           s11, -250(s8)
                  sb           s5, -197(a7)
                  lbu          s10, 10(s9)
                  lbu          gp, -98(s8)
                  lb           s2, -45(s9)
                  lbu          t4, 122(s8)
                  lb           s5, -47(a7)
                  lbu          a4, -218(a7)
                  sb           a6, -177(s8)
                  sw           t0, -208(a7)
                  lbu          t3, 43(s8)
                  sb           zero, 43(s9)
                  sb           a2, 25(s9)
                  sh           t2, 34(a7)
                  lh           a1, 154(s8)
                  sb           s3, -35(s8)
                  sb           t3, 17(s9) #end load_store_instr_stream_2
                  lb           s7, -218(a7) #end load_store_instr_stream_1
                  lbu          s11, 101(s8) #end load_store_instr_stream_0
                  la           tp, region_1+1572 #start load_store_instr_stream_1
                  la           s11, region_1+1922 #start load_store_instr_stream_0
                  sb           s9, -1405(s11)
                  lbu          s8, 12(tp)
                  lh           ra, -1252(s11)
                  sh           s8, 2(tp)
                  lb           s6, -616(s11)
                  lbu          a0, -11(tp)
                  lh           a1, -1598(s11)
                  sb           t5, 14(tp)
                  lb           t6, 41(s11)
                  lbu          s4, -15(tp)
                  lh           zero, 10(tp)
                  lb           s6, -5(tp)
                  sh           s8, -1404(s11)
                  lb           a7, 8(tp)
                  sb           t5, -949(s11)
                  lbu          a3, 9(tp) #end load_store_instr_stream_1
                  lbu          a1, -341(s11) #end load_store_instr_stream_0
                  addi         a4, zero, -6 #init loop 1 counter
                  addi         a6, zero, -18 #init loop 1 limit
                  c.li         s0, -1
                  and          s1, a3, t0
sub_5_102_1_t:    sub          zero, a2, s11
                  addi         a3, t3, 241
                  c.lui        s0, 2
                  sub          a0, a1, t6
                  addi         a4, a4, -6 #update loop 1 counter
                  addi         s6, zero, 6 #init loop 0 counter
                  c.add        s5, sp
                  addi         t0, zero, 6 #init loop 0 limit
                  slt          s10, t6, s5
sub_5_102_0_t:    divu         t4, s4, s9
                  rem          s8, s11, s4
                  addi         s6, s6, -5 #update loop 0 counter
                  bgeu         s6, t0, sub_5_102_0_t #branch for loop 0
                  c.add        t4, s6
                  bne          a4, a6, sub_5_102_1_t #branch for loop 1
                  sltiu        a5, s10, -1746
                  la           s5, region_0+693 #start load_store_instr_stream_1
                  la           s6, region_1+1576 #start load_store_instr_stream_0
                  lb           s2, 208(s5)
                  lw           t1, 203(s5)
                  sh           tp, -191(s5)
                  lbu          s3, -1(s6)
                  lhu          s10, -101(s5)
                  lbu          zero, -88(s5)
                  lbu          gp, -9(s6)
                  lbu          a1, 11(s6)
                  lbu          a4, -19(s5)
                  sb           a0, -242(s5) #end load_store_instr_stream_1
                  sb           s10, 11(s6)
                  lbu          a0, -16(s6) #end load_store_instr_stream_0
                  la           a6, region_0+476 #start riscv_load_store_rand_instr_stream_13
                  sb           ra, 12(a6)
                  rem          s6, t5, sp
                  c.srai       s1, 8
                  mulhsu       a4, s4, t4
                  sh           zero, 26(a6)
                  lbu          t1, 55(a6)
                  sh           gp, 68(a6)
                  lw           a0, 76(a6)
                  c.addi       tp, 8
                  auipc        a7, 896206
                  auipc        s11, 63737
                  sb           s2, -84(a6)
                  lbu          s11, -98(a6)
                  srli         s2, a7, 9
                  lh           s5, 42(a6)
                  lbu          a0, 211(a6)
                  sh           t0, 150(a6)
                  c.andi       a3, 20
                  slli         s3, s11, 31
                  sb           t2, 50(a6)
                  lbu          s10, 242(a6)
                  addi         t0, s11, -311
                  sb           a7, -249(a6)
                  sb           a7, 137(a6)
                  c.slli       t3, 3
                  sll          t4, s10, a6
                  c.add        t1, t4
                  sh           s4, 238(a6)
                  lbu          s3, 79(a6)
                  srai         s1, s7, 15
                  slt          s0, tp, t5
                  sltiu        gp, gp, -58
                  lb           t0, 17(a6)
                  lw           zero, 172(a6)
                  lbu          a3, 197(a6)
                  lb           a1, -79(a6)
                  c.srai       a4, 17
                  lbu          t0, -157(a6)
                  lhu          s9, 244(a6) #end riscv_load_store_rand_instr_stream_13
                  la           s3, region_0+1403 #start riscv_load_store_hazard_instr_stream_10
                  lh           t4, 7(s3)
                  c.slli       a6, 22
                  nop
                  mulhsu       s5, s7, a7
                  slli         t0, a7, 26
                  mulhsu       a7, s7, t1
                  mul          a2, a7, t6
                  lbu          s9, 4(s3)
                  lbu          a7, 4(s3)
                  lbu          a1, 16(s3)
                  sb           s9, -14(s3)
                  lbu          tp, -14(s3)
                  srli         s4, a6, 5
                  lb           t6, -14(s3)
                  lbu          a1, -14(s3)
                  lb           t3, -14(s3)
                  sb           t5, -14(s3)
                  lh           t1, -3(s3)
                  sh           t5, -3(s3)
                  lh           t0, -5(s3)
                  sb           s8, -12(s3) #end riscv_load_store_hazard_instr_stream_10
                  la           t1, region_1+1579 #start riscv_hazard_instr_stream_3
                  lbu          t0, -1020(t1)
                  lb           a7, 364(t1)
                  c.nop
                  and          a1, t6, s10
                  lhu          a1, -829(t1)
                  lb           a7, -261(t1)
                  sltu         a7, t0, a1
                  sb           t0, 38(t1)
                  lbu          s10, 282(t1)
                  sh           a7, -623(t1)
                  c.slli       a7, 30
                  c.addi       t6, -1
                  c.addi       s11, -1
                  mulh         a7, t0, a7
                  sb           t0, -326(t1)
                  sh           t0, -575(t1)
                  slt          a7, t0, a1
                  lb           a7, -433(t1)
                  sb           s11, -498(t1)
                  rem          t0, s10, a1
                  mulhsu       a1, s10, t0
                  sh           s10, -829(t1)
                  slli         a1, t0, 8
                  lb           s11, 234(t1)
                  sh           a7, 399(t1)
                  lb           s11, 252(t1)
                  c.xor        a1, a1
                  lb           s11, -529(t1)
                  lbu          a1, -770(t1)
                  sb           s10, -1222(t1)
                  sub          s11, a7, t0
                  lh           t0, -739(t1)
                  lw           t6, -1195(t1)
                  lb           a1, -1210(t1)
                  lb           a7, -694(t1) #end riscv_hazard_instr_stream_3
                  la           t3, region_0+1070 #start load_store_instr_stream_3
                  la           a1, region_0+1594 #start load_store_instr_stream_0
                  lbu          s9, 3(t3)
                  lb           a5, 33(a1)
                  sh           a4, 28(t3)
                  sb           a2, 21(t3)
                  la           t6, region_0+871 #start load_store_instr_stream_1
                  la           a2, region_0+87 #start load_store_instr_stream_2
                  sb           s8, 47(t6)
                  lb           t1, 1270(a2)
                  sb           t5, -29(t3)
                  lb           a4, 156(a1)
                  sb           a7, 1752(a2)
                  lb           s4, -42(t6)
                  sb           s11, -4(t6)
                  sb           s6, 64(t6)
                  sb           ra, -125(a1)
                  sb           s4, -193(a1)
                  sb           s11, 59(t6)
                  sb           a7, -51(a1)
                  lbu          s8, 119(a1)
                  lb           a7, 1550(a2)
                  lw           gp, 9(t6)
                  lb           tp, -45(t3)
                  sb           s2, -11(t3)
                  lh           tp, -61(t6)
                  lbu          a6, 39(t3)
                  lbu          t0, 56(t3)
                  lbu          a0, 1(t3) #end load_store_instr_stream_3
                  lb           t4, -92(a1)
                  sb           t2, 44(t6)
                  lbu          a0, 1342(a2)
                  lhu          s8, -246(a1)
                  lhu          a4, 1207(a2) #end load_store_instr_stream_2
                  lbu          a7, -19(t6) #end load_store_instr_stream_1
                  lbu          s10, 75(a1) #end load_store_instr_stream_0
                  la           s0, region_1+1724 #start riscv_hazard_instr_stream_6
                  lhu          t3, 14(s0)
                  lh           a2, -30(s0)
                  lhu          t3, 62(s0)
                  srai         t3, a0, 9
                  mul          s6, a0, a2
                  lhu          a2, 30(s0)
                  lb           s6, -6(s0)
                  c.addi       t3, 18
                  lb           a0, 44(s0)
                  lb           a2, 10(s0)
                  c.sw         a2, 4(s0)
                  sb           s6, 39(s0)
                  c.add        s6, a2
                  lh           a7, -48(s0)
                  sll          s6, t3, a2
                  slli         s6, zero, 1
                  lhu          s6, 34(s0)
                  lb           t3, -64(s0)
                  addi         zero, zero, -1390
                  lbu          zero, -7(s0)
                  sb           a7, -1(s0)
                  lb           a7, 29(s0)
                  srli         zero, a0, 13
                  sltiu        a0, a2, -138
                  mul          s6, s6, a7
                  lbu          s6, -1(s0)
                  sb           a7, -59(s0)
                  lb           a2, -43(s0)
                  lb           a2, -62(s0) #end riscv_hazard_instr_stream_6
                  addi         a4, zero, 6 #init loop 1 counter
                  addi         zero, zero, 0 #init loop 1 limit
                  c.andi       s0, 14
sub_5_103_1_t:    xor          a0, a0, t6
                  c.addi       t1, 6
                  c.nop
                  andi         gp, a3, 946
                  addi         a4, a4, -3 #update loop 1 counter
                  addi         s10, zero, 10 #init loop 0 counter
                  mulhsu       a2, t4, a0
                  addi         s3, zero, 7 #init loop 0 limit
sub_5_103_0_t:    addi         ra, t6, -51
                  sub          a0, a5, t2
                  addi         s10, s10, -6 #update loop 0 counter
                  bgeu         s10, s3, sub_5_103_0_t #branch for loop 0
                  c.beqz       a4, sub_5_103_1_t #branch for loop 1
                  sltu         a1, s10, s6
                  la           t1, amo_0+36 #start riscv_amo_instr_stream_3
                  amomax.w      a1, s0, (t1) #end riscv_amo_instr_stream_3
                  la           s8, region_0+1535 #start load_store_instr_stream_1
                  la           tp, region_1+127 #start load_store_instr_stream_0
                  lbu          gp, 4(s8)
                  lb           s11, 87(tp)
                  lbu          s10, 8(s8)
                  lbu          s2, 192(tp)
                  lbu          a4, -7(s8)
                  sb           sp, 6(s8)
                  lb           s0, -20(tp)
                  sb           sp, 12(s8)
                  sb           s11, -16(s8)
                  sb           s4, 5(s8)
                  lb           s1, 74(tp)
                  sb           a0, -16(s8)
                  sh           s1, -1(s8)
                  lhu          a3, 15(s8) #end load_store_instr_stream_1
                  lb           s3, 67(tp) #end load_store_instr_stream_0
                  la           s6, region_1+1032 #start load_store_instr_stream_0
                  la           a1, region_0+1787 #start load_store_instr_stream_1
                  sw           t6, 9(a1)
                  lhu          a2, -34(s6)
                  lb           s3, -9(s6)
                  lh           s7, 18(s6)
                  lw           t1, -47(a1)
                  lhu          s10, -46(s6)
                  lbu          t3, 62(a1)
                  lbu          a6, 32(s6)
                  lb           s0, 17(s6)
                  lbu          tp, 51(s6)
                  lhu          a4, -45(a1)
                  lbu          ra, -49(a1)
                  lw           ra, 29(a1)
                  sb           s10, 6(a1)
                  sh           s6, 50(s6)
                  lhu          s10, -43(a1)
                  lb           s10, 42(a1) #end load_store_instr_stream_1
                  lbu          a5, -5(s6) #end load_store_instr_stream_0
                  la           a2, region_1+27 #start riscv_hazard_instr_stream_17
                  c.srai       a4, 4
                  lbu          a4, 72(a2)
                  sh           a0, 177(a2)
                  sb           s8, 96(a2)
                  srl          a0, s3, s8
                  sw           s2, 125(a2)
                  auipc        t3, 919811
                  sb           s2, 234(a2)
                  sll          a4, s2, t3
                  sb           a0, 74(a2)
                  sh           a0, 33(a2)
                  lbu          a0, 101(a2)
                  lh           t3, 61(a2)
                  lb           a0, 202(a2)
                  srl          a4, s3, a0
                  sb           a0, 83(a2)
                  remu         a0, a0, a0
                  lb           a4, 90(a2)
                  lbu          a0, 2(a2)
                  sb           a4, 24(a2)
                  or           a4, t3, s8
                  xori         s2, s8, 985
                  slt          s2, s8, s2
                  addi         a0, s2, 465
                  sb           a0, 208(a2)
                  lbu          s3, 10(a2)
                  rem          a0, a4, s8
                  sb           a0, 10(a2)
                  lui          s8, 867208
                  srl          s2, t3, a4
                  lw           s8, 77(a2) #end riscv_hazard_instr_stream_17
                  la           t0, region_1+1713 #start riscv_hazard_instr_stream_1
                  lbu          a4, 253(t0)
                  lb           t6, -237(t0)
                  sb           a3, -89(t0)
                  sltu         t3, a3, t6
                  xori         a2, a4, 633
                  xori         t6, a2, 1102
                  rem          a4, t6, a2
                  sltu         a4, a0, a3
                  sub          a0, a3, a3
                  div          t3, t3, a0
                  xori         a3, a4, -1010
                  lb           a3, -186(t0)
                  lb           a3, 106(t0)
                  slli         t6, t3, 14
                  lbu          a4, 28(t0)
                  or           t6, a3, a3
                  srl          t6, a0, a2
                  c.slli       a2, 22
                  sb           t3, 252(t0)
                  sub          a3, t3, a2
                  xori         a2, a2, -1617
                  lb           t3, -106(t0)
                  auipc        t6, 412657
                  rem          a3, a3, a2
                  c.li         a0, 23
                  srai         a3, t6, 31
                  sb           a3, 212(t0)
                  slt          t6, t6, t6
                  slt          a4, t3, t3
                  addi         a0, t3, -454
                  mulh         a2, t3, t3
                  mulhu        a4, a4, t6
                  sub          t3, a4, a3
                  lb           t3, -163(t0)
                  auipc        t3, 183334
                  sltiu        a0, a2, -1773
                  sh           a0, 199(t0)
                  sb           t3, 6(t0) #end riscv_hazard_instr_stream_1
                  la           a7, amo_0+20 #start riscv_amo_instr_stream_12
                  la           s10, amo_0+56
                  la           s8, amo_0+52
                  la           t0, amo_0+8
                  add          s2, a6, s0
                  auipc        tp, 198408
                  amominu.w.aq  a6, s8, (s8)
                  c.srai       a5, 25
                  amoor.w.rl    a6, ra, (s8)
                  amomax.w.aq   s0, s11, (s8)
                  amoand.w.rl   a1, s3, (s10)
                  amoswap.w.aq  tp, s3, (s8)
                  amoor.w.aq    s3, a4, (s8)
                  amoadd.w.rl   a3, s7, (a7)
                  c.addi       a4, 21
                  and          a2, a2, t2
                  amoand.w.aq   a1, s7, (t0) #end riscv_amo_instr_stream_12
sub_5_33:         jal          a0, 19f
0:                c.j          10f
1:                c.jal        0b
2:                c.jal        5f
3:                jal          ra, 8f
4:                c.j          16f
5:                jal          t1, 1b
6:                c.j          4b
7:                jal          gp, 18f
8:                c.j          20f
9:                c.j          15f
10:               jal          ra, 21f
11:               c.j          12f
12:               c.j          14f
13:               jal          ra, 17f
14:               c.j          6b
15:               c.j          7b
16:               c.jal        3b
17:               jal          ra, 9b
18:               jal          t1, 2b
19:               c.jal        11b
20:               c.j          13b
21:               c.srli       a3, 26
                  la           s3, region_0+1437 #start riscv_hazard_instr_stream_10
                  mulhsu       t0, a1, a2
                  c.sub        a2, a2
                  add          a1, a1, a1
                  sh           t0, 117(s3)
                  xori         t4, t4, -425
                  lb           t0, 243(s3)
                  c.andi       a1, 20
                  lbu          a1, -63(s3)
                  ori          a1, t0, -250
                  lb           a2, 410(s3)
                  lbu          t4, -703(s3)
                  srli         s0, a2, 27
                  c.mv         t4, t4
                  lbu          s11, -1361(s3)
                  lb           s0, -1409(s3)
                  lbu          s11, 18(s3)
                  lh           s0, -195(s3)
                  lhu          t4, -1353(s3)
                  c.xor        a2, a1
                  lbu          s11, 380(s3)
                  sb           t4, -924(s3)
                  slti         a2, t0, -985
                  c.xor        a2, a1
                  lh           a1, -341(s3)
                  div          s0, s11, a1
                  sb           s0, -742(s3)
                  lbu          s0, -1054(s3) #end riscv_hazard_instr_stream_10
sub_5_49:         jal          a0, 6f
0:                c.jal        8f
1:                c.j          5f
2:                c.j          9f
3:                c.jal        10f
4:                c.jal        1b
5:                c.j          7f
6:                c.j          4b
7:                c.jal        3b
8:                c.j          11f
9:                c.j          0b
10:               jal          ra, 2b
11:               mulhu        s8, t3, t1
                  la           ra, region_0+1949 #start load_store_instr_stream_4
                  la           gp, region_0+1248 #start load_store_instr_stream_3
                  la           s4, region_0+1561 #start load_store_instr_stream_2
                  lb           s7, -227(ra)
                  la           a6, region_0+589 #start load_store_instr_stream_1
                  sb           a4, 244(gp)
                  lw           tp, -229(ra)
                  lb           a5, -221(a6)
                  la           a7, region_0+1252 #start load_store_instr_stream_0
                  lb           tp, -114(ra)
                  lb           s6, -175(ra)
                  lbu          s9, 114(a6)
                  lb           s10, -222(ra)
                  sb           s3, -89(a6)
                  lbu          s2, -49(a7)
                  lb           s5, 42(s4)
                  lb           a0, -36(a6)
                  lhu          t1, -35(a6)
                  lbu          a5, -6(s4)
                  sh           s6, 236(gp)
                  lb           s2, -58(ra)
                  lw           t0, 192(a7)
                  lh           a0, 75(a6)
                  sb           s4, 23(s4)
                  lbu          a2, 50(gp)
                  lbu          s5, -36(ra)
                  sh           a5, -97(a6)
                  sb           sp, -65(gp)
                  lb           s3, 29(s4)
                  lh           s3, 127(a6)
                  lbu          s10, 50(ra)
                  lb           s3, 107(gp)
                  sb           s6, -37(gp) #end load_store_instr_stream_3
                  lbu          a0, 253(a7)
                  sw           t0, -73(ra)
                  lbu          a3, -163(ra) #end load_store_instr_stream_4
                  lb           t6, 150(a6) #end load_store_instr_stream_1
                  sb           gp, 225(a7)
                  sb           a2, -21(s4) #end load_store_instr_stream_2
                  lb           s11, -9(a7) #end load_store_instr_stream_0
                  la           t3, amo_0+40 #start riscv_lr_sc_instr_stream_8
                  c.nop
                  add          t0, t0, a3
                  c.mv         t0, t2
                  sub          s3, ra, t3
                  add          ra, s1, gp
                  andi         s7, s3, 1254
                  c.andi       s1, 9
                  lr.w.aq       a7, (t3)
                  c.lui        a7, 9
                  sltu         s3, s0, s0
                  c.mv         s5, a7
                  slli         s1, s5, 17
                  ori          t4, s4, -243
                  ori          s10, t5, 533
                  c.li         t4, -1
                  sc.w          s1, a5, (t3) #end riscv_lr_sc_instr_stream_8
                  la           s3, region_1+329 #start riscv_hazard_instr_stream_12
                  lbu          s5, -176(s3)
                  lh           t0, 213(s3)
                  sb           s11, -141(s3)
                  sh           s9, -65(s3)
                  addi         a0, s11, -1433
                  sltiu        s11, a3, -1229
                  sb           s5, 19(s3)
                  lhu          s5, 177(s3)
                  sh           a3, -17(s3)
                  lb           t0, 54(s3)
                  lb           s11, 206(s3)
                  lh           t0, 165(s3)
                  srai         s9, s11, 31
                  lbu          s9, 194(s3)
                  lbu          s11, 138(s3)
                  mul          t0, s5, s9
                  c.nop
                  lb           a0, -56(s3)
                  c.xor        a0, a0
                  lbu          a3, -256(s3)
                  sw           t0, -169(s3)
                  sb           t0, -94(s3)
                  sb           a0, 33(s3)
                  or           t0, a0, s11
                  slt          s9, a3, t0
                  lb           s9, 33(s3)
                  lb           s11, -26(s3)
                  srli         s9, a3, 5
                  sb           s9, -76(s3)
                  slli         a3, s11, 26
                  lhu          s5, -91(s3)
                  lb           s5, 197(s3)
                  xori         a0, s5, 506
                  mulh         a3, a0, a3
                  lhu          t0, 35(s3)
                  lbu          a3, 66(s3) #end riscv_hazard_instr_stream_12
                  la           s7, amo_0+16 #start riscv_lr_sc_instr_stream_11
                  slti         a7, a0, -1013
                  add          ra, s0, sp
                  and          s8, a5, t3
                  lr.w.rl       tp, (s7)
                  sltiu        a5, zero, 1278
                  c.mv         s6, s10
                  andi         zero, s8, 1945
                  c.srai       s0, 5
                  ori          zero, a5, 996
                  sc.w.aq       a2, t2, (s7) #end riscv_lr_sc_instr_stream_11
sub_5_45:         jal          a0, 3f
0:                jal          ra, 12f
1:                c.jal        11f
2:                jal          ra, 8f
3:                c.j          0b
4:                c.jal        15f
5:                c.jal        4b
6:                c.j          17f
7:                c.j          1b
8:                c.jal        7b
9:                jal          gp, 6b
10:               jal          t1, 16f
11:               c.j          14f
12:               c.j          5b
13:               c.j          10b
14:               c.jal        13b
15:               c.j          2b
16:               c.jal        9b
17:               and          t1, s5, t2
                  la           gp, region_1+530 #start riscv_load_store_hazard_instr_stream_0
                  lb           t3, 202(gp)
                  c.nop
                  sb           ra, 83(gp)
                  lbu          tp, 83(gp)
                  sb           a5, 112(gp)
                  lh           s3, 112(gp)
                  lhu          s2, 112(gp)
                  c.andi       a2, -1
                  sub          a5, a0, s0
                  sb           s11, -171(gp)
                  sb           tp, -231(gp)
                  slli         s4, a0, 9
                  lbu          a5, -231(gp)
                  lb           s3, -231(gp) #end riscv_load_store_hazard_instr_stream_0
                  la           s10, region_1+954 #start riscv_load_store_hazard_instr_stream_9
                  sll          s7, a3, a6
                  sw           t2, 2(s10)
                  sw           s11, 2(s10)
                  sll          t4, s1, s8
                  divu         s5, a1, s6
                  sb           t5, 11(s10)
                  lb           t4, 11(s10)
                  lbu          s11, -5(s10)
                  sll          a6, t6, s8
                  lhu          s11, -16(s10)
                  lb           a6, 15(s10)
                  add          s4, a1, t5
                  sll          s11, s5, a4
                  lb           t0, 15(s10)
                  sb           t5, -16(s10)
                  lbu          zero, 13(s10)
                  lbu          gp, -3(s10)
                  c.and        a4, a5
                  sb           sp, -14(s10) #end riscv_load_store_hazard_instr_stream_9
                  la           t4, region_1+984 #start load_store_instr_stream_1
                  la           s3, region_0+1909 #start load_store_instr_stream_0
                  lh           s4, 12(t4)
                  lb           t6, -32(s3)
                  lb           t3, -4(t4)
                  lb           a7, -13(s3)
                  lb           s1, -50(s3)
                  lb           s11, 10(t4)
                  lb           s5, -28(s3)
                  lbu          a3, 15(t4)
                  lb           s8, -14(s3)
                  lb           ra, -3(t4) #end load_store_instr_stream_1
                  lb           s10, -18(s3)
                  lhu          s1, -5(s3) #end load_store_instr_stream_0
                  addi         a6, zero, 10 #init loop 0 counter
                  sll          s9, zero, t0
                  c.lui        s4, 14
                  add          t0, s0, s0
                  c.slli       a3, 13
                  c.li         s11, -1
                  slt          a0, a6, s4
                  addi         tp, zero, 9 #init loop 0 limit
sub_5_98_0_t:     slt          gp, s4, a0
                  sltu         s3, s9, s1
                  lui          ra, 804429
                  c.sub        s0, s1
                  addi         a6, a6, -4 #update loop 0 counter
                  mul          s0, s11, gp
                  sll          s8, a2, s4
                  mulhsu       a1, a2, a5
                  bgeu         a6, tp, sub_5_98_0_t #branch for loop 0
                  sll          ra, tp, a6
                  la           t1, region_1+276 #start riscv_load_store_hazard_instr_stream_6
                  lbu          gp, 6(t1)
                  lbu          t0, 6(t1)
                  lb           s11, 6(t1)
                  sh           s2, 6(t1)
                  lhu          a2, 6(t1)
                  lbu          t3, 6(t1)
                  sb           t2, 6(t1)
                  sb           s8, 6(t1)
                  lbu          s7, 6(t1)
                  sb           a1, 6(t1)
                  lhu          s1, 6(t1)
                  mulh         a4, t0, a5
                  and          s9, tp, gp
                  sh           gp, 6(t1)
                  lh           s1, 6(t1)
                  lhu          a7, 6(t1)
                  sw           s2, -4(t1)
                  lhu          a7, -4(t1)
                  lhu          s0, -4(t1) #end riscv_load_store_hazard_instr_stream_6
                  la           a7, region_1+1591 #start load_store_instr_stream_1
                  la           a0, region_0+1354 #start load_store_instr_stream_0
                  lbu          s11, -177(a7)
                  lb           t3, 192(a7)
                  lb           gp, -27(a0)
                  sh           s6, 64(a0)
                  lb           s6, 253(a7)
                  lb           a5, -62(a0)
                  lbu          zero, -102(a7)
                  lb           s2, 20(a0)
                  lh           a4, -57(a7)
                  lb           a1, -13(a7)
                  lh           s11, 203(a7)
                  sb           t3, -37(a0)
                  sb           a4, -53(a0)
                  lb           s0, -33(a0)
                  sh           a6, 33(a7)
                  sb           a4, 57(a0)
                  lh           s2, 135(a7) #end load_store_instr_stream_1
                  lbu          s2, 59(a0) #end load_store_instr_stream_0
                  la           s9, region_1+274 #start riscv_hazard_instr_stream_16
                  sb           t3, 53(s9)
                  sltu         gp, t4, s3
                  sb           tp, -67(s9)
                  srli         a2, t4, 28
                  sh           gp, 2(s9)
                  sb           tp, -231(s9)
                  lbu          t3, 207(s9)
                  sh           gp, 54(s9)
                  lb           s3, 211(s9)
                  c.sub        a2, a2
                  mul          gp, a2, t3
                  lbu          gp, 87(s9)
                  lb           s3, -232(s9)
                  div          s3, t3, gp
                  sb           a2, 61(s9)
                  sb           t3, 241(s9)
                  lbu          tp, 81(s9)
                  sra          s3, s3, gp
                  c.nop
                  lhu          s3, -188(s9)
                  lb           s3, -9(s9)
                  sb           t3, -36(s9)
                  lb           tp, 154(s9)
                  c.srli       a2, 29
                  slt          t4, s3, a2
                  lbu          tp, 115(s9)
                  lb           t4, -9(s9)
                  remu         tp, tp, gp
                  sb           a2, -175(s9)
                  c.sub        a2, a2
                  sb           gp, 222(s9)
                  sb           t3, 96(s9)
                  lb           s3, -164(s9)
                  sh           t3, 90(s9)
                  sb           gp, -175(s9) #end riscv_hazard_instr_stream_16
                  la           s1, amo_0+0 #start riscv_amo_instr_stream_8
                  la           a1, amo_0+36
                  la           s11, amo_0+24
                  la           a6, amo_0+0
                  amoxor.w.rl   a7, t3, (s1)
                  c.add        s10, sp
                  amomin.w.rl   a4, s7, (a6)
                  amominu.w     s0, t3, (s1)
                  c.sub        a5, a2
                  c.sub        a5, a3
                  amomaxu.w.aq  s2, s6, (s1)
                  c.srai       a4, 29
                  add          s2, t6, s9
                  amoswap.w.rl  a2, s5, (s11)
                  xor          s9, a5, s4
                  sltu         a2, s11, zero
                  amomin.w.aq   zero, s7, (a1)
                  sltiu        ra, a5, -1842
                  amoxor.w.rl   s4, gp, (a6)
                  c.srli       a0, 30
                  amoxor.w.aq   a4, t6, (a1)
                  amomax.w.rl   a3, s8, (a6)
                  amomaxu.w.aq  zero, s7, (a6) #end riscv_amo_instr_stream_8
                  la           t4, region_0+1415 #start riscv_load_store_hazard_instr_stream_13
                  lbu          s11, -12(t4)
                  lb           a0, -12(t4)
                  lb           s8, -12(t4)
                  sb           a5, -6(t4)
                  sb           s3, -6(t4)
                  srli         t3, a1, 26
                  sb           s1, -6(t4)
                  slti         s6, a1, -876
                  lbu          s11, -6(t4)
                  sb           s2, -6(t4)
                  sb           ra, -6(t4)
                  c.nop
                  sb           a1, -6(t4) #end riscv_load_store_hazard_instr_stream_13
                  addi         t0, zero, 1 #init loop 1 counter
                  sub          t1, a6, s9
                  mul          a6, s11, s1
                  c.slli       s9, 24
                  c.srli       a3, 1
                  addi         s10, zero, 10 #init loop 1 limit
                  srai         a4, t2, 0
                  or           s1, a0, a2
                  addi         a7, s3, -405
sub_5_96_1_t:     mulhsu       ra, s2, a3
                  addi         t0, t0, 9 #update loop 1 counter
                  c.addi       s3, 4
                  nop
                  addi         tp, zero, -7 #init loop 0 counter
                  mulhu        a5, s5, t0
                  slt          s7, a5, a7
                  c.srai       a0, 28
                  nop
                  c.srli       a4, 17
                  addi         t3, zero, 4 #init loop 0 limit
                  or           s5, s8, s11
sub_5_96_0_t:     c.or         a4, a0
                  srl          s5, t4, s6
                  addi         tp, tp, 8 #update loop 0 counter
                  c.lui        gp, 18
                  bltu         tp, t3, sub_5_96_0_t #branch for loop 0
                  c.srli       s1, 7
                  c.li         s0, 5
                  xor          s8, a1, a7
                  slli         t6, a3, 22
                  nop
                  c.slli       gp, 12
                  mul          t4, a5, tp
                  bne          t0, s10, sub_5_96_1_t #branch for loop 1
                  c.lui        t4, 19
                  addi         a0, zero, 9 #init loop 0 counter
                  addi         s4, zero, 8 #init loop 0 limit
sub_5_93_0_t:     c.add        s9, s2
                  c.lui        a2, 25
                  addi         a0, a0, -7 #update loop 0 counter
                  andi         zero, s5, -1968
                  auipc        gp, 336708
                  c.slli       a7, 19
                  c.mv         ra, a4
                  c.slli       a2, 31
                  bgeu         a0, s4, sub_5_93_0_t #branch for loop 0
                  c.srli       a1, 20
                  la           a2, region_0+902 #start riscv_hazard_instr_stream_15
                  slli         s0, a0, 10
                  lh           s8, -420(a2)
                  sb           t1, 343(a2)
                  c.mv         a0, s10
                  sub          a0, s0, t1
                  nop
                  auipc        t1, 129167
                  sb           s0, 180(a2)
                  c.lui        s10, 19
                  lb           s8, -751(a2)
                  mulhsu       a0, t1, s0
                  sb           t1, 759(a2)
                  sb           s10, 945(a2)
                  lbu          a0, -715(a2)
                  sll          s0, s0, t4
                  c.slli       t1, 27
                  sltu         s8, a0, t1
                  sltiu        a0, t4, 1629
                  c.slli       t4, 6
                  lb           s0, 545(a2)
                  c.srai       a0, 23
                  c.addi       s8, -1
                  c.add        s8, t1
                  remu         a0, t4, t4
                  c.mv         a0, t1
                  sb           s10, -817(a2)
                  mul          s8, t4, t1
                  sw           s10, 38(a2) #end riscv_hazard_instr_stream_15
                  la           a7, region_0+1462 #start riscv_load_store_rand_instr_stream_10
                  mulhsu       s7, s11, a7
                  xor          s5, t2, t6
                  xori         a0, a2, -203
                  lui          s8, 410207
                  slt          s6, tp, a3
                  mulhu        s1, s2, t4
                  slt          s8, gp, s5
                  lbu          ra, -11(a7)
                  slt          a1, s0, a3
                  lb           s8, -7(a7)
                  sb           s7, -5(a7)
                  xori         a0, s8, -1765
                  div          t6, t2, s1
                  lbu          a3, -9(a7)
                  sb           s9, -4(a7)
                  lh           s10, -16(a7)
                  lb           a1, -13(a7)
                  slli         t3, s9, 1
                  lb           a3, 13(a7)
                  sltiu        s7, tp, 168
                  lhu          a0, -14(a7)
                  lbu          a2, -12(a7)
                  and          s8, s0, a4
                  srli         a0, t0, 27
                  sh           sp, -14(a7)
                  lbu          a6, -12(a7)
                  lui          s10, 1045965
                  lbu          s6, -9(a7)
                  nop
                  c.sub        a5, s0
                  sw           t5, -14(a7)
                  lh           s5, -4(a7)
                  lb           a1, -11(a7)
                  or           s7, s9, a4
                  lbu          s4, 2(a7)
                  lbu          a5, 1(a7)
                  addi         s4, t0, -1189
                  c.slli       s4, 6
                  lbu          s5, 15(a7)
                  lh           t3, 0(a7)
                  lw           s10, 2(a7)
                  lh           s3, 4(a7)
                  lh           t3, -8(a7)
                  slli         gp, s8, 22
                  lb           t1, 12(a7)
                  lb           zero, -9(a7)
                  c.nop
                  lbu          tp, -9(a7) #end riscv_load_store_rand_instr_stream_10
                  la           s4, region_0+744 #start load_store_instr_stream_1
                  lb           a3, -235(s4)
                  lbu          t4, -253(s4)
                  la           a0, region_0+234 #start load_store_instr_stream_0
                  lbu          s1, -131(s4)
                  sb           t5, 255(s4)
                  sb           t1, 1445(a0)
                  lb           s7, 3(s4)
                  sb           zero, -157(a0)
                  lb           s3, 812(a0)
                  lh           s2, 140(s4)
                  sb           zero, 85(a0)
                  sh           a1, 4(s4)
                  sb           a4, 1323(a0)
                  sh           t3, -22(s4)
                  sw           s1, 240(s4) #end load_store_instr_stream_1
                  sw           s0, 1354(a0) #end load_store_instr_stream_0
                  la           a1, region_1+121 #start load_store_instr_stream_0
                  la           s7, region_1+1 #start load_store_instr_stream_2
                  sb           a0, 97(s7)
                  la           s9, region_1+1927 #start load_store_instr_stream_1
                  sw           s11, 83(s7)
                  sb           gp, -583(s9)
                  lbu          a7, 222(s7)
                  la           t3, region_1+449 #start load_store_instr_stream_3
                  lbu          t0, 188(a1)
                  lb           zero, 15(t3)
                  sb           s11, -1024(s9)
                  lbu          s0, 6(t3)
                  sh           a7, 91(s7)
                  lbu          s10, 69(s7)
                  lbu          a4, -11(t3)
                  lbu          s6, -1013(s9)
                  lbu          t1, -1604(s9)
                  lbu          a7, 16(s7)
                  lb           s3, 51(a1)
                  lb           s1, 168(s7)
                  lbu          t6, -1(t3)
                  lbu          s1, -576(s9)
                  sh           t0, -7(a1)
                  sb           tp, -570(s9)
                  lb           s2, 25(s7)
                  lbu          a7, -1310(s9)
                  lh           zero, 5(t3)
                  lb           a2, 156(s7)
                  lw           a6, -13(a1)
                  lb           a7, 58(s7) #end load_store_instr_stream_2
                  lbu          t4, -1736(s9)
                  lh           a4, -15(t3)
                  lb           s6, -346(s9)
                  lbu          ra, -2(t3)
                  lbu          zero, -11(a1)
                  sb           s6, -16(t3) #end load_store_instr_stream_3
                  lb           t6, -1658(s9) #end load_store_instr_stream_1
                  lb           s1, -103(a1) #end load_store_instr_stream_0
                  la           t3, region_0+1666 #start riscv_load_store_rand_instr_stream_3
                  lhu          a3, -6(t3)
                  sb           s3, 4(t3)
                  c.srai       a1, 29
                  lh           s7, 4(t3)
                  sb           s5, -4(t3)
                  c.mv         a5, s9
                  c.lui        a4, 30
                  lh           a5, 8(t3)
                  lb           ra, -15(t3)
                  c.srai       a0, 14
                  add          s11, s3, a6
                  sb           a5, 7(t3)
                  and          a0, s7, t6
                  lb           s0, -3(t3)
                  sltu         s9, a2, s4
                  c.mv         a5, a6
                  sb           a5, -5(t3)
                  lw           t1, 14(t3)
                  lb           a5, 13(t3)
                  lbu          t6, -12(t3)
                  rem          a4, s2, a1
                  mul          a2, s8, t4
                  slti         t6, a4, -471
                  sb           s0, 0(t3)
                  lw           a7, -2(t3)
                  or           ra, s4, a6
                  lb           s3, -4(t3)
                  sh           t0, 16(t3)
                  lbu          s2, -8(t3)
                  lh           a1, -2(t3)
                  lbu          s9, 3(t3)
                  sll          s7, s7, t4
                  sh           s1, 0(t3) #end riscv_load_store_rand_instr_stream_3
                  la           s2, region_1+647 #start riscv_load_store_rand_instr_stream_18
                  lw           a3, -127(s2)
                  c.addi       s10, 2
                  c.andi       s0, -1
                  lb           a5, 165(s2)
                  lb           a5, -118(s2)
                  lbu          s4, 218(s2)
                  lbu          t0, 188(s2)
                  xor          a3, tp, s1
                  slt          s6, s10, s3
                  div          s3, t4, s0
                  sb           a7, -252(s2)
                  c.mv         t4, a4
                  rem          s9, t5, a2
                  lbu          a0, -152(s2)
                  lhu          zero, -253(s2)
                  lb           a2, -166(s2)
                  mulhsu       s4, t6, s5
                  srl          a7, t2, t1
                  or           s9, s1, a5
                  c.sub        a4, a4
                  lui          s7, 979431
                  lbu          tp, 256(s2)
                  xori         s5, s5, 651
                  lbu          s0, 122(s2)
                  srl          s1, t6, s6
                  sb           t3, 250(s2)
                  c.srli       a4, 20
                  sw           a4, -171(s2)
                  lh           s3, -223(s2)
                  add          t0, s9, sp
                  lbu          t3, 61(s2)
                  sw           t1, 45(s2)
                  xor          s11, t2, s10
                  lbu          s10, 42(s2)
                  lb           ra, -76(s2)
                  sb           t6, 160(s2)
                  c.or         a0, a2
                  mulh         s0, s0, s6
                  or           a6, gp, a2
                  sb           s5, -238(s2)
                  xori         s10, a1, 1518
                  lb           t1, -2(s2)
                  sb           s5, 26(s2)
                  and          t6, t2, s3
                  lb           a1, -220(s2)
                  sw           ra, 185(s2)
                  c.lui        a3, 4
                  andi         tp, a0, 88
                  c.srai       s1, 6
                  c.slli       s5, 3
                  c.mv         s0, s6
                  lbu          s8, 81(s2)
                  sb           t4, 45(s2) #end riscv_load_store_rand_instr_stream_18
                  la           s5, amo_0+20 #start riscv_lr_sc_instr_stream_3
                  c.add        a2, t0
                  addi         s10, s6, 2029
                  nop
                  addi         s9, tp, 101
                  xori         s7, tp, 1092
                  sltu         a3, s4, s3
                  lr.w          s9, (s5)
                  c.or         a2, s0
                  c.andi       s0, -1
                  sc.w.aq       t1, tp, (s5) #end riscv_lr_sc_instr_stream_3
                  la           s11, amo_0+60 #start riscv_amo_instr_stream_0
                  amomin.w.aq   t3, s5, (s11) #end riscv_amo_instr_stream_0
                  la           a5, region_1+383 #start riscv_load_store_hazard_instr_stream_3
                  sb           ra, 978(a5)
                  lbu          s0, 978(a5)
                  lbu          t3, 978(a5)
                  sb           s7, 978(a5)
                  rem          a1, ra, s3
                  lbu          s1, 1225(a5)
                  sb           s5, 1355(a5)
                  lb           tp, 1523(a5)
                  lbu          a2, 94(a5)
                  lbu          s3, -220(a5)
                  lbu          zero, -220(a5)
                  lb           t6, -220(a5)
                  mul          s2, s3, sp
                  lb           s2, -220(a5)
                  lbu          s7, -220(a5)
                  sb           s9, -220(a5)
                  sb           a1, 698(a5)
                  lbu          s11, 698(a5)
                  lb           s4, 698(a5)
                  sb           s6, 698(a5)
                  srai         s2, tp, 2
                  sh           s9, 919(a5) #end riscv_load_store_hazard_instr_stream_3
                  la           s1, region_1+245 #start load_store_instr_stream_0
                  lw           t1, 107(s1)
                  la           t0, region_0+1216 #start load_store_instr_stream_1
                  lb           t4, -168(s1)
                  lh           s2, 97(s1)
                  lb           tp, -15(s1)
                  sb           zero, 209(s1)
                  sb           s11, -3(t0)
                  lbu          a6, -240(s1)
                  sb           t5, 13(t0)
                  sb           a2, 11(t0)
                  lbu          gp, -169(s1)
                  lb           s3, -12(t0)
                  lb           a2, -98(s1)
                  lhu          s8, 14(t0)
                  lb           a3, -5(t0)
                  sh           t1, -173(s1)
                  sb           a7, 7(t0)
                  sb           gp, -8(t0) #end load_store_instr_stream_1
                  lbu          a3, 144(s1) #end load_store_instr_stream_0
                  la           s4, region_0+77 #start riscv_load_store_rand_instr_stream_1
                  sh           s9, 461(s4)
                  c.or         a1, s1
                  c.xor        s1, a0
                  sb           tp, 1708(s4)
                  c.srai       a0, 21
                  lbu          s6, 1834(s4)
                  sll          a4, t5, s2
                  divu         a7, a5, s11
                  mulhsu       a7, s10, ra
                  lhu          s11, -51(s4)
                  c.nop
                  lb           s2, 426(s4)
                  lbu          s5, 1548(s4)
                  c.lui        a6, 3
                  lbu          zero, 1618(s4)
                  c.li         a2, -1
                  srli         t0, s2, 24
                  add          a6, s7, t2
                  andi         s2, s3, 476
                  lui          a1, 892733
                  remu         s8, t6, sp
                  c.lui        ra, 8
                  nop
                  auipc        tp, 731574
                  c.slli       gp, 2
                  and          s2, t6, s8
                  lw           a2, 1063(s4)
                  c.andi       a2, -1
                  lb           s0, 11(s4)
                  c.srli       a0, 19
                  srli         a5, zero, 31
                  lb           gp, 55(s4)
                  sb           s5, 1066(s4) #end riscv_load_store_rand_instr_stream_1
sub_5_38:         jal          a0, 5f
0:                jal          ra, 4f
1:                c.jal        3f
2:                jal          tp, 9f
3:                c.j          22f
4:                jal          s7, 17f
5:                jal          ra, 6f
6:                c.jal        16f
7:                jal          s9, 21f
8:                c.jal        12f
9:                jal          ra, 14f
10:               c.j          19f
11:               jal          t1, 7b
12:               c.j          13f
13:               c.j          15f
14:               c.j          11b
15:               c.jal        20f
16:               c.jal        10b
17:               c.j          1b
18:               jal          s6, 8b
19:               jal          t0, 23f
20:               jal          s4, 24f
21:               c.jal        18b
22:               jal          ra, 2b
23:               jal          ra, 0b
24:               srl          gp, s2, t5
                  la           s7, region_1+1473 #start load_store_instr_stream_0
                  la           gp, region_0+800 #start load_store_instr_stream_1
                  lbu          a3, 62(gp)
                  sb           s7, 112(s7)
                  lbu          t0, 141(gp)
                  lhu          tp, 149(s7)
                  sb           s9, 23(gp)
                  lb           t3, 90(s7)
                  lbu          a3, -50(s7)
                  lb           ra, -53(gp)
                  lb           s11, -4(s7)
                  sb           a2, -123(gp)
                  lbu          s4, 230(s7)
                  sb           ra, -55(s7)
                  lh           s8, -158(gp) #end load_store_instr_stream_1
                  lw           a3, -145(s7)
                  lbu          t1, 101(s7)
                  lbu          s9, 241(s7) #end load_store_instr_stream_0
sub_5_51:         jal          a0, 6f
0:                jal          ra, 11f
1:                c.jal        15f
2:                c.jal        12f
3:                c.j          17f
4:                c.jal        19f
5:                jal          t1, 26f
6:                c.jal        4b
7:                jal          ra, 24f
8:                c.j          7b
9:                c.j          21f
10:               c.jal        18f
11:               jal          s6, 25f
12:               c.jal        10b
13:               c.j          23f
14:               c.j          2b
15:               c.jal        22f
16:               c.jal        8b
17:               jal          t1, 20f
18:               c.j          9b
19:               c.jal        1b
20:               c.j          27f
21:               c.j          0b
22:               jal          a3, 14b
23:               c.j          5b
24:               jal          a4, 3b
25:               c.j          13b
26:               c.j          16b
27:               slt          gp, a6, s2
                  la           a1, region_1+988 #start riscv_load_store_hazard_instr_stream_12
                  lb           a7, 174(a1)
                  lbu          ra, 174(a1)
                  mul          t0, s2, ra
                  sb           t0, 32(a1)
                  c.mv         s1, t1
                  mulhu        t4, tp, s7
                  sb           a5, 125(a1)
                  sb           t1, 125(a1)
                  lbu          s5, 125(a1)
                  lh           s4, 180(a1)
                  sb           s3, 180(a1)
                  lh           a7, 180(a1)
                  lhu          s0, 180(a1)
                  sh           s2, 98(a1)
                  lh           a3, 40(a1)
                  c.li         a3, 9
                  c.sw         a4, 40(a1)
                  sw           gp, 40(a1)
                  mulhsu       zero, a7, t0
                  nop
                  sb           a7, 34(a1)
                  sb           s1, 47(a1) #end riscv_load_store_hazard_instr_stream_12
                  la           s4, region_1+410 #start load_store_instr_stream_0
                  lh           s5, 938(s4)
                  lb           a0, 189(s4)
                  la           s1, region_0+523 #start load_store_instr_stream_1
                  sb           t1, 809(s4)
                  lbu          s0, -70(s1)
                  lhu          a7, -330(s4)
                  lb           gp, -124(s1)
                  lb           s10, -55(s4)
                  lbu          a1, 139(s1)
                  lbu          s10, 145(s4)
                  lbu          zero, -136(s4)
                  lhu          a5, 59(s1)
                  sb           s2, 481(s4)
                  lb           t1, -219(s1)
                  sb           s1, 987(s4)
                  sb           s7, -200(s1) #end load_store_instr_stream_1
                  sb           t6, -84(s4) #end load_store_instr_stream_0
                  la           s11, amo_0+48 #start riscv_lr_sc_instr_stream_13
                  lr.w.rl       s2, (s11)
                  sc.w.aq       s2, zero, (s11) #end riscv_lr_sc_instr_stream_13
                  la           a2, amo_0+48 #start riscv_lr_sc_instr_stream_9
                  c.add        tp, a2
                  c.srai       s0, 29
                  c.and        a0, a4
                  sll          a3, t1, gp
                  c.srai       a0, 19
                  c.and        s0, s0
                  c.addi       t1, 12
                  slti         a7, tp, -555
                  auipc        s7, 129815
                  c.add        s3, t2
                  and          s8, s6, s8
                  lr.w.aq       s10, (a2)
                  and          gp, sp, s11
                  c.lui        s9, 6
                  c.andi       a1, -1
                  sc.w.rl       s6, t1, (a2) #end riscv_lr_sc_instr_stream_9
                  c.nop
                  srai         t6, s8, 9
                  c.li         s11, 14
                  xori         s7, a3, -253
                  srai         s4, ra, 6
                  bne          s6, a2, 20f
                  c.srai       a5, 1
                  ori          a5, s2, -514
                  and          a4, s7, a6
                  mul          a5, t0, gp
                  xor          s4, s0, a7
                  sra          a6, a4, s7
                  xori         a4, a1, -940
                  srl          a3, s3, a2
                  ori          a6, a6, -985
                  divu         t6, s0, a2
                  c.sub        a3, s0
                  add          a0, sp, a3
                  lui          s2, 1026016
                  blt          a6, a4, 25f
20:               c.mv         a3, tp
                  lui          a3, 209874
                  and          s4, s1, a1
                  nop
                  bne          t2, ra, 38f
25:               c.srli       a0, 18
                  c.addi       s1, -1
                  bge          s3, s11, 33f
                  mulhsu       a1, zero, s3
                  c.mv         a7, t0
                  c.srai       a1, 31
                  c.slli       s5, 2
                  c.and        a1, s0
33:               blt          t4, ra, 35f
                  divu         a3, t6, ra
35:               bltu         s2, s4, 46f
                  andi         a7, sp, -503
                  ori          s10, a3, -363
38:               andi         s10, t4, 997
                  bgeu         t0, s5, 42f
                  c.andi       s0, -1
                  xor          t0, t4, a7
42:               sltu         a3, ra, s0
                  bne          zero, t4, 55f
                  c.li         s10, -1
                  srli         s0, t6, 22
46:               srl          s11, s0, sp
                  slli         s1, sp, 24
                  srl          a7, t1, t5
                  bge          gp, s10, 57f
                  sra          a5, s1, s1
                  and          s5, t1, s1
                  c.beqz       a5, 55f
                  ori          a2, s11, 1348
                  c.andi       a2, -1
55:               mulh         s7, t2, a2
                  rem          s4, a7, t5
57:               mulhu        a7, a5, a4
                  div          s8, a6, t3
                  andi         a7, a4, -1998
                  ori          gp, sp, 1132
                  div          s8, ra, a0
                  sub          t0, t3, ra
                  and          s7, t5, s1
                  c.addi       s3, 14
                  c.slli       a5, 23
                  c.sub        a4, a2
                  auipc        t6, 885923
                  auipc        t0, 527113
                  lui          s0, 838114
                  mulhu        s3, zero, a0
                  xori         a5, a0, 1844
                  c.nop
                  ori          t1, t1, -159
                  blt          t0, s5, 76f
                  beq          a3, t3, 89f
76:               mulh         a3, sp, t4
                  c.lui        s6, 18
                  c.lui        s2, 5
                  c.beqz       s1, 92f
                  c.srai       a5, 14
                  slt          a2, t5, s5
                  sub          gp, t4, s8
                  slli         a2, a1, 18
                  srai         s2, s6, 24
                  and          a7, s8, s10
                  c.nop
                  ori          a5, a1, 1088
                  bge          sp, gp, 97f
89:               rem          s0, s11, tp
                  c.lui        a7, 6
                  blt          sp, a2, 95f
92:               rem          a1, a3, s2
                  div          a5, a4, s8
                  sltiu        zero, sp, 1319
95:               c.and        s0, s1
                  c.mv         t3, t4
97:               ori          s9, s7, 1650
                  c.and        a1, s0
                  c.andi       s0, -1
                  c.beqz       s0, 106f
                  mulh         s4, s0, t3
                  c.and        a4, s1
                  or           a1, s2, a1
                  auipc        a2, 776337
                  or           a4, s10, s4
106:              beq          s0, a2, 122f
                  c.slli       a1, 10
                  c.nop
                  div          a1, a2, zero
                  c.nop
                  c.srai       a3, 30
                  mulh         a2, a0, t2
                  c.nop
                  c.and        a3, a4
                  c.bnez       a0, 124f
                  srl          a4, a2, s4
                  c.slli       s9, 10
                  xori         s1, s11, -558
                  xori         t6, sp, -512
                  nop
                  sltu         a4, a6, s5
122:              c.sub        a1, a1
                  div          s7, s4, s5
124:              beq          t4, s10, 130f
                  c.mv         s9, s4
                  lui          gp, 726618
                  xor          a3, s0, s3
                  c.addi       s9, 14
                  sltiu        s2, a2, 557
130:              bgeu         zero, t6, 132f
                  c.lui        s5, 20
132:              c.or         s1, a5
                  c.slli       a1, 31
                  c.beqz       a2, 144f
                  c.slli       t0, 17
                  slt          a7, ra, zero
                  c.add        s7, a0
                  beq          ra, a0, 141f
                  c.xor        a4, s1
                  srai         s11, a4, 1
141:              sra          ra, a4, sp
                  divu         t4, s3, t1
                  ori          t6, s10, 761
144:              slti         t3, t2, 174
                  srai         a1, t4, 13
                  xor          a5, s11, s11
                  mul          t0, a7, t5
                  mulhsu       s9, t4, a3
                  auipc        s3, 561860
                  c.lui        s11, 25
                  c.beqz       a2, 169f
                  slt          s8, s4, sp
                  c.srli       s1, 5
                  addi         tp, a4, 1260
                  blt          t6, s9, 170f
                  rem          a0, a3, ra
                  lui          t4, 1031546
                  nop
                  c.xor        a5, a0
                  c.nop
                  c.xor        a3, a3
                  c.srli       a5, 4
                  and          a0, a3, a1
                  addi         t1, a4, -1170
                  addi         s0, t1, 572
                  c.nop
                  srl          s0, s9, s2
                  c.xor        a3, a5
169:              c.srli       a2, 16
170:              xor          s4, s1, t2
                  add          a0, t1, a6
                  sra          s4, s8, a7
                  blt          zero, s8, 178f
                  srli         s3, a1, 18
                  rem          a2, t5, a2
                  nop
                  add          s5, a4, s5
178:              lui          a2, 177818
                  slli         t0, a4, 14
                  mulhu        t6, t0, t6
                  or           t3, t5, tp
                  c.mv         tp, t6
                  addi         a5, s0, 197
                  sltu         t0, t5, t6
                  addi         gp, s0, -115
                  bltu         s7, a3, 194f
                  bne          s4, zero, 205f
                  slti         gp, a4, -107
                  sub          a5, s11, s3
                  slti         a3, s2, -1317
                  div          s11, sp, s11
                  c.lui        s8, 15
                  c.srai       a5, 14
194:              c.mv         s1, a6
                  slt          t1, a4, t2
                  mulhsu       t1, s5, ra
                  divu         s8, t5, t3
                  c.addi       s5, 3
                  blt          a5, s0, 212f
                  srl          s6, a4, s7
                  c.add        s0, s1
                  beq          t4, a4, 219f
                  c.lui        a0, 30
                  slti         a7, a1, -1401
205:              c.or         a5, a4
                  ori          zero, s10, -2008
                  xor          s5, t2, s2
                  bge          a2, s8, 223f
                  div          a6, zero, a0
                  c.or         s1, a3
                  divu         tp, s11, a0
212:              auipc        ra, 300707
                  mulhsu       s6, s11, s11
                  rem          t0, t4, a6
                  or           s9, t0, ra
                  c.and        a4, a3
                  c.add        t0, t1
                  auipc        s4, 609426
219:              mulhu        s0, t2, gp
                  rem          t0, t0, t3
                  and          s9, s2, sp
                  c.bnez       a2, 236f
223:              c.slli       t6, 25
                  c.and        a4, s1
                  srai         s11, t0, 6
                  c.li         s6, -1
                  andi         s3, gp, -1630
                  sub          s2, s7, a0
                  c.addi       gp, 11
                  c.or         s1, a1
                  mulhu        ra, a2, a2
                  c.mv         s8, tp
                  add          a4, t4, s8
                  bne          a5, t2, 236f
                  bgeu         tp, t6, 243f
236:              c.srai       a3, 8
                  xori         gp, a4, -1630
                  slti         s2, s6, -1457
                  bne          s3, s11, 254f
                  beq          ra, a3, 243f
                  mulhsu       t4, s3, s0
                  c.li         s11, 10
243:              blt          s7, t4, 249f
                  sltu         s3, tp, s3
                  bltu         s7, a0, 255f
                  srai         s2, s8, 31
                  div          a5, t6, s3
                  bne          t2, s8, 250f
249:              lui          a4, 633489
250:              c.beqz       s0, 259f
                  divu         a6, a3, s11
                  c.andi       a1, -1
                  c.srai       a3, 18
254:              mulhsu       s5, t3, s0
255:              slt          s1, s2, s7
                  c.sub        a2, a0
                  bge          s7, a1, 270f
                  srli         t4, ra, 30
259:              c.lui        ra, 1
                  c.li         t4, -1
                  srli         s0, zero, 6
                  c.add        a6, t5
                  xori         zero, a4, 1282
                  auipc        t0, 90126
                  addi         a0, s0, -353
                  c.beqz       a0, 279f
                  slti         s10, t5, -1587
                  c.beqz       a3, 272f
                  c.slli       s11, 25
270:              and          a5, a4, s9
                  c.lui        s11, 20
272:              c.nop
                  bltu         gp, a5, 282f
                  sll          s2, t0, a2
                  blt          a2, s6, 281f
                  blt          s10, zero, 294f
                  slt          s9, a3, s9
                  c.beqz       a3, 295f
279:              auipc        a6, 856427
                  c.bnez       a3, 288f
281:              nop
282:              sub          s2, a6, a3
                  c.xor        a1, a2
                  remu         s0, t0, s10
                  c.xor        a1, s0
                  srl          s9, a5, s6
                  slli         a7, t0, 24
288:              mulhu        s2, t5, a7
                  mul          a3, a2, s1
                  blt          s6, s7, 295f
                  divu         s2, a5, t3
                  c.nop
                  c.li         a1, 27
294:              remu         a0, s7, t4
295:              ori          a5, s11, 529
                  auipc        s1, 859396
                  c.mv         s0, s5
                  srl          t4, s11, ra
                  blt          s7, s0, 311f
                  sltiu        zero, t4, -1644
                  c.srai       s0, 29
                  addi         t1, s4, 128
                  blt          a3, sp, 306f
                  addi         t0, a4, -208
                  c.bnez       s1, 316f
306:              mulhu        a7, s7, s6
                  and          s4, sp, a2
                  xori         t6, a4, -1633
                  c.lui        s8, 3
                  sltiu        s10, a3, -1468
311:              c.addi       s2, -1
                  sll          ra, a1, t0
                  c.srli       a4, 6
                  sra          t1, a4, t0
                  sll          s5, s4, a3
316:              c.lui        s2, 11
                  c.or         a0, a0
                  ori          t0, s11, 55
                  bge          a2, s1, 333f
                  c.srai       a4, 16
                  bgeu         t1, t0, 339f
                  c.andi       a2, 6
                  srli         s1, s8, 19
                  slti         ra, t1, 839
                  sra          a3, s6, s7
                  or           a6, gp, s6
                  slti         s3, s10, -1667
                  c.addi       t1, 21
                  c.bnez       a1, 345f
                  bge          s11, t3, 345f
                  lui          ra, 194829
                  bgeu         a5, s10, 347f
333:              sra          tp, a5, a7
                  slli         t3, s0, 5
                  c.or         a2, a0
                  c.addi       t4, -1
                  and          s6, a0, s2
                  c.and        a5, a4
339:              nop
                  auipc        s3, 1015036
                  srai         s3, s3, 30
                  or           s6, a4, ra
                  nop
                  divu         t1, s9, t6
345:              bgeu         s11, a6, 351f
                  c.srli       a5, 2
347:              srli         t0, ra, 27
                  bltu         a7, s0, 354f
                  c.xor        s0, s0
                  c.mv         s5, gp
351:              mulh         a2, gp, a6
                  c.bnez       a5, 354f
                  sra          a7, s2, t4
354:              c.li         a1, 31
                  c.beqz       s0, 358f
                  c.lui        s4, 10
                  slti         s6, a4, -28
358:              c.addi       a5, -1
                  c.srai       s0, 8
                  add          t0, a6, s0
                  slt          a1, a1, s5
                  c.nop
                  mulhsu       t0, a3, ra
                  c.xor        a3, a0
                  ori          t1, t2, -249
                  c.mv         ra, t4
                  mul          s8, s4, s6
                  mul          a6, a5, a7
                  sll          gp, s2, gp
                  lui          zero, 444468
                  c.or         a5, a1
                  c.andi       s0, 18
                  c.slli       s2, 29
                  c.andi       a1, 23
                  c.sub        a3, a4
                  remu         t3, a4, a1
                  andi         t4, t3, -1445
                  add          a5, s9, s1
                  add          t0, a7, s3
                  c.srai       a3, 23
                  c.xor        a1, a5
                  c.lui        t3, 31
                  c.beqz       s1, 398f
                  add          t3, t3, a0
                  c.sub        a5, s0
                  srli         s6, s7, 5
                  add          s9, t1, s11
                  c.beqz       a2, 391f
                  div          s7, t1, t0
                  auipc        a7, 414858
391:              add          gp, s7, s8
                  xori         a7, a4, -774
                  c.and        a4, a1
                  remu         a0, s11, sp
                  sub          a2, s9, t4
                  c.and        a5, a0
                  slt          s5, tp, a2
398:              mulhu        s2, t3, t2
                  div          s10, a2, ra
                  nop
                  beq          t0, t6, 403f
                  c.and        s1, s1
403:              c.andi       a2, 20
                  sll          t1, s0, sp
sub_5_47:         jal          a0, 10f
0:                c.jal        13f
1:                c.jal        0b
2:                c.jal        5f
3:                c.j          6f
4:                jal          s8, 12f
5:                c.j          9f
6:                jal          t1, 14f
7:                jal          t1, 4b
8:                jal          a5, 11f
9:                c.jal        8b
10:               c.jal        1b
11:               jal          tp, 3b
12:               jal          t1, 2b
13:               c.j          7b
14:               sltu         s5, s5, t3
                  remu         tp, a4, t6
                  blt          s7, a7, 412f
                  add          t4, s2, t6
                  div          s9, sp, ra
                  ori          s11, a6, -1926
                  mulh         zero, ra, a6
sub_5_48:         jal          a0, 22f
0:                c.j          8f
1:                c.jal        19f
2:                c.j          21f
3:                c.jal        15f
4:                c.jal        25f
5:                c.j          1b
6:                c.j          13f
7:                c.jal        18f
8:                c.j          7b
9:                jal          a2, 16f
10:               jal          t1, 2b
11:               jal          tp, 0b
12:               c.jal        24f
13:               jal          ra, 5b
14:               c.jal        11b
15:               c.j          26f
16:               jal          ra, 6b
17:               jal          ra, 23f
18:               c.j          4b
19:               jal          ra, 20f
20:               c.j          14b
21:               c.j          3b
22:               c.jal        17b
23:               c.j          12b
24:               c.jal        9b
25:               c.jal        10b
26:               andi         s2, s9, 588
                  div          s5, a4, zero
412:              c.xor        a3, s1
                  auipc        s3, 663520
                  nop
                  c.srli       a5, 28
                  bltu         gp, a0, 424f
                  xor          ra, a2, s1
                  c.lui        s1, 10
                  addi         s4, s10, 2022
                  srli         t1, s1, 16
                  c.slli       t4, 1
                  bne          a1, s8, 428f
                  slti         a1, ra, -1471
424:              c.srai       a4, 29
                  c.and        s1, s1
                  c.lui        s2, 4
                  lui          gp, 293612
428:              bltu         t1, t5, 437f
                  c.or         a3, a5
                  mulhu        zero, s1, s7
                  slt          a6, a3, t2
                  c.and        a4, a1
                  or           t3, s4, s5
                  bne          s6, t0, 452f
                  remu         t6, t0, s7
                  c.and        s0, a4
437:              div          t0, s5, s3
                  c.andi       s1, -1
                  c.andi       a3, 10
                  mulhu        s3, t1, s7
                  mulhsu       t4, s6, s3
                  bne          a6, gp, 455f
                  mulhu        s2, s6, tp
                  bgeu         s3, zero, 459f
                  c.andi       s1, -1
                  slti         s3, t6, 648
                  c.srli       a4, 2
                  c.lui        ra, 22
                  slt          ra, a6, a3
                  c.addi       s9, 5
                  div          s9, t1, t1
452:              slt          a1, s3, t4
                  c.lui        s7, 21
                  mulhsu       a4, gp, t6
455:              c.addi       gp, 3
                  c.li         s2, -1
                  divu         s1, s10, t2
                  sll          s1, ra, s5
459:              c.srai       s0, 12
                  xori         s0, a2, 870
                  la           a6, amo_0+36 #start riscv_lr_sc_instr_stream_6
                  c.srai       s1, 2
                  lr.w          s10, (a6)
                  or           s4, t1, s2
                  addi         s11, a5, 596
                  c.slli       a0, 29
                  sc.w.rl       s0, sp, (a6) #end riscv_lr_sc_instr_stream_6
                  bltu         t2, t4, 469f
                  c.bnez       a0, 464f
                  mulh         tp, zero, a2
464:              c.add        s3, a3
                  sltiu        t0, t4, 1262
                  c.addi       s10, -1
                  div          s7, s2, a4
                  div          t1, s5, s3
469:              slli         a3, t5, 7
                  xor          gp, t6, t1
                  slt          a3, t1, a6
                  c.and        a1, a2
                  c.addi       s8, 18
                  c.xor        a0, a5
                  c.addi       tp, 26
                  sltiu        tp, s4, 1292
                  rem          s5, t6, s9
                  lui          a0, 1036765
                  beq          t1, s1, 484f
                  srl          t1, s7, s0
                  bge          a6, ra, 497f
                  sra          s11, t3, a0
                  and          t4, s3, sp
484:              nop
                  c.lui        s3, 2
                  remu         a0, s1, a0
                  c.bnez       a0, 498f
                  sltu         s0, s2, t5
                  mul          a4, a6, s5
                  slli         a2, s11, 26
                  c.add        a7, a5
                  c.bnez       a2, 510f
                  bltu         s8, t1, 508f
                  beq          s3, s1, 498f
                  andi         a5, t3, -1666
                  c.add        s9, t5
497:              mulhu        s11, s5, s0
498:              xori         s9, sp, 294
                  bge          a7, a1, 508f
                  sll          s8, t6, a1
                  remu         s2, t5, t3
                  c.addi       ra, 1
                  c.andi       s0, 20
                  divu         s4, s10, t4
                  sltiu        a3, t6, -1975
                  rem          tp, s8, tp
                  c.xor        a2, a3
508:              or           s3, s6, s4
                  c.or         s0, a4
510:              slti         s0, gp, -498
                  rem          t1, s11, s11
                  slt          s0, t4, a2
                  la           a6, amo_0+48 #start riscv_lr_sc_instr_stream_4
                  lui          s0, 145440
                  slti         a1, a5, 1896
                  slt          a0, s7, a3
                  lui          s3, 809239
                  auipc        gp, 278218
                  sltiu        a3, s6, -1827
                  nop
                  lr.w.rl       a2, (a6)
                  c.andi       a1, 4
                  c.srli       a1, 20
                  slli         t4, a7, 27
                  c.srli       s1, 24
                  c.xor        a0, a0
                  c.add        t3, t0
                  sltu         a5, t1, s1
                  sc.w          t1, t3, (a6) #end riscv_lr_sc_instr_stream_4
                  or           s11, t3, t2
                  remu         t0, a4, a7
                  mulhu        a2, t5, sp
                  bgeu         sp, a2, 533f
                  srai         a1, ra, 24
                  c.addi       t4, -1
                  bgeu         s2, s8, 521f
                  divu         t6, a4, t0
521:              rem          t4, s2, t5
                  andi         s2, a2, 367
                  mulh         s5, gp, s6
                  c.and        a1, s1
                  mulh         s3, s0, s7
                  c.and        s0, a3
                  div          ra, t5, a3
                  srai         a7, t5, 22
                  sltu         ra, sp, sp
                  and          t0, ra, a4
                  auipc        a3, 41431
                  andi         a5, a4, 1252
533:              bne          gp, t6, 536f
                  c.lui        a4, 21
                  c.or         a3, s1
536:              sra          tp, t5, s7
                  nop
                  sll          gp, s6, a6
                  or           s6, s10, s4
                  div          s10, t5, a7
                  divu         s6, ra, a6
                  auipc        s1, 134609
                  sll          a2, t4, s1
                  slt          a2, s9, a3
                  c.andi       a0, 4
                  c.add        a4, t2
                  divu         a2, a4, a3
                  c.nop
                  srai         a5, a7, 23
                  beq          s0, t5, 563f
                  bgeu         s10, ra, 554f
                  div          t3, s8, t2
                  c.bnez       a5, 559f
554:              div          a7, a6, zero
                  mul          s5, sp, gp
                  bne          s2, s5, 566f
                  srl          ra, tp, s10
                  mulh         s6, tp, s10
559:              xor          tp, s11, t2
                  c.or         a2, a4
                  bltu         t5, s11, 573f
                  bltu         sp, t6, 568f
563:              c.xor        a1, a2
                  remu         a2, a2, a0
                  blt          a5, t1, 579f
566:              sra          s11, a7, a1
                  sll          s11, s5, s5
568:              divu         ra, s0, a1
                  c.lui        a5, 21
                  c.bnez       a3, 584f
                  blt          a2, s5, 573f
                  c.sub        a2, s1
573:              xor          s11, s2, s4
                  srli         a0, tp, 18
                  c.add        tp, s0
                  add          ra, zero, t5
                  addi         t6, ra, -104
                  srli         s4, s1, 25
579:              c.add        a4, s9
                  nop
                  auipc        s4, 319137
                  c.or         a4, a1
                  c.lui        a7, 13
584:              sltiu        t0, t2, 102
                  sub          s8, gp, t4
                  sltu         a0, tp, t4
                  or           a1, t3, t4
                  addi         s0, s5, 197
                  mul          t1, a7, a7
                  remu         ra, sp, gp
                  c.slli       s6, 27
                  bne          t3, a5, 595f
                  c.xor        s0, a2
                  c.srai       a1, 3
595:              mulh         s9, t6, a4
                  bgeu         s11, a6, 611f
                  mulhu        t6, s4, ra
                  mul          a6, s9, gp
                  mulhsu       a3, a0, t4
                  mul          s4, a6, t6
                  c.lui        s10, 10
                  sltiu        t0, zero, -235
                  sra          t6, s11, zero
                  divu         t3, a6, s1
                  c.li         a2, 25
                  c.bnez       a0, 612f
                  divu         tp, s7, a2
                  xor          t6, s11, t3
                  slt          s2, a6, t0
                  add          s8, a5, a4
611:              mulhu        a5, s8, s5
612:              remu         s10, a2, t4
                  auipc        s8, 472342
                  c.nop
                  addi         t4, a2, 1615
                  addi         s1, t1, -213
                  mul          s6, zero, gp
                  mulhu        a7, s10, s7
                  sra          s7, a2, s3
                  mulhu        gp, tp, tp
                  rem          t4, s2, t2
                  c.mv         t6, t5
                  addi         t0, tp, 374
                  srli         gp, a6, 18
                  c.nop
                  c.addi       t1, -1
                  bgeu         sp, a1, 632f
                  c.li         s11, -1
                  sltu         ra, t6, s3
                  c.beqz       a1, 641f
                  bltu         s5, s1, 640f
632:              sltu         a7, s8, a6
                  la           s10, region_1+1953 #start riscv_load_store_rand_instr_stream_16
                  remu         a3, a6, s10
                  sb           t0, -24(s10)
                  lb           t0, -39(s10)
                  lh           s11, 39(s10)
                  slt          s11, t4, t3
                  sb           s5, -26(s10)
                  sb           t0, -13(s10)
                  lh           a3, 11(s10)
                  slli         a7, s6, 8
                  sb           s7, -6(s10)
                  sh           s0, 37(s10)
                  lb           s3, 19(s10)
                  c.sub        s1, a2
                  c.sub        a3, a4
                  nop
                  lbu          a6, -46(s10)
                  lb           a6, -35(s10)
                  ori          a6, a0, -1936
                  lui          a5, 308543
                  lb           s0, -17(s10)
                  lb           s1, -44(s10)
                  xori         t4, s5, 551
                  lbu          s1, -14(s10)
                  c.li         a6, 1
                  sb           t1, 30(s10)
                  c.and        a4, s1
                  c.li         s9, 17
                  lhu          s11, 29(s10)
                  lbu          gp, 2(s10)
                  sb           sp, -2(s10)
                  ori          s1, tp, 438
                  sh           ra, 23(s10)
                  lb           s1, -25(s10)
                  remu         t1, t5, s2
                  sb           t2, -32(s10)
                  lbu          s7, -10(s10)
                  sb           a1, -61(s10)
                  nop
                  sw           ra, -9(s10)
                  lh           t3, 35(s10)
                  sb           zero, 2(s10)
                  lh           tp, -47(s10)
                  c.nop
                  lbu          s6, 32(s10)
                  sltiu        t0, s1, -221
                  sltiu        s8, a3, -2034
                  sb           t4, -14(s10)
                  lh           s4, 21(s10) #end riscv_load_store_rand_instr_stream_16
                  xor          a3, s11, t3
                  mul          a2, s10, gp
                  bge          a3, t0, 643f
                  mulhu        a7, t5, t3
                  c.and        s0, a5
                  sub          s1, a4, gp
                  mul          s2, s10, s5
640:              slti         s4, a6, -842
641:              auipc        s1, 666234
                  lui          s8, 948997
643:              c.nop
                  mulhu        s7, s10, a3
                  rem          t0, ra, a1
                  xor          a3, ra, t3
                  c.li         t4, 18
                  andi         a2, a1, 1075
                  la           a7, region_1+1138 #start riscv_hazard_instr_stream_5
                  lh           a0, -8(a7)
                  mul          t1, s1, a0
                  sra          t1, s5, a0
                  lw           ra, 2(a7)
                  c.andi       a0, -1
                  lbu          s1, 8(a7)
                  lb           ra, 1(a7)
                  lbu          a0, -9(a7)
                  sb           t1, -9(a7)
                  sb           t6, -15(a7)
                  lb           s5, 15(a7)
                  divu         t1, s5, a0
                  lw           ra, 10(a7)
                  lbu          a0, -9(a7)
                  div          s1, t1, ra
                  lb           ra, -15(a7)
                  sb           t1, -7(a7)
                  sb           s1, -1(a7)
                  c.add        a0, s5
                  auipc        s1, 375464
                  lbu          t6, 15(a7)
                  remu         ra, s1, s5
                  sh           a0, 12(a7)
                  lbu          t1, -4(a7)
                  lb           t1, -2(a7)
                  lh           s5, -12(a7)
                  lb           s5, 15(a7)
                  mulhu        ra, s5, a0
                  c.and        a0, a0
                  lbu          t1, -4(a7)
                  lb           t6, -5(a7)
                  lhu          t1, -8(a7)
                  addi         t1, t6, -1522
                  remu         s5, t6, a0
                  sb           ra, -15(a7)
                  srl          a0, s1, s1
                  lhu          t1, -16(a7) #end riscv_hazard_instr_stream_5
                  mulhu        a4, s10, a5
                  c.xor        a4, a2
                  bgeu         s0, s0, 666f
                  mulhsu       a7, a7, ra
                  c.srai       s0, 18
                  c.bnez       a5, 672f
                  c.lui        s8, 26
                  and          s3, a7, s10
                  c.and        a5, s1
                  c.mv         s0, sp
                  lui          s2, 244681
                  mulh         s8, t0, tp
                  sltiu        a3, a2, 1438
                  div          t1, t6, t3
                  c.slli       a7, 30
                  bge          tp, s4, 666f
                  slt          s4, a1, s2
666:              c.nop
                  slt          a7, t5, s1
                  mul          t0, sp, s10
                  sra          a2, t1, s11
                  c.slli       a1, 28
                  xor          tp, s4, s3
672:              c.slli       tp, 22
                  sltiu        a7, s5, -1218
                  c.srli       a3, 5
                  c.bnez       a4, 679f
                  xori         t6, t1, 928
                  auipc        s4, 251565
                  add          zero, t0, a7
679:              xori         s3, a3, -104
                  srl          s5, s5, t2
                  xori         a7, t5, -1870
                  c.lui        s11, 4
                  beq          t1, s4, 696f
                  c.srai       a5, 24
                  bltu         a5, a1, 695f
                  auipc        s5, 780787
                  c.andi       a1, 24
                  c.srai       a4, 3
                  c.beqz       a5, 695f
                  bge          s3, a1, 703f
                  blt          ra, a7, 707f
                  c.srli       s1, 19
                  rem          t0, t2, ra
                  slli         t3, s11, 22
695:              sltu         s11, a6, a5
696:              rem          zero, a6, s11
                  sltiu        a5, s10, 1734
                  bgeu         a4, s0, 716f
                  sltiu        s4, tp, -602
                  srl          s5, s7, sp
                  slti         zero, sp, -1731
                  addi         a7, a5, -1413
703:              sll          s2, s4, t3
                  blt          t4, t1, 719f
                  xori         a0, t1, 478
                  mulh         t4, a1, t5
707:              c.xor        s0, a3
                  bgeu         s4, a2, 716f
                  slli         s2, a6, 27
                  c.andi       a4, 30
                  rem          t4, t1, zero
                  addi         a2, s6, -1473
                  c.addi       t3, -1
                  slli         s2, a4, 14
                  sltiu        s0, gp, -1280
716:              c.addi       gp, 28
                  xor          a6, s3, s4
                  c.beqz       s1, 732f
719:              add          s2, t1, s4
                  blt          a5, a5, 726f
                  blt          t5, a5, 727f
                  nop
                  c.lui        a5, 3
                  c.andi       a2, -1
                  c.lui        s4, 26
726:              auipc        a2, 533313
727:              andi         a1, t5, -1349
sub_5_46:         jal          a0, 26f
0:                c.j          24f
1:                c.j          27f
2:                c.j          5f
3:                c.jal        13f
4:                c.j          7f
5:                jal          a5, 14f
6:                jal          ra, 17f
7:                c.jal        19f
8:                c.j          23f
9:                jal          a3, 20f
10:               c.jal        2b
11:               c.j          10b
12:               jal          ra, 15f
13:               jal          ra, 16f
14:               c.j          6b
15:               jal          ra, 3b
16:               c.jal        18f
17:               c.jal        12b
18:               c.j          1b
19:               jal          t1, 0b
20:               c.jal        11b
21:               c.jal        8b
22:               jal          gp, 4b
23:               jal          a2, 9b
24:               jal          t1, 25f
25:               c.jal        21b
26:               jal          s2, 22b
27:               srli         a0, s10, 29
                  c.srli       s1, 28
                  c.xor        a0, s1
                  auipc        s0, 128145
                  srli         t1, zero, 16
732:              xor          s10, t1, a3
                  lui          a7, 300590
                  slt          s8, s7, gp
                  bgeu         s5, s8, 749f
                  bne          s10, gp, 745f
                  sra          t3, s11, s0
                  bge          s5, gp, 755f
                  c.andi       s0, -1
                  sll          s11, s9, a3
                  srl          gp, a4, s3
                  sll          s0, a6, s7
                  ori          t1, s1, -33
                  c.andi       s1, 8
745:              andi         s7, a0, 342
                  addi         a5, s4, -1284
                  c.bnez       s1, 750f
                  c.andi       s1, 24
749:              bne          t3, t4, 751f
750:              sltiu        zero, sp, 1330
751:              c.srli       a0, 8
                  srai         s11, t6, 17
                  blt          a6, t3, 756f
                  sra          a5, s9, ra
755:              mul          a5, s6, a4
756:              c.srli       s0, 8
                  c.bnez       s0, 769f
                  c.and        a3, a3
                  c.add        s0, t5
                  c.li         s0, 10
                  c.srli       a2, 31
                  or           a1, t1, ra
                  c.beqz       a3, 772f
                  andi         a2, s4, -1924
                  c.slli       ra, 28
                  lui          s9, 660007
                  c.lui        a1, 12
                  c.or         a4, a5
769:              c.srai       a1, 23
                  c.add        a0, t5
                  c.addi       t3, 9
772:              divu         gp, sp, s10
                  slti         s6, s7, -251
                  lui          a1, 996136
                  bne          s2, s8, 777f
                  sll          t1, s7, s2
777:              addi         tp, t5, -705
                  c.beqz       a5, 796f
                  slli         s3, s5, 15
                  ori          t6, s8, -1091
                  sra          a0, t5, ra
                  lui          s5, 498920
                  mulhsu       zero, s9, s11
                  c.bnez       a4, 787f
                  mulhu        s0, s4, s6
                  mulhu        t0, zero, zero
787:              mul          s5, s4, t2
                  c.lui        t4, 27
                  c.addi       t6, -1
                  slti         s9, s8, 799
                  sra          a1, a1, tp
                  rem          s8, sp, s11
                  c.nop
                  ori          s5, a4, 1818
                  bne          t5, a6, 808f
796:              or           s9, a4, s11
                  mulhu        a5, gp, s3
                  xor          tp, s9, s8
                  c.beqz       a3, 811f
                  c.or         s0, a1
                  rem          t3, a6, t5
                  add          a3, tp, t2
                  slli         a6, a3, 31
                  c.slli       s5, 21
                  c.srli       a0, 12
                  c.sub        s0, a3
                  c.li         s11, -1
808:              slt          s5, a5, t4
                  c.and        a3, a5
                  c.sub        a1, a1
811:              ori          s1, s9, 1655
                  slt          gp, t3, gp
                  sra          s0, t6, t2
                  or           s0, t0, s2
                  div          a2, s5, zero
                  sub          t1, t3, s3
                  c.nop
                  bgeu         a0, s1, 834f
                  bge          s1, a0, 823f
                  c.srli       s0, 5
                  and          ra, sp, ra
                  rem          t6, a4, a1
823:              slti         t0, s1, -1038
                  mulh         t4, s11, t5
                  remu         a4, s2, s2
                  slt          s8, t2, t2
                  c.beqz       s0, 840f
                  nop
                  andi         s9, a7, 1104
                  sltiu        t3, a7, -35
                  c.and        a2, a5
                  srai         s4, s2, 8
                  sub          a3, s10, t0
834:              sra          t1, a7, s9
                  mulhsu       s5, s7, sp
                  sltu         s7, s0, s2
                  c.xor        a1, s0
                  bgeu         t5, s5, 844f
                  ori          a4, t2, -226
840:              c.and        a1, a2
                  c.bnez       s1, 844f
                  div          s2, s2, s6
                  divu         t0, s10, s7
844:              sll          a1, s8, s2
                  c.srli       a2, 4
                  c.srai       a4, 30
                  c.nop
                  c.or         a0, a1
                  mul          ra, a0, s9
                  or           s9, s4, t5
                  auipc        a7, 403684
                  c.beqz       a5, 863f
                  addi         s7, zero, -944
                  c.xor        a4, s0
                  sltu         s2, a6, t3
                  c.srli       a4, 8
                  slli         a3, t5, 2
                  sltu         s9, s11, a7
                  slti         t1, s11, 1515
                  slli         s5, t2, 23
                  slt          s7, s10, a5
                  slli         t4, a3, 30
863:              c.lui        t3, 2
                  c.mv         s8, s11
                  xor          s11, a1, s1
                  srli         tp, zero, 0
                  add          s11, a4, s2
                  or           a0, t4, s10
                  ori          t1, sp, 467
                  sltiu        t1, sp, 1748
                  slt          s6, ra, t0
                  mulh         a3, s1, a6
                  lui          s7, 66266
                  c.and        a0, a2
                  rem          s10, s10, s4
                  or           s5, s8, a3
                  slti         s8, s5, -1878
                  c.xor        a0, s1
                  nop
                  c.bnez       a1, 885f
                  xor          s1, s4, a0
                  xor          s1, s8, s6
                  bgeu         s1, a7, 889f
                  nop
885:              c.add        s3, t0
                  srai         s6, a3, 26
                  auipc        ra, 729577
                  mul          zero, a7, t1
889:              mul          s7, t6, a3
                  auipc        a6, 187567
                  sltiu        s1, sp, -1094
                  c.and        a4, s0
                  c.li         ra, -1
                  c.nop
                  mul          a2, t0, t5
                  and          a5, a0, ra
                  srai         s0, t5, 1
                  sltu         a3, a7, t2
                  and          tp, s3, t6
                  sub          tp, a2, s8
                  divu         a3, a2, s2
                  c.sub        a2, a4
                  lui          t6, 561526
                  srai         a3, s10, 5
                  ori          a7, gp, 1419
                  slt          t6, s3, t0
                  and          s3, gp, tp
                  and          gp, t5, a5
                  c.li         t4, 18
                  divu         s5, s11, zero
                  beq          s11, s5, 921f
                  rem          t6, t1, a7
                  xor          s10, t5, s11
                  c.mv         t3, s9
                  bltu         s3, t3, 918f
                  auipc        gp, 490426
                  add          a6, t4, a6
918:              and          s4, s10, s3
                  auipc        t3, 572699
                  or           a7, t3, s5
921:              c.or         a1, a5
                  c.addi       s4, -1
                  c.srli       a5, 2
                  c.srli       a4, 2
                  ori          s2, a5, 2044
                  mulhsu       zero, zero, s10
                  c.or         a3, s0
                  srl          a0, a0, a0
                  mul          s7, s4, a1
                  and          s11, t0, t3
                  c.beqz       a4, 939f
                  bgeu         s9, a4, 940f
                  srai         t6, s4, 8
                  c.li         a2, -1
                  c.bnez       a1, 941f
                  slt          a5, a3, s2
                  divu         t4, s11, a7
                  bltu         s9, a2, 955f
939:              divu         s10, s0, s3
940:              sltu         s3, a3, s6
941:              mulhu        s10, t1, s1
                  slti         s3, a2, -1593
                  c.xor        a1, s1
                  c.add        tp, t4
                  c.sub        a5, a2
                  bge          a5, t1, 955f
                  c.beqz       a1, 962f
                  addi         s9, t4, 502
                  mul          tp, s3, a0
                  slti         a6, zero, 218
                  mulh         zero, a3, a6
                  sub          s4, s4, s4
                  sub          s10, s10, s10
                  sltu         gp, s8, a4
955:              or           t3, s11, s2
                  andi         s5, s7, 2003
                  c.or         a4, a0
                  sltu         t4, s8, t3
                  c.nop
                  sll          s11, s11, t3
                  mulh         s4, t5, gp
962:              xori         a7, a7, -1669
                  mulhsu       t3, ra, s1
                  bne          s11, s0, 978f
                  srai         t4, s6, 29
                  c.xor        a4, a2
                  bltu         sp, t1, 969f
                  nop
969:              c.li         s2, 24
                  c.lui        a7, 21
                  c.sub        a2, a1
                  srl          s2, s6, s3
                  bgeu         a3, t0, 991f
                  c.nop
                  nop
                  xori         s3, s8, -1187
                  c.addi       s11, -1
978:              mulh         s0, ra, s0
                  c.sub        a2, a5
                  c.andi       s1, -1
                  sltu         s10, sp, s8
                  add          a5, gp, t2
                  sltiu        t4, t0, -360
                  nop
                  srli         a2, sp, 17
                  or           s9, s5, a1
                  mul          t4, t2, t6
                  and          a4, a3, t0
                  c.lui        s9, 10
                  c.mv         a0, s0
991:              c.mv         s6, t0
                  c.add        s8, s2
                  slli         s5, ra, 2
                  srli         a3, tp, 6
                  sub          a5, a4, tp
                  c.sub        a0, a4
                  c.lui        s9, 4
                  remu         s9, s2, t2
                  sll          t1, s0, tp
                  or           s1, t3, s2
                  srli         s1, t2, 13
                  c.xor        a4, a5
                  c.beqz       a2, 1005f
                  lui          s0, 254115
1005:             c.add        a5, s0
                  mulhu        t0, s8, sp
                  remu         a2, s9, a2
                  sltu         a0, tp, t1
                  ori          a1, tp, -1851
                  c.add        s4, s11
                  c.srai       a5, 14
                  c.srli       a5, 21
                  c.srai       s0, 27
                  bge          s2, s5, 1028f
                  c.addi       t6, 2
                  c.slli       t4, 22
                  c.lui        t1, 26
                  c.srli       a0, 24
                  slti         zero, sp, 853
                  mulhu        a7, tp, s0
                  c.beqz       a2, 1036f
                  addi         a5, tp, 1072
                  c.nop
                  c.srli       a3, 23
                  or           a4, a2, t0
                  auipc        s6, 826671
                  sltu         a5, s2, gp
1028:             c.srli       a3, 18
                  srl          s0, s8, a1
                  and          a7, a1, t1
                  auipc        t4, 354584
                  sltiu        a0, t6, 1203
                  srli         a2, s10, 1
                  c.xor        s0, a2
                  rem          t3, s4, s8
1036:             c.andi       a4, -1
                  c.and        s0, a1
                  beq          a6, sp, 1053f
                  auipc        a6, 676952
                  c.li         s10, -1
                  addi         s2, s2, -1550
                  xori         gp, a7, 1781
                  srli         s1, zero, 5
                  blt          s2, t1, 1050f
                  lui          t3, 488202
                  xori         s6, s6, 1037
                  sll          s9, s4, a5
                  xori         s4, a4, -33
                  or           a4, a5, tp
1050:             c.addi       s5, 2
                  beq          s9, a0, 1064f
                  xor          a7, a2, s9
1053:             mulh         s9, t2, s0
                  mulhsu       s3, s5, s2
                  lui          a4, 525207
                  addi         t6, s11, 130
                  and          s2, s3, s2
                  lui          a0, 873801
                  c.addi       s8, 26
                  add          t1, t1, s3
                  slli         s4, s4, 8
                  srli         t1, t3, 1
                  c.add        a7, t3
1064:             slt          s11, s11, a6
                  ori          s10, a6, -2011
                  srli         t1, s4, 7
                  c.or         a4, a5
                  c.li         t0, 26
                  c.add        ra, s10
                  c.slli       s4, 12
                  mulh         s11, s10, t6
                  rem          s10, s11, t2
                  c.srai       a3, 18
                  nop
                  srli         s10, t3, 14
                  sll          a1, a3, a5
                  blt          s9, s11, 1079f
                  xori         s0, t0, 542
1079:             sltu         s6, a1, s11
                  mulh         t6, s3, t1
                  andi         a7, s0, 984
                  c.nop
                  c.lui        a4, 1
                  div          s3, s4, a1
                  slt          t1, a5, s8
                  c.add        t4, t0
                  mulhsu       t6, t3, t1
                  slli         s5, t0, 17
                  bltu         s11, t4, 1095f
                  mulhu        gp, s2, s9
                  auipc        s10, 143986
                  srai         s11, t3, 30
                  bne          s2, t4, 1102f
                  or           t4, t0, s3
1095:             sltu         s2, a7, s8
                  bge          a1, s1, 1111f
                  c.lui        s4, 13
                  or           s6, s8, a4
                  xor          s10, ra, zero
                  mulh         t0, a3, zero
                  beq          s3, s1, 1104f
1102:             div          a6, s1, a1
                  sll          t0, t0, a7
1104:             c.mv         s1, a2
                  or           t0, a1, zero
                  xor          t1, a0, t5
                  srli         s1, s3, 16
                  sltu         a5, a2, a7
                  c.bnez       a3, 1115f
                  ori          s11, a4, -514
1111:             and          s4, s4, a3
                  c.lui        gp, 7
                  beq          tp, tp, 1119f
                  c.and        a5, a2
1115:             slt          zero, a1, s10
                  srai         s8, a6, 20
                  c.add        a4, s0
                  c.xor        a0, a0
1119:             bne          a6, a1, 1124f
                  lui          s6, 1015564
                  slt          t0, tp, t2
                  c.nop
                  remu         s10, s4, t3
1124:             mulhsu       s10, t2, ra
                  remu         a5, s2, gp
                  c.li         a4, -1
                  c.lui        a1, 1
                  c.srai       a2, 26
                  remu         a5, a5, t4
                  bltu         s2, s4, 1142f
                  xor          s4, s1, s3
                  and          s9, s4, a3
                  slli         s0, t5, 5
                  blt          s4, a0, 1144f
                  xori         t1, s1, -1111
                  c.mv         gp, a6
                  c.lui        a2, 14
                  mulhsu       gp, a3, a0
                  remu         t3, t6, a1
                  divu         a2, s9, sp
                  c.srai       a1, 1
1142:             srli         s11, t0, 6
                  remu         s5, a1, s10
1144:             xor          t4, s3, sp
                  remu         t1, ra, t1
                  sub          a2, t5, s11
                  lui          t1, 940467
                  c.srli       s0, 24
                  c.andi       a4, 13
                  c.andi       a5, 15
                  srai         s3, s9, 4
                  ori          zero, s11, 799
                  c.li         gp, 0
                  or           a1, t4, gp
                  c.or         s1, a5
                  la           s3, region_1+113 #start riscv_load_store_rand_instr_stream_8
                  c.or         s1, a2
                  lbu          s6, 188(s3)
                  slt          zero, s1, gp
                  lb           gp, 1691(s3)
                  lh           s5, 767(s3)
                  sra          a2, a7, t1
                  lbu          s9, 270(s3)
                  c.lui        s1, 18
                  or           s7, a0, a4
                  slt          s11, t6, sp
                  c.li         s7, -1
                  slti         s10, s9, -899
                  srli         a5, zero, 0
                  sh           a5, 1189(s3)
                  lbu          a2, 1404(s3)
                  sub          ra, s10, s0
                  slli         a3, s8, 27
                  nop
                  c.srai       a3, 18
                  lbu          s10, -90(s3)
                  c.lui        a4, 12
                  add          s4, a5, t3
                  lw           a3, 623(s3)
                  c.lui        s11, 16
                  lh           t4, 1219(s3)
                  mulhu        s2, t6, s0
                  sb           t4, 511(s3)
                  div          t0, ra, t2
                  c.li         a4, -1
                  lbu          t4, 1080(s3)
                  lb           a0, 1278(s3)
                  sb           sp, 212(s3)
                  c.and        s1, a1
                  lb           tp, 622(s3)
                  sltiu        s4, s6, 704
                  and          a3, s6, sp
                  c.addi       s7, -1
                  sb           a4, 1684(s3)
                  addi         s7, s7, -643
                  sub          tp, t0, t3
                  and          s2, t1, ra
                  lb           s1, 1821(s3)
                  lb           a2, 1030(s3)
                  lbu          s5, 1539(s3) #end riscv_load_store_rand_instr_stream_8
                  addi         s0, a2, -135
                  addi         s9, t1, -1517
                  bne          s6, gp, 1166f
                  and          a0, a2, tp
                  rem          a3, s1, s4
                  c.addi       a0, 13
                  srl          gp, a6, s4
                  add          s11, s6, s9
                  ori          t3, t6, 1594
                  srl          zero, s5, zero
1166:             sll          s0, a1, s4
                  divu         s0, a5, gp
                  c.sub        a1, s0
                  sll          tp, s2, t3
                  bge          s10, s9, 1185f
                  xor          tp, s11, a5
                  xor          s7, s7, t4
                  c.slli       a5, 20
                  beq          t4, t2, 1180f
                  ori          a6, s0, -1062
                  bne          a2, ra, 1194f
                  srli         a5, zero, 15
                  andi         gp, t0, 870
                  slt          tp, a2, a6
1180:             sra          a3, s8, tp
                  c.srai       s1, 15
                  div          s5, gp, a5
                  c.addi       s3, 19
                  bltu         a1, sp, 1186f
1185:             mul          a4, s5, a6
1186:             bge          s5, t0, 1202f
                  and          a5, zero, a1
                  slti         s4, s8, 122
                  ori          a3, s1, -1086
                  c.add        s2, a1
                  c.xor        a4, s0
                  or           a2, a7, t2
                  sra          a1, s8, s6
1194:             auipc        t3, 256508
                  c.andi       a3, -1
                  sll          a1, s8, s11
                  c.bnez       a1, 1200f
                  sltiu        a7, a0, -626
                  c.addi       s9, 3
1200:             c.srli       s0, 24
                  lui          s4, 213564
1202:             srai         a0, t6, 30
                  beq          sp, t0, 1221f
                  auipc        a2, 176454
                  addi         a0, t0, 205
                  or           tp, a4, a3
                  srli         a2, gp, 18
                  beq          a0, zero, 1219f
                  bgeu         ra, t4, 1211f
                  addi         t1, s2, -1588
1211:             mul          s8, s8, s10
                  bltu         gp, a4, 1216f
                  c.nop
                  bltu         s8, tp, 1217f
                  beq          s4, s7, 1232f
1216:             remu         t4, a2, a7
1217:             addi         a7, s10, 535
                  slti         a4, s0, 1049
1219:             c.xor        a2, a3
                  c.nop
1221:             bgeu         sp, a1, 1235f
                  mulh         s0, ra, t0
                  bgeu         t1, s2, 1236f
                  c.andi       a2, 10
                  xor          a2, s7, a0
                  srai         ra, a0, 4
                  div          s3, s1, t1
                  divu         a2, ra, a4
                  ori          a4, zero, 160
                  c.or         a4, a3
                  c.srai       a4, 28
1232:             nop
                  bge          s8, s10, 1247f
                  andi         s3, s4, -1250
1235:             c.bnez       a0, 1243f
1236:             and          s5, a3, s11
                  sra          s2, s4, s0
                  mulhsu       gp, s6, s5
                  c.slli       tp, 16
                  c.add        s0, t0
                  c.lui        s10, 26
                  c.srli       s1, 30
1243:             mul          s10, s4, s11
                  bgeu         s4, ra, 1259f
                  bltu         a7, s10, 1254f
                  mulh         t1, s9, a4
1247:             c.bnez       a3, 1250f
                  slti         s8, a4, -1253
                  c.sub        s0, a2
1250:             ori          t3, a6, 1013
                  c.slli       tp, 1
                  c.bnez       a5, 1265f
                  nop
1254:             c.xor        s0, s1
                  beq          a1, a5, 1269f
                  bgeu         s1, s0, 1267f
                  divu         s1, s10, s11
                  rem          a7, t1, gp
1259:             xor          a3, a5, a0
                  bltu         s11, s4, 1268f
                  c.and        a4, a4
                  bne          s8, t2, 1270f
                  c.nop
                  slti         a6, a6, -602
1265:             c.bnez       s0, 1267f
                  srl          s11, tp, t3
1267:             mulhu        a3, t5, sp
1268:             mulhu        a0, s11, t3
1269:             sltu         s11, a7, s2
1270:             c.or         a0, a1
                  mulhu        s9, s9, a4
                  mulh         a1, a3, gp
                  and          s10, s10, t3
                  srl          a2, tp, s4
                  andi         a3, a5, -1362
                  and          s1, a1, s1
                  sub          a3, s3, a0
                  blt          a2, a6, 1284f
                  mulhu        s9, s8, a0
                  c.srai       a4, 26
                  c.lui        s1, 21
                  c.add        s11, t6
                  c.sub        s1, a3
1284:             beq          t0, a4, 1300f
                  add          t0, s11, s3
                  slt          a3, s9, s11
                  c.li         s7, -1
                  bltu         a7, t3, 1294f
                  c.beqz       a5, 1302f
                  and          a7, t1, a2
                  sltu         a1, t5, ra
                  c.bnez       a1, 1304f
                  c.and        a3, a3
1294:             slti         t4, ra, -979
                  bne          a4, gp, 1297f
                  c.bnez       s1, 1311f
1297:             remu         t3, s3, s3
                  c.slli       t3, 21
                  xori         ra, a6, -1196
1300:             c.bnez       a5, 1317f
                  srai         a7, s0, 19
1302:             divu         a7, t0, s6
                  addi         gp, t5, 678
1304:             add          tp, t1, a1
                  c.andi       a4, 27
                  srli         t4, zero, 17
                  and          s6, s10, sp
                  blt          s8, s2, 1326f
                  and          t1, a2, t0
                  c.srli       a5, 15
1311:             lui          a3, 944535
                  div          s2, a4, t5
                  srl          s9, gp, t0
                  xori         s3, tp, -646
                  rem          a5, t2, s0
                  c.srli       a2, 13
1317:             mulhu        t4, s9, s9
                  c.slli       a5, 22
                  lui          a5, 208198
                  mul          s7, s0, s5
                  sll          a6, a1, t0
                  bltu         zero, s9, 1331f
                  c.addi       s8, 20
                  srli         a1, t0, 4
                  bgeu         a4, a7, 1343f
1326:             c.beqz       a4, 1341f
                  blt          s11, s7, 1333f
                  divu         t4, tp, t2
                  srli         a0, s3, 30
                  c.or         a4, a4
1331:             andi         t1, s5, 864
                  c.addi       s11, -1
1333:             andi         t0, t4, 1471
                  sra          s0, s3, s10
                  ori          a3, zero, -1801
                  sll          s2, t5, tp
                  c.li         a0, 13
                  andi         s8, s9, -1939
                  xor          a1, a2, zero
                  xori         s2, a7, -77
1341:             bge          s4, s0, 1356f
                  c.addi       s3, 16
1343:             c.add        s8, t5
                  c.add        tp, a3
                  bltu         a0, tp, 1349f
                  c.bnez       a2, 1351f
                  add          s8, zero, t1
                  andi         s7, t0, -1787
1349:             mul          t3, t2, s1
                  andi         t3, s8, 288
1351:             addi         zero, t1, -568
                  c.xor        a0, a5
                  c.sub        a5, a5
                  mul          gp, a5, a1
                  c.bnez       a4, 1369f
1356:             xor          t3, s5, a7
                  xor          s10, t1, s9
                  remu         s5, ra, a4
                  mulh         s4, s8, a3
                  c.lui        a1, 30
                  sltu         s8, s11, s0
                  c.and        a2, s0
                  bne          a4, s3, 1369f
                  c.slli       t3, 13
                  sub          s5, t4, s5
                  c.andi       s0, -1
                  c.sub        a5, a0
                  srli         s6, s11, 6
1369:             c.slli       a0, 13
                  srai         t4, s5, 9
                  c.add        s3, a2
                  remu         t4, a4, s9
                  mulhu        s1, s3, a6
                  c.li         s7, -1
                  rem          s11, ra, s8
                  srl          zero, a7, s9
                  bltu         a0, a4, 1379f
                  c.bnez       s1, 1381f
1379:             c.andi       a0, 29
                  c.sub        a5, a3
1381:             srl          t3, a3, s7
                  sll          s10, t0, sp
                  mulh         s8, s3, s6
                  blt          gp, t3, 1394f
                  div          s5, a1, a6
                  srl          s2, ra, a3
                  xor          a2, s11, s4
                  sub          a2, a6, a2
                  xor          s9, t4, zero
                  xor          s0, s8, a6
                  ori          s10, gp, -1744
                  c.srai       a2, 15
                  c.lui        a4, 3
1394:             divu         s3, s6, t1
                  c.sub        a5, a1
                  srl          a2, tp, sp
                  sub          s0, s10, s6
                  c.xor        a0, s1
                  srli         s5, s7, 2
                  sra          a4, t5, s8
                  bge          s4, s10, 1404f
                  c.and        a4, a1
                  remu         ra, a2, t0
1404:             beq          a3, s8, 1413f
                  sra          s11, s2, tp
                  c.bnez       a3, 1409f
                  bge          a2, t0, 1409f
                  lui          s8, 46326
1409:             blt          t6, a2, 1415f
                  c.mv         ra, s10
                  slt          t1, s5, a7
                  c.beqz       a3, 1420f
1413:             mulh         s6, s0, t5
                  c.srai       a1, 17
1415:             div          t3, s11, t4
                  c.nop
                  c.beqz       a4, 1429f
                  sltiu        s3, s7, -986
                  mulhsu       a2, a3, gp
1420:             mulh         t6, a7, s6
                  mulhsu       gp, t0, gp
                  or           s1, t2, s9
                  bltu         a2, s7, 1438f
                  lui          a2, 269850
                  mulhu        s1, sp, ra
                  c.add        a0, a6
                  c.srai       a0, 11
                  xori         t4, tp, -494
1429:             sll          t1, a7, t4
                  or           a6, t2, ra
                  c.li         s3, -1
                  ori          a7, a0, 1935
                  sltiu        t3, tp, 1004
                  c.and        a3, a0
                  div          a1, s1, t5
                  xor          a6, s11, ra
                  lui          s1, 292153
1438:             and          s1, s0, a7
                  xori         a4, a7, -253
                  blt          t3, t5, 1450f
                  mulhsu       t1, a0, a2
                  add          a1, s1, a4
                  bge          a5, s10, 1460f
                  srai         a3, sp, 6
                  c.srai       a4, 26
                  slti         gp, t2, -1109
                  bge          a2, s4, 1465f
                  remu         a7, s5, zero
                  auipc        s3, 1007107
1450:             bge          t6, a0, 1461f
                  srai         s5, zero, 29
                  bltu         t2, s5, 1458f
                  slt          s5, t4, a7
                  and          s10, s10, a6
                  sra          t6, s6, a2
                  bgeu         a1, a7, 1472f
                  c.nop
1458:             nop
                  slli         t1, t1, 7
1460:             c.nop
1461:             c.and        s0, a0
                  mulhu        s7, s7, a6
                  sltiu        s10, s0, -979
                  xor          gp, gp, a3
1465:             bne          s1, t6, 1467f
                  c.nop
1467:             sra          s7, tp, s5
                  mulhu        s1, a4, a6
                  sra          s1, s6, s9
                  bge          t0, sp, 1483f
                  beq          s3, a5, 1480f
1472:             div          zero, sp, t6
                  bltu         t1, s7, 1486f
                  slt          tp, s4, sp
                  div          tp, s8, s7
                  slt          a2, s3, tp
                  ori          zero, a2, -1886
                  or           tp, t6, sp
                  xor          zero, a3, s11
1480:             ori          t1, s8, -1387
                  xor          a4, a0, s11
                  c.and        s1, a2
1483:             auipc        zero, 585546
                  sltu         s5, a2, a2
                  addi         s6, a0, 698
1486:             xor          t0, a2, zero
                  mulh         a4, a1, ra
                  mulh         s5, a2, zero
                  sll          tp, tp, gp
                  blt          t2, s6, 1499f
                  c.and        s0, a0
                  sll          s9, t0, s10
                  slli         s3, gp, 6
                  c.add        s4, a1
                  beq          a5, t0, 1498f
                  srli         s2, s0, 29
                  mulh         s9, s7, s11
1498:             slt          a5, s9, tp
1499:             c.mv         s6, s4
                  bne          t3, s0, 1508f
                  xor          t6, s8, a3
                  c.slli       tp, 13
                  rem          s4, a3, a4
                  c.srai       a3, 6
                  c.and        a1, a2
                  bgeu         s10, a0, 1512f
                  c.bnez       a5, 1509f
1508:             srl          tp, t6, s7
1509:             c.slli       s7, 14
                  c.lui        s7, 20
                  xor          s7, s0, t6
1512:             mul          s9, ra, t5
                  c.beqz       s0, 1518f
                  ori          a2, ra, 220
                  c.lui        s9, 6
                  slti         s2, s9, -559
                  c.andi       a2, -1
1518:             sra          t1, s4, a0
                  srl          s0, t5, s6
                  remu         s4, s5, a0
                  c.lui        s0, 28
                  c.slli       a7, 22
                  srl          a3, a0, sp
                  c.lui        s6, 3
                  sll          t4, t0, t4
                  xori         a7, t3, -1662
                  sll          t6, a1, s9
                  c.and        a4, a3
                  andi         a7, t6, 1795
                  slli         gp, a5, 20
                  xori         s0, a4, -573
                  c.srli       a1, 17
                  c.bnez       a4, 1537f
                  ori          zero, t2, -1197
                  ori          s1, a6, -1230
                  srai         s7, s11, 23
1537:             rem          a7, s4, s5
                  c.andi       a1, -1
                  bgeu         t3, t0, 1542f
                  addi         s0, s7, -181
                  c.nop
1542:             c.and        s0, a1
                  mulh         s0, s8, sp
                  beq          sp, a3, 1559f
                  c.bnez       a1, 1559f
                  auipc        tp, 202413
                  c.nop
                  bltu         t5, s4, 1563f
                  remu         s4, tp, t3
                  bgeu         s7, ra, 1564f
                  c.andi       a5, -1
                  lui          a2, 51938
                  sra          a0, t6, gp
                  sra          a7, a6, s2
                  c.srai       a2, 1
                  and          t6, ra, s10
                  mulh         s1, t5, s6
                  c.addi       a4, -1
1559:             sltiu        zero, s0, 1322
                  c.add        t0, t2
                  sll          t3, gp, a1
                  c.slli       t3, 2
1563:             c.andi       a2, -1
1564:             div          a7, s3, t0
                  c.slli       ra, 14
                  c.add        a5, ra
                  addi         t6, t1, -977
                  sltiu        s5, gp, 266
                  c.and        a2, a2
                  slt          s5, t0, tp
                  nop
                  lui          a4, 214015
                  c.li         s6, 31
                  srl          a2, t5, tp
                  lui          a4, 592102
                  bltu         s5, t2, 1582f
                  ori          zero, gp, 1456
                  slt          gp, s10, a6
                  xori         s9, t4, -354
                  slt          t6, s8, s7
                  beq          s1, s1, 1599f
1582:             andi         t0, s6, -966
                  or           t0, s3, a1
                  slti         a6, t1, 588
                  div          s2, t6, a5
                  add          zero, t6, t1
                  c.andi       a2, -1
                  lui          s8, 572669
                  bge          ra, zero, 1603f
                  srai         t4, sp, 8
                  lui          a7, 561387
                  bltu         a4, s7, 1598f
                  rem          s1, s7, a1
                  mul          t4, s1, s11
                  bltu         gp, s11, 1613f
                  c.xor        s0, a0
                  and          s3, s5, t6
1598:             divu         t0, s0, t1
1599:             mul          s2, t4, ra
                  srli         t3, s8, 25
                  addi         tp, s6, -22
                  mul          s0, a3, s0
1603:             mulhsu       tp, t6, a0
                  c.addi       a7, -1
                  divu         gp, a5, tp
                  c.or         a3, a5
                  and          gp, sp, gp
                  andi         s8, sp, -875
                  bgeu         zero, s9, 1620f
                  srli         t6, s6, 10
                  xori         a0, t2, -1870
                  auipc        s10, 979878
1613:             beq          t2, a4, 1628f
                  rem          a5, t3, a4
                  div          s11, a3, s4
                  bne          a3, s11, 1624f
                  c.and        a2, a1
                  nop
                  srai         t4, t0, 10
1620:             sll          t0, s8, gp
                  blt          a0, a2, 1623f
                  sltu         t4, ra, t3
1623:             srai         s7, s4, 19
1624:             srli         t6, a2, 25
                  bgeu         gp, t0, 1631f
                  c.and        a5, a3
                  mul          gp, a7, a0
1628:             ori          a7, s6, 20
                  sltiu        a4, s1, 626
                  slti         s9, a2, -940
1631:             srl          s3, s6, t6
                  xor          s8, gp, s10
                  c.add        t0, t0
                  divu         s11, s5, a3
                  mul          s3, zero, t6
                  c.beqz       s1, 1646f
                  c.sub        s0, a4
                  slli         a5, s7, 12
                  c.slli       a2, 25
                  srl          t6, a1, t3
                  bne          a5, t3, 1649f
                  add          a1, s9, sp
                  slli         t1, zero, 21
                  add          t3, s3, a7
                  slli         gp, a2, 23
1646:             div          s1, s4, t3
                  c.srli       a1, 4
                  ori          ra, t1, -1332
1649:             c.slli       t1, 28
                  div          a5, t5, t2
                  add          a0, a4, s4
                  c.bnez       a2, 1664f
                  blt          a5, s9, 1658f
                  mulhsu       t0, s3, ra
                  slt          s10, sp, t5
                  c.andi       a2, 2
                  c.bnez       s1, 1659f
1658:             c.or         a1, s1
1659:             and          s5, s0, s8
                  c.add        a0, sp
                  sra          a2, t5, a2
                  c.lui        s0, 17
                  bltu         a1, t4, 1678f
1664:             c.or         s1, s1
                  bltu         tp, t0, 1683f
                  ori          a3, t2, 1237
                  mulh         t4, zero, s8
                  c.srli       s1, 22
                  c.li         s7, 16
                  remu         s1, a4, s6
                  sltiu        t6, a5, -46
                  remu         s3, tp, s7
                  andi         a5, ra, 1137
                  c.srai       a4, 8
                  divu         tp, s11, s0
                  div          s3, s1, s8
                  srai         t6, t4, 16
1678:             sltu         tp, s5, a0
                  remu         s6, s8, t3
                  c.addi       s10, -1
                  c.andi       a4, 6
                  sub          s9, a0, s2
1683:             div          t0, t3, s7
                  auipc        s1, 216881
                  sll          t0, t2, a4
                  c.bnez       a3, 1702f
                  and          s2, a4, s4
                  andi         a0, s4, 348
                  c.srli       a0, 19
                  c.bnez       s0, 1704f
                  xor          a0, t6, t1
                  ori          s4, t6, -1823
                  beq          s5, t1, 1699f
                  bgeu         s3, gp, 1697f
                  add          t4, a2, zero
                  c.nop
1697:             sltiu        tp, s3, 597
                  c.srli       a5, 24
1699:             sll          a1, t5, s11
                  div          a3, s7, s7
                  c.lui        t6, 10
1702:             sra          t6, sp, ra
                  beq          t4, a5, 1720f
1704:             remu         s6, t2, zero
                  lui          tp, 977502
                  nop
                  lui          a6, 546115
                  c.addi       t6, 25
                  c.srai       s1, 3
                  addi         a6, gp, 1153
                  xor          a1, a5, tp
                  nop
                  bge          t2, a6, 1717f
                  sub          s1, s7, s0
                  srl          t4, s10, zero
                  div          t3, s2, s7
1717:             c.xor        s0, a0
                  addi         s6, a5, -1474
                  sll          s10, a3, a7
1720:             bgeu         a0, zero, 1729f
                  auipc        s2, 563646
                  addi         s2, t5, -92
                  mulh         t1, s4, s7
                  mulh         s1, s1, t3
                  andi         s2, a6, -630
                  c.mv         a6, a0
                  auipc        s6, 471491
                  rem          ra, s6, ra
1729:             slli         s2, a0, 4
                  xor          s1, s3, t4
                  mulhu        a5, s6, t1
                  and          a0, s9, a3
                  sub          a2, s10, s6
                  c.sub        a1, s0
                  sll          a2, a0, ra
                  sltiu        t6, s5, 847
                  c.srai       a2, 14
                  sll          s6, gp, a3
                  xori         s8, s2, 51
                  c.li         tp, -1
                  c.addi       a5, -1
                  sub          t1, tp, s9
                  bgeu         tp, a0, 1758f
                  beq          t6, t5, 1747f
                  bgeu         t3, s11, 1758f
                  c.srai       s1, 19
1747:             bltu         zero, s4, 1749f
                  nop
1749:             mulhsu       s5, s10, s7
                  c.or         a5, a4
                  c.mv         s3, a7
                  srai         s2, s8, 28
                  sub          s9, a0, t6
                  andi         gp, s7, -2040
                  c.lui        a6, 26
                  sub          t0, a7, s5
                  srli         a6, a1, 28
1758:             blt          sp, ra, 1771f
                  sltu         a6, a5, a5
                  div          s3, s8, a6
                  and          s1, s9, tp
                  ori          s7, s3, 430
                  xor          t1, t1, a3
                  c.sub        a4, a2
                  auipc        s6, 1046446
                  addi         a2, s2, 1819
                  bgeu         s7, a0, 1773f
                  bltu         s5, t2, 1777f
                  sll          a4, tp, a7
                  sltu         a2, s9, a6
1771:             addi         s10, s2, 137
                  and          s1, s8, ra
1773:             xori         t3, a1, -839
                  bne          a3, a0, 1777f
                  c.srli       s1, 2
                  divu         s5, a2, a7
1777:             rem          zero, s11, s7
                  srli         s4, s8, 23
                  or           zero, s7, a5
                  xori         s10, a6, 715
                  c.srli       a3, 6
                  bltu         a0, a5, 1786f
                  mul          a7, zero, s8
                  c.sub        s1, s0
                  srl          a6, gp, s11
1786:             c.xor        a3, s0
                  c.slli       t6, 13
                  add          a2, t4, a1
                  c.beqz       a0, 1800f
                  c.srli       a0, 6
                  c.nop
                  c.lui        tp, 23
                  sra          a1, t6, a0
                  c.srai       a2, 8
                  c.slli       a3, 22
                  sra          s7, t5, t4
                  c.xor        s1, a4
                  mul          ra, s11, a1
                  mulh         s2, ra, sp
1800:             bge          s2, t6, 1803f
                  sltu         a6, tp, tp
                  addi         s3, s8, -955
1803:             c.bnez       s0, 1805f
                  auipc        ra, 329529
1805:             c.or         a4, a1
                  bgeu         s10, t6, 1808f
                  sub          s4, a3, t3
1808:             c.and        a0, a1
                  la           s11, amo_0+24 #start riscv_amo_instr_stream_1
                  srai         s5, s2, 20
                  amomaxu.w     s0, s9, (s11)
                  srli         t0, t5, 15
                  amoor.w.aq    s9, s4, (s11)
                  amoand.w      a3, a1, (s11) #end riscv_amo_instr_stream_1
                  mulhu        t1, a6, s5
                  bltu         ra, a0, 1818f
                  c.add        a3, gp
                  srli         a3, sp, 13
                  divu         s1, s6, a6
                  bge          t0, t4, 1828f
                  rem          s2, a2, t4
                  slti         a0, s10, 2008
                  mulhu        a6, s8, gp
1818:             c.li         a4, -1
                  c.addi       a2, 16
                  bge          sp, s8, 1828f
                  bne          s1, a2, 1834f
                  c.or         a0, a1
                  srli         t3, t5, 1
                  or           a0, s2, ra
                  divu         tp, gp, s9
                  div          tp, a1, a3
                  sll          t4, t5, s1
1828:             c.or         a1, a5
                  c.nop
                  mulh         t1, a0, s10
                  bltu         a7, a5, 1836f
                  sll          ra, s11, t2
                  c.slli       s9, 22
1834:             divu         gp, s9, s6
                  c.xor        a2, a2
1836:             sra          ra, sp, t1
                  sra          ra, a2, a1
                  srl          t4, gp, ra
                  sra          s5, a3, s0
                  mulh         s6, s11, tp
                  blt          zero, s0, 1859f
                  c.nop
                  bge          ra, zero, 1861f
                  bgeu         a4, s1, 1859f
                  c.li         a1, -1
                  mulhsu       s4, tp, t3
                  c.li         t3, 3
                  ori          a4, t3, 2012
                  sll          s1, s0, s1
                  c.slli       ra, 7
                  c.nop
                  addi         a4, s5, -1626
                  c.lui        a4, 9
                  sltiu        a2, a7, 204
                  c.sub        s0, s0
                  slti         s3, s7, 1572
                  or           s3, sp, s3
                  srl          t4, zero, s3
1859:             c.srai       s1, 4
                  blt          sp, s5, 1875f
1861:             blt          a7, a6, 1864f
                  c.beqz       a5, 1865f
                  sltu         a6, t2, t5
1864:             mul          a1, s2, gp
1865:             c.add        s7, s6
                  andi         a6, t6, -1311
                  sub          t1, t4, a6
                  srli         ra, s7, 4
                  sub          s3, s2, s0
                  sub          s9, s1, t4
                  xori         s4, ra, -723
                  add          tp, s4, s5
                  bne          s8, ra, 1879f
                  c.beqz       s1, 1876f
1875:             c.srli       a3, 29
1876:             ori          s5, t5, -1282
                  c.sub        s0, s1
                  mulhsu       zero, a0, a7
1879:             c.mv         s1, s1
                  xor          t0, sp, s3
                  bge          t4, t4, 1898f
                  c.beqz       a0, 1895f
                  ori          t1, s1, 1214
                  srl          s10, tp, s5
                  and          a5, s2, t2
                  c.srli       a4, 20
                  ori          s5, t3, -520
                  c.li         ra, -1
                  c.lui        s6, 26
                  c.mv         t3, a7
                  c.beqz       s0, 1906f
                  c.srai       a0, 13
                  c.addi       s3, 23
                  rem          a6, s8, t5
1895:             slt          a6, a4, t4
                  sltiu        a0, s9, -332
                  bne          s1, zero, 1909f
1898:             bge          s10, a2, 1914f
                  c.beqz       a1, 1908f
                  la           ra, region_0+794 #start load_store_instr_stream_1
                  la           s3, region_0+1257 #start load_store_instr_stream_0
                  lh           gp, -59(s3)
                  lbu          gp, -686(ra)
                  sb           s7, -191(s3)
                  sb           s1, 720(ra)
                  lbu          s7, 1203(ra)
                  sw           t4, -185(s3)
                  sb           gp, 402(ra)
                  lb           zero, 263(ra)
                  sb           s9, -489(ra)
                  lb           a0, 174(s3)
                  lb           t0, 175(s3)
                  sb           s2, 987(ra)
                  sb           a2, -230(s3)
                  sb           s5, -50(s3)
                  lhu          t0, -9(s3)
                  lb           a4, -26(s3)
                  lb           s8, 477(ra)
                  sb           t3, -339(ra)
                  lbu          s7, -470(ra) #end load_store_instr_stream_1
                  lhu          a0, -243(s3) #end load_store_instr_stream_0
                  and          ra, a7, a1
                  mulhu        a1, a2, a1
                  sub          a1, t4, t3
                  addi         s2, s5, 1468
                  divu         t3, zero, t3
                  and          a2, ra, tp
1906:             bge          s1, a0, 1912f
                  lui          s2, 38820
1908:             mulhu        t1, s7, t4
1909:             c.slli       s9, 18
                  andi         t4, a6, 247
                  c.sub        a0, s1
1912:             bne          a1, a1, 1918f
                  slti         s2, t5, 659
1914:             c.nop
                  lui          s7, 712091
                  rem          zero, t1, s11
                  and          s8, a4, a3
1918:             slti         s10, a5, -252
                  xori         s9, a1, -362
                  mul          s9, s4, s11
                  sltiu        a7, a3, 1809
                  slt          a5, t5, s8
                  mulhsu       s11, a0, s1
                  c.add        t0, gp
                  sra          a1, a3, s1
                  addi         s2, ra, 10
                  c.andi       s1, -1
                  c.srai       a3, 30
                  c.xor        a5, a4
                  c.add        ra, a5
                  beq          a5, s8, 1941f
                  andi         s7, s0, -1186
                  srli         s2, a4, 15
                  xori         a5, t6, -1166
                  srli         s6, t3, 4
                  nop
                  c.li         a6, 4
                  srli         s5, a3, 9
                  sltu         t1, a3, s7
                  bge          t6, s1, 1946f
1941:             mulhu        s5, s8, sp
                  c.beqz       s1, 1951f
                  xori         s1, t5, -1547
                  c.xor        a4, s1
                  c.nop
1946:             nop
                  xori         tp, a4, -337
                  sub          t6, t1, s0
                  bltu         s0, s4, 1963f
                  c.bnez       a0, 1953f
1951:             bne          s0, t5, 1960f
                  xori         a2, t4, 1287
1953:             c.andi       a3, -1
                  bgeu         t2, a6, 1956f
                  ori          t3, t0, -1503
1956:             auipc        a0, 332802
                  c.lui        t1, 4
                  sltu         tp, ra, sp
                  slli         a7, s5, 12
1960:             nop
                  c.or         a4, a2
                  bgeu         t3, sp, 1967f
1963:             bgeu         s4, sp, 1969f
                  ori          a7, t0, -1102
                  bge          a6, t1, 1969f
                  slli         a5, t4, 3
1967:             beq          a1, s5, 1970f
                  div          s9, sp, a5
1969:             bne          s4, a5, 1971f
1970:             sltiu        zero, tp, 717
1971:             c.nop
                  c.addi       a2, -1
                  sltu         a0, t2, t2
                  c.addi       t6, 23
                  mulhsu       a4, a1, s0
                  c.add        s9, t6
                  bne          t4, s10, 1986f
                  divu         a1, a2, t1
                  c.srli       a3, 2
                  c.li         s7, -1
                  bge          t0, t1, 1995f
                  auipc        s1, 313117
                  auipc        zero, 31163
                  mulhu        t1, ra, s11
                  bltu         tp, zero, 2001f
1986:             srai         s3, s8, 8
                  c.nop
                  mulhu        s9, sp, s11
                  c.and        a1, a2
                  bge          a1, zero, 2005f
                  slli         t6, zero, 29
                  c.add        s10, s7
                  slt          gp, s2, s6
                  c.bnez       a0, 1997f
1995:             srai         s0, s0, 16
                  c.lui        a1, 1
1997:             mulh         a3, s0, a3
                  xor          s6, gp, zero
                  blt          s10, sp, 2001f
                  slti         s2, s7, -717
2001:             c.andi       s0, -1
                  c.mv         t1, ra
                  remu         t1, s11, gp
                  c.slli       s1, 5
2005:             c.srai       a3, 31
                  lui          s10, 252453
                  andi         t1, t4, 1948
                  mul          t0, s1, t5
                  nop
                  c.li         s5, 28
                  lui          a5, 501645
                  nop
                  ori          s7, a6, -36
                  srli         t1, s2, 2
                  c.srai       a1, 19
                  and          s7, t2, t3
                  sltiu        tp, zero, -183
                  sltu         s7, s9, s6
                  sltu         s0, a6, s6
                  bgeu         s11, s10, 2028f
                  slti         s11, t5, 1692
                  beq          s11, s10, 2035f
                  c.add        s9, a3
                  c.and        a5, s0
                  srl          t0, zero, ra
                  mul          a4, t4, a7
                  c.add        t6, s3
2028:             c.xor        a4, s1
                  sra          a1, gp, s10
                  c.mv         a1, t2
                  rem          s10, zero, s8
                  andi         s7, a5, 1656
                  c.li         s7, 7
                  c.and        a0, a3
2035:             sltiu        s4, s9, 1768
                  c.add        a3, sp
                  sub          s8, a6, s5
                  c.beqz       s1, 2051f
                  sub          a0, a6, s0
                  c.mv         t6, s11
                  beq          s7, s9, 2055f
                  or           s2, t1, t2
                  or           a0, a2, s4
                  ori          s5, a2, 77
                  lui          t4, 341041
                  c.mv         a3, s5
                  sra          s9, a0, s5
                  lui          t4, 752143
                  sltu         a3, t5, a5
                  c.lui        s7, 2
2051:             c.add        s7, t0
                  srai         zero, t1, 24
                  nop
                  bne          s10, t1, 2071f
2055:             xor          ra, t6, ra
                  sltiu        s11, t2, -596
                  srai         s2, a6, 5
                  c.nop
                  bge          sp, t2, 2065f
                  mulhu        a6, t3, s4
                  c.srli       a5, 14
                  mulhsu       s7, ra, t3
                  mulhsu       t4, a2, a5
                  divu         a3, s8, s7
2065:             xori         a0, t1, -1806
                  sltu         a1, a1, a3
                  c.add        a7, a7
                  ori          a3, t4, 327
                  c.li         s2, -1
                  bge          s0, s4, 2088f
2071:             c.and        a1, a2
                  c.li         a3, -1
                  slti         a3, zero, -1068
                  srl          s8, s11, t5
                  mulhsu       s8, t4, a6
                  c.xor        s1, a0
                  bltu         s9, s6, 2089f
                  c.sub        a2, s1
                  c.xor        s0, a3
                  auipc        s10, 598363
                  div          gp, s8, s0
                  xori         s2, s5, 354
                  and          s9, t5, t4
                  srai         zero, zero, 6
                  rem          a1, s1, s11
                  add          tp, s3, s11
                  c.srli       a3, 15
2088:             divu         s2, s9, s10
2089:             c.mv         a4, s7
                  blt          a1, a0, 2105f
                  bge          gp, s1, 2102f
                  bne          t0, t1, 2110f
                  srli         s1, tp, 26
                  c.nop
                  rem          a4, a3, t2
                  div          a2, t3, s6
                  mulh         t0, sp, s11
                  srl          a4, a3, a4
                  c.beqz       a2, 2107f
                  c.beqz       a0, 2115f
                  or           tp, s11, gp
2102:             srli         t3, a5, 10
                  c.or         a4, a2
                  c.sub        a2, s1
2105:             slti         a2, tp, -1243
                  bltu         s5, ra, 2112f
2107:             sltu         a3, t2, s11
                  c.beqz       a2, 2114f
                  srai         a5, s4, 19
2110:             divu         s8, s8, s8
                  mulhu        t4, s8, t3
2112:             remu         s10, a7, s7
                  bne          a1, t0, 2123f
2114:             mulh         a7, s9, t2
2115:             mulhsu       s4, t2, a4
                  srl          s8, s3, t3
                  remu         s10, t6, a3
                  sltiu        s5, sp, -1697
                  sltiu        a0, t1, -1638
                  lui          s11, 532520
                  rem          a2, a6, t3
                  bgeu         a1, s0, 2130f
2123:             sra          a3, tp, a2
                  sltu         s11, sp, s4
                  sub          t3, s0, sp
                  lui          t4, 309916
                  xori         a2, s3, 229
                  xori         s4, a2, -1350
                  bltu         t5, s6, 2142f
2130:             blt          t4, a0, 2132f
                  c.bnez       s1, 2146f
2132:             c.srli       a5, 27
                  sltiu        tp, sp, 1179
                  c.bnez       a0, 2149f
                  mulh         s5, s2, s2
                  bge          s2, a4, 2142f
                  srl          s11, s9, a3
                  and          s0, s10, a4
                  sltiu        tp, t5, -1186
                  c.andi       a2, -1
                  c.or         a3, s0
2142:             div          zero, s5, ra
                  srai         a0, a2, 27
                  c.bnez       a1, 2147f
                  c.li         s4, -1
2146:             mulhsu       a2, a6, s2
2147:             c.or         a5, a1
                  div          s6, a4, s2
2149:             slti         a5, tp, 955
                  nop
                  or           a2, a0, s4
                  srai         ra, a7, 20
                  c.or         a0, a2
                  slli         s1, s11, 8
                  divu         tp, t0, s10
                  mulh         s8, s11, sp
                  c.addi       s6, 8
                  blt          t5, s10, 2173f
                  mulhsu       a4, t3, s6
                  bltu         a5, s6, 2162f
                  nop
2162:             sll          t4, s1, s4
                  srli         s0, a7, 10
                  sub          t3, a3, tp
                  c.mv         a4, gp
                  c.beqz       a0, 2178f
                  sub          a2, sp, s0
                  sll          s8, s5, s9
                  c.srli       s1, 1
                  slti         a7, ra, 1403
                  c.and        a4, s0
                  c.sub        s0, a0
2173:             addi         s3, s10, -1085
                  ori          a4, s1, -900
                  c.bnez       a0, 2191f
                  c.or         a1, a5
                  srli         a4, t4, 19
2178:             slti         t6, tp, -553
                  slti         a0, s4, -1233
                  slli         a7, a1, 27
                  c.xor        a0, a5
                  beq          a6, s8, 2199f
                  srai         s0, s10, 15
                  rem          a2, a5, s6
                  mulhsu       t3, s4, a0
                  c.slli       t3, 15
                  c.add        gp, a1
                  mulhsu       s9, tp, s2
                  slti         s7, t2, 1125
                  div          t6, t5, t6
2191:             c.lui        s2, 15
                  c.li         t1, 20
                  c.srai       a3, 28
                  and          s5, t0, s4
                  sub          t1, a3, ra
                  mul          a5, zero, t2
                  c.srli       s0, 30
                  xori         gp, s3, 89
2199:             sltu         t1, a0, sp
                  c.andi       a5, -1
                  mulhu        s3, t1, gp
                  slti         s6, t5, -1922
                  rem          t1, t3, s3
                  lui          t0, 491340
                  c.bnez       a5, 2219f
                  or           s2, s8, t0
                  divu         ra, s5, t4
                  remu         ra, t2, t6
                  c.li         a3, 19
                  andi         a0, s3, 1653
                  c.li         a6, -1
                  auipc        ra, 613367
                  xor          a0, s5, a3
                  mulh         ra, t3, a5
                  srai         t3, s6, 21
                  rem          a5, s11, s2
                  c.addi       a6, -1
                  c.andi       a3, -1
2219:             remu         ra, t2, s11
                  sltiu        s1, zero, 1721
                  c.srli       a0, 13
                  bltu         s7, a1, 2228f
                  divu         s6, s7, s2
                  mulh         s9, t5, sp
                  mulhsu       s9, s0, s6
                  c.srai       a1, 26
                  or           ra, t5, t3
2228:             mulh         gp, t5, a7
                  c.bnez       s0, 2232f
                  div          s3, a4, t0
                  xor          s1, s11, t3
2232:             xor          s3, s5, sp
                  nop
                  bgeu         t4, s6, 2238f
                  divu         zero, t2, a1
                  mulh         ra, s5, s9
                  bne          t5, t1, 2247f
2238:             bne          gp, t6, 2244f
                  slt          t6, a0, s11
                  slli         s0, a7, 19
                  c.add        a1, gp
                  lui          gp, 985519
                  c.or         a2, a0
2244:             xori         gp, a2, 1259
                  div          t4, s1, a2
                  slt          s1, s9, a4
2247:             c.li         a0, -1
                  c.bnez       a5, 2256f
                  sub          t3, s7, ra
                  c.addi       s5, 26
                  bne          a5, a3, 2260f
                  slli         a3, s4, 23
                  c.bnez       a4, 2262f
                  mulh         t4, a3, s5
                  mul          ra, s8, a5
2256:             sll          s1, t3, zero
                  blt          s4, s2, 2271f
                  mulh         tp, s0, s9
                  c.li         a4, 13
2260:             srai         s2, t6, 6
                  c.or         a1, a0
2262:             remu         s9, gp, s1
                  ori          s3, a3, -1390
                  c.slli       t3, 12
                  bne          a5, t6, 2278f
                  srli         a6, t2, 15
                  bne          s0, s2, 2285f
                  auipc        s0, 394554
                  c.slli       a1, 13
                  srli         gp, t5, 1
2271:             c.srli       a1, 16
                  mul          t6, t1, a5
                  c.srli       a5, 15
                  srli         s7, a0, 22
                  c.andi       a4, 22
                  mul          ra, a3, a3
                  srli         s4, a4, 3
2278:             and          s6, s4, s5
                  rem          gp, zero, a0
                  andi         zero, t0, -942
                  sra          t3, s5, a6
                  c.nop
                  c.sub        a4, a1
                  mulh         gp, s8, a0
2285:             c.andi       a5, 27
                  c.addi       t3, -1
                  div          s8, a0, s6
                  c.nop
                  c.or         a4, a4
                  c.mv         t0, a2
                  sub          a4, gp, a5
                  rem          s4, tp, ra
                  div          s7, t5, s9
                  c.addi       s0, 1
                  mulhsu       a4, sp, a0
                  bltu         s0, a4, 2302f
                  nop
                  c.srli       s0, 29
                  sltu         a4, a1, a6
                  sll          s7, t4, sp
                  c.sub        a4, a0
2302:             slt          a6, t3, s10
                  c.beqz       a2, 2306f
                  c.slli       t3, 25
                  addi         s7, t0, 97
2306:             c.mv         gp, s2
                  bltu         t3, s10, 2312f
                  lui          a1, 251858
                  or           s7, a3, tp
                  xor          a5, ra, t0
                  srai         s8, a6, 23
2312:             c.sub        a5, a4
                  xori         a7, a1, -2012
                  div          t1, s11, zero
                  divu         t1, ra, ra
                  mulhu        a6, zero, sp
                  c.sub        a2, s0
                  beq          sp, s4, 2320f
                  or           s4, s11, s10
2320:             nop
                  srli         a1, a5, 0
                  c.or         s0, a3
                  addi         a5, s5, 1600
                  add          a0, a3, zero
                  mulh         s5, a6, s11
                  andi         a6, a6, 827
                  addi         s11, a3, -756
                  mul          a7, a6, s7
                  srai         s8, a0, 26
                  andi         t0, t5, 1431
                  c.andi       a0, 20
                  beq          s10, t2, 2350f
                  c.nop
                  addi         s4, tp, 63
                  and          a6, sp, s5
                  div          zero, a6, s1
                  remu         a1, a2, a4
                  and          a1, a7, t6
                  sltu         s4, t4, sp
                  beq          s1, t6, 2351f
                  bne          zero, a1, 2353f
                  slti         s0, zero, -489
                  div          a3, s0, t0
                  c.srai       a2, 8
                  c.beqz       a3, 2359f
                  bne          t0, t0, 2348f
                  nop
2348:             bge          s3, t1, 2354f
                  add          zero, ra, t6
2350:             sra          s2, t3, s8
2351:             rem          s5, s11, s1
                  mulh         s2, gp, a4
2353:             c.sub        s1, a5
2354:             mul          a0, a2, ra
                  sub          gp, s9, t3
                  c.bnez       a5, 2371f
                  sltu         t1, s1, a6
                  c.nop
2359:             ori          a2, zero, -925
                  add          s3, t3, s9
                  c.mv         a1, a6
                  c.or         a1, s1
                  or           ra, a1, s1
                  slt          t4, tp, s2
                  c.srli       s1, 2
                  c.srai       a5, 18
                  rem          s4, t3, s10
                  addi         a4, a5, -1264
                  sll          zero, sp, sp
                  slti         t0, s10, -898
2371:             bge          ra, a4, 2374f
                  blt          a2, t0, 2378f
                  blt          ra, gp, 2381f
2374:             c.sub        a5, a4
                  srl          t3, a0, s7
                  xori         s10, a6, -1585
                  c.addi       s2, 30
2378:             mulh         t6, a4, s0
                  srai         a2, s5, 24
                  c.andi       a4, -1
2381:             xori         ra, tp, 826
                  srl          ra, t4, tp
                  srai         t1, s8, 8
                  and          ra, s4, s8
                  mulhu        a5, t0, s6
                  mulhu        zero, tp, s4
                  mulhsu       s6, a6, zero
                  c.beqz       s0, 2390f
                  srai         a1, s11, 16
2390:             sub          s7, a7, s11
                  rem          a1, a1, a1
                  c.xor        a0, a5
                  c.andi       a4, -1
                  c.bnez       a0, 2397f
                  srl          a4, s4, tp
                  andi         zero, s3, 1544
2397:             c.srai       s0, 1
                  srl          s9, t5, t6
                  addi         a7, a2, 228
                  sub          a4, t4, a1
                  ori          ra, s11, -786
                  c.andi       a1, 7
                  bgeu         t5, s4, 2418f
                  sltu         s0, t4, a4
                  c.beqz       s0, 2414f
                  c.li         a4, -1
                  auipc        s3, 515845
                  or           gp, s10, t3
                  remu         zero, s3, s7
                  mulhsu       s0, s9, s10
                  c.li         ra, 16
                  bge          s4, a4, 2425f
                  c.beqz       a3, 2426f
2414:             divu         a0, t1, s6
                  remu         t1, s1, t6
                  beq          zero, ra, 2418f
                  c.sub        s0, a3
2418:             c.sub        a1, a3
                  c.and        a3, a5
                  mulhsu       s0, ra, a4
                  div          s0, a6, t3
                  beq          s5, t2, 2432f
                  bgeu         t6, tp, 2441f
                  srli         t0, s5, 15
2425:             c.and        a1, a5
2426:             sub          a0, tp, t1
                  nop
                  bltu         s10, t3, 2446f
                  mulhsu       s1, s4, ra
                  div          t1, s10, a7
                  slli         s0, a4, 5
2432:             srli         s0, tp, 20
sub_5_40:         jal          a0, 4f
0:                c.j          6f
1:                jal          s3, 14f
2:                c.j          1b
3:                jal          t1, 13f
4:                c.jal        5f
5:                jal          ra, 17f
6:                jal          ra, 15f
7:                c.j          8f
8:                c.jal        10f
9:                jal          a2, 2b
10:               c.j          9b
11:               jal          ra, 7b
12:               c.jal        16f
13:               c.jal        0b
14:               c.j          12b
15:               jal          t1, 11b
16:               c.j          18f
17:               jal          t1, 3b
18:               slti         t0, a1, -1459
                  auipc        a5, 659753
                  bgeu         sp, t4, 2450f
                  c.srli       a5, 21
                  sub          t1, t4, ra
                  auipc        s5, 151226
                  c.bnez       a1, 2441f
                  mulhu        s7, a7, t4
                  c.nop
2441:             divu         gp, a7, t1
                  c.srai       a5, 8
                  sltiu        s11, s8, -1875
                  mulhu        s5, tp, s3
                  c.beqz       a1, 2453f
2446:             beq          t2, a0, 2451f
                  c.nop
                  sltiu        a3, s6, 774
                  slt          s9, s0, s8
2450:             c.sub        s0, a1
2451:             srl          a2, a7, s6
                  nop
2453:             divu         a3, ra, a3
                  c.addi       gp, -1
                  auipc        gp, 309794
                  bge          t5, s11, 2470f
                  bge          s4, s2, 2463f
                  bgeu         a4, t4, 2464f
                  blt          t2, a2, 2468f
                  sra          a1, s3, s9
                  div          t6, s2, s6
                  c.add        a7, a5
2463:             bltu         s9, s3, 2474f
2464:             srli         a1, s2, 10
                  c.srli       s0, 19
                  sltu         t4, a4, sp
                  xori         t0, zero, 550
2468:             slti         a6, s9, -642
                  bne          s6, sp, 2473f
2470:             remu         t4, ra, sp
                  srl          s4, t4, s5
                  mulhsu       a2, sp, s5
2473:             divu         a5, tp, a6
2474:             mul          a3, a5, ra
                  srl          s6, t3, s2
                  c.sub        a4, s0
                  mulh         s11, s3, a2
                  srai         s0, a0, 8
                  c.srli       a5, 30
                  slti         s8, s9, -762
                  c.bnez       a4, 2496f
                  nop
                  c.and        a4, a3
                  rem          t4, s4, s8
                  blt          ra, t6, 2502f
                  c.addi       s8, 25
                  add          s10, ra, s5
                  blt          a2, s6, 2497f
                  auipc        s1, 461095
                  blt          t4, s0, 2508f
                  sra          a7, gp, s10
                  c.slli       ra, 26
                  c.beqz       a2, 2504f
                  sll          s7, s3, t2
                  c.li         s3, 20
2496:             divu         t4, s3, s9
2497:             bge          t6, t0, 2506f
                  bltu         s3, a1, 2513f
                  blt          s9, t4, 2507f
                  slt          s0, s6, a6
                  c.sub        a1, a0
2502:             beq          s8, s6, 2518f
                  sltiu        tp, s0, 1009
2504:             bgeu         s8, t5, 2517f
                  addi         t6, a3, -1051
2506:             and          gp, t0, sp
2507:             slti         s1, a6, -1317
2508:             div          a6, s10, t5
                  c.mv         s6, a3
                  sltu         t1, ra, s10
                  or           s5, s6, a1
                  c.add        t0, sp
2513:             rem          tp, a2, ra
                  bge          a0, s6, 2528f
                  beq          tp, t0, 2525f
                  sll          s3, tp, s6
2517:             xori         a0, t5, 1053
2518:             sltiu        s5, sp, 1696
                  or           a4, zero, s11
                  c.addi       t3, -1
                  c.sub        a1, a2
                  c.lui        s7, 14
                  add          s1, tp, s8
                  la           s8, amo_0+4 #start riscv_amo_instr_stream_11
                  la           a2, amo_0+44
                  amomaxu.w     a5, s3, (a2)
                  amoor.w       s7, zero, (s8)
                  or           a5, a1, t1
                  lui          s3, 109712
                  amoor.w.aq    zero, s4, (s8)
                  amoor.w.rl    s3, s7, (s8)
                  amoadd.w.aq   s10, a1, (a2)
                  amoadd.w.aq   a6, ra, (a2)
                  amomax.w.rl   s5, s9, (a2)
                  amoxor.w      s10, a1, (s8)
                  c.srli       a0, 15
                  c.and        a1, a3
                  add          a0, t6, t1
                  c.and        a0, a4
                  amomaxu.w.rl  s10, t1, (s8) #end riscv_amo_instr_stream_11
                  c.sub        a5, a3
2525:             sltiu        ra, s3, 947
                  srai         tp, gp, 24
                  mulhsu       s1, t5, t3
2528:             div          a2, s9, s8
                  mulhsu       a3, t5, t3
                  sll          s2, s10, a4
                  or           ra, s8, zero
                  or           t0, zero, a5
                  lui          gp, 162844
                  sll          s7, a1, tp
                  and          t6, a2, s11
                  rem          ra, s11, sp
                  sltu         s11, s9, t2
                  sll          a0, tp, s7
                  sll          a6, a2, t1
                  srli         t1, tp, 22
                  slli         a0, a5, 0
                  nop
                  c.lui        s2, 28
                  c.and        s1, a2
                  c.srli       a5, 19
                  add          a5, t1, t4
                  andi         s0, gp, 1901
                  xori         a4, s1, -1885
                  beq          s10, t5, 2552f
                  remu         s7, s5, s1
                  c.mv         a7, s2
2552:             c.mv         s0, a4
                  c.beqz       a3, 2555f
                  bne          s1, a7, 2560f
2555:             auipc        t6, 883528
                  slli         s1, zero, 4
                  beq          zero, t0, 2563f
                  addi         s6, zero, 3 #init loop 0 counter
                  slt          a3, s4, t2
                  andi         t1, s7, 562
                  xori         s8, a3, -1230
                  c.addi       a2, -1
                  addi         s7, zero, 13 #init loop 0 limit
                  c.srli       a2, 4
                  c.xor        a3, a4
                  c.andi       a4, -1
                  auipc        tp, 959924
                  srli         t4, a7, 6
                  slt          s5, a3, a1
                  ori          t4, s7, 538
                  xor          s3, a5, s6
                  c.sub        a2, a2
                  c.and        a5, a5
                  srai         a5, s5, 30
                  rem          gp, ra, s4
sub_5_90_0_t:     addi         s10, s8, 1263
                  and          a1, t6, a2
                  addi         s6, s6, 3 #update loop 0 counter
                  and          zero, s4, a3
                  c.slli       a7, 29
                  c.xor        a3, a0
                  xor          s11, a6, s0
                  c.or         a0, a2
                  bltu         s6, s7, sub_5_90_0_t #branch for loop 0
                  add          zero, a6, s8
                  bge          a4, s7, 2561f
                  c.beqz       a5, 2574f
2560:             divu         s8, a2, tp
2561:             blt          t4, a2, 2569f
                  c.bnez       a4, 2564f
2563:             mul          zero, s2, s4
2564:             mulhsu       s4, a2, a6
                  rem          t1, a4, t5
                  bgeu         s7, zero, 2572f
                  xori         s2, s10, -158
                  c.andi       a2, -1
2569:             mulh         s3, a6, s4
                  c.nop
                  c.mv         a3, s3
2572:             auipc        s3, 512524
                  sub          s9, t3, t5
2574:             or           t6, t0, t6
                  mulh         s2, a4, tp
                  auipc        a1, 366169
                  nop
                  srli         a3, s6, 20
                  c.nop
                  c.sub        s0, s0
                  addi         s6, tp, -1792
                  srl          a0, s0, sp
                  div          a4, a4, t5
                  c.sub        s0, a3
                  c.lui        s4, 12
                  sub          a6, a0, gp
                  nop
                  c.bnez       a3, 2605f
                  add          a1, s3, ra
                  mulhu        t6, a6, a3
                  sltiu        a6, a4, -910
                  bne          t0, a7, 2605f
                  beq          s8, a3, 2596f
                  blt          s2, t4, 2598f
                  c.bnez       s1, 2609f
2596:             xori         t6, t1, 1935
                  slti         a4, t2, -949
2598:             nop
                  andi         s7, s5, -1420
                  c.mv         s0, a6
                  ori          s6, t3, -337
                  rem          s10, zero, a6
                  srli         a2, t2, 26
                  c.xor        a0, s1
2605:             mul          s11, ra, gp
                  bgeu         s2, a3, 2621f
                  lui          t3, 153080
                  remu         s11, t0, a3
2609:             mulhsu       a1, t4, s0
                  bge          t2, zero, 2615f
                  bgeu         s7, a0, 2613f
                  slli         t6, a1, 20
2613:             sub          ra, s4, s2
                  bge          t1, t1, 2620f
2615:             or           a7, s0, t5
                  andi         tp, gp, 930
                  bgeu         s0, a7, 2635f
                  nop
                  bne          zero, a0, 2631f
2620:             srl          s10, a0, a1
2621:             ori          t0, tp, 2022
                  c.xor        s0, a4
                  srl          s10, a3, a5
                  lui          s5, 241272
                  c.nop
                  sltiu        s10, s10, -1265
                  c.or         a4, a2
                  c.add        a1, a2
                  c.lui        gp, 23
                  c.add        t6, s9
2631:             c.beqz       s1, 2641f
                  divu         a7, s8, s0
                  c.andi       a4, -1
                  bltu         sp, s7, 2647f
2635:             c.xor        s0, a0
                  c.addi       a0, 17
                  c.srli       a1, 26
                  c.add        a3, s6
                  xori         a5, s4, 589
                  xori         a3, t1, 1624
2641:             sub          a4, s10, a4
                  sra          a1, s11, t3
                  and          t0, zero, s4
                  auipc        t1, 94379
                  add          s11, s6, a0
                  sll          zero, sp, s11
2647:             srli         a6, sp, 27
                  xor          a6, t1, gp
                  mul          s5, s7, s4
                  xori         s10, t3, -350
                  c.srli       a0, 1
                  slt          t4, gp, s4
                  div          s1, a7, t2
                  andi         s4, a0, 1486
                  c.andi       a0, 16
                  or           s6, s6, zero
                  c.addi       a5, 1
                  c.slli       ra, 20
                  bge          t5, s2, 2672f
                  c.addi       s2, -1
                  bge          a3, sp, 2670f
                  sltiu        s10, tp, 671
                  divu         tp, t6, s5
                  xor          gp, s6, a7
                  c.mv         s1, ra
                  c.mv         t4, a1
                  mul          s11, t5, s4
                  c.sub        a1, a2
                  c.addi       s8, 25
2670:             c.srai       s1, 4
                  rem          t1, s4, t3
2672:             mulhu        s4, zero, s10
                  auipc        ra, 111278
                  slti         t1, a6, 1691
                  lui          s2, 220235
                  c.beqz       s1, 2691f
                  and          s3, a2, t6
                  mulhu        s3, sp, a5
                  add          s10, s0, t0
                  sltiu        a0, a6, 311
                  mulhu        a4, a2, t4
                  c.xor        a5, a3
                  div          t0, t0, t6
                  auipc        zero, 499646
                  xori         s10, s11, -279
                  c.slli       s9, 19
                  c.slli       t3, 26
                  bne          s5, a7, 2704f
                  c.xor        a0, s0
                  c.lui        t3, 27
2691:             bne          s4, s5, 2703f
                  srai         s0, t4, 3
                  c.andi       s1, -1
                  add          s0, a6, a4
                  srai         s10, s8, 0
                  srai         zero, s6, 27
                  blt          zero, a6, 2712f
                  c.or         a3, a2
                  xor          s7, a1, sp
                  sub          a3, s8, s11
                  addi         s0, t4, 1635
                  srli         s7, s11, 22
2703:             auipc        zero, 355327
2704:             add          a7, t1, s1
                  sltu         s9, t6, zero
                  c.nop
                  blt          a7, s2, 2710f
                  mulhu        t6, s7, ra
                  c.srai       a3, 21
2710:             c.beqz       a3, 2715f
                  sltu         s4, a2, t4
2712:             slti         t6, s2, 400
                  srli         s8, t5, 3
                  sltiu        s11, s4, 1428
2715:             blt          s0, s0, 2723f
                  sltiu        a7, s0, 1299
                  xori         t1, t1, 90
                  and          s8, s5, s10
                  beq          a1, zero, 2722f
                  c.srli       a2, 9
                  lui          s11, 68318
2722:             c.srai       a4, 24
2723:             slli         zero, t6, 16
                  c.srai       a0, 22
                  c.add        tp, a7
                  c.beqz       a4, 2735f
                  ori          s2, s7, -98
                  c.add        s6, a7
                  c.lui        s7, 24
                  bne          t0, a5, 2747f
                  sll          s11, a1, a7
                  nop
                  c.slli       s5, 17
                  xor          s9, a7, s2
2735:             c.add        t1, a5
                  xori         a5, t0, -1766
                  mulh         a3, a0, a3
                  c.mv         a6, s4
                  srai         t4, s7, 14
                  bne          s4, s9, 2754f
                  c.or         s1, a1
                  and          s3, s8, a5
                  nop
                  srl          gp, s10, s0
                  c.addi       s0, -1
                  beq          t3, t4, 2752f
2747:             nop
                  slti         t4, t4, -439
                  lui          s3, 488667
                  c.andi       a3, 13
                  bgeu         ra, a2, 2765f
2752:             mulhsu       t0, t3, a5
                  c.srai       a2, 12
2754:             srl          tp, a4, ra
                  srl          s10, a1, s11
                  c.beqz       a2, 2774f
                  mulhsu       s10, t3, a2
                  c.mv         a1, t5
                  divu         a4, s4, a6
                  c.add        t0, a3
                  bne          t1, s7, 2763f
                  blt          s4, tp, 2773f
2763:             mulhu        t0, t3, gp
                  sltu         t6, zero, s5
2765:             c.nop
                  addi         s3, s9, -1154
                  lui          tp, 996726
                  c.srai       a5, 14
                  addi         s4, s5, -1286
                  srli         a3, s7, 2
                  bne          a4, s7, 2789f
                  c.xor        a2, a3
2773:             c.srli       a5, 2
2774:             c.addi       t6, -1
                  c.li         s7, 7
                  and          a7, s7, s0
                  mulh         t4, ra, a6
                  c.addi       s0, 15
                  bne          t5, s0, 2785f
                  mulhsu       s1, a3, s9
                  bltu         t0, s0, 2783f
                  mul          s5, s9, ra
2783:             nop
                  c.slli       t1, 15
2785:             bge          a5, a1, 2791f
                  xor          t1, gp, s2
                  sra          s11, s9, gp
                  srai         s1, t6, 0
2789:             and          s0, s5, s3
                  sra          s5, t2, s4
2791:             c.lui        ra, 3
                  sub          s8, a3, s5
                  remu         s6, s11, a2
                  c.li         s1, 20
                  remu         s11, a2, a0
                  bne          gp, a2, 2798f
                  bge          t6, t1, 2803f
2798:             ori          a0, t2, -1800
                  c.beqz       a3, 2802f
                  addi         t1, s10, 640
                  bltu         s4, s3, 2816f
2802:             bltu         s3, a7, 2806f
2803:             slti         s7, zero, -283
                  c.slli       s11, 31
                  add          a7, sp, s9
2806:             add          t3, a7, a6
                  addi         a5, t0, 861
                  c.nop
                  c.sub        a0, a2
                  slti         s8, t4, -1315
                  slti         a5, s0, 356
                  c.slli       s8, 5
                  mul          s7, t6, a1
                  xor          s8, s8, s9
                  c.or         a4, s1
2816:             mulhsu       a6, a0, t0
                  and          t3, a2, a6
                  mul          s10, a6, ra
                  divu         s5, s3, a7
                  c.srli       a1, 1
                  remu         t4, t4, a3
                  srl          s1, s10, a0
                  srai         a3, gp, 15
                  mulhu        s11, a0, s10
                  c.slli       s5, 4
                  srai         s8, s11, 16
                  sub          s2, a2, zero
                  srl          s9, s1, zero
                  andi         s8, s1, 138
                  beq          sp, t0, 2838f
                  xor          t4, t0, a3
                  c.or         s1, a2
                  c.mv         s11, a5
                  blt          s5, t6, 2848f
                  c.lui        s6, 21
                  sra          a5, s8, gp
                  or           s5, s6, s6
2838:             bge          s4, t6, 2852f
                  c.srai       a0, 21
                  xor          a5, zero, s2
                  c.xor        s1, a5
                  c.bnez       s1, 2845f
                  nop
                  bltu         t3, tp, 2849f
2845:             lui          s6, 327378
                  sra          s0, t1, a4
                  sltiu        t1, ra, 506
2848:             c.srli       a0, 10
2849:             rem          zero, s5, tp
                  c.srai       a4, 23
                  beq          t3, s3, 2860f
2852:             c.li         s10, -1
                  sub          s3, s7, s9
                  sll          t0, sp, s11
                  c.srli       a3, 23
                  c.andi       a2, -1
                  c.and        s0, a0
                  slt          tp, a4, s10
                  c.srli       a1, 1
2860:             c.srai       a1, 1
                  bgeu         zero, s7, 2879f
                  nop
                  sra          s6, s5, t1
                  div          ra, t0, t6
                  nop
                  c.sub        a3, a2
                  bgeu         s8, t2, 2873f
                  c.slli       s10, 22
                  sltiu        t4, a0, -1521
                  xori         t3, a7, -24
                  mul          zero, t2, s7
                  c.add        a6, s2
2873:             add          ra, ra, a2
                  or           s2, sp, s7
                  c.add        ra, t1
                  c.sub        a5, a3
                  c.or         a3, a4
                  div          a0, s8, s5
2879:             srli         gp, t1, 21
                  sltu         a3, ra, s11
                  andi         s7, s11, -1332
                  bltu         a5, gp, 2884f
                  c.sub        a2, a5
2884:             mulhu        t1, t1, a2
                  mulh         s10, t0, a3
                  mulh         a3, s11, t4
                  divu         s7, a4, t4
                  c.slli       s4, 25
                  c.xor        a1, a0
                  nop
                  c.or         a1, a0
                  slli         a3, a2, 27
                  bne          zero, t1, 2901f
                  mulhu        s11, s7, a0
                  c.beqz       a3, 2908f
                  bge          sp, ra, 2914f
                  sltiu        t1, zero, 581
                  beq          sp, t6, 2913f
                  add          s11, a1, t0
                  c.andi       a2, 31
2901:             slt          s1, t2, s1
                  srai         s6, a5, 24
                  sra          t6, t5, t0
                  and          s9, a6, a3
                  auipc        zero, 199571
                  lui          s3, 580334
                  div          zero, gp, a1
2908:             sltiu        s8, s7, 1954
                  blt          a0, a2, 2924f
                  srl          a3, a7, s8
                  c.srli       a0, 9
                  c.addi       a3, 23
2913:             bgeu         a7, a3, 2924f
2914:             div          a1, s1, a7
                  c.or         a3, a3
                  mul          a4, a1, t3
                  addi         zero, a3, -529
                  c.xor        a4, a5
                  mulh         s11, t4, a6
                  slti         a2, t1, -545
                  c.li         gp, -1
                  sll          s7, s0, s7
                  divu         s7, s6, a1
2924:             bne          s1, t4, 2930f
                  bge          t3, t6, 2941f
                  rem          s5, tp, a7
                  c.srli       s0, 3
                  slti         t3, t1, -670
                  xori         tp, s8, -697
2930:             andi         s10, t3, 1289
                  mulhsu       a5, a1, zero
                  srai         a0, t6, 26
                  bne          a5, a4, 2945f
                  c.sub        s1, a1
                  lui          a0, 26854
                  srli         a7, s5, 29
                  sltiu        tp, a5, -624
                  sll          a6, s1, a1
                  sub          s9, a5, s3
                  c.srai       a0, 17
2941:             c.slli       a0, 2
                  divu         s3, s9, t2
                  xori         a7, s5, 1355
                  c.andi       a3, 11
2945:             c.add        s8, ra
                  rem          s4, t4, s8
                  c.xor        a4, a5
                  addi         s4, s0, 780
                  beq          a7, t3, 2955f
                  div          gp, s0, tp
                  mulh         s5, t5, s11
                  sra          a5, s7, s2
                  c.xor        a3, a1
                  sltiu        gp, s6, -1782
2955:             slt          s8, t5, t5
                  div          a2, a1, s10
                  c.bnez       a3, 2959f
                  bltu         a5, t4, 2964f
2959:             add          s6, s2, a6
                  slt          s7, t6, s2
                  andi         s7, sp, 889
                  c.lui        a1, 1
                  blt          t5, t2, 2978f
2964:             and          t6, a1, a4
                  c.or         s0, a1
                  bgeu         zero, s2, 2975f
                  sltiu        t6, s10, -650
                  sltu         s8, t6, s7
                  bne          s0, s3, 2973f
                  addi         s10, a3, -1217
                  c.nop
                  mulh         s9, s7, t3
2973:             c.lui        s7, 28
                  c.add        s6, s10
2975:             c.sub        a4, a1
                  bne          zero, t3, 2979f
                  divu         gp, s1, a6
2978:             c.mv         s3, s8
2979:             beq          t6, s7, 2981f
                  c.srai       a4, 2
2981:             c.beqz       a2, 2994f
                  mulhu        a3, a4, a3
                  c.nop
                  mulh         t0, t1, s6
                  xor          a7, gp, sp
                  xor          t4, t5, s2
                  auipc        s7, 83381
                  mulhsu       gp, t4, a7
                  srli         t0, sp, 24
                  blt          a0, s5, 3000f
                  blt          t4, a0, 3008f
                  mulhsu       s11, a0, s2
                  bge          s7, s2, 3001f
2994:             ori          s1, a6, 972
                  slt          a6, tp, a0
                  c.li         s6, -1
                  or           a7, s10, s3
                  ori          s0, sp, -1758
                  c.li         s2, 10
3000:             and          s6, s0, sp
3001:             mul          a2, a5, s0
                  srai         s8, a1, 22
                  bgeu         s1, a0, 3006f
                  c.srai       a1, 12
                  c.slli       s1, 2
3006:             bgeu         a6, t6, 3009f
                  sll          t3, s1, s7
3008:             xor          t3, s5, a7
3009:             mulhu        s0, t6, t5
                  c.add        s5, s1
                  c.li         a1, -1
                  c.lui        t1, 29
                  bne          sp, a7, 3022f
                  bltu         a7, zero, 3028f
                  beq          t6, s4, 3021f
                  c.srli       a4, 14
                  and          s10, s5, t5
                  c.or         a3, s0
                  c.and        a4, a3
                  c.addi       a0, -1
3021:             mulhu        s11, s10, t1
3022:             srli         s9, s8, 27
                  c.xor        a4, a0
                  c.mv         tp, s7
                  sltu         a7, a3, a6
                  remu         s2, t4, a5
                  c.bnez       a4, 3035f
3028:             c.beqz       a0, 3034f
                  xori         a6, t0, 875
                  c.xor        a5, a4
                  ori          s9, a1, -1245
                  srl          s10, a1, s2
                  remu         s10, gp, s5
3034:             bge          a4, s10, 3049f
3035:             andi         a0, t1, 27
                  ori          s10, sp, -1127
                  c.sub        a0, a1
                  divu         s2, t4, t1
                  c.nop
                  sra          s6, a3, a1
                  addi         t1, gp, -1954
                  remu         a3, a3, s0
                  srli         s1, sp, 18
                  c.slli       s0, 15
                  c.nop
                  c.or         a5, a4
                  bne          s6, a2, 3052f
                  bgeu         t0, a0, 3064f
3049:             c.andi       a2, -1
                  bne          a4, tp, 3059f
                  c.slli       a7, 3
3052:             blt          a6, zero, 3062f
                  xor          tp, s7, sp
                  slli         ra, tp, 16
                  blt          t4, zero, 3066f
                  bne          t5, s11, 3058f
                  or           s6, sp, ra
3058:             mulh         s8, s8, a3
3059:             mulhsu       s10, ra, t1
                  c.and        a1, a3
                  c.add        s7, t3
3062:             bltu         s4, s7, 3077f
                  ori          a1, t1, -653
3064:             c.and        a0, s0
                  c.addi       a3, 13
3066:             c.andi       a0, 11
                  bne          gp, a3, 3079f
                  c.srai       a1, 6
                  sub          a0, a6, t5
                  c.add        tp, s4
                  sltu         s3, a2, ra
                  ori          s4, a6, 1877
                  auipc        t6, 110792
                  c.nop
                  bge          t3, a2, 3090f
                  c.srai       a5, 26
3077:             bltu         a7, s9, 3090f
                  c.sub        a2, s1
3079:             ori          ra, s1, 1776
                  c.addi       gp, -1
                  bne          s2, a2, 3087f
                  la           a0, region_1+989 #start riscv_load_store_rand_instr_stream_4
                  srl          t4, a1, s8
                  sb           s7, -170(a0)
                  c.nop
                  sra          s8, s11, a7
                  sb           s4, -182(a0)
                  c.and        s1, s1
                  or           s6, s1, sp
                  lbu          t1, 729(a0)
                  lui          ra, 951717
                  c.slli       s9, 1
                  sb           t5, -55(a0)
                  lbu          s11, -32(a0)
                  lh           s2, -579(a0)
                  c.srli       a5, 31
                  sltu         s0, t5, s11
                  div          a7, t0, gp
                  mulh         t1, gp, t0
                  lb           s1, -543(a0)
                  sll          s7, a5, a3
                  c.nop
                  xori         a3, a7, 1359
                  srai         gp, t5, 30
                  sw           s4, -969(a0)
                  c.nop
                  sb           t6, 898(a0)
                  lh           s0, -809(a0)
                  andi         s4, a2, 1080
                  lb           a6, -357(a0)
                  mulh         a3, a2, s0
                  lb           a5, 543(a0)
                  divu         s5, a6, s9
                  sb           zero, -621(a0)
                  lb           s9, -649(a0) #end riscv_load_store_rand_instr_stream_4
                  remu         t1, t1, s4
                  or           t4, s1, s4
                  mulhu        a5, sp, s1
                  mulhu        s10, sp, s2
                  bge          s6, a5, 3104f
3087:             xor          s11, t5, zero
                  remu         t0, t5, s0
                  bge          s6, s8, 3093f
3090:             c.xor        a1, a5
                  sltiu        a3, s3, -2037
                  remu         t6, t1, gp
3093:             srl          t1, s0, s7
                  nop
                  bltu         sp, s5, 3098f
                  or           t3, t3, a2
                  beq          t3, a6, 3110f
3098:             c.xor        a0, a5
                  c.sub        a4, a3
                  c.andi       a1, -1
                  c.add        s3, s9
                  ori          s10, s2, 130
                  nop
3104:             bltu         t0, a3, 3107f
                  c.addi       t4, 30
                  andi         s1, s0, -1886
3107:             slti         s5, a0, 1272
                  div          a7, s6, a2
                  mulhsu       t0, s7, s5
3110:             c.slli       s2, 19
                  andi         t3, a2, -1354
                  c.srli       a1, 11
                  c.andi       s0, -1
                  and          a5, tp, s4
                  rem          a6, t3, a5
                  c.lui        s6, 8
                  addi         a4, a0, 744
                  c.beqz       a0, 3135f
                  lui          s6, 249164
                  srl          s0, s4, gp
                  c.beqz       a2, 3123f
                  c.beqz       a1, 3136f
3123:             andi         s0, a4, -1073
                  bne          s4, s9, 3132f
                  auipc        s5, 102264
                  lui          tp, 650140
                  sra          t0, tp, t0
                  c.lui        s8, 28
                  c.andi       a0, -1
                  nop
                  bgeu         s0, gp, 3137f
3132:             bgeu         a4, zero, 3150f
                  c.andi       a3, -1
                  bgeu         a7, a0, 3136f
3135:             bgeu         s10, ra, 3137f
3136:             mulhu        s7, s6, s11
3137:             remu         s10, a0, a0
                  c.xor        a1, s1
                  and          a2, t2, t6
                  c.nop
                  rem          a2, sp, t6
                  lui          s6, 191203
                  auipc        t1, 283628
                  divu         a5, t3, ra
                  ori          zero, s1, -1774
                  or           a7, a2, zero
                  nop
                  c.sub        a0, s0
                  bge          s10, s1, 3163f
3150:             sltiu        s11, zero, 603
                  c.bnez       a4, 3164f
                  srli         t4, s6, 19
                  srli         s6, a5, 18
                  rem          s7, s7, a3
                  bne          a4, s8, 3159f
                  slti         a0, t5, -834
                  bgeu         t5, t1, 3160f
                  c.slli       s0, 12
3159:             srai         a3, a0, 17
3160:             c.slli       s10, 15
                  slti         s7, s7, 582
                  mulhsu       a7, a4, a1
3163:             ori          s10, t0, -127
3164:             c.andi       s1, -1
                  c.beqz       a2, 3173f
                  srai         a1, a5, 3
                  beq          s10, s6, 3169f
                  c.or         a2, a3
3169:             mulhsu       gp, gp, s10
                  bgeu         gp, s2, 3173f
                  auipc        a0, 887287
                  lui          s5, 739080
3173:             xori         a4, s7, -641
                  beq          s4, s4, 3179f
                  slt          s11, tp, s6
                  c.or         s0, a1
                  srl          s2, s8, t2
                  bltu         s8, t0, 3194f
3179:             bge          t4, ra, 3189f
                  xor          a7, t3, s3
                  or           gp, t1, s11
                  c.srai       s0, 7
                  sra          s1, sp, s2
                  sll          ra, s7, s10
                  sltiu        s10, s2, 43
                  c.slli       s4, 6
                  xori         ra, s10, 401
                  c.lui        s0, 17
3189:             c.mv         s3, s3
                  sltu         ra, gp, a3
                  c.srli       a4, 14
                  mulhu        t0, a4, a2
                  bltu         s5, s5, 3199f
3194:             xor          s3, a3, t2
                  sltiu        a2, s9, 638
                  xor          t4, tp, t0
                  c.slli       t6, 17
                  xor          a1, t1, s6
3199:             addi         a2, s2, 1787
                  sltiu        tp, t6, -151
                  andi         a3, s7, 1185
                  andi         s5, a0, -1777
                  sra          a3, tp, gp
                  c.mv         t0, s8
                  sub          t0, s5, s8
                  srai         a0, t4, 29
                  c.mv         a2, s1
                  bge          s2, s3, 3217f
                  sra          t3, a7, s6
                  ori          t6, t3, 1318
                  sltiu        ra, t3, 1279
                  mulhu        ra, a0, s2
                  sll          tp, s10, t0
                  srl          s10, s4, s2
                  xori         a0, a7, 229
                  slt          t3, t4, t0
3217:             nop
                  c.sub        a4, a1
                  xori         s9, s4, 26
                  c.li         gp, 20
                  sub          tp, s3, s4
                  c.xor        s0, a1
                  c.and        a2, a4
                  beq          a6, s7, 3242f
                  c.li         a2, -1
                  c.bnez       a5, 3228f
                  sll          s9, a2, ra
3228:             slli         a1, s7, 23
                  srli         s1, s9, 25
                  blt          a2, tp, 3242f
                  c.bnez       a4, 3240f
                  c.mv         ra, t4
                  mulhsu       a6, a2, s7
                  c.slli       gp, 7
                  mulh         t4, s7, s11
                  beq          a3, a1, 3253f
                  sra          t6, s10, a4
                  c.beqz       a1, 3244f
                  mul          ra, s8, tp
3240:             srli         zero, s5, 0
                  divu         a7, t5, s7
3242:             bge          ra, zero, 3257f
                  andi         tp, s8, 1398
3244:             add          t6, a1, s9
                  srai         zero, t3, 8
                  slli         tp, s5, 2
                  lui          s10, 756685
                  c.add        s6, s0
                  c.nop
                  c.add        t0, a1
                  xor          s4, a0, s8
                  divu         a0, a6, s0
3253:             c.andi       a2, -1
                  c.sub        a5, s0
                  xori         gp, s3, 924
                  c.srai       a5, 24
3257:             mulhsu       a3, a2, s10
                  sltu         a2, s4, t6
                  auipc        ra, 646992
                  nop
                  bltu         t3, a3, 3279f
                  andi         ra, s3, 1034
                  bne          a6, s9, 3278f
                  sltiu        a6, a3, -1470
                  slt          t6, t3, t0
                  c.slli       t4, 18
                  c.andi       s1, 1
                  slli         s10, t3, 6
                  rem          s7, a4, s11
                  slt          a7, t2, t0
                  xor          tp, s3, zero
                  c.xor        a1, a5
                  beq          t2, s5, 3287f
                  blt          s6, s0, 3289f
                  blt          s2, s7, 3281f
                  add          s3, a4, a7
                  sltiu        s1, a2, -338
3278:             bne          t0, a5, 3291f
3279:             c.li         a3, 8
                  blt          s4, t1, 3286f
3281:             bne          t0, s8, 3292f
                  and          s1, ra, a4
                  c.beqz       a2, 3286f
                  div          t4, a3, s4
                  xori         tp, a2, -89
3286:             divu         a6, s6, a1
3287:             add          a1, a0, s11
                  slti         s7, s5, -917
3289:             or           a3, s4, s11
                  c.or         s0, a5
3291:             srl          t1, a2, t0
3292:             srai         s8, s1, 4
                  slt          a0, s3, s1
                  c.srai       a1, 22
                  div          gp, a7, a7
                  c.lui        gp, 28
                  c.bnez       s0, 3305f
                  c.srai       s1, 14
                  nop
                  sltiu        s5, a0, -1810
                  andi         t1, sp, -1222
                  srl          s4, t4, s3
                  mulh         gp, s8, s10
                  c.addi       t6, -1
3305:             c.bnez       s1, 3311f
                  divu         t1, t4, s8
                  divu         tp, ra, a2
                  sra          a7, t4, s1
                  mulh         s9, tp, a6
                  sltu         a5, t4, t6
3311:             auipc        t4, 215685
                  c.li         s2, -1
                  sub          a0, zero, t2
                  c.andi       a0, -1
                  remu         s1, a2, t5
                  mulhu        t4, s5, a3
                  c.and        a1, a0
                  bgeu         a6, s11, 3320f
                  mulhu        s11, s9, a7
3320:             beq          t2, s2, 3333f
                  srli         s1, a5, 0
                  c.srai       a5, 22
                  c.sub        a5, a1
                  mulh         s10, s0, s10
                  c.srai       s0, 30
                  srai         t0, a7, 13
                  slti         s1, s3, -1772
                  div          a5, a7, ra
                  and          t6, zero, a0
                  slli         a5, a2, 14
                  c.xor        a0, a5
                  c.sub        s0, s0
3333:             or           s4, t4, s1
                  andi         t1, a6, -512
                  sll          a3, s5, t2
                  srl          a6, t2, t1
                  ori          t4, s2, 701
                  addi         s2, s10, -1037
                  sub          t6, s10, tp
                  andi         s0, t2, 1968
                  ori          a3, zero, 1143
                  addi         t1, a6, 269
                  ori          tp, a7, -1238
                  sub          s11, a0, t2
                  srli         ra, s2, 11
                  c.srli       a5, 20
                  mul          zero, a3, a5
                  beq          a7, t2, 3366f
                  slt          a4, a0, s4
                  mulhsu       a3, sp, s5
                  ori          a6, t5, -1104
                  add          s0, t2, gp
                  beq          a0, s1, 3367f
                  sltiu        a5, a2, 1984
                  srli         a3, s2, 31
                  c.srai       a5, 16
                  add          gp, t4, s5
                  c.li         s3, 17
                  sll          a0, t1, a5
                  bne          t4, s0, 3364f
                  divu         zero, t4, a5
                  c.sub        a0, a2
                  c.bnez       a2, 3380f
3364:             srli         s9, s1, 16
                  c.addi       s0, 13
3366:             c.sub        a1, a0
3367:             srai         ra, sp, 7
                  mul          t0, s0, t5
                  or           t0, s4, a1
                  c.srli       a3, 11
                  c.lui        ra, 12
                  c.beqz       a4, 3375f
                  divu         tp, t4, t4
                  c.mv         s5, t1
3375:             srl          t1, s2, tp
                  c.nop
                  c.xor        a5, a2
                  rem          s3, a0, s6
                  c.andi       s1, 30
3380:             ori          s8, gp, -1567
                  c.beqz       s1, 3397f
                  c.nop
                  sra          t3, a7, s4
                  sltu         t0, s8, a0
                  andi         s8, s2, -1449
                  c.lui        t0, 23
                  div          a2, s11, s11
                  bne          t3, s5, 3398f
                  rem          s2, sp, t0
                  bgeu         t6, a7, 3392f
                  xori         a1, tp, -1567
3392:             addi         s4, a4, -1783
                  remu         s0, s9, s6
                  auipc        a5, 430258
                  mulh         t4, a7, s0
                  addi         s9, a7, -1742
3397:             c.slli       t6, 12
3398:             c.lui        a4, 1
                  blt          a4, tp, 3401f
                  ori          s0, s8, 222
3401:             mulh         s7, zero, s8
                  c.andi       a0, 13
                  c.xor        a0, a2
                  auipc        t3, 430646
                  slli         a4, ra, 29
                  bge          a3, gp, 3411f
                  lui          s1, 835107
                  bltu         t6, t0, 3414f
                  sub          s8, a2, s11
                  c.srli       a2, 2
3411:             rem          s6, ra, a5
                  mulh         s11, t6, s1
                  slt          s7, s0, t3
3414:             bltu         s6, t3, 3426f
                  c.slli       s9, 30
                  beq          s8, s11, 3434f
                  c.srli       a0, 16
                  addi         s7, gp, 1641
                  c.bnez       a2, 3425f
                  slti         a2, s8, 1802
                  c.xor        a3, a4
                  beq          s2, t4, 3437f
                  sub          t4, s9, a6
                  c.beqz       a4, 3438f
3425:             c.xor        s1, a4
3426:             c.xor        s0, a0
                  c.or         a4, a5
                  c.srai       a0, 8
                  ori          ra, a5, 1472
                  ori          s3, s2, -1239
                  c.srli       s0, 9
                  bltu         t1, s1, 3435f
                  c.and        a3, a0
3434:             srli         a0, s6, 19
3435:             sltiu        t6, sp, -1906
                  and          t4, t1, t3
3437:             c.andi       a1, 15
3438:             c.srai       a0, 26
                  blt          a7, t0, 3448f
                  c.or         a0, a0
                  beq          s10, a7, 3456f
                  beq          gp, s0, 3450f
                  mulh         s8, t2, ra
                  c.add        ra, t1
                  bge          s0, t5, 3454f
                  ori          a6, a0, 1911
                  lui          s7, 265986
3448:             c.srai       a1, 23
                  auipc        s11, 233912
3450:             addi         s2, a0, 333
                  sra          a5, s2, s11
                  c.slli       a2, 29
                  c.mv         t6, s3
3454:             mulh         tp, s10, a0
                  bge          a1, a2, 3470f
3456:             slti         t0, s4, 489
                  lui          a4, 725108
                  c.lui        a5, 22
                  sll          s8, s7, ra
                  c.srai       a4, 28
                  add          a3, s8, s10
                  c.nop
                  beq          t1, s9, 3474f
                  add          a0, s4, a2
                  sll          s5, s9, t2
                  srli         s1, s8, 27
                  c.mv         s11, t3
                  blt          s5, s3, 3481f
                  srai         s3, t1, 12
3470:             c.andi       a0, 29
                  xor          s10, a3, t0
                  bne          s0, sp, 3478f
                  c.srli       a1, 23
3474:             c.beqz       a5, 3482f
                  c.lui        a0, 16
                  and          a0, a6, a2
                  blt          s0, ra, 3480f
3478:             lui          s8, 445635
                  slt          s11, a6, t5
3480:             sltu         ra, s2, s2
3481:             sltiu        a0, t6, 1859
3482:             sltu         s4, a6, a3
                  and          s4, a2, s0
                  slti         t3, gp, 1458
                  c.li         s6, -1
                  or           a4, s2, t4
                  c.lui        a2, 1
                  sltiu        a1, t5, -1291
                  lui          t4, 316013
                  bltu         a7, a3, 3505f
                  rem          s11, tp, s8
                  c.li         a1, -1
                  c.slli       gp, 3
                  bgeu         s7, a0, 3496f
                  sltiu        tp, gp, 203
3496:             sltiu        s3, tp, -315
                  srai         gp, a5, 17
                  slti         a1, t6, 638
                  bge          s11, s6, 3513f
                  xori         a4, t6, 1731
                  c.sub        a1, s1
                  c.srli       a5, 21
                  c.srai       a2, 2
                  auipc        s0, 564687
3505:             xor          a1, a6, s10
                  beq          s9, a0, 3509f
                  andi         a6, ra, -1338
                  bgeu         ra, zero, 3516f
3509:             auipc        a5, 431592
                  sra          t1, tp, s7
                  c.li         s11, 1
                  rem          ra, tp, s4
3513:             remu         t3, t3, s9
                  mul          tp, a7, a6
                  bne          s11, s9, 3530f
3516:             mul          s0, s10, s0
                  sub          ra, sp, s1
                  c.mv         s3, gp
                  lui          ra, 465948
                  bgeu         t4, tp, 3524f
                  c.and        s0, a2
                  rem          s8, s4, s10
                  blt          s6, s5, 3532f
3524:             c.xor        a0, a2
                  c.srli       s0, 29
                  mul          s3, s10, s11
                  c.and        s0, a1
                  lui          s10, 310353
                  sub          s10, s9, s11
3530:             c.slli       a6, 22
                  xor          a5, a5, a2
3532:             c.mv         ra, a5
                  add          t0, t4, a2
                  slli         tp, s11, 21
                  c.beqz       a0, 3549f
                  srl          zero, s8, s5
                  c.lui        gp, 9
                  c.add        s11, t1
                  divu         t4, a2, s8
                  bgeu         s11, sp, 3558f
                  lui          ra, 878163
                  c.addi       ra, 19
                  c.and        a5, s0
                  sub          a3, s2, t3
                  c.nop
                  xor          s11, sp, s3
                  lui          s2, 401556
                  andi         s11, a4, 1978
3549:             srli         s8, t0, 27
                  c.and        s1, a5
                  c.and        a2, a4
                  c.sub        a3, a3
                  mulh         zero, a0, s5
                  mulhsu       ra, s5, t2
                  srli         gp, a3, 26
                  c.srai       a1, 27
                  c.andi       s0, -1
3558:             blt          a1, a6, 3571f
                  bge          a5, t0, 3567f
                  and          tp, s7, s11
                  slt          s10, t5, s1
                  c.bnez       s1, 3577f
                  c.li         s10, 14
                  lui          a3, 838585
                  addi         s5, tp, 1652
                  mulh         t3, s5, a4
3567:             bge          t6, s10, 3580f
                  mulhu        s3, t5, gp
                  c.or         a5, s1
                  c.andi       s1, -1
3571:             blt          a0, s4, 3573f
                  c.srli       a5, 28
3573:             c.or         a4, a2
                  sra          s7, sp, a1
                  c.bnez       a1, 3581f
                  nop
3577:             bgeu         s9, t2, 3586f
                  and          a7, a2, ra
                  or           s1, t5, s9
3580:             blt          s8, a3, 3590f
3581:             c.nop
                  beq          s8, sp, 3594f
                  divu         a5, t4, a6
                  ori          a6, a7, -1456
                  auipc        zero, 637686
3586:             xori         a2, s9, -1794
                  div          a7, s1, s5
                  c.beqz       a0, 3599f
                  srl          s5, a6, t0
3590:             c.or         a4, a1
                  lui          tp, 895215
                  slti         s8, a5, -1304
                  beq          a5, tp, 3609f
3594:             c.and        s1, a3
                  c.and        a0, s0
                  c.andi       a3, -1
                  mulhsu       a4, s0, s11
                  beq          zero, a7, 3603f
3599:             c.mv         t0, s7
                  or           s1, s2, t3
                  c.beqz       a4, 3607f
                  bge          s3, a7, 3605f
3603:             lui          ra, 749542
                  c.nop
3605:             c.li         s8, -1
                  c.beqz       a3, 3624f
3607:             slli         gp, t0, 28
                  bgeu         zero, gp, 3614f
3609:             c.beqz       a4, 3612f
                  xori         t0, s2, -1929
                  and          s1, tp, ra
3612:             beq          s5, t4, 3629f
                  auipc        gp, 697250
3614:             remu         t3, a1, s0
                  sll          t4, s8, s0
                  slti         s7, t0, -732
                  sra          s4, t0, zero
                  srli         t1, s3, 22
                  addi         s6, s5, 988
                  c.nop
                  sub          t1, t0, s9
                  srai         a2, a6, 13
                  mulh         a6, sp, s11
3624:             or           a3, gp, s10
                  xor          s6, s10, s7
                  c.mv         a7, s4
                  slt          t3, a2, a5
                  c.xor        a4, a4
3629:             c.li         s11, -1
                  or           ra, tp, s4
                  blt          ra, s7, 3633f
                  or           s2, s0, tp
3633:             andi         s5, t5, 315
                  mulhsu       t0, a6, s0
                  c.lui        ra, 4
                  divu         t4, a2, t2
                  remu         s7, s11, s3
                  bne          gp, s8, 3644f
                  add          ra, ra, a1
                  ori          a7, a3, 874
                  c.addi       a7, 19
                  c.bnez       s0, 3648f
                  c.nop
3644:             srl          s9, t4, a6
                  xor          s3, a5, t5
                  bgeu         t5, s4, 3664f
                  c.slli       a7, 1
3648:             srai         gp, t4, 18
                  c.add        s11, t4
                  c.li         s6, -1
                  auipc        a0, 671827
                  mulh         s9, a3, a4
                  sll          s4, t2, s6
                  remu         s2, s7, t1
                  slt          t3, t0, t4
                  auipc        s6, 18331
                  div          s3, a4, a4
                  bne          s0, a6, 3666f
                  srli         s7, a1, 23
                  divu         s5, t6, t1
                  remu         t3, t5, t0
                  c.li         t4, -1
                  rem          s4, a4, s3
3664:             c.addi       s4, 6
                  auipc        t3, 622658
3666:             c.xor        a4, a5
                  c.bnez       s0, 3671f
                  c.mv         s9, t4
                  srl          t6, a7, a3
                  rem          s0, s9, s4
3671:             bltu         s8, a1, 3676f
                  xori         s2, t6, 732
                  c.add        s4, sp
                  c.nop
                  bne          t2, gp, 3690f
3676:             c.slli       gp, 6
                  mul          t1, zero, s3
                  mul          s2, a5, zero
                  xor          zero, s11, t4
                  bge          s2, a5, 3689f
                  c.li         t3, 3
                  c.nop
                  srai         a7, a6, 7
                  c.andi       a2, -1
                  mul          t6, sp, t4
                  addi         ra, a3, 1599
                  beq          a7, t2, 3700f
                  bgeu         t2, s11, 3697f
3689:             add          zero, t1, s0
3690:             rem          a0, t0, s1
                  add          s10, t1, zero
                  lui          s4, 681079
                  bge          t3, s9, 3695f
                  c.lui        s5, 26
3695:             bltu         s9, a7, 3712f
                  c.li         s2, 18
3697:             slt          a2, a1, s1
                  c.or         a4, a5
                  c.sub        a4, a5
3700:             blt          s10, s8, 3715f
                  slti         a7, s8, -2
                  mul          s5, s4, gp
                  c.srli       a4, 13
                  slt          a3, s3, a4
                  addi         a2, s5, -1793
                  andi         t1, t2, 588
                  bgeu         a2, a6, 3713f
                  beq          s4, t4, 3716f
                  ori          s4, s9, -1825
                  add          t1, ra, sp
                  mulhsu       zero, a5, zero
3712:             c.nop
3713:             blt          gp, s0, 3729f
                  sltu         s7, sp, zero
3715:             nop
3716:             bne          t4, ra, 3730f
                  c.xor        a1, a0
                  mulhsu       t0, a0, zero
                  xori         t6, s5, 87
                  andi         t1, a0, -367
                  c.or         a2, a4
                  ori          a4, s9, -823
                  c.and        a2, s1
                  or           a2, t0, s3
                  andi         s4, a6, 1597
                  sra          a6, sp, t2
                  slli         s4, s6, 31
                  c.and        s0, a0
3729:             c.slli       a4, 8
3730:             div          t3, a6, t0
                  remu         t6, t1, a3
                  andi         t6, s11, -1009
                  c.and        s0, s1
                  auipc        s2, 380257
                  c.slli       a0, 7
                  bgeu         t3, a5, 3739f
                  xor          a1, a2, t0
                  mulhsu       tp, t6, s5
3739:             divu         gp, a6, a5
                  slli         s10, a3, 28
                  and          t0, s10, t1
                  divu         a0, a4, t1
                  remu         tp, s11, t4
                  beq          s6, a2, 3750f
                  srl          a4, t4, a6
                  divu         t1, a0, sp
                  bltu         s3, s6, 3765f
                  mul          zero, gp, t2
                  xor          t1, s10, t3
3750:             lui          a7, 674758
                  add          s4, s3, s4
                  mulhu        s9, a3, s11
                  mulh         a7, a2, s8
                  or           t6, s11, s2
                  c.nop
                  add          a6, s9, s5
                  srai         zero, s11, 15
                  blt          a6, t6, 3772f
                  c.slli       s11, 3
                  c.beqz       s1, 3775f
                  bgeu         sp, s8, 3763f
                  ori          zero, a6, -920
3763:             c.andi       a1, -1
                  c.slli       ra, 19
3765:             srl          a3, s1, gp
                  mulh         s11, a0, a0
                  c.mv         a4, s11
                  mulh         t3, sp, a0
                  add          s2, tp, sp
                  beq          a3, zero, 3776f
                  c.srli       a4, 30
3772:             xor          s9, a7, a0
                  c.andi       a1, -1
                  sra          a4, a3, a2
3775:             auipc        a2, 987513
3776:             addi         a1, s10, -1318
                  slt          t6, t5, a6
                  srai         s9, s1, 5
                  slti         s10, s3, -713
                  and          zero, t2, s3
                  c.or         a4, s1
                  c.srai       a0, 3
                  bne          t5, s0, 3785f
                  bne          tp, t6, 3796f
3785:             mulh         a3, sp, s8
                  c.bnez       a3, 3789f
                  mulhsu       a3, a2, a3
                  c.xor        s1, a1
3789:             blt          s7, s4, 3792f
                  srli         ra, a4, 11
                  andi         zero, s8, -803
3792:             c.li         s9, 20
                  c.slli       t4, 4
                  mul          s10, a2, t6
                  c.andi       s1, -1
3796:             sra          tp, a3, a1
                  addi         s1, s10, -728
                  bge          a6, a7, 3811f
                  lui          a1, 100217
                  bne          s11, zero, 3810f
                  add          s0, a4, s2
                  bgeu         a1, a5, 3813f
                  mulhu        s2, s10, t0
                  sub          tp, zero, s5
                  c.and        a4, a5
                  auipc        t1, 138049
                  bge          s7, a0, 3810f
                  xori         s11, s1, -256
                  slti         s0, t2, 779
                  la           s10, region_0+1819 #start load_store_instr_stream_1
                  la           a5, region_0+449 #start load_store_instr_stream_0
                  sh           a7, -39(s10)
                  sb           s9, -56(s10)
                  lw           s6, 3(a5)
                  lw           s0, 29(s10)
                  sb           s4, -61(s10)
                  lbu          tp, -7(a5)
                  lbu          zero, 16(a5)
                  lh           zero, 5(a5)
                  lb           t1, -54(s10) #end load_store_instr_stream_1
                  lhu          zero, -1(a5) #end load_store_instr_stream_0
3810:             rem          gp, a5, sp
3811:             sltiu        tp, a6, -1347
                  bge          a5, t5, 3825f
3813:             and          s1, s3, a1
                  ori          s7, a7, 195
                  c.nop
                  auipc        s6, 528488
                  sll          s1, s3, a4
                  sll          s7, t5, ra
                  divu         s10, a0, a6
                  c.or         a3, s1
                  c.add        s8, a1
                  mulh         s11, a3, a5
                  c.lui        a2, 13
                  blt          s3, s10, 3841f
3825:             c.bnez       a0, 3829f
                  sub          s8, a4, s11
                  addi         a6, s10, 1691
                  c.andi       s0, 2
3829:             srli         s9, ra, 24
                  c.srli       s1, 3
                  slli         a4, s6, 18
                  sub          a7, t2, s1
                  c.beqz       a2, 3851f
                  beq          s0, zero, 3848f
                  c.srli       a0, 3
                  bgeu         t4, s5, 3844f
                  c.li         s5, -1
                  c.beqz       a5, 3849f
                  blt          a1, s7, 3845f
                  c.mv         t0, s10
3841:             slli         a2, s1, 24
                  sra          ra, tp, a0
                  c.or         s0, a0
3844:             c.beqz       a5, 3850f
3845:             rem          s7, s2, s6
                  remu         a2, t3, s3
                  auipc        a2, 151202
3848:             bgeu         t2, a3, 3861f
3849:             slti         t4, s6, -1448
3850:             xor          t6, a7, sp
3851:             bgeu         t0, tp, 3854f
                  c.addi       s2, -1
                  bne          a1, sp, 3855f
3854:             srai         t0, gp, 14
3855:             remu         t0, t0, ra
                  c.beqz       a2, 3865f
                  c.srli       a5, 23
                  sltiu        a3, a1, 1862
                  bge          s1, s8, 3865f
                  bne          s7, a4, 3863f
3861:             auipc        s10, 123406
                  slt          s1, t3, s3
3863:             sltu         a1, s9, t3
                  bgeu         t2, a7, 3879f
3865:             bgeu         s2, t2, 3867f
                  c.and        a1, a2
3867:             xori         a5, t4, -205
                  sll          t4, t1, a6
                  srli         a2, a2, 3
                  div          tp, s3, a3
                  slti         s8, s11, -1095
                  c.slli       a6, 25
                  c.or         s1, a4
                  lui          a7, 729057
                  c.srli       s1, 12
                  addi         t1, t0, -91
                  sra          t3, a0, a5
                  beq          t0, a4, 3894f
3879:             bltu         t3, a4, 3893f
                  mulhsu       a2, t5, tp
                  or           a5, s9, s0
                  srl          s7, tp, t1
                  bne          a6, s4, 3901f
                  blt          s1, sp, 3894f
                  bltu         s0, sp, 3893f
                  sub          t1, s10, t2
                  lui          zero, 722271
                  xori         a0, t1, -421
                  c.mv         s4, a2
                  rem          s1, s6, s7
                  div          s10, a0, a6
                  slti         t0, a1, -2046
3893:             div          s6, s3, a0
3894:             slli         s4, s6, 30
                  sll          a5, s1, t6
                  remu         s9, a3, a3
                  or           a3, t3, s10
                  c.nop
                  mulhu        a6, a2, t4
                  or           s4, s1, s2
                  la           s4, region_0+887 #start load_store_instr_stream_2
                  la           tp, region_0+1606 #start load_store_instr_stream_0
                  la           s0, region_0+1974 #start load_store_instr_stream_1
                  lb           t1, -8(s0)
                  lbu          s11, -32(s4)
                  sb           t4, -9(s4)
                  sw           s8, 2(tp)
                  lb           s7, -31(s0)
                  lh           t3, -3(s4)
                  lbu          s9, -42(s4)
                  lh           a3, -49(s4)
                  lb           gp, -3(tp)
                  lhu          s5, 23(s4)
                  sw           t4, 14(s0)
                  sb           a6, 48(s4) #end load_store_instr_stream_2
                  lhu          s7, -10(tp)
                  sb           tp, -52(s0)
                  lhu          a3, 12(tp)
                  lb           t3, 11(s0) #end load_store_instr_stream_1
                  sb           s1, -5(tp) #end load_store_instr_stream_0
3901:             bltu         s7, zero, 3906f
                  xori         a2, t4, 48
                  srli         t4, s6, 14
                  mul          s1, a4, s0
                  c.srli       a2, 20
3906:             c.srai       a3, 7
                  mulhu        a0, tp, a4
                  mulh         a0, a2, t4
                  bne          ra, s4, 3911f
                  c.addi       t3, -1
3911:             lui          s11, 988949
                  c.mv         t6, a0
                  c.addi       a0, 13
                  divu         a0, a4, t2
                  c.andi       a1, -1
                  c.slli       a5, 28
                  srli         a5, s0, 21
                  c.srli       a0, 23
                  sra          tp, gp, s7
                  c.add        s11, s8
                  c.addi       ra, -1
                  auipc        s6, 991681
                  bne          s11, zero, 3932f
                  ori          a2, t3, 887
                  addi         s11, a2, 986
                  sra          a6, s10, s8
                  sltu         tp, s8, t3
                  c.nop
                  slti         a0, s1, -30
                  ori          t3, a5, 1505
                  bgeu         s7, a7, 3946f
3932:             c.nop
                  beq          t2, s4, 3948f
                  c.addi       s6, -1
                  rem          t4, s2, a4
                  auipc        s2, 268500
                  sra          a1, t6, gp
                  xori         ra, s0, 592
                  c.srai       a5, 4
                  bgeu         t3, zero, 3946f
                  auipc        s0, 798269
                  c.li         tp, -1
                  srl          s4, t1, tp
                  srli         s3, t5, 5
                  c.beqz       s0, 3957f
3946:             c.andi       a2, 23
                  mulhsu       zero, t6, s6
3948:             sltu         t1, tp, a1
                  bgeu         s11, s6, 3964f
                  bne          s9, zero, 3959f
                  auipc        a6, 198467
                  c.bnez       s0, 3966f
                  div          t3, t6, s11
                  bgeu         t4, s10, 3962f
                  c.xor        s1, a0
                  bne          s11, gp, 3971f
3957:             xori         a3, t5, -47
                  c.srli       a3, 27
3959:             div          t3, s3, t0
                  sub          a5, t6, ra
                  mulhu        s10, sp, a6
3962:             c.addi       s3, -1
                  c.add        t3, s10
3964:             c.nop
                  c.lui        s10, 11
3966:             andi         a6, t5, -1110
                  c.li         s9, 17
                  slt          a6, t0, s2
                  or           s9, a3, s1
                  bltu         zero, tp, 3976f
3971:             mulh         s8, a7, a2
                  srli         s0, t4, 15
                  xori         a3, s9, 1214
                  or           s1, t5, a0
                  slti         s10, s4, -1113
3976:             bge          s3, a4, 3979f
                  bltu         t1, a2, 3983f
                  sra          s4, t0, a1
3979:             div          t6, t6, s4
                  addi         a7, sp, 1273
                  blt          tp, s7, 3984f
                  srai         s6, a0, 18
3983:             bltu         t6, gp, 3992f
3984:             andi         a3, s7, -292
                  slt          a6, s6, a0
                  c.and        s0, s0
                  divu         s7, s9, t5
                  nop
                  auipc        a3, 23015
                  or           s1, t3, s5
                  ori          t0, s3, -691
3992:             srli         s5, t6, 29
                  add          s7, s4, t1
                  sub          s4, t1, s8
                  c.addi       t1, -1
                  c.beqz       a1, 4001f
                  xori         s8, s2, 1170
                  divu         t0, s11, s8
                  srai         a4, s11, 18
                  add          s6, s7, sp
4001:             c.or         a5, s0
                  slli         s7, s8, 7
                  nop
                  bltu         t4, a5, 4010f
                  slti         t3, tp, 1230
                  c.sub        s0, a4
                  sra          t0, t4, s0
                  c.and        s1, a5
                  beq          t2, t1, 4022f
4010:             c.slli       s7, 9
                  add          s3, ra, t3
                  beq          a3, sp, 4016f
                  sub          a4, a5, a1
                  c.and        a1, a3
                  c.sub        s0, a4
4016:             or           zero, s3, t2
                  lui          s3, 893828
                  lui          s9, 10692
                  blt          a7, s0, 4031f
                  sub          s7, a3, a1
                  sra          s3, s7, t0
4022:             add          a2, s8, a2
                  addi         s5, s5, -226
                  c.andi       a5, -1
                  nop
                  bltu         a6, a5, 4032f
                  c.slli       s4, 14
                  slti         gp, t6, -1175
                  c.mv         s8, a3
                  bgeu         t4, s2, 4041f
4031:             c.and        a1, s0
4032:             c.xor        a3, s0
                  bltu         t2, s6, 4035f
                  ori          s2, s4, -127
4035:             c.srai       a5, 9
                  div          s0, s10, s0
                  lui          a4, 589055
                  c.bnez       a1, 4052f
                  bne          zero, a3, 4041f
                  blt          s4, t3, 4043f
4041:             and          s8, a4, s10
                  bge          gp, s7, 4060f
4043:             slli         t3, s9, 13
                  c.nop
                  srli         s1, sp, 19
                  ori          t0, s10, -1088
                  add          a1, a3, a2
                  c.srli       a3, 10
                  c.srli       a0, 17
                  sra          ra, t2, t0
                  slt          s0, sp, s2
4052:             bge          s1, t4, 4054f
                  ori          a0, t4, -857
4054:             srli         s3, a4, 20
                  lui          t0, 109209
                  mulhsu       a5, t6, s4
                  blt          s0, t2, 4073f
                  andi         s5, tp, -72
                  mulh         a4, t4, t3
4060:             slti         s7, t5, -318
                  slti         s0, s0, 1679
                  c.nop
                  lui          s1, 924232
                  c.xor        s1, a0
                  srl          t6, a1, t4
                  c.mv         s4, s9
                  sra          ra, s10, a3
                  srli         t4, s4, 2
                  c.lui        t1, 28
                  c.lui        s8, 11
                  nop
                  c.mv         a2, s3
4073:             c.srli       s0, 8
                  xor          s1, a2, a5
                  andi         s10, s1, -1435
                  xori         a5, s8, 733
                  srai         s11, zero, 0
                  lui          a0, 996183
                  c.nop
                  c.slli       s7, 16
                  andi         s1, s11, 758
                  srli         t4, a0, 0
                  bgeu         zero, tp, 4096f
                  slli         a0, s8, 7
                  divu         s9, s3, s7
                  nop
                  c.srli       s1, 31
                  c.srli       s1, 18
                  div          t0, s8, sp
                  slti         s9, a1, -552
                  beq          s0, t1, 4099f
                  mulhsu       s7, t0, s1
                  c.and        a1, a2
                  srai         s2, s5, 21
                  lui          tp, 488591
4096:             auipc        t3, 939551
                  srli         a7, gp, 30
                  add          s9, s1, s11
4099:             lui          a5, 994619
                  nop
                  lui          a6, 327793
                  c.andi       a0, 20
                  c.li         s10, -1
                  slli         s4, a7, 30
                  c.andi       a0, 23
                  c.andi       a1, 15
                  bge          s8, s9, 4122f
                  bge          a7, s2, 4118f
                  bgeu         t3, a4, 4127f
                  bge          s5, s3, 4127f
                  sltu         s10, sp, t5
                  sltu         t0, s6, a4
                  ori          a1, t0, 1705
                  or           a5, s3, zero
                  ori          s4, t0, 1529
                  rem          a4, s2, t0
                  xor          a0, sp, s4
4118:             sltu         t1, s4, a0
                  mulh         a4, s8, tp
                  blt          a6, s1, 4125f
                  xori         s8, ra, -1595
4122:             or           a7, s8, s3
                  c.addi       s4, -1
                  bne          s11, s9, 4126f
4125:             slti         s9, s11, -1379
4126:             auipc        t3, 488460
4127:             c.and        s0, a4
                  c.srli       a5, 14
                  mulh         a0, s3, t1
                  sub          a7, sp, zero
                  c.andi       s0, -1
                  beq          s0, a3, 4141f
                  c.and        s0, s0
                  mulhsu       t3, t0, a5
                  slti         s8, a7, -101
                  c.bnez       s1, 4148f
                  sll          a1, s9, t0
                  sll          s7, t6, t3
                  sltiu        s9, s3, -1759
                  and          gp, s1, s0
4141:             add          s4, s11, a3
                  nop
                  mulh         a5, t0, t4
                  srli         a5, s6, 27
                  c.addi       t3, 23
                  add          t1, s3, a7
                  or           s0, s0, tp
4148:             bne          a3, a5, 4158f
sub_5_37:         jal          a0, 0f
0:                c.j          10f
1:                c.jal        4f
2:                c.j          11f
3:                jal          s1, 2b
4:                c.j          6f
5:                jal          ra, 1b
6:                c.jal        9f
7:                c.jal        3b
8:                c.j          7b
9:                c.j          8b
10:               c.j          5b
11:               c.mv         ra, a3
                  remu         a1, s0, sp
                  srl          s11, t0, zero
                  mulhsu       t6, t6, sp
                  c.xor        a4, s0
                  sltiu        a6, a6, 416
                  bne          s0, t1, 4169f
                  add          ra, a6, a2
                  c.add        s10, a5
                  mulhsu       s5, t1, gp
4158:             mul          t1, sp, t3
                  sll          t4, a7, s10
                  addi         s6, a5, -2043
                  divu         s2, s0, a3
                  remu         ra, s3, a4
                  andi         a6, t4, -1765
                  div          s1, a3, t1
                  sra          s9, t2, t0
                  rem          tp, s3, s10
                  nop
                  xor          s1, a6, tp
4169:             c.slli       s4, 12
                  slti         s10, s4, 1772
                  divu         a5, s1, s5
                  addi         a0, t3, -1355
                  sll          s0, tp, s2
                  c.addi       s8, 10
                  c.add        a0, s6
                  addi         t3, a5, 39
                  mulh         s1, s0, s11
                  bltu         a6, a2, 4193f
                  c.beqz       a4, 4183f
                  divu         gp, t4, t4
                  bge          ra, a5, 4195f
                  sltiu        a7, t6, -1860
4183:             slti         s4, t1, -1858
                  blt          gp, s8, 4186f
                  sub          s5, s5, a6
4186:             divu         t6, s2, s5
                  c.add        t1, t5
                  mulhsu       s10, s7, t2
                  mul          s4, a5, a5
                  sra          s11, t2, t4
                  mul          a4, t5, a3
                  c.nop
4193:             bltu         a7, s6, 4209f
                  c.li         s4, -1
4195:             beq          t3, zero, 4201f
                  c.mv         a2, t6
                  sltu         a3, t3, s6
                  c.srai       a5, 15
                  ori          s9, s3, 1805
                  c.add        a5, a5
4201:             slti         t0, s0, 1300
                  sll          s11, sp, a6
                  add          s9, a7, gp
                  bne          zero, s0, 4210f
                  div          a7, a1, s2
                  lui          s5, 216322
                  rem          gp, t4, a3
                  divu         t1, t3, a5
4209:             mulh         s3, zero, tp
4210:             xori         s4, a5, -516
                  sub          s0, a2, t1
                  c.beqz       a4, 4215f
                  mul          a7, t5, a2
                  slli         tp, sp, 3
4215:             xor          ra, a1, s10
                  sltiu        a4, s0, 1066
                  or           t0, s1, s4
                  c.srai       s0, 25
                  ori          a5, a5, 335
                  div          a2, a1, a5
                  remu         gp, gp, a5
                  sub          tp, a5, s0
                  mulhsu       zero, zero, t5
                  srai         s7, s8, 5
                  andi         a3, sp, -1908
                  c.li         a6, -1
                  or           a5, a1, a5
                  c.lui        s2, 17
                  srli         a1, zero, 5
                  bltu         a0, a4, 4247f
                  or           s7, s8, a7
                  srli         s2, s8, 22
                  divu         a3, s5, s5
                  sltu         s0, t3, t3
                  mul          a5, t2, a0
                  c.mv         s3, a7
                  srli         tp, s6, 22
                  xor          a5, a5, t6
                  slt          t6, ra, sp
                  and          t4, a2, s11
                  c.or         s0, a2
                  c.srai       a2, 25
                  c.srli       a3, 9
                  c.sub        a1, s0
                  mulh         s3, a3, a3
                  ori          s8, s9, 1497
4247:             c.srai       a4, 14
                  blt          t0, s11, 4261f
                  andi         s0, t5, -1018
                  srai         t1, s8, 26
                  c.beqz       a0, 4257f
                  c.srli       a0, 28
                  nop
                  c.srai       a4, 16
                  c.mv         t3, t1
                  c.mv         ra, s2
4257:             mulh         a3, s6, s9
                  bltu         a4, s2, 4271f
                  slli         ra, s3, 13
                  srai         s0, s4, 4
4261:             srai         s3, a0, 3
                  c.sub        a4, a5
                  c.and        a2, a3
                  c.srai       s1, 6
                  srl          ra, t6, a4
                  sltu         s0, a2, ra
                  srl          s5, t4, a2
                  addi         s6, s6, 1470
                  c.addi       t4, -1
                  c.srai       a1, 20
4271:             auipc        s4, 84412
                  srli         a1, a0, 30
                  c.slli       s5, 22
                  nop
                  sra          s1, s5, a3
                  sub          s11, a4, s9
                  and          s10, s8, t4
                  c.lui        t0, 1
                  bgeu         sp, t4, 4282f
                  mulhsu       t6, t6, tp
                  srai         s4, t3, 2
4282:             remu         s10, s9, t3
                  bge          s3, a2, 4298f
                  lui          s9, 525358
                  bne          a7, t3, 4303f
                  bltu         t4, t1, 4295f
                  srl          s11, t6, s11
                  nop
                  xori         s10, a4, 1971
                  auipc        s11, 887269
                  auipc        t1, 32505
                  c.srli       a4, 25
                  xor          zero, t4, s9
                  c.srai       a2, 10
4295:             xori         s2, t6, -1228
                  nop
                  xori         t0, zero, 685
4298:             nop
                  xor          a6, s5, s8
                  srli         a3, a7, 8
                  c.add        a1, tp
                  c.xor        a4, a1
4303:             sub          a4, t5, a2
                  c.lui        t4, 1
                  c.and        s0, a3
                  sltu         s8, s11, s6
                  andi         s5, t5, 1924
                  sub          a0, t4, s8
                  c.beqz       a0, 4311f
                  andi         a1, t3, 843
4311:             srli         t1, a7, 7
                  c.srli       a4, 22
                  c.and        s1, a1
                  remu         a6, t4, t5
                  ori          a7, s6, 1780
                  bge          t5, s7, 4324f
                  c.slli       a0, 3
                  bgeu         a4, sp, 4332f
                  divu         t3, t4, ra
                  slti         t6, s5, -699
                  sltu         a1, t4, t3
                  srl          a3, s0, s4
                  srl          s11, s11, a4
4324:             and          s9, a7, tp
                  blt          t6, s7, 4331f
                  beq          a0, t0, 4337f
                  srl          t1, s7, a5
                  c.srai       a5, 30
                  srli         zero, a3, 7
                  c.andi       a1, -1
4331:             add          a0, s0, s10
4332:             c.bnez       a2, 4350f
                  c.srli       a4, 9
                  lui          gp, 569556
                  slt          zero, t3, zero
                  sltu         s6, s11, t0
4337:             sltu         s10, a3, sp
                  c.or         a0, a3
                  ori          ra, s10, 1607
                  c.beqz       s1, 4348f
                  xori         a1, t6, -462
                  slti         s7, s7, -952
                  blt          s5, t5, 4346f
                  c.bnez       s1, 4347f
                  bltu         zero, s8, 4351f
4346:             auipc        a2, 897238
4347:             mulhsu       t3, t3, s6
4348:             lui          s5, 723559
                  slti         a5, s11, -292
4350:             rem          a1, s8, zero
4351:             bge          s10, s6, 4364f
                  ori          tp, s3, -1227
                  sltiu        s8, s5, 1744
                  nop
                  c.or         a4, a5
                  ori          t1, sp, -295
                  divu         s5, t5, a2
                  blt          t0, a6, 4364f
                  sltu         a7, a0, s1
                  c.li         s6, 1
                  bgeu         s8, s3, 4369f
                  c.nop
                  and          tp, a4, a5
4364:             rem          t3, s0, t3
                  bge          gp, s8, 4377f
                  c.li         a7, 28
                  bltu         s2, a7, 4381f
                  c.addi       t6, 17
4369:             c.mv         s2, s5
                  or           s6, s11, gp
                  nop
                  add          t0, s9, ra
                  andi         a6, s8, 1892
                  c.beqz       s1, 4387f
                  mul          t0, s4, s6
                  bne          t4, s9, 4390f
4377:             remu         a2, t6, a1
                  c.add        a2, a0
                  c.add        s8, t0
                  srli         s2, ra, 5
4381:             c.srli       a0, 10
                  bge          t4, sp, 4398f
                  ori          tp, t5, 1831
                  rem          tp, t0, a7
                  bgeu         s9, a5, 4390f
                  bge          s3, t1, 4395f
4387:             beq          a6, a1, 4389f
                  blt          s10, a1, 4399f
4389:             remu         s4, a4, t2
4390:             bne          a2, t4, 4405f
                  c.srai       a0, 25
                  mul          s3, t3, s9
                  c.lui        gp, 28
                  c.and        a2, a5
4395:             c.bnez       a4, 4413f
                  slti         s10, s9, -722
                  xori         s2, s0, 49
4398:             c.beqz       a4, 4401f
4399:             bge          s6, s10, 4405f
                  lui          a0, 136301
4401:             c.add        a4, a1
                  mulh         tp, zero, t2
                  divu         s0, gp, a0
                  mulhu        a3, s4, sp
4405:             blt          s6, a4, 4409f
                  auipc        s10, 377011
                  c.slli       s9, 12
                  slli         s1, zero, 19
4409:             sltiu        t1, s9, 1361
                  and          s9, t5, a5
                  slti         s10, s7, -1036
                  sll          s8, a3, gp
4413:             sub          a7, ra, s7
                  ori          s0, s2, 460
                  rem          a2, a5, sp
                  and          s6, t1, ra
                  srli         s1, s5, 21
                  auipc        t4, 720579
                  bltu         a1, zero, 4434f
                  srai         s3, s5, 11
                  c.nop
                  nop
                  mul          s9, s10, a5
                  xor          a6, t2, s0
                  auipc        a3, 171169
                  bne          s8, ra, 4436f
                  andi         s11, s10, 1009
                  srai         a2, s8, 20
                  mulhu        a0, a3, s3
                  addi         s2, gp, 763
                  sltu         a2, zero, s7
                  andi         ra, zero, -1996
                  xori         t0, s1, 822
4434:             bgeu         s1, s11, 4451f
                  c.bnez       a3, 4437f
4436:             c.nop
4437:             srai         a3, a1, 28
                  c.addi       s10, 10
                  mul          s2, a3, a5
                  nop
                  mulhu        a1, a6, a2
                  xor          a5, t0, a1
                  andi         a7, a2, -1197
                  slti         s8, s3, -257
                  c.xor        a4, a5
                  c.lui        s1, 2
                  srl          t1, s1, s9
                  mulhu        a2, t5, ra
                  sll          ra, t3, t5
                  c.bnez       a1, 4459f
4451:             auipc        tp, 231276
                  slti         s11, s0, 828
                  c.slli       s3, 4
                  sub          s7, s3, gp
                  bge          a0, tp, 4458f
                  bge          s5, a4, 4474f
                  c.or         a2, a0
4458:             c.add        t6, a6
4459:             auipc        a5, 798000
                  bne          s5, t3, 4462f
                  rem          tp, a4, gp
4462:             sll          s4, a6, s7
                  c.and        a2, s0
                  mul          t1, gp, ra
                  c.add        a2, a5
                  mulhu        s3, a0, s8
                  sltiu        a7, s8, 538
                  srai         a1, s4, 13
                  sub          s1, a3, t1
                  blt          t1, t4, 4485f
                  c.or         s0, s0
                  c.beqz       a2, 4478f
                  sltiu        a2, t3, -1126
4474:             srl          t0, s9, s8
                  addi         s0, t6, 420
                  xor          s1, s1, s11
                  c.lui        ra, 12
4478:             c.sub        a0, a3
                  bne          gp, s10, 4487f
                  c.srai       a1, 27
                  c.andi       s0, -1
                  nop
                  sub          gp, t2, s3
                  andi         t4, t5, -1549
4485:             c.andi       a5, 29
                  andi         s9, sp, 686
4487:             srai         s7, a6, 31
                  srai         ra, t5, 23
                  rem          t1, sp, t4
                  c.beqz       a0, 4499f
                  c.add        s11, t1
                  mulhu        s2, t1, s5
                  div          t0, a0, t2
                  sub          gp, t2, t5
                  c.andi       s0, -1
                  bgeu         s7, s11, 4514f
                  ori          a1, t0, 921
                  c.beqz       a2, 4515f
4499:             c.nop
                  srl          t4, a7, t2
                  blt          zero, s11, 4506f
                  bne          a0, t5, 4504f
                  rem          tp, t4, a7
4504:             remu         s2, s7, s1
                  srl          t0, s6, s9
4506:             sub          s2, s7, s11
                  remu         s11, s10, t5
                  beq          gp, s4, 4511f
                  nop
                  xor          tp, a6, tp
4511:             c.or         s0, s1
                  c.lui        t1, 16
                  c.beqz       a2, 4531f
4514:             addi         zero, a4, -1607
4515:             xor          s6, t0, a5
                  add          s10, a7, a3
                  c.xor        a1, a5
                  or           s10, s5, s10
                  c.add        s9, s11
                  div          s9, s10, s8
                  add          s1, s6, a3
                  mulhu        a1, a0, t2
                  rem          a0, t5, gp
                  c.li         s4, 10
                  mulhsu       s2, s4, a3
                  srli         s7, s4, 30
                  addi         t4, t4, 1138
                  srai         gp, s5, 0
                  slt          a5, a6, s7
                  sra          s0, s1, t2
4531:             and          t4, a7, s10
                  c.nop
                  bgeu         gp, t5, 4536f
                  c.nop
                  srai         t6, s0, 22
4536:             c.add        a6, t3
                  add          a0, a4, s5
                  remu         a1, sp, s2
                  sltiu        s3, sp, -1612
                  mulhu        a5, a3, s6
                  divu         zero, t6, s3
                  c.lui        a0, 1
                  ori          s9, s0, -1980
                  remu         t0, a4, gp
                  c.nop
                  sltiu        t6, a1, -1899
                  andi         tp, s9, 603
                  sltu         s6, s7, t0
                  andi         a7, a6, 586
                  sll          s5, s5, s3
                  lui          t0, 629053
                  c.lui        s3, 3
                  bltu         s9, s9, 4565f
                  xor          t4, s3, s7
                  c.lui        s0, 28
                  mul          s2, s10, s8
                  slti         t3, s8, -34
                  c.srai       s1, 24
                  c.slli       s0, 17
                  sltu         t3, t1, s7
                  mulhsu       t1, a5, sp
                  c.nop
                  c.add        a7, ra
                  div          ra, t2, a1
4565:             rem          t3, gp, t0
                  sltu         a3, zero, t5
                  c.lui        tp, 4
                  c.or         a1, a2
                  c.add        t1, t2
                  srl          a4, t6, s0
                  bge          a0, s4, 4581f
                  c.or         a1, a5
                  c.andi       a4, 13
                  rem          s1, s0, gp
                  bgeu         s2, a6, 4581f
                  srai         t1, a3, 9
                  or           s8, t0, t5
                  mulh         ra, a7, t6
                  sltiu        a0, a0, -818
                  c.and        a3, s0
4581:             xori         s6, a7, 203
                  c.andi       s0, -1
                  c.beqz       a4, 4586f
                  xor          ra, t2, a3
                  bge          zero, sp, 4600f
4586:             c.andi       a5, 17
                  c.add        gp, t5
                  sll          s9, a2, s9
                  srli         t6, s5, 23
                  c.or         a1, a4
                  sltiu        s7, t0, -1605
                  sltu         t4, s2, a0
                  sub          a3, a5, s10
                  srai         s5, s5, 7
                  c.and        a0, a2
                  add          s3, s3, a1
                  lui          s6, 648621
                  sltu         t6, gp, a4
                  andi         a0, s4, 1889
4600:             div          a6, s3, zero
                  auipc        s3, 207994
                  c.lui        gp, 25
                  mulhsu       gp, a7, s5
                  srli         s5, t2, 0
                  slt          a3, s9, ra
                  c.li         t4, 19
                  mulhsu       s10, s1, s0
                  sltiu        a1, t1, -1512
                  and          s10, s10, s0
                  srl          s3, s9, a4
                  c.srli       a1, 17
                  auipc        t6, 60328
                  xori         a5, zero, 879
                  mul          a6, s2, s0
                  c.li         tp, -1
                  auipc        a5, 658312
                  c.srai       a0, 29
                  c.andi       a5, -1
                  mul          s10, a0, a0
                  c.slli       tp, 5
                  auipc        tp, 965564
                  add          a4, s9, s2
                  sll          t1, t0, t4
                  c.add        s8, t0
                  slt          s7, s0, a5
                  c.srai       s1, 8
                  bgeu         a6, a2, 4642f
                  addi         s10, a6, 377
                  sll          s3, s11, s0
                  addi         gp, s6, -1741
                  c.addi       s9, 5
                  remu         s3, t0, gp
                  c.nop
                  and          a3, sp, t3
                  bge          t2, s4, 4646f
                  c.slli       s11, 4
                  bgeu         s1, zero, 4643f
                  remu         a6, zero, s1
                  c.nop
                  c.bnez       a1, 4648f
                  bltu         s9, t4, 4647f
4642:             slt          ra, tp, s10
4643:             beq          t6, s1, 4657f
                  beq          s7, s0, 4650f
                  bltu         a2, ra, 4649f
4646:             sub          a4, a4, a6
4647:             mul          t6, a4, t0
4648:             c.srai       a3, 17
4649:             c.sub        a0, a3
4650:             bge          sp, t3, 4659f
                  c.and        a4, a3
                  c.add        t3, t3
                  slt          s3, a6, s2
                  sltu         s10, s7, t6
                  xor          a3, a3, s8
                  remu         a4, s4, s0
4657:             bge          zero, s8, 4671f
                  remu         a0, s5, t4
4659:             divu         t3, a2, a2
                  lui          a5, 137521
                  and          s2, a5, a5
                  c.slli       a2, 9
                  c.add        s9, a6
                  slli         s2, s4, 4
                  la           a2, region_1+909 #start load_store_instr_stream_4
                  la           s1, region_1+1849 #start load_store_instr_stream_3
                  sw           t3, -637(a2)
                  la           a3, region_1+1465 #start load_store_instr_stream_2
                  lhu          s6, 611(a2)
                  lbu          a5, -800(a3)
                  lb           s4, 10(s1)
                  lbu          s7, 280(a3)
                  la           a7, region_1+615 #start load_store_instr_stream_1
                  la           s2, region_1+810 #start load_store_instr_stream_0
                  lbu          s6, 930(a7)
                  sw           s6, 114(s2)
                  lb           zero, -538(a7)
                  sw           s8, 993(a7)
                  lb           a1, -4(s1)
                  lb           ra, 458(a3)
                  lw           s0, -5(s1)
                  lbu          s8, 45(s2)
                  lbu          tp, -830(a2)
                  sb           t5, -42(s2)
                  lbu          s5, -940(a3)
                  lb           s5, -256(s2)
                  sh           s4, 469(a7)
                  sw           t4, -1421(a3)
                  lhu          t4, -9(s1)
                  lh           s11, 723(a2)
                  lbu          tp, 544(a7)
                  lb           tp, -8(s1)
                  lb           t6, -452(a7)
                  lb           t6, -174(a7)
                  sb           s7, -69(s2)
                  lhu          a4, -11(s1)
                  lbu          s0, 761(a2) #end load_store_instr_stream_4
                  lb           s8, -14(s1) #end load_store_instr_stream_3
                  lhu          s0, -200(s2)
                  lhu          s0, -337(a3) #end load_store_instr_stream_2
                  lb           s9, -40(a7) #end load_store_instr_stream_1
                  lb           a6, -103(s2) #end load_store_instr_stream_0
                  c.li         s3, 31
                  add          t0, s8, s0
                  c.mv         s2, s6
                  srai         s5, sp, 18
                  sra          a3, s10, s0
                  srli         tp, s7, 24
4671:             slt          ra, s11, a0
                  addi         s9, sp, -229
                  or           a2, t6, s4
                  bgeu         s9, zero, 4690f
                  bltu         a7, s0, 4683f
                  slt          t3, s2, s9
                  c.nop
                  slli         s7, s8, 17
                  c.srli       s0, 24
                  xor          t1, t0, zero
                  div          a2, t5, s1
                  and          zero, t4, s11
4683:             mulhsu       a2, a1, a0
                  c.mv         ra, a6
                  bgeu         a4, t0, 4698f
                  or           s10, s2, s7
                  xor          s9, t0, s8
                  c.xor        a3, a5
                  bltu         s8, s9, 4702f
4690:             andi         s6, a0, 1469
                  c.lui        s4, 5
                  c.and        s1, a3
                  srli         s11, a2, 6
                  c.lui        s4, 13
                  addi         s5, s6, -572
                  blt          t3, sp, 4698f
                  div          a1, s0, sp
4698:             slli         s2, sp, 25
                  c.andi       a0, -1
                  ori          s5, s0, -1124
                  c.slli       tp, 24
4702:             c.lui        s7, 29
                  c.addi       ra, 20
                  c.and        a0, a4
                  c.add        a4, s4
                  bltu         s3, ra, 4721f
                  sltiu        a2, zero, -2006
                  c.beqz       a1, 4710f
                  c.srai       a3, 22
4710:             andi         s6, s6, -1295
                  sltiu        t0, s11, -1006
                  add          s5, s10, s8
                  c.srli       a5, 21
                  bge          s10, s7, 4722f
                  rem          gp, a0, s2
                  blt          a1, zero, 4718f
                  bgeu         s2, s7, 4730f
4718:             or           s9, a0, t2
                  srl          gp, t4, s0
                  c.mv         s8, a6
4721:             div          s4, a5, s4
4722:             andi         t4, s4, -919
                  srai         a0, s9, 5
                  c.li         ra, 18
                  srai         gp, s2, 2
                  ori          ra, t0, 1025
                  blt          s9, s10, 4730f
                  rem          s8, s8, s1
                  slt          s11, s11, s2
4730:             andi         s2, a4, -588
                  add          t3, s10, t3
                  bne          zero, s4, 4738f
                  c.add        a3, t2
                  slti         t6, a7, -1062
                  mul          t3, s6, t1
                  c.mv         s9, tp
                  c.add        s5, a3
4738:             sltiu        a0, s10, 78
                  c.or         s1, a1
                  blt          t6, s2, 4754f
                  div          a6, sp, a1
                  sltiu        t1, s2, -871
                  slli         t0, s7, 13
                  c.add        a6, ra
                  c.add        s9, s7
                  srai         t3, s6, 7
                  bge          t5, s3, 4752f
                  bge          a5, a0, 4750f
                  sub          a1, a5, a2
4750:             c.srli       s1, 28
                  mulhsu       s9, s0, t5
4752:             c.srli       a0, 12
                  c.andi       a3, 20
4754:             c.nop
                  auipc        a6, 413335
                  c.or         a5, a4
                  add          a7, t3, a6
                  sll          a4, s10, a7
                  nop
                  c.srai       a0, 13
                  sra          a6, t4, s9
                  or           zero, s0, a5
                  sra          a6, s0, s2
                  sub          ra, s11, s7
                  and          a5, t1, a2
                  c.xor        s0, a4
                  c.add        s5, s9
                  div          t4, a7, t2
                  bltu         a5, a3, 4771f
                  or           a1, s2, ra
4771:             bgeu         t2, s10, 4780f
                  c.slli       a1, 13
                  c.sub        a1, a5
                  remu         gp, t5, s4
                  c.srai       a0, 3
                  c.nop
                  xor          s5, s10, t4
                  c.or         a3, s1
                  sll          a5, s7, t1
4780:             bgeu         s11, s7, 4788f
                  c.and        a5, s0
                  mul          s3, a3, sp
                  mulhsu       s11, s7, a7
                  c.nop
                  sll          s4, t1, sp
                  ori          a3, a3, -351
                  c.beqz       s1, 4802f
4788:             c.add        gp, s9
                  c.beqz       a0, 4792f
                  sltiu        tp, s10, 769
                  nop
4792:             mulhu        a6, t6, ra
                  remu         ra, s7, t6
                  ori          t4, t6, 637
                  bge          s8, s5, 4809f
                  slt          a7, s11, s8
                  blt          zero, s2, 4803f
                  c.addi       a6, -1
                  srli         s0, a4, 9
                  blt          a4, t2, 4813f
                  c.li         s9, -1
4802:             c.mv         s1, s6
4803:             mulhu        tp, s11, t3
                  mul          a6, s4, t5
                  sltu         s0, a0, t1
                  slt          a6, a3, t0
                  xor          a2, s0, s10
                  bgeu         t0, t0, 4814f
4809:             slt          a1, a4, s7
                  mulhu        t6, s6, t1
                  andi         t1, t2, -844
                  andi         t1, s6, -849
4813:             c.bnez       a4, 4831f
4814:             andi         s2, a1, 1485
                  nop
                  bltu         s4, gp, 4826f
                  c.add        a3, s8
                  srai         s5, s8, 6
                  c.nop
                  bne          s5, s4, 4833f
                  addi         tp, s6, 1696
                  slti         s3, s4, -452
                  andi         gp, t4, 1641
                  or           gp, t6, s7
                  c.mv         s9, s1
4826:             sltiu        t0, s7, -813
                  slti         s4, t2, -200
                  slti         tp, a6, -1371
                  c.xor        s1, a1
                  srl          a1, a6, s11
4831:             c.sub        a0, a3
                  xori         s8, zero, -1710
4833:             xori         t0, s11, -1984
                  c.sub        a2, a4
                  c.srli       a3, 5
                  xor          s3, a2, a3
                  slti         t0, ra, -284
                  sltu         s7, t4, a5
                  lw           a0, 4(t5)
                  addi         t5, t5, 16
                  mulh         a3, s6, a5
8603:             addi x13, x10, 0
8603:             c.jalr x13
sub_2:            addi         t6, a3, -193
                  addi         a1, s6, -1606
                  c.srai       s1, 2
                  addi         t5, t5, -44
                  remu         t0, sp, a7
                  nop
                  c.srai       s0, 31
                  c.slli       t0, 12
                  sw           a0, 4(t5)
                  and          a6, s1, a0
                  c.sub        a5, a3
                  xori         s2, s3, -1271
                  la           t3, sub_3
                  sra          s4, s9, t6
                  addi         t3, t3, -13
                  auipc        gp, 889577
                  c.li         s1, -1
                  slti         s8, s10, -1269
sub_2_j5:         jalr         a0, t3, 13 #jump sub_2 -> sub_3
                  blt          s2, t1, sub_2_j6 #branch to jump instr
                  c.slli       s3, 16
                  slti         a1, a4, -752
                  srai         a3, tp, 24
                  srli         t1, s6, 28
                  slli         a5, a2, 23
                  c.addi       t1, -1
sub_2_j6:         jal          a0, sub_3 #jump sub_2 -> sub_3
                  sltiu        s9, a2, -1834
                  blt          a1, s11, 13f
                  sltiu        t3, s7, 1506
                  bltu         s10, a0, 14f
                  ori          t6, ra, 752
                  c.srli       s1, 21
                  c.slli       a7, 5
                  auipc        a6, 320648
                  mulhsu       t0, sp, a6
                  div          a1, zero, s1
                  bgeu         a4, ra, 16f
                  c.slli       a5, 10
                  c.beqz       a1, 19f
13:               bgeu         t0, zero, 16f
14:               c.mv         t0, a5
                  addi         s5, ra, 620
16:               div          a0, s0, a0
                  c.xor        a1, a0
                  c.bnez       s1, 29f
19:               blt          t1, a6, 28f
                  lui          s1, 978480
                  sltiu        s6, a4, -357
                  c.or         a2, a5
                  sltiu        s10, t6, 208
                  sra          s1, a1, a5
                  sltiu        t1, a0, -1870
                  lui          s10, 153806
                  c.srai       s1, 6
28:               bltu         s9, t2, 45f
29:               sub          ra, sp, s6
                  or           a6, s9, a3
                  nop
                  and          s9, gp, s6
                  sltiu        s11, s8, -1437
                  c.srli       a4, 31
                  c.sub        a0, a0
                  c.mv         s4, a4
                  sltiu        a2, a6, -1086
                  c.and        s1, a5
                  c.beqz       a3, 45f
                  c.lui        s6, 6
                  mulhu        t4, tp, t6
                  srai         s1, t5, 0
                  mul          a7, s2, t1
                  andi         ra, t0, 1370
45:               mulhu        t1, a2, t1
                  slt          s9, sp, s1
                  c.addi       a1, -1
                  remu         a7, a3, t5
                  lw           a0, 4(t5)
                  remu         a5, zero, s1
                  addi         t5, t5, 44
                  c.sub        a5, a1
                  lui          a5, 121686
                  add          zero, s2, tp
                  c.slli       s1, 20
83:               addi x18, x10, 1
83:               c.jr x18
sub_4:            beq          s10, s6, sub_4_stack_p
                  c.slli       s0, 4
                  c.mv         a3, a7
                  c.lui        gp, 21
sub_4_stack_p:    addi         t5, t5, -24
                  or           ra, s7, t6
                  c.nop
                  sltu         s3, t0, a4
                  sw           a0, 4(t5)
                  mulhsu       s10, t4, a7
                  c.and        s0, a5
                  addi         t1, zero, 5 #init loop 0 counter
                  xori         gp, a3, 1842
                  divu         tp, a5, s6
                  c.or         a0, a1
                  srli         a3, t4, 12
                  or           tp, a0, a1
                  auipc        a1, 152181
                  addi         t0, zero, -1 #init loop 0 limit
                  slli         s9, a6, 14
                  slti         zero, s7, 695
                  remu         a3, t4, s0
sub_4_14_0_t:     c.or         a0, a2
                  c.mv         t6, sp
                  c.nop
                  addi         s7, t2, 730
                  srli         gp, a6, 8
                  addi         t1, t1, -3 #update loop 0 counter
                  remu         a5, s2, s9
                  srli         s4, t4, 10
                  nop
                  auipc        ra, 30837
                  c.addi       gp, 4
                  c.li         s3, 14
                  sltu         s10, sp, a1
                  c.sub        a4, a4
                  c.andi       a2, 22
                  beq          t1, t0, sub_4_14_0_t #branch for loop 0
                  c.lui        gp, 8
sub_4_5:          jal          a0, 17f
0:                c.jal        19f
1:                c.j          13f
2:                jal          s8, 5f
3:                jal          ra, 18f
4:                c.jal        0b
5:                c.jal        3b
6:                jal          ra, 20f
7:                c.jal        12f
8:                c.jal        7b
9:                c.jal        10f
10:               c.j          8b
11:               c.jal        9b
12:               c.j          15f
13:               c.jal        11b
14:               jal          ra, 2b
15:               c.j          21f
16:               c.j          6b
17:               jal          t0, 1b
18:               c.jal        16b
19:               c.j          14b
20:               jal          s6, 22f
21:               jal          s11, 4b
22:               c.add        s10, t4
                  la           s10, region_0+1922 #start riscv_hazard_instr_stream_2
                  sw           tp, -50(s10)
                  mul          s6, s8, a3
                  c.li         s6, -1
                  lhu          s8, -8(s10)
                  lbu          s1, 21(s10)
                  sb           s8, -40(s10)
                  lb           a5, -27(s10)
                  ori          s8, s6, -718
                  sb           s6, 0(s10)
                  sltu         s6, a5, a5
                  c.and        a5, s1
                  c.andi       a5, 0
                  sb           tp, 15(s10)
                  c.xor        s1, a5
                  srl          a3, s8, a3
                  c.li         s8, 27
                  sb           a5, -49(s10)
                  c.andi       a3, 25
                  xori         s1, s1, 1339
                  c.nop
                  sb           s1, 57(s10)
                  lbu          s8, 58(s10)
                  sb           s8, -29(s10)
                  sb           a3, 55(s10)
                  c.xor        a3, a3
                  mulh         a3, s1, s1
                  mul          s6, a3, tp
                  lbu          s1, -16(s10)
                  and          tp, s6, tp
                  lb           tp, 39(s10)
                  srl          s1, tp, s1
                  lb           tp, -55(s10)
                  remu         a5, tp, s8
                  lbu          a3, 54(s10)
                  mulh         a5, a3, s6
                  lb           tp, 58(s10)
                  lbu          a3, 11(s10)
                  lb           a5, -26(s10)
                  c.add        a5, a5
                  nop
                  lb           s6, -37(s10)
                  lbu          tp, 49(s10)
                  xor          a5, tp, a5
                  c.srli       a5, 1
                  c.xor        s1, a5
                  c.addi       tp, 17
                  lhu          tp, -52(s10)
                  lhu          a3, 12(s10)
                  lhu          s6, 32(s10)
                  lbu          a5, -29(s10)
                  sll          tp, a3, a3
                  c.add        s6, s6
                  c.andi       a5, 12
                  lbu          a5, -55(s10) #end riscv_hazard_instr_stream_2
                  la           s6, region_1+493 #start load_store_instr_stream_0
                  la           s11, region_0+153 #start load_store_instr_stream_1
                  sh           t6, 217(s11)
                  sb           s7, 90(s11)
                  sh           s2, 131(s6)
                  sh           a0, -7(s11)
                  sb           t6, 232(s6)
                  sb           s7, -71(s11)
                  sb           sp, 42(s11)
                  lh           t3, -223(s6)
                  sw           s4, -229(s6)
                  sb           t0, -114(s11) #end load_store_instr_stream_1
                  sh           s5, 145(s6) #end load_store_instr_stream_0
                  la           s0, region_1+533 #start riscv_load_store_rand_instr_stream_2
                  lb           t3, 160(s0)
                  lh           t6, 221(s0)
                  c.add        a3, s11
                  c.li         a7, -1
                  c.or         a0, a0
                  sb           a5, -62(s0)
                  lb           a2, 84(s0)
                  sra          t0, t4, s11
                  sb           a1, -36(s0)
                  c.or         a4, s1
                  nop
                  xori         s2, s7, -884
                  c.add        s2, s7
                  lb           s4, 48(s0)
                  c.or         a5, s1
                  lh           gp, 37(s0)
                  auipc        zero, 467708
                  slli         a7, t4, 30
                  c.and        a4, a5
                  lbu          s9, -213(s0)
                  lbu          zero, 239(s0)
                  slli         s8, a3, 28
                  c.and        a1, a3
                  sra          gp, s7, s8
                  mulh         s10, s7, t2
                  andi         a4, s11, -1643
                  remu         a1, a5, s1
                  c.slli       gp, 4
                  srli         s4, a4, 20
                  sb           gp, -156(s0)
                  sb           a6, -207(s0)
                  slti         s11, s1, -120
                  c.nop
                  sb           a7, 175(s0) #end riscv_load_store_rand_instr_stream_2
                  la           s1, region_0+939 #start riscv_load_store_hazard_instr_stream_0
                  sw           a0, 97(s1)
                  sh           s11, 97(s1)
                  sll          s5, t2, a3
                  c.slli       t1, 19
                  lhu          t0, 97(s1)
                  sb           s4, -124(s1)
                  lb           s11, -124(s1)
                  lui          t0, 912425
                  sb           s6, 80(s1)
                  lbu          s9, -23(s1)
                  sw           zero, -23(s1)
                  andi         a5, gp, -871
                  lbu          a3, 38(s1)
                  lbu          s11, 38(s1)
                  lbu          s6, -180(s1)
                  xor          s0, tp, s5
                  srai         a7, s1, 4
                  sb           s7, -190(s1)
                  c.srai       a5, 22
                  lbu          s0, -190(s1)
                  lbu          s6, -190(s1)
                  lbu          a5, -12(s1) #end riscv_load_store_hazard_instr_stream_0
                  la           s5, amo_0+32 #start riscv_amo_instr_stream_0
                  amomax.w.rl   t1, s4, (s5)
                  amomaxu.w.rl  a5, a4, (s5)
                  amoadd.w.aq   tp, s1, (s5)
                  amominu.w.rl  ra, a7, (s5)
                  amomaxu.w.rl  s3, t3, (s5) #end riscv_amo_instr_stream_0
sub_4_6:          jal          a0, 6f
0:                c.j          22f
1:                jal          ra, 14f
2:                jal          a6, 19f
3:                c.j          12f
4:                jal          ra, 13f
5:                c.jal        3b
6:                c.jal        4b
7:                c.j          16f
8:                c.jal        2b
9:                c.j          24f
10:               c.j          17f
11:               c.jal        26f
12:               c.jal        18f
13:               jal          s9, 1b
14:               c.j          9b
15:               c.j          7b
16:               c.j          25f
17:               c.jal        5b
18:               c.j          23f
19:               c.jal        15b
20:               c.jal        10b
21:               c.jal        0b
22:               c.j          11b
23:               jal          a0, 8b
24:               c.jal        20b
25:               c.jal        21b
26:               c.slli       a1, 21
                  la           a3, amo_0+40 #start riscv_lr_sc_instr_stream_1
                  c.andi       a1, 18
                  srli         t4, sp, 27
                  addi         s6, s11, 1544
                  c.li         s5, 9
                  slli         a6, s3, 7
                  slli         s5, s8, 8
                  lr.w.rl       s1, (a3)
                  c.srli       s1, 11
                  nop
                  lui          a6, 713117
                  auipc        s9, 484189
                  sc.w          s9, a0, (a3) #end riscv_lr_sc_instr_stream_1
                  la           s10, region_0+1486 #start load_store_instr_stream_1
                  la           a4, region_0+1400 #start load_store_instr_stream_2
                  la           a7, region_0+1296 #start load_store_instr_stream_3
                  lbu          a0, -776(s10)
                  lbu          s11, -12(a7)
                  lb           s3, 3(a4)
                  sb           s9, -15(a4)
                  sh           a1, 48(s10)
                  lbu          s11, -14(a4)
                  la           s7, region_0+665 #start load_store_instr_stream_0
                  lb           gp, -10(a7)
                  lh           s6, 300(s10)
                  lbu          a5, 461(s10)
                  lb           s2, -9(a4)
                  sw           a1, -145(s7)
                  sb           a4, 9(a7)
                  sh           sp, -2(a4)
                  lh           s11, -4(a4)
                  lh           t1, -10(a7)
                  lbu          s11, -24(s7)
                  lb           t1, 5(a4)
                  lbu          a3, -190(s7)
                  sb           a2, -475(s10)
                  sh           t2, 16(a7) #end load_store_instr_stream_3
                  lb           s2, 9(a4)
                  lb           a1, -582(s10)
                  lhu          t3, -225(s7)
                  lb           a1, -13(a4) #end load_store_instr_stream_2
                  lbu          gp, -142(s7)
                  lbu          t1, -501(s10)
                  sb           s10, -761(s10) #end load_store_instr_stream_1
                  sb           t3, -147(s7) #end load_store_instr_stream_0
                  la           s4, region_1+1470 #start load_store_instr_stream_1
                  sb           s11, -75(s4)
                  la           a2, region_0+1090 #start load_store_instr_stream_0
                  lhu          s1, -164(s4)
                  sh           a4, -84(s4)
                  lb           s5, 98(a2)
                  lb           zero, -122(a2)
                  sb           tp, -163(s4)
                  sw           a0, 238(a2)
                  lh           a1, 110(s4) #end load_store_instr_stream_1
                  lbu          s7, -89(a2)
                  lb           s6, 19(a2)
                  sb           a0, 45(a2) #end load_store_instr_stream_0
                  la           s8, region_0+33 #start load_store_instr_stream_0
                  la           t0, region_0+937 #start load_store_instr_stream_2
                  la           t6, region_0+1787 #start load_store_instr_stream_1
                  sb           s2, -7(t6)
                  sb           s6, 0(t0)
                  la           s6, region_0+414 #start load_store_instr_stream_3
                  lh           ra, -25(s8)
                  lb           s4, 5(t0)
                  sh           t2, 1(t6)
                  lb           t1, -14(t0)
                  lh           a0, -5(t0)
                  lh           s10, -23(s8)
                  lw           gp, -322(s6)
                  sh           s0, 1538(s6)
                  lb           s11, 7(s8)
                  sb           a5, -172(s6)
                  sb           s8, -22(s8)
                  lbu          a1, 12(t6)
                  lhu          s4, 354(s6)
                  sb           s4, 18(s8)
                  sh           a4, 21(s8)
                  lbu          a3, -14(t0)
                  sb           zero, 30(s8)
                  lb           s9, -11(t6)
                  lhu          s3, 21(s8)
                  sh           gp, -15(t0)
                  sb           gp, 896(s6)
                  sb           s10, -71(s6) #end load_store_instr_stream_3
                  lbu          s2, 0(t0) #end load_store_instr_stream_2
                  sb           a1, -8(t6)
                  lbu          tp, 48(s8)
                  sb           t3, 16(t6) #end load_store_instr_stream_1
                  lh           t1, 1(s8) #end load_store_instr_stream_0
                  la           t0, region_1+1594 #start load_store_instr_stream_1
                  sw           a2, -14(t0)
                  la           s1, region_1+120 #start load_store_instr_stream_0
                  la           s6, region_1+1034 #start load_store_instr_stream_2
                  sh           s7, -12(s6)
                  lbu          a5, 41(s1)
                  lh           gp, 16(s6)
                  sw           t2, -12(s1)
                  lb           s2, 8(s6)
                  lb           gp, 13(t0)
                  lw           s0, -2(s6)
                  lb           t3, 8(t0)
                  lb           a2, 7(t0)
                  lb           gp, 7(t0)
                  sb           t4, -69(s1)
                  lbu          a5, 220(s1)
                  lb           tp, 1(s6) #end load_store_instr_stream_2
                  lbu          t4, 1(t0)
                  lhu          s5, -118(s1)
                  sh           s3, 10(t0) #end load_store_instr_stream_1
                  lh           a3, -22(s1) #end load_store_instr_stream_0
                  la           ra, amo_0+44 #start riscv_lr_sc_instr_stream_0
                  add          tp, s9, sp
                  lr.w.rl       a2, (ra)
                  c.mv         s3, s2
                  sltiu        s1, zero, 1262
                  xor          t0, a6, zero
                  sc.w          s5, a0, (ra) #end riscv_lr_sc_instr_stream_0
                  la           a4, amo_0+4 #start riscv_amo_instr_stream_1
                  la           a0, amo_0+48
                  la           s3, amo_0+28
                  amoswap.w.aq  t1, a6, (s3)
                  amomax.w.aq   s0, a7, (a0)
                  amoswap.w.rl  s5, t6, (a0)
                  amoand.w      a2, a2, (a4)
                  amoswap.w     a7, t6, (a0)
                  amoand.w      a2, gp, (a0)
                  amoadd.w.aq   a3, a3, (s3) #end riscv_amo_instr_stream_1
sub_4_7:          jal          a0, 4f
0:                jal          t1, 7f
1:                c.jal        2f
2:                c.j          9f
3:                c.j          0b
4:                c.j          6f
5:                c.j          11f
6:                jal          a2, 8f
7:                jal          t1, 12f
8:                c.j          1b
9:                c.j          3b
10:               jal          ra, 13f
11:               jal          ra, 10b
12:               c.j          5b
13:               sltu         s10, s2, t2
                  la           t4, region_0+340 #start riscv_load_store_hazard_instr_stream_1
                  lbu          ra, 65(t4)
                  lb           a7, 65(t4)
                  lb           a5, -237(t4)
                  sb           s6, 39(t4)
                  lb           a0, -229(t4)
                  xor          t3, zero, a7
                  lbu          t1, -229(t4)
                  lbu          t3, -229(t4)
                  lbu          s5, -229(t4)
                  lbu          t3, -77(t4)
                  lb           t3, -77(t4)
                  sltu         tp, a7, s6
                  sb           a7, 26(t4)
                  lh           a4, 26(t4)
                  lbu          a2, 26(t4)
                  lb           s9, 246(t4)
                  lw           s5, -108(t4)
                  sw           gp, 132(t4)
                  lhu          s0, 132(t4)
                  lbu          s9, 143(t4)
                  addi         s6, a5, -1878
                  lbu          a6, -254(t4) #end riscv_load_store_hazard_instr_stream_1
                  la           t6, region_0+590 #start load_store_instr_stream_0
                  lbu          t1, 9(t6)
                  la           s1, region_1+201 #start load_store_instr_stream_1
                  sb           t6, 1548(s1)
                  lbu          t4, 9(t6)
                  sh           ra, 61(s1)
                  sb           t4, 213(s1)
                  lhu          s5, 12(t6)
                  lbu          a4, -3(t6)
                  lbu          ra, 1738(s1)
                  lbu          s0, 156(s1)
                  lb           a3, 331(s1) #end load_store_instr_stream_1
                  lbu          t3, 5(t6) #end load_store_instr_stream_0
                  la           t4, region_1+1972 #start riscv_load_store_rand_instr_stream_1
                  sb           s7, -34(t4)
                  lbu          a6, -119(t4)
                  ori          t1, s1, 1288
                  and          a4, a0, zero
                  remu         a7, t0, s7
                  auipc        a7, 1003486
                  sub          a6, t6, t0
                  addi         s4, ra, -1379
                  mul          gp, sp, s7
                  lbu          a3, -153(t4)
                  sb           t6, -133(t4)
                  auipc        t0, 143519
                  div          s7, t5, a3
                  lhu          a2, -50(t4)
                  lh           a5, -234(t4)
                  lhu          tp, -194(t4)
                  c.slli       tp, 2
                  slli         tp, s0, 27
                  c.and        s1, a4
                  ori          s2, t0, 382
                  remu         a7, a1, s1
                  c.mv         t6, a0
                  c.slli       s11, 6
                  srai         a6, s4, 24
                  lbu          zero, -241(t4)
                  slti         a5, s1, 1120
                  lh           s5, -2(t4)
                  ori          s1, s1, -345
                  sb           a1, -217(t4)
                  lhu          t6, -244(t4)
                  lb           s0, -160(t4)
                  lbu          s5, -149(t4)
                  xor          a6, gp, t1
                  lh           s3, -190(t4)
                  c.or         a1, s1
                  sb           s8, -198(t4)
                  c.nop
                  c.or         a3, a5
                  srai         t0, sp, 3
                  lbu          s11, -25(t4)
                  c.or         a3, a5
                  lhu          a0, -216(t4)
                  sb           t4, -39(t4)
                  sb           a6, -221(t4)
                  xori         s9, gp, -1181
                  lb           s7, -185(t4)
                  div          gp, s6, a3
                  lbu          a7, -141(t4)
                  lb           a6, -129(t4) #end riscv_load_store_rand_instr_stream_1
                  addi         s3, zero, -6 #init loop 0 counter
                  srli         a4, s10, 9
                  ori          t1, t4, 1653
                  addi         a1, zero, 12 #init loop 0 limit
                  c.andi       a0, 18
sub_4_15_0_t:     divu         s6, s1, s7
                  srai         s2, s3, 31
                  addi         s4, s0, -511
                  addi         s3, s3, 3 #update loop 0 counter
                  auipc        s9, 116107
                  mulhu        a5, a3, s9
                  mulhu        s0, s11, sp
                  c.srai       a5, 27
                  srai         s9, tp, 18
                  ori          s4, s9, 394
                  and          gp, ra, s1
                  c.slli       s1, 6
                  mulhsu       tp, t3, a4
                  bne          s3, a1, sub_4_15_0_t #branch for loop 0
                  andi         s10, a0, 841
                  la           tp, region_1+635 #start riscv_hazard_instr_stream_0
                  addi         t0, t0, -2026
                  divu         a6, ra, s8
                  c.addi       t0, 2
                  lb           a6, 916(tp)
                  lb           ra, 1186(tp)
                  srai         s1, a4, 17
                  mulh         ra, ra, t0
                  sub          a6, ra, s1
                  lb           s1, -376(tp)
                  xor          s8, a4, ra
                  c.srli       s1, 6
                  sltiu        a6, s8, -695
                  lb           a6, -96(tp)
                  sw           s8, 949(tp)
                  lbu          s1, 1240(tp)
                  sh           s8, 849(tp)
                  sra          a6, s1, s1
                  sb           ra, 62(tp)
                  lh           a4, 241(tp)
                  sb           s1, -602(tp)
                  lb           s1, 1112(tp)
                  sb           s1, 98(tp)
                  and          a6, a6, s8
                  lhu          s8, -107(tp)
                  lbu          a6, -196(tp)
                  lb           ra, 621(tp)
                  sh           a4, 219(tp)
                  lh           s8, 425(tp)
                  sub          s1, ra, ra
                  sb           a6, 298(tp)
                  sltiu        s1, t0, -1217
                  lh           ra, 991(tp)
                  lbu          t0, -580(tp)
                  or           s1, ra, s1
                  sb           s1, 1095(tp) #end riscv_hazard_instr_stream_0
                  c.slli       s0, 2
                  div          s1, t0, a3
                  c.nop
                  xori         s11, s10, 460
                  rem          s2, ra, t0
                  addi         s2, a2, 1087
                  c.srli       a0, 2
                  divu         s6, tp, s0
                  srl          a0, zero, t5
                  slli         ra, a1, 9
                  c.bnez       a2, 22f
                  sub          s4, t5, sp
                  sra          t6, a6, zero
                  c.srli       a4, 11
                  xor          a4, s5, a0
                  c.srli       a3, 6
                  c.srli       a2, 16
                  xor          gp, s7, t2
                  rem          a1, t4, s0
                  c.addi       ra, -1
                  addi         s5, s2, 1033
                  c.sub        a5, s0
22:               mul          tp, s7, gp
                  nop
                  divu         s2, tp, t6
                  slli         s5, a6, 2
                  mulhu        s9, t5, a0
                  c.srai       a1, 18
                  ori          s2, sp, 1313
                  c.lui        s6, 6
                  c.mv         a2, s2
                  sltiu        t0, a7, -1177
                  rem          s3, s7, a7
                  auipc        t6, 481080
                  blt          a2, s4, 42f
                  lui          a1, 777409
                  xor          a4, a3, a3
                  sltu         a4, s10, t0
                  c.srai       a2, 16
                  addi         s7, s8, 1972
                  c.or         a4, a5
                  c.addi       a5, -1
42:               c.slli       s6, 6
                  andi         s5, s2, -500
                  addi         tp, t0, 932
                  c.and        a1, a3
                  c.mv         a1, s9
                  c.lui        t3, 24
                  sll          s6, s1, a4
                  c.lui        a6, 13
                  c.srai       s0, 8
                  divu         gp, a3, s6
                  divu         a3, a0, s8
                  slt          a0, s10, s6
                  auipc        s10, 962906
                  srai         s5, s2, 2
                  sra          s0, s6, a3
                  lui          a7, 4365
                  c.srai       a0, 8
                  and          a0, a0, a1
                  c.andi       a2, 13
                  c.srli       a3, 7
                  sll          tp, a3, a0
                  c.or         s0, a5
                  srai         s8, s0, 29
                  beq          a0, s4, 67f
                  c.and        a3, a0
67:               beq          a0, a7, 75f
                  sltiu        s9, a7, -1856
                  sub          ra, a6, s9
                  sltu         s1, s10, s6
                  slli         s8, tp, 18
                  c.bnez       a3, 75f
                  c.sub        a2, s1
                  bge          t4, t2, 87f
75:               c.lui        a1, 4
                  c.and        a0, a2
                  rem          a3, s9, t5
                  srai         s11, a7, 16
                  ori          s0, s2, -1579
                  xor          zero, a6, t5
                  remu         zero, tp, s2
                  add          s11, t4, sp
                  sra          zero, a5, s6
                  mul          zero, s6, s2
                  c.srli       s1, 13
                  slli         ra, a0, 0
87:               sra          s2, gp, a4
                  xor          t4, s0, sp
                  lui          t6, 1006080
                  c.and        s0, a1
                  srl          tp, s9, s1
                  mulhsu       ra, t1, s6
                  c.slli       s6, 10
                  c.srli       a0, 11
                  c.andi       a0, -1
                  auipc        a7, 786730
                  mul          a7, a3, a4
                  blt          s3, t5, 103f
                  andi         s10, s9, 61
                  c.add        s3, t3
                  slli         s10, t0, 2
                  sra          s2, s7, a3
103:              sltu         a4, a2, a3
                  bltu         ra, zero, 108f
                  c.lui        ra, 2
                  c.and        s0, s1
                  sltiu        tp, t6, -812
108:              xori         a4, gp, -3
                  c.addi       t0, 26
                  sltu         tp, a4, ra
                  c.sub        a2, a0
                  add          s10, s2, tp
                  sub          s10, a4, s0
                  nop
                  bgeu         a5, gp, 125f
                  c.li         ra, 19
                  c.or         a2, a1
                  srli         a6, a0, 11
                  auipc        a1, 291247
                  c.and        a0, s1
                  slt          t3, a4, a7
                  c.nop
                  c.nop
                  slt          t6, t5, gp
125:              c.xor        a2, a5
                  c.bnez       a2, 145f
                  c.andi       s1, 3
                  c.or         a3, a3
                  and          ra, s1, s2
                  c.or         s0, s0
                  mulhu        a6, a1, gp
                  sltu         zero, s11, t0
                  andi         s11, s2, 1402
                  andi         s0, t2, 1660
                  srai         s5, s11, 11
                  xor          s1, s8, t2
                  mul          s8, a3, a1
                  bgeu         a1, s9, 147f
                  andi         s3, gp, -1129
                  c.add        s7, s3
                  sltiu        t1, a4, 268
                  sltiu        a4, zero, 1995
                  slli         a4, a7, 27
                  srli         zero, a1, 14
145:              addi         s9, s2, -987
                  c.lui        s2, 13
147:              blt          s9, s5, 162f
                  divu         a4, a6, s0
                  c.beqz       a1, 150f
150:              c.srai       a0, 7
                  bne          t6, s6, 159f
                  slti         s1, s4, -217
                  add          s4, gp, a5
                  bltu         s3, s2, 170f
                  c.bnez       a0, 169f
                  bge          s6, a0, 173f
                  c.add        s8, ra
                  mulh         t3, a0, s8
159:              c.lui        s9, 22
                  c.and        a2, s1
                  c.bnez       a5, 170f
162:              c.add        s2, s2
                  c.slli       t6, 24
                  c.beqz       a4, 170f
                  xori         a2, s3, -1105
                  or           t1, s4, a3
                  rem          s11, s5, t5
                  srai         zero, t6, 4
169:              mulhu        a5, s8, ra
170:              xor          s2, t2, t0
                  c.and        a0, a3
                  slt          a5, t0, s9
173:              andi         s5, s8, 1878
                  c.lui        a6, 1
                  beq          s3, gp, 187f
                  bgeu         a7, a3, 177f
177:              andi         s1, t4, 681
                  c.srai       a5, 10
                  sltu         a5, t1, sp
                  bge          a4, s0, 191f
                  rem          s5, s7, a5
                  slli         t6, s10, 20
                  xori         a3, gp, 1077
                  sll          s2, s10, s10
                  c.xor        a4, a1
                  add          t0, s5, gp
187:              lui          t6, 967458
                  auipc        s8, 564910
                  c.andi       s0, -1
                  c.beqz       s1, 200f
191:              mulhu        s5, s8, s6
                  srai         s7, a1, 6
                  sra          a7, ra, s3
                  srai         t1, s0, 10
                  c.nop
                  addi         a4, s10, -1151
                  srli         gp, a0, 4
                  mulhsu       s5, t4, ra
                  bgeu         ra, a0, 202f
200:              c.bnez       a3, 213f
                  bltu         t5, a0, 211f
202:              c.beqz       s1, 221f
                  ori          a6, a6, -255
                  mul          a5, a0, t6
                  slli         s1, ra, 27
                  slli         a4, s8, 9
                  c.andi       s1, 29
                  sltiu        s6, a6, 1067
                  c.or         a3, a3
                  div          tp, a5, a6
211:              xori         s8, t6, -1968
                  c.srai       a2, 9
213:              c.nop
                  c.sub        a2, s1
                  xori         t1, s6, 454
                  slli         s10, t2, 20
                  div          a4, t6, s8
                  c.andi       a3, 27
                  div          a3, s4, tp
                  c.add        s9, s8
221:              beq          zero, zero, 235f
                  sltiu        a7, s1, 1062
                  mulh         s8, s11, a3
                  c.or         a0, a2
                  c.sub        a4, a5
                  divu         a7, a7, a7
                  mul          s2, t3, a6
                  c.nop
                  c.mv         t1, s10
                  or           s11, s9, zero
                  srai         ra, sp, 5
                  lui          a4, 135230
                  c.or         a0, a5
                  c.addi       s1, 31
235:              bltu         t0, a4, 252f
                  slti         t0, tp, -1295
                  srai         s6, s8, 16
                  srli         s10, gp, 22
                  c.mv         a7, t0
                  mulhsu       t0, t3, t0
                  c.and        a0, a1
                  c.sub        a1, a4
                  mulhsu       s10, s5, a2
                  beq          s10, s0, 254f
                  c.srli       a2, 15
                  bgeu         t1, t0, 263f
                  sub          s0, s10, s1
                  c.lui        s10, 15
                  slt          s2, s5, s0
                  xori         s0, s9, 1065
                  bltu         ra, t1, 265f
252:              andi         a2, t2, 1425
                  blt          a6, s4, 254f
254:              c.lui        s7, 4
                  sltu         s4, gp, gp
                  lui          t6, 71570
                  c.andi       a0, 14
                  c.andi       a0, 21
                  c.srai       a5, 22
                  remu         zero, s1, sp
                  sll          t6, s0, t4
                  nop
263:              andi         t6, t4, 1828
                  div          a3, a1, s7
265:              addi         a2, t4, 1957
                  bgeu         t0, s7, 276f
                  c.srli       a2, 17
                  bltu         ra, s5, 276f
                  beq          s0, t6, 277f
                  beq          a1, ra, 289f
                  ori          ra, ra, 898
                  xori         s7, ra, 1596
                  c.addi       s9, -1
                  lui          t0, 33817
                  bgeu         a2, a0, 288f
276:              c.nop
277:              c.or         s1, a5
                  bge          t2, a5, 287f
                  c.lui        t1, 13
                  addi         s3, t0, -1534
                  and          zero, sp, s6
                  andi         ra, s9, 275
                  c.add        s3, a7
                  c.beqz       a3, 303f
                  c.or         a5, a3
                  xori         a0, a7, 1111
287:              c.or         a3, a1
288:              sub          s9, s5, s6
289:              ori          s3, s3, -3
                  sltiu        s2, a6, -1695
                  c.xor        a3, a5
                  or           tp, ra, s10
                  bge          s11, s3, 301f
                  auipc        tp, 166749
                  c.li         a3, -1
                  mulhsu       s0, s11, s7
                  c.andi       a1, 5
                  c.or         a4, a1
                  slti         t1, s6, 2019
                  c.mv         t1, s7
301:              c.mv         s2, a6
                  c.mv         s9, s8
303:              xor          s6, t6, s6
                  mulhsu       a1, sp, t2
                  rem          s8, a7, s11
                  bne          zero, a5, 312f
                  c.slli       a3, 8
                  srli         s2, s0, 13
                  bltu         gp, gp, 320f
                  div          a4, a7, t6
                  mulhsu       s7, t3, a4
312:              c.mv         s7, gp
                  ori          s10, ra, 1980
                  mulhsu       s4, tp, sp
                  c.mv         ra, a4
                  mulh         a0, s6, zero
                  add          t0, s8, t5
                  c.or         a0, a4
                  c.li         s8, 19
320:              addi         zero, a2, 1719
                  c.bnez       s1, 338f
                  c.srai       a0, 4
                  la           s3, region_0+1043 #start riscv_load_store_hazard_instr_stream_2
                  sub          t6, t2, s11
                  lhu          zero, 99(s3)
                  sb           a2, -252(s3)
                  slti         gp, t0, 1295
                  lbu          a6, -252(s3)
                  lbu          t0, -252(s3)
                  lb           t0, -10(s3)
                  lb           s0, -82(s3)
                  lhu          t6, 161(s3)
                  sltiu        tp, s10, 1689
                  c.srli       s1, 9
                  lh           a5, 161(s3)
                  lbu          t3, -222(s3)
                  sb           a5, 200(s3)
                  add          s6, gp, t2
                  lb           a1, -206(s3)
                  lb           a4, -206(s3) #end riscv_load_store_hazard_instr_stream_2
                  sll          s4, s3, a5
                  andi         a6, s11, 1395
                  or           ra, s10, s1
                  mulhu        s5, a2, s11
                  sltiu        s10, zero, 1249
                  srl          s7, a6, s0
                  c.add        s9, gp
                  mulh         s7, t6, tp
                  c.srai       a2, 30
                  add          a1, a4, s4
                  slti         a6, s7, -1716
                  c.bnez       a0, 346f
                  sub          a3, gp, a3
                  c.add        s11, s5
                  c.xor        a1, a1
338:              sub          s4, t6, s11
                  auipc        s9, 773736
                  addi         a4, s3, 923
                  slt          s3, a6, a0
                  bne          ra, s0, 344f
                  divu         s7, t4, gp
344:              c.srai       a2, 27
                  nop
346:              add          s7, s1, t2
                  nop
                  c.add        t1, s9
                  slt          zero, a2, s5
                  mulhsu       a1, sp, t6
                  bge          s6, a3, 365f
                  c.andi       s0, -1
                  c.addi       s3, -1
                  c.srli       a2, 17
                  beq          s5, tp, 365f
                  bgeu         gp, a3, 365f
                  xor          s5, t4, t5
                  xori         a4, s4, 835
                  add          a3, s2, zero
                  srli         gp, a4, 22
                  lui          s4, 558446
                  slt          s10, t5, s5
                  addi         s1, t6, -1771
                  srli         t4, s10, 3
365:              c.nop
                  mulhu        a1, a7, s6
                  nop
                  or           s9, t5, t1
                  c.andi       a5, 3
                  srli         a6, a3, 24
                  c.slli       a2, 13
                  c.lui        a0, 7
                  div          s11, a5, s0
                  mul          s4, s3, a0
                  blt          a1, s10, 378f
                  and          tp, s6, s9
                  bgeu         s2, t3, 392f
378:              slli         s2, s4, 21
                  c.xor        a4, a5
                  c.sub        a3, a0
                  c.or         s1, a1
                  lui          ra, 747826
                  c.lui        a4, 22
                  ori          a4, zero, -1789
                  bge          t6, s11, 398f
                  mulh         s11, a4, a1
                  bge          a4, a5, 388f
388:              srli         t0, a4, 16
                  c.beqz       a0, 401f
                  c.sub        a1, a1
                  sub          a5, s8, s3
392:              c.andi       a3, -1
                  beq          zero, s1, 396f
                  sltiu        s1, s4, -937
                  mulhu        s6, s2, t1
396:              bne          zero, a3, 400f
                  c.xor        s0, a2
398:              mulhu        a1, tp, a6
                  andi         a6, t5, 2037
400:              sra          s4, s4, s1
401:              srl          s9, s6, s6
                  c.add        a0, t0
                  lui          a5, 358826
                  mulhu        ra, s2, ra
                  sub          s5, gp, s6
                  mul          s7, t4, t2
                  c.slli       a5, 1
                  bge          s4, s9, 424f
                  mulhsu       s3, s1, a4
                  c.slli       s7, 13
                  slti         a3, t6, 1333
                  or           s5, s1, s10
                  srl          s6, a5, s5
                  bge          a7, a5, 424f
                  c.add        a7, t5
                  andi         a4, s3, 1846
                  divu         a0, a0, s4
                  or           a1, a7, a1
                  c.nop
                  c.or         a1, a1
                  c.addi       a7, -1
                  c.srai       a5, 6
                  c.li         s1, -1
424:              bge          a3, a0, 429f
                  mulhsu       s2, s3, a1
                  lui          s0, 537600
                  bgeu         s10, s10, 437f
                  mulh         s10, tp, t0
429:              c.srai       a2, 5
                  c.sub        a1, a0
                  c.mv         t0, s7
                  c.bnez       a4, 449f
                  bltu         t2, a1, 442f
                  c.slli       t6, 3
                  c.nop
                  div          s11, s10, t2
437:              andi         a2, s2, 1297
                  bltu         s10, tp, 446f
                  mul          t4, s8, sp
                  and          gp, a0, s5
                  bgeu         zero, a7, 442f
442:              c.mv         a5, a0
                  c.mv         ra, tp
                  c.lui        s9, 12
                  srl          t4, s8, t3
446:              remu         t6, sp, s2
                  sub          s1, s1, sp
                  sltiu        s0, a5, 446
449:              divu         s0, a6, a0
                  beq          s1, a1, 467f
                  div          s4, s9, s8
                  sll          s1, s10, ra
                  addi         a1, t2, -290
                  c.add        ra, t6
                  slt          a7, sp, s2
                  c.li         a5, 21
                  sub          a6, zero, sp
                  mulhu        s2, s3, s0
                  remu         s4, a1, s0
                  sltu         s8, s10, a0
                  c.mv         tp, s9
                  c.srai       a5, 5
                  c.or         a3, s1
                  c.bnez       a3, 468f
                  xor          s6, a3, s8
                  remu         a2, s9, s4
467:              rem          ra, s4, s1
468:              sub          s1, tp, s4
                  bne          s9, t5, 479f
                  c.bnez       a0, 480f
                  srli         s9, a1, 22
                  c.nop
                  c.nop
                  rem          t6, a3, a1
                  ori          a4, a6, -825
                  c.beqz       a5, 479f
                  addi         s0, zero, 24
                  mulhu        a0, t3, a0
479:              c.or         a4, a2
480:              sltiu        t1, s6, -202
                  bgeu         gp, a6, 493f
                  c.slli       ra, 24
                  xor          s4, s4, a5
                  mul          a1, s0, s8
                  c.bnez       s1, 501f
                  andi         t6, ra, -1972
                  c.lui        s9, 2
                  bne          a6, a2, 498f
                  srl          zero, s9, s4
                  mulhsu       s7, s1, a7
                  c.add        a5, t2
                  rem          a0, s11, s7
493:              c.bnez       a1, 495f
                  beq          t6, gp, 495f
495:              addi         s11, sp, 1065
                  bge          tp, s0, 499f
                  mulhsu       s3, a3, s0
498:              c.bnez       a0, 503f
499:              auipc        a0, 765529
                  c.sub        a1, a3
501:              nop
                  remu         tp, s6, a1
503:              ori          tp, t5, 153
                  xori         s5, s1, 476
                  xori         s7, a5, 1149
                  add          s9, zero, s2
                  div          gp, s8, s5
                  or           zero, s9, t3
                  c.mv         t3, s10
                  c.mv         a5, a4
                  sltiu        s6, s8, -1721
                  la           t4, region_1+229 #start riscv_hazard_instr_stream_1
                  c.lui        t3, 19
                  mulhu        t3, s3, a7
                  sb           s9, 1260(t4)
                  c.mv         s11, a7
                  lb           a0, 1008(t4)
                  or           s3, s3, a0
                  lb           s11, -126(t4)
                  sb           s3, 672(t4)
                  lbu          a0, 621(t4)
                  add          s11, s11, t3
                  lb           s9, 1506(t4)
                  nop
                  sb           s9, 321(t4)
                  lbu          s3, 1280(t4)
                  lb           s9, 1060(t4)
                  srli         a7, a0, 30
                  sb           s3, 1020(t4)
                  lb           t3, 1256(t4)
                  c.srai       a0, 7
                  lbu          s11, -194(t4)
                  nop
                  lh           a0, 1453(t4)
                  lh           a0, 1085(t4)
                  sh           s3, 341(t4)
                  rem          a0, a7, t3
                  sltiu        t3, a7, 1181
                  and          t3, s9, a7
                  c.slli       s9, 12
                  sb           t3, 1562(t4)
                  sb           s11, 404(t4)
                  sh           t3, 1219(t4)
                  c.andi       a0, -1
                  xori         a0, a7, -111
                  srai         a7, s3, 19
                  sb           a7, 1600(t4)
                  c.andi       a0, -1
                  c.sub        a0, a0
                  addi         t3, s11, 731
                  c.lui        s9, 29
                  div          s11, s9, s3
                  sb           a0, 140(t4)
                  c.add        s11, t3
                  lbu          t3, 278(t4)
                  lh           s3, -203(t4)
                  lbu          s11, 1739(t4) #end riscv_hazard_instr_stream_1
                  srai         s2, a1, 8
                  srli         s5, t5, 10
                  c.and        a0, a0
                  divu         a2, a0, s0
                  mul          s6, t1, a3
                  slt          a5, a0, s11
                  mulhu        a0, s6, a3
                  bltu         a7, t4, 532f
                  slli         a4, s4, 24
                  mul          s2, a3, s7
                  srli         a0, a3, 29
                  bne          s4, s8, 534f
                  slt          a5, a0, s7
                  sltu         a2, t4, s3
                  sltiu        s9, s3, 1009
                  sra          s0, t5, s6
                  c.lui        s5, 31
                  c.bnez       a0, 548f
                  nop
                  sra          ra, sp, a0
532:              nop
                  c.bnez       a0, 547f
534:              blt          s4, a5, 542f
                  c.xor        a5, a5
                  c.bnez       a1, 545f
                  add          t3, a3, zero
                  sltu         a3, t2, sp
                  blt          a7, s9, 551f
                  c.addi       s3, 12
                  srli         s5, tp, 14
542:              srai         s6, t4, 22
                  add          s4, sp, t2
                  slti         t0, s7, 1534
545:              c.and        a4, a2
                  div          a0, t3, s9
547:              and          s9, a5, s10
548:              div          a4, a1, tp
                  mul          t1, a3, s9
                  xor          s1, tp, s10
551:              c.beqz       a5, 566f
                  bltu         ra, s10, 560f
                  c.srli       a3, 1
                  c.li         s10, -1
                  blt          a4, s11, 561f
                  slli         s11, s4, 2
                  sra          a5, a2, s4
                  slli         a0, a4, 4
                  sltu         s1, a1, sp
560:              c.li         a3, -1
561:              c.and        a4, a5
                  c.mv         t0, s2
                  rem          s1, a3, a3
                  slti         a1, s4, -1908
                  remu         s7, a6, t5
566:              remu         s4, t3, a7
                  c.mv         t0, a6
                  sra          s4, a4, a5
                  c.xor        a1, a3
                  c.srli       s1, 4
                  lui          a2, 902929
                  c.or         s0, a0
                  mulhu        t6, s4, s9
                  c.or         a0, s1
                  srli         a3, a0, 16
                  ori          t4, t5, -1193
                  auipc        ra, 608320
                  c.bnez       s1, 588f
                  mulhsu       a5, s7, t2
                  or           a4, s11, t6
                  ori          tp, s7, -817
                  beq          a4, s1, 596f
                  sll          s0, t2, a5
                  slt          s2, a6, s1
                  srl          a0, t0, s10
                  srl          a6, s4, s2
                  or           tp, t3, a4
588:              andi         t0, ra, -1703
                  c.and        s0, a4
                  xor          gp, a5, s3
                  divu         a3, t2, ra
                  c.nop
                  mulhu        t1, s1, s2
                  addi         a5, s5, -1411
                  c.mv         a0, a7
596:              c.or         a5, a2
                  c.srli       a3, 6
                  sltiu        gp, s0, -2014
                  xori         a2, s0, -1634
                  bne          s8, t2, 619f
                  bne          s3, a3, 614f
                  sll          zero, t0, s5
                  rem          s1, t5, a4
                  or           a6, s8, t4
                  bge          s5, t0, 618f
                  andi         gp, s0, -154
                  auipc        t6, 1004675
                  bltu         t1, s3, 622f
                  c.and        a4, a3
                  c.srli       a2, 12
                  c.beqz       a4, 624f
                  c.addi       s0, 2
                  c.or         s1, a0
614:              c.nop
                  and          s2, a6, zero
                  c.mv         t1, a7
                  bne          a4, s0, 625f
618:              c.add        s11, a0
619:              c.mv         s10, t6
                  ori          a6, a0, -439
                  sll          s1, tp, s2
622:              c.lui        a0, 2
                  c.bnez       a3, 635f
624:              bge          ra, s7, 629f
625:              andi         t6, t1, 1759
                  or           t6, t6, ra
                  srli         a0, a1, 15
                  bgeu         s2, t4, 640f
629:              sub          s8, s1, zero
                  sltu         gp, s7, a0
                  addi         t6, t5, 1553
                  c.mv         s5, t2
                  la           s9, region_1+475 #start riscv_load_store_rand_instr_stream_0
                  c.or         a3, a4
                  divu         t3, s2, s11
                  sub          a5, sp, a5
                  lbu          s3, -358(s9)
                  c.nop
                  ori          a5, a7, -1498
                  c.sub        a3, s0
                  lh           a7, 1425(s9)
                  addi         s1, s1, -1056
                  srli         a3, s5, 13
                  sw           a6, -135(s9)
                  slt          a4, a2, s9
                  c.and        a5, a1
                  sb           s0, 108(s9)
                  slli         a0, a0, 27
                  slti         s5, s5, -550
                  lbu          t1, 1190(s9)
                  sb           zero, 1036(s9)
                  div          t4, sp, a3
                  sb           t6, 162(s9)
                  add          s7, t5, t4
                  c.srai       a1, 7
                  remu         s7, s0, a3
                  sltiu        t3, a3, 80
                  lbu          a7, 952(s9)
                  slt          s4, s10, a7
                  srli         a7, s4, 1
                  sb           t1, 1207(s9)
                  c.xor        s0, s0
                  srli         t1, t1, 23
                  c.srai       s0, 5
                  mulh         a0, a5, t6
                  c.mv         t6, a5
                  lui          t3, 435189
                  lh           t3, 859(s9) #end riscv_load_store_rand_instr_stream_0
                  c.xor        a3, a4
                  c.andi       s1, 16
635:              sltiu        a5, t6, -795
                  bgeu         s2, t1, 651f
                  mulhu        a6, a0, a7
                  bge          a0, s9, 648f
                  c.li         a4, 22
640:              sltiu        tp, s8, -1307
                  div          t6, s3, s11
                  srl          s11, sp, sp
                  c.addi       s11, -1
                  add          gp, a6, t6
                  slti         t0, sp, -616
                  xor          a2, s8, s3
                  c.or         a2, a3
648:              sub          a1, a3, a2
                  c.srli       a3, 31
                  c.srli       a5, 18
651:              c.addi       s6, 15
                  slt          t3, s7, s7
                  c.sub        a2, a2
                  c.and        a5, a1
                  sra          a1, s3, s5
                  xor          s10, a3, s3
                  or           a7, t2, zero
                  sub          s4, s2, tp
                  c.srai       a5, 23
                  c.and        a0, a2
                  bge          a3, a7, 671f
                  auipc        s1, 372950
                  bne          s7, a7, 674f
                  divu         s6, s10, a5
                  c.or         s1, a3
                  bltu         s1, s2, 672f
                  sra          a2, s11, a2
                  c.lui        a1, 22
                  c.or         a4, a0
                  c.slli       tp, 8
671:              sra          t3, a3, a7
672:              c.srai       a4, 26
                  xor          a4, t0, t6
674:              addi         zero, tp, 1825
                  and          s5, gp, s6
                  mulh         s2, s2, t5
                  bltu         ra, a2, 693f
                  mul          t1, a7, t6
                  slt          a3, s3, s5
                  slt          a4, s5, s5
                  mulh         a4, s5, t6
                  c.slli       a6, 27
                  c.srli       a5, 31
                  addi         s7, ra, -808
                  c.beqz       a4, 688f
                  c.slli       t1, 7
                  c.xor        a5, a3
688:              c.srai       a5, 6
                  sub          a7, s11, t3
                  bge          s11, a6, 700f
                  andi         a0, a4, -844
                  and          t3, a7, t6
693:              c.srai       a3, 22
                  mulhu        t3, s3, zero
                  srai         t3, ra, 12
                  mulhu        s5, a2, sp
                  addi         s2, zero, 411
                  slt          s8, sp, s0
                  sltiu        zero, a1, 180
700:              slt          a1, s3, a6
                  c.lui        s10, 1
                  lui          tp, 652411
                  c.addi       tp, -1
                  beq          s1, s2, 712f
                  c.srai       s1, 31
                  bne          a5, a5, 715f
                  bltu         s10, s2, 721f
                  srli         a3, t2, 1
                  auipc        s2, 307353
                  div          zero, a2, a7
                  mulhu        gp, gp, a2
712:              beq          s2, s6, 721f
                  divu         s6, gp, s2
                  sra          zero, s6, s9
715:              blt          a4, s9, 719f
                  sltiu        s6, t5, -10
                  blt          t0, zero, 727f
                  blt          s5, s8, 719f
719:              c.andi       a2, -1
                  bne          t0, a6, 721f
721:              c.addi       s7, -1
                  c.bnez       a4, 724f
                  blt          s1, sp, 740f
724:              mul          s11, a1, s8
                  slt          a3, s11, t2
                  bge          sp, gp, 745f
727:              mul          s4, a4, t4
                  srl          s5, tp, a7
                  remu         t0, a5, s2
                  bgeu         a1, a7, 747f
                  sra          s6, s8, tp
                  div          tp, t1, s10
                  addi         a1, a4, 489
                  srai         a6, s11, 8
                  slli         s4, s6, 31
                  sll          s7, tp, s10
                  srl          a4, a6, t0
                  c.beqz       a4, 746f
                  c.lui        s1, 17
740:              c.srai       s1, 31
                  slt          s1, s2, a2
                  c.addi       t0, 5
                  c.li         ra, -1
                  add          s2, s4, t5
745:              slli         s1, a3, 9
746:              srli         t3, t6, 18
747:              srai         s11, t2, 15
                  sra          s9, s8, t5
                  or           s3, ra, gp
                  lw           a0, 4(t5)
                  xori         t3, a2, 1048
                  addi         t5, t5, 24
                  c.sub        a2, a3
                  auipc        t0, 139591
                  mulh         a7, s5, sp
1365:             addi x29, x10, 0
1365:             c.jr x29
sub_3:            c.or         a2, a1
                  c.srai       a2, 5
                  beq          s0, t0, sub_3_stack_p
                  c.mv         t3, t3
                  mulhu        t6, s5, a4
sub_3_stack_p:    addi         t5, t5, -36
                  srl          a7, a4, s8
                  sw           a0, 4(t5)
                  srai         s2, zero, 6
                  sub          s1, s6, s5
                  srai         t3, s4, 28
                  la           ra, amo_0+32 #start riscv_amo_instr_stream_2
                  la           s6, amo_0+40
                  la           a0, amo_0+60
                  la           gp, amo_0+56
                  amominu.w.aq  t3, a2, (ra)
                  amomin.w.aq   s9, a2, (s6)
                  amoand.w.rl   s4, s7, (gp)
                  divu         s2, sp, s2
                  amoswap.w.aq  s3, t0, (a0)
                  c.srai       a5, 31
                  amomaxu.w.rl  s1, s0, (a0)
                  amoand.w.aq   t0, t6, (gp)
                  amomaxu.w.aq  t1, a3, (s6)
                  c.mv         a7, s10
                  amoor.w.aq    s8, tp, (gp)
                  c.or         s0, a3
                  remu         tp, s8, s10
                  amomin.w.aq   a6, a1, (a0)
                  amomaxu.w.aq  a5, s5, (a0) #end riscv_amo_instr_stream_2
                  la           tp, region_0+736 #start load_store_instr_stream_1
                  la           s9, region_1+1859 #start load_store_instr_stream_0
                  lbu          a7, 135(s9)
                  lb           s6, 6(tp)
                  lbu          a5, 137(s9)
                  sb           a5, -53(tp)
                  sb           a6, -38(tp)
                  sb           t0, 54(tp)
                  lhu          t1, 59(s9)
                  lbu          zero, 68(s9)
                  sh           ra, -14(tp)
                  lb           zero, -63(tp)
                  sw           zero, 73(s9)
                  lh           t1, -6(tp) #end load_store_instr_stream_1
                  lbu          s7, -106(s9) #end load_store_instr_stream_0
                  la           a3, region_1+1522 #start riscv_hazard_instr_stream_0
                  lb           a2, -16(a3)
                  lhu          a7, 4(a3)
                  lb           s10, 14(a3)
                  c.li         a7, 11
                  sra          a2, s0, s10
                  lb           a2, 3(a3)
                  slti         a7, s10, 1687
                  sra          a7, a2, s10
                  lbu          a7, -10(a3)
                  sw           s0, -14(a3)
                  sh           a2, 10(a3)
                  lb           a7, 3(a3)
                  sb           s10, 16(a3)
                  c.nop
                  sh           s10, -16(a3)
                  sw           s10, -6(a3)
                  sh           a2, -6(a3)
                  auipc        a2, 827620
                  xori         a2, t3, 1895
                  and          s10, s0, s2
                  slli         a2, s10, 11
                  srli         t3, s10, 19
                  lb           a7, 11(a3)
                  lb           a2, -13(a3)
                  c.li         a7, 16
                  lhu          s0, -8(a3)
                  c.srli       s0, 8
                  lh           t3, 12(a3)
                  slt          a7, a2, t3
                  sh           a7, 8(a3)
                  sra          t3, s0, a7
                  andi         s2, s0, -497
                  mul          s2, a2, s2
                  sra          a2, s0, s2
                  srai         t3, s2, 4
                  sb           s2, 9(a3) #end riscv_hazard_instr_stream_0
                  la           s2, amo_0+16 #start riscv_lr_sc_instr_stream_6
                  andi         s6, t5, -1667
                  xori         s6, s6, 1480
                  c.nop
                  c.mv         s4, tp
                  slti         s4, t6, 674
                  c.or         a0, a0
                  lr.w.aq       s4, (s2)
                  c.mv         t0, s9
                  c.or         a0, a5
                  auipc        zero, 379611
                  slt          a6, s8, t0
                  sc.w          s0, s6, (s2) #end riscv_lr_sc_instr_stream_6
                  la           s5, region_1+94 #start riscv_hazard_instr_stream_6
                  xori         a3, t6, -1457
                  rem          t0, a7, t6
                  lbu          t0, 327(s5)
                  lhu          a3, 242(s5)
                  sb           t3, 579(s5)
                  sb           t3, 435(s5)
                  lhu          t0, 1302(s5)
                  lb           t0, 1256(s5)
                  sb           a7, 145(s5)
                  sb           t6, 1290(s5)
                  sh           t0, 1216(s5)
                  sra          t0, a3, t0
                  sltu         s0, s0, t3
                  lb           a3, 759(s5)
                  lh           a7, 424(s5)
                  or           a7, s0, a3
                  c.sub        a3, a3
                  lb           a3, 351(s5)
                  lb           a3, 47(s5)
                  lbu          s0, 1801(s5)
                  sh           a3, 1020(s5)
                  lw           t0, 1774(s5)
                  lb           s0, 1353(s5)
                  srli         t3, a7, 5
                  c.li         s0, -1
                  lh           a7, 412(s5)
                  c.srai       s0, 6
                  c.lui        a7, 3
                  srl          a7, s0, t6
                  lbu          t0, 273(s5)
                  c.add        s0, s0
                  lb           a7, 1890(s5)
                  sll          t6, a3, t0
                  sh           t3, 1736(s5)
                  and          a7, a7, t6
                  remu         t6, t0, a3
                  sb           t3, 1464(s5) #end riscv_hazard_instr_stream_6
                  la           s2, region_1+34 #start load_store_instr_stream_0
                  la           s11, region_1+1061 #start load_store_instr_stream_4
                  la           tp, region_1+81 #start load_store_instr_stream_1
                  lbu          a5, 1(s11)
                  sb           a1, 50(tp)
                  lbu          ra, -11(s11)
                  la           t1, region_1+380 #start load_store_instr_stream_2
                  lhu          zero, 69(tp)
                  lbu          t6, 51(s2)
                  lbu          s10, 5(s11)
                  lb           s1, 13(t1)
                  lb           t3, 10(s2)
                  la           s3, region_1+1309 #start load_store_instr_stream_3
                  sb           s9, 8(s11)
                  lbu          s7, 20(s2)
                  lbu          ra, 246(s3)
                  lbu          a1, -61(s11)
                  lhu          ra, 22(s2)
                  lb           a5, 24(s11)
                  sb           ra, 23(tp)
                  sb           a7, 50(s11)
                  sb           t1, -97(s3)
                  lbu          a6, -228(s3)
                  lb           t4, 119(tp)
                  lbu          s1, 17(s2)
                  sb           ra, -37(s11)
                  lbu          a2, -72(s3)
                  sb           s0, 230(tp)
                  lb           a7, -7(t1)
                  lbu          s4, 6(tp)
                  lb           gp, -13(t1)
                  sb           sp, 1(t1)
                  lbu          s4, 64(s2)
                  lb           a1, -28(s11) #end load_store_instr_stream_4
                  lbu          gp, 7(s2)
                  lh           gp, 12(t1) #end load_store_instr_stream_2
                  lw           s1, 27(s3) #end load_store_instr_stream_3
                  sh           zero, 161(tp) #end load_store_instr_stream_1
                  sh           t0, -2(s2) #end load_store_instr_stream_0
                  la           a2, region_1+1527 #start load_store_instr_stream_1
                  la           t3, region_1+1168 #start load_store_instr_stream_0
                  sb           ra, -24(a2)
                  sh           a2, -4(t3)
                  lb           a0, -39(a2)
                  lbu          s1, -47(t3)
                  lbu          s1, -36(a2)
                  sb           t5, 17(t3)
                  lb           gp, -4(a2)
                  sb           s2, 17(t3)
                  lb           a1, -39(a2)
                  lbu          s7, -21(t3)
                  sh           t2, 24(t3)
                  sh           a4, -50(t3)
                  sb           gp, 50(a2) #end load_store_instr_stream_1
                  sh           tp, 4(t3) #end load_store_instr_stream_0
                  la           a4, region_0+1193 #start riscv_load_store_rand_instr_stream_10
                  sb           a3, 109(a4)
                  sb           a6, -224(a4)
                  remu         s7, a6, t3
                  sb           s0, 210(a4)
                  c.add        s9, t2
                  sb           s11, 132(a4)
                  addi         s10, a6, -1397
                  sb           a3, 62(a4)
                  slli         t0, s2, 28
                  c.li         a2, 8
                  c.mv         a1, t2
                  divu         a3, s0, gp
                  c.or         a5, a3
                  mulhu        s4, s8, t5
                  c.li         a2, -1
                  slt          s7, a3, s3
                  lb           t3, -74(a4)
                  auipc        t6, 748553
                  nop
                  c.andi       a1, 9
                  srl          a2, a4, s8
                  lbu          a7, 170(a4)
                  c.andi       s1, 19
                  c.slli       t0, 26
                  sb           gp, -36(a4)
                  lh           a2, -85(a4)
                  lbu          zero, -169(a4)
                  lhu          a1, -135(a4)
                  sb           s3, 14(a4)
                  sra          a3, tp, s1
                  lb           zero, 124(a4)
                  c.and        s0, a1
                  c.mv         t1, s1
                  rem          s0, a4, s6
                  c.or         s1, a4
                  slti         s11, a5, -1508
                  c.sub        a1, a0
                  c.sub        a2, a2
                  srli         t1, a4, 4
                  mulh         t4, t0, t6
                  addi         s10, s2, -554
                  c.or         s0, a1
                  xor          s9, t5, s1
                  lbu          a5, -16(a4) #end riscv_load_store_rand_instr_stream_10
                  la           gp, region_0+1168 #start load_store_instr_stream_1
                  sb           s0, 6(gp)
                  lbu          a7, -5(gp)
                  lh           a3, 8(gp)
                  lbu          s3, 11(gp)
                  lhu          s7, -12(gp)
                  la           s11, region_1+1861 #start load_store_instr_stream_0
                  sb           t6, -11(gp)
                  sh           s10, -21(s11)
                  lb           a1, -43(s11)
                  lbu          t6, -10(gp)
                  lb           s7, -56(s11)
                  sb           s9, 13(gp)
                  lhu          t4, 61(s11)
                  lbu          a1, -60(s11)
                  lb           ra, 7(gp)
                  sb           a7, -41(s11)
                  lbu          t6, -14(gp) #end load_store_instr_stream_1
                  sw           s5, -45(s11) #end load_store_instr_stream_0
                  la           t3, amo_0+48 #start riscv_lr_sc_instr_stream_10
                  sltiu        t4, t0, -969
                  slti         s1, t2, 453
                  slti         s7, t2, 8
                  lr.w.aq       s8, (t3)
                  sc.w.rl       a6, s5, (t3) #end riscv_lr_sc_instr_stream_10
                  la           s3, region_1+241 #start riscv_load_store_hazard_instr_stream_0
                  sb           t6, 2(s3)
                  lbu          s1, 14(s3)
                  c.or         a2, a4
                  lbu          s6, 14(s3)
                  nop
                  c.nop
                  sb           s7, 14(s3)
                  sb           gp, 14(s3)
                  sb           a4, 14(s3)
                  c.nop
                  c.nop
                  rem          s7, t1, s4
                  sb           a6, 14(s3)
                  lb           zero, 14(s3)
                  sb           s11, 14(s3)
                  lbu          a7, 14(s3)
                  sb           t3, 14(s3)
                  lh           a0, -13(s3)
                  lb           t1, 4(s3)
                  lui          s10, 240183
                  lbu          s5, 4(s3)
                  sb           a7, -8(s3)
                  sb           s7, -8(s3)
                  lbu          a1, -8(s3) #end riscv_load_store_hazard_instr_stream_0
sub_3_34:         jal          a0, 8f
0:                jal          t1, 9f
1:                c.jal        3f
2:                c.jal        1b
3:                c.jal        4f
4:                c.j          10f
5:                jal          ra, 7f
6:                c.j          5b
7:                c.jal        0b
8:                c.j          6b
9:                c.j          2b
10:               c.slli       s11, 17
sub_3_44:         jal          a0, 10f
0:                c.jal        17f
1:                jal          ra, 0b
2:                jal          t1, 16f
3:                c.j          6f
4:                c.jal        19f
5:                c.jal        1b
6:                c.j          23f
7:                c.jal        21f
8:                c.jal        3b
9:                jal          gp, 14f
10:               jal          tp, 15f
11:               c.j          18f
12:               c.j          22f
13:               c.j          9b
14:               c.j          11b
15:               c.j          2b
16:               jal          ra, 8b
17:               jal          t1, 20f
18:               jal          t1, 24f
19:               jal          a3, 5b
20:               jal          t0, 7b
21:               c.j          13b
22:               c.jal        4b
23:               c.jal        12b
24:               mul          a4, s2, s3
                  la           a2, amo_0+8 #start riscv_amo_instr_stream_1
                  amoswap.w     s3, a1, (a2)
                  amoor.w.aq    s2, a5, (a2)
                  amoxor.w      s5, zero, (a2)
                  amomaxu.w.aq  s0, t2, (a2)
                  amoand.w      gp, a7, (a2)
                  c.sub        a1, a5
                  amoadd.w.aq   a5, t3, (a2)
                  amoand.w.aq   s1, a7, (a2)
                  amoadd.w      ra, sp, (a2) #end riscv_amo_instr_stream_1
                  la           t1, region_0+1519 #start load_store_instr_stream_1
                  la           s11, region_0+73 #start load_store_instr_stream_0
                  lb           s10, 4(t1)
                  sh           s5, 1203(s11)
                  lb           s10, 1888(s11)
                  lbu          s5, 1227(s11)
                  sb           t1, -1(t1)
                  sw           zero, 9(t1)
                  lb           s3, 192(s11)
                  sb           a6, 6(t1)
                  lb           s10, 5(t1)
                  sb           a4, 1797(s11)
                  lb           a7, -6(t1)
                  lw           t4, -3(t1)
                  lb           s2, 1754(s11)
                  lbu          s5, -5(t1)
                  lh           s8, 817(s11)
                  lb           s3, 9(t1)
                  sb           s9, 4(t1) #end load_store_instr_stream_1
                  sh           zero, 1797(s11) #end load_store_instr_stream_0
                  la           a1, amo_0+16 #start riscv_amo_instr_stream_6
                  auipc        t0, 57518
                  c.slli       t1, 3
                  amomaxu.w.aq  s11, a7, (a1)
                  amoor.w.rl    s0, t4, (a1) #end riscv_amo_instr_stream_6
                  la           a0, amo_0+36 #start riscv_amo_instr_stream_11
                  amomax.w      zero, t2, (a0)
                  amomaxu.w.rl  a5, t6, (a0)
                  amoor.w       a7, tp, (a0)
                  amoand.w.rl   a2, a4, (a0)
                  amomaxu.w.aq  t0, s0, (a0)
                  amoand.w.rl   gp, t1, (a0)
                  amoor.w.rl    a7, s3, (a0)
                  c.sub        a5, a0
                  amominu.w.aq  s6, s11, (a0) #end riscv_amo_instr_stream_11
                  la           a6, region_0+1255 #start riscv_load_store_hazard_instr_stream_8
                  lb           s0, -56(a6)
                  slli         zero, s2, 15
                  sb           t0, -30(a6)
                  c.srai       a3, 24
                  sb           a1, -30(a6)
                  lb           t1, -30(a6)
                  lbu          s6, 22(a6)
                  sb           a0, 22(a6)
                  sltu         s11, t4, t2
                  lbu          t3, 22(a6)
                  lb           s3, 32(a6)
                  sb           s10, -63(a6)
                  lh           s2, -63(a6)
                  lh           a7, -63(a6) #end riscv_load_store_hazard_instr_stream_8
                  la           t6, region_0+78 #start load_store_instr_stream_1
                  la           s10, region_1+1914 #start load_store_instr_stream_0
                  sb           s2, 141(t6)
                  sb           gp, 245(t6)
                  lhu          gp, 156(t6)
                  sh           s3, 16(s10)
                  sh           s2, 242(t6)
                  lb           s9, 35(s10)
                  lhu          s0, -36(s10)
                  lb           s11, -21(s10)
                  lb           s4, 187(t6)
                  lbu          t1, 15(s10)
                  lbu          s2, 32(t6)
                  lbu          zero, 135(t6)
                  lhu          t4, -38(s10)
                  sb           a7, 75(t6) #end load_store_instr_stream_1
                  lb           s6, -37(s10) #end load_store_instr_stream_0
                  la           ra, region_1+744 #start riscv_load_store_hazard_instr_stream_15
                  sh           t6, -226(ra)
                  lb           s10, -237(ra)
                  srai         tp, zero, 5
                  sb           t0, -237(ra)
                  lb           s4, -237(ra)
                  sb           a7, -237(ra)
                  lb           s0, -237(ra)
                  c.li         t6, -1
                  lb           a3, -237(ra)
                  sb           s9, -237(ra)
                  lb           a4, -237(ra)
                  lb           t3, 82(ra)
                  lhu          a1, 82(ra)
                  sb           s0, 82(ra)
                  lbu          gp, 82(ra)
                  andi         s2, ra, 578
                  lhu          a7, 82(ra) #end riscv_load_store_hazard_instr_stream_15
sub_3_35:         jal          a0, 9f
0:                c.jal        10f
1:                c.jal        3f
2:                c.jal        11f
3:                c.j          2b
4:                c.jal        5f
5:                c.j          7f
6:                c.jal        0b
7:                c.jal        12f
8:                jal          ra, 1b
9:                jal          a7, 8b
10:               jal          t3, 4b
11:               c.j          6b
12:               c.lui        ra, 28
                  la           s9, region_1+425 #start riscv_load_store_rand_instr_stream_6
                  srli         s5, s7, 19
                  mul          a3, ra, s10
                  sb           a1, 534(s9)
                  lbu          ra, 408(s9)
                  sb           tp, 386(s9)
                  lb           a0, 449(s9)
                  sb           t3, -204(s9)
                  add          t4, sp, a3
                  mul          a3, t1, a0
                  sb           t5, -410(s9)
                  c.nop
                  c.mv         s7, s10
                  sh           s2, 1551(s9)
                  lui          s6, 536797
                  c.mv         s4, s4
                  lb           ra, 1530(s9)
                  lbu          t4, 688(s9)
                  sb           ra, -72(s9)
                  lh           s11, 159(s9)
                  sltiu        s5, t4, 1717
                  sub          s3, t2, s11
                  lbu          t4, 913(s9)
                  srli         s6, a6, 14
                  lw           t4, -57(s9)
                  sltiu        a7, t4, 1914
                  lbu          zero, 1290(s9) #end riscv_load_store_rand_instr_stream_6
sub_3_38:         jal          a0, 2f
0:                c.j          8f
1:                c.jal        9f
2:                c.jal        0b
3:                c.jal        12f
4:                c.j          10f
5:                c.j          6f
6:                c.j          11f
7:                c.j          4b
8:                c.j          1b
9:                c.jal        5b
10:               c.j          3b
11:               c.jal        7b
12:               addi         s2, t2, 691
                  la           a0, region_1+1909 #start load_store_instr_stream_1
                  la           tp, region_0+1821 #start load_store_instr_stream_0
                  lbu          t1, -11(a0)
                  lbu          s3, -16(tp)
                  sb           a2, -10(a0)
                  sb           t1, -13(tp)
                  lbu          s5, -13(a0)
                  lbu          a5, -8(a0)
                  lb           s3, -10(tp)
                  lbu          s7, 7(tp)
                  lbu          s11, 14(a0)
                  lbu          s3, -4(a0)
                  lb           s1, 2(tp)
                  sw           t6, 11(a0) #end load_store_instr_stream_1
                  lbu          s0, 5(tp) #end load_store_instr_stream_0
                  la           s9, region_1+305 #start riscv_load_store_hazard_instr_stream_13
                  sb           a7, 3(s9)
                  sb           s11, 0(s9)
                  div          s8, a1, s3
                  lb           t3, -4(s9)
                  lb           t6, -12(s9)
                  sb           t5, 1(s9)
                  sb           ra, -16(s9)
                  lh           s6, -3(s9)
                  sb           a5, -7(s9)
                  auipc        a5, 624733
                  sb           gp, -12(s9)
                  sb           s1, 14(s9)
                  sb           a5, 12(s9)
                  lb           a1, 12(s9)
                  sb           s9, -9(s9)
                  lhu          tp, -9(s9)
                  lbu          a6, 14(s9)
                  c.add        tp, a0
                  lbu          a2, 8(s9) #end riscv_load_store_hazard_instr_stream_13
                  addi         t0, zero, -2 #init loop 1 counter
                  auipc        zero, 679273
                  sra          s2, s9, a4
                  and          s5, s1, zero
                  addi         a7, zero, 20 #init loop 1 limit
sub_3_80_1_t:     xor          a2, t2, s6
                  addi         t0, t0, 2 #update loop 1 counter
                  c.add        t4, s11
                  mulhu        gp, t6, t4
                  addi         a1, zero, 10 #init loop 0 counter
                  or           a0, sp, s1
                  addi         s1, zero, -17 #init loop 0 limit
                  addi         s2, s6, -1568
sub_3_80_0_t:     mul          t1, a5, sp
                  remu         t4, gp, s5
                  slt          tp, t4, t2
                  srli         t1, s3, 23
                  slli         s4, s2, 19
                  auipc        s3, 788423
                  c.sub        a4, a0
                  c.addi       t1, 5
                  addi         a1, a1, -1 #update loop 0 counter
                  bge          a1, s1, sub_3_80_0_t #branch for loop 0
                  lui          s3, 3528
                  beq          t0, a7, sub_3_80_1_t #branch for loop 1
                  rem          ra, t0, a5
                  la           s5, amo_0+36 #start riscv_amo_instr_stream_3
                  la           t0, amo_0+28
                  amoxor.w.rl   a1, t1, (t0)
                  sra          a0, s9, a0
                  amominu.w     s4, zero, (s5)
                  amoand.w.rl   t6, s5, (s5)
                  c.or         a3, a1
                  amoadd.w.aq   a7, ra, (t0)
                  and          t3, s10, a1
                  amoadd.w.rl   t6, a6, (t0) #end riscv_amo_instr_stream_3
                  la           a0, amo_0+52 #start riscv_lr_sc_instr_stream_11
                  or           t6, t3, s10
                  sra          s10, t3, a6
                  c.xor        s0, a3
                  c.nop
                  auipc        a3, 762217
                  sltiu        tp, s7, 508
                  c.add        s11, s11
                  add          s3, t1, a5
                  lr.w.rl       a5, (a0)
                  lui          gp, 205394
                  sc.w          a3, a1, (a0) #end riscv_lr_sc_instr_stream_11
                  la           t0, region_0+891 #start riscv_hazard_instr_stream_1
                  lb           t3, -6(t0)
                  lhu          tp, 7(t0)
                  sb           t3, -14(t0)
                  lbu          s8, -10(t0)
                  lb           t3, -4(t0)
                  sb           s8, -2(t0)
                  lb           tp, 14(t0)
                  addi         t3, a7, 623
                  and          a4, a4, a4
                  c.li         s8, -1
                  c.li         a7, -1
                  divu         s8, a2, s8
                  c.li         tp, 7
                  c.nop
                  auipc        t3, 938604
                  sb           a2, 3(t0)
                  srli         a2, s8, 7
                  auipc        a7, 14896
                  lhu          s8, 13(t0)
                  srai         a2, a4, 5
                  c.and        a2, a2
                  lh           a7, -1(t0)
                  lbu          a2, -8(t0)
                  c.srli       a2, 28
                  lb           s8, -3(t0)
                  remu         a4, t3, tp
                  andi         a4, t3, -117
                  sb           a7, -4(t0)
                  mul          s8, a7, a2
                  xori         s8, a2, -1243
                  lbu          s8, 0(t0)
                  c.slli       a4, 16
                  sb           a2, 16(t0)
                  mulhu        tp, a2, a7
                  lbu          t3, -6(t0)
                  slt          tp, t3, s8
                  lb           t3, 8(t0)
                  lhu          a2, 11(t0)
                  sltiu        a4, a4, -580
                  ori          a4, a4, 2029
                  lui          t3, 1035887
                  srl          t3, a2, tp
                  sb           a7, -10(t0)
                  add          t3, a7, s8
                  sb           s8, -7(t0) #end riscv_hazard_instr_stream_1
                  addi         s4, zero, -4 #init loop 1 counter
                  and          ra, t4, s1
                  addi         s8, zero, -16 #init loop 1 limit
                  c.add        s1, a7
                  c.andi       a4, -1
sub_3_91_1_t:     c.nop
                  addi         s4, s4, -1 #update loop 1 counter
                  xori         s3, t6, -254
                  addi         s6, zero, -4 #init loop 0 counter
                  addi         t6, zero, -13 #init loop 0 limit
                  c.addi       t4, -1
                  sltu         s11, s0, t5
sub_3_91_0_t:     c.andi       s1, -1
                  srl          zero, tp, s6
                  c.li         a7, -1
                  addi         s6, s6, -3 #update loop 0 counter
                  c.srli       a0, 5
                  c.li         ra, -1
                  nop
                  beq          s6, t6, sub_3_91_0_t #branch for loop 0
                  c.srli       a3, 15
                  bge          s4, s8, sub_3_91_1_t #branch for loop 1
                  slli         a6, t2, 10
                  la           s7, region_1+1159 #start riscv_load_store_rand_instr_stream_13
                  lh           tp, -91(s7)
                  mulhsu       s6, a0, a4
                  lh           t6, 15(s7)
                  nop
                  srli         a7, a1, 12
                  sb           t1, -238(s7)
                  sb           a3, 106(s7)
                  andi         s4, a7, -1811
                  lbu          t3, 550(s7)
                  sub          ra, t6, s3
                  addi         gp, a4, 655
                  lh           zero, -531(s7)
                  mulhsu       t6, a1, s6
                  srli         s9, a0, 2
                  lb           a3, 760(s7)
                  c.mv         s8, a2
                  c.add        a5, a7
                  sltiu        t4, t4, -1666
                  xori         s5, a1, 1321
                  sll          s4, s10, gp
                  sb           t3, -71(s7)
                  lb           a6, -750(s7)
                  c.add        a7, s11
                  xor          s11, a1, a3
                  sb           t1, -491(s7)
                  c.andi       a0, 19
                  lhu          a1, -725(s7)
                  sh           a6, -369(s7)
                  rem          a4, s7, s1
                  add          tp, a7, a4
                  sw           ra, -979(s7)
                  sra          s10, s2, t4
                  sb           a4, -762(s7) #end riscv_load_store_rand_instr_stream_13
                  la           tp, amo_0+12 #start riscv_lr_sc_instr_stream_4
                  add          s2, t1, s5
                  sll          t3, t3, a4
                  slt          ra, gp, t6
                  lr.w.rl       zero, (tp)
                  c.and        s0, a3
                  sc.w.rl       zero, s0, (tp) #end riscv_lr_sc_instr_stream_4
                  la           s7, region_0+621 #start load_store_instr_stream_1
                  la           s4, region_1+557 #start load_store_instr_stream_0
                  lb           a4, -13(s7)
                  sb           a3, 34(s7)
                  sh           s6, -203(s4)
                  lhu          s1, 97(s4)
                  lbu          a5, 52(s7)
                  sw           t1, 3(s7)
                  lb           tp, 155(s4)
                  lb           a5, -135(s4)
                  lhu          s6, -11(s7) #end load_store_instr_stream_1
                  sh           a3, -55(s4) #end load_store_instr_stream_0
                  la           s5, region_0+483 #start load_store_instr_stream_1
                  la           a2, region_1+487 #start load_store_instr_stream_0
                  lbu          a7, 658(s5)
                  sb           gp, 27(a2)
                  lh           s8, 195(s5)
                  lbu          s3, 6(a2)
                  lb           s10, 312(s5)
                  lb           ra, 9(a2)
                  sb           a0, 1412(s5)
                  sw           a6, 1357(s5)
                  sh           t6, -43(a2)
                  sh           t4, 1389(s5)
                  lhu          s7, -5(a2)
                  sw           t2, 1153(s5) #end load_store_instr_stream_1
                  lb           a4, 20(a2) #end load_store_instr_stream_0
sub_3_39:         jal          a0, 0f
0:                c.jal        4f
1:                c.j          16f
2:                c.j          15f
3:                c.jal        11f
4:                c.j          3b
5:                jal          t1, 7f
6:                jal          s11, 14f
7:                c.j          6b
8:                c.jal        1b
9:                c.jal        10f
10:               c.j          5b
11:               c.jal        2b
12:               c.j          9b
13:               c.jal        12b
14:               c.jal        8b
15:               c.jal        13b
16:               c.srli       a1, 5
                  la           a0, region_0+1893 #start riscv_load_store_hazard_instr_stream_9
                  lbu          a7, -24(a0)
                  lb           a6, -1(a0)
                  lw           a3, 7(a0)
                  lb           s10, 38(a0)
                  lb           a2, 4(a0)
                  lw           t0, -37(a0)
                  lh           tp, -37(a0)
                  sb           t4, 39(a0)
                  lbu          t3, 39(a0)
                  sb           a5, -34(a0)
                  lbu          s2, 58(a0)
                  sb           t0, 8(a0)
                  sb           a4, -4(a0)
                  lbu          s11, -4(a0)
                  lbu          s3, 2(a0)
                  div          a7, s0, a1
                  sb           s8, 2(a0) #end riscv_load_store_hazard_instr_stream_9
                  la           a6, region_1+1036 #start load_store_instr_stream_1
                  lw           a3, -44(a6)
                  la           t3, region_1+27 #start load_store_instr_stream_0
                  sb           a2, -57(a6)
                  lhu          a5, -60(a6)
                  lb           s6, 38(t3)
                  lb           s6, 28(t3)
                  lh           a7, 9(t3)
                  lbu          zero, 37(a6)
                  lbu          t4, 26(t3)
                  lh           s7, -22(a6) #end load_store_instr_stream_1
                  sh           s7, 43(t3)
                  sh           t2, 47(t3) #end load_store_instr_stream_0
                  la           s3, region_0+459 #start load_store_instr_stream_1
                  lbu          s1, 158(s3)
                  lb           zero, 135(s3)
                  lb           s11, 88(s3)
                  la           s6, region_0+721 #start load_store_instr_stream_0
                  lbu          s11, -14(s6)
                  sh           gp, 1(s6)
                  sh           a5, -7(s6)
                  lhu          s5, 233(s3)
                  lbu          a3, 25(s3)
                  lw           a5, 3(s6)
                  lb           a5, 46(s3)
                  lh           a2, 15(s6)
                  lb           t0, 193(s3)
                  lbu          t6, 36(s3)
                  lb           s11, 12(s6)
                  lb           a3, -14(s6)
                  sb           tp, 118(s3)
                  lb           a5, -27(s3) #end load_store_instr_stream_1
                  sw           t4, 3(s6) #end load_store_instr_stream_0
                  la           s9, region_0+1889 #start riscv_load_store_rand_instr_stream_8
                  lbu          t1, -927(s9)
                  lbu          t4, -1109(s9)
                  lbu          a5, -1149(s9)
                  sb           s9, -137(s9)
                  lb           t0, -920(s9)
                  or           zero, s11, s11
                  div          s8, t3, a1
                  sb           s7, -1098(s9)
                  slli         s6, s7, 7
                  andi         s5, t6, -2022
                  sw           t2, -1745(s9)
                  c.lui        t0, 22
                  c.addi       a6, 16
                  sb           a3, -1694(s9)
                  slli         gp, a1, 9
                  remu         ra, s1, t4
                  divu         t6, a1, a0
                  c.li         a6, -1
                  c.nop
                  lbu          a0, 82(s9)
                  c.addi       s10, -1
                  sb           zero, -1391(s9)
                  sltu         a6, s4, s0
                  sub          s4, s8, a5
                  rem          s11, t1, sp
                  mulhsu       s5, t5, t6
                  lbu          a5, -1539(s9)
                  c.slli       a5, 7
                  slli         a5, a6, 24
                  sb           zero, -1248(s9)
                  div          s3, t1, s3
                  divu         s0, a0, t2
                  auipc        a6, 193938
                  lw           a2, -393(s9) #end riscv_load_store_rand_instr_stream_8
                  la           s0, region_1+562 #start riscv_load_store_rand_instr_stream_4
                  sltiu        t6, t2, -1825
                  c.andi       a5, -1
                  srai         s7, s3, 16
                  lbu          t6, 219(s0)
                  c.mv         a2, s8
                  remu         a3, s5, a0
                  sb           t4, 137(s0)
                  c.srli       a1, 25
                  sw           a2, 138(s0)
                  c.or         a2, a1
                  lbu          t3, -245(s0)
                  sb           t3, 93(s0)
                  c.nop
                  lb           s5, -67(s0)
                  sh           a4, -212(s0)
                  c.andi       a2, 19
                  lh           a1, 158(s0)
                  lbu          s1, 191(s0)
                  lb           zero, -3(s0)
                  lbu          s9, -225(s0)
                  lbu          a4, 200(s0)
                  lbu          a2, 177(s0)
                  or           t0, s8, ra
                  c.mv         t0, a2
                  c.slli       s3, 17
                  lbu          s6, 51(s0)
                  mul          gp, s3, tp
                  c.mv         s9, t3
                  lhu          a2, -156(s0)
                  lbu          zero, -205(s0)
                  c.li         t0, -1
                  lb           t6, 117(s0)
                  add          t6, t2, s11
                  sb           s4, 7(s0)
                  lbu          s9, 213(s0)
                  sb           s10, 101(s0)
                  mulhsu       s2, s2, a7
                  andi         t0, a1, -683
                  lbu          ra, 25(s0)
                  sb           s0, 7(s0)
                  sh           a2, -246(s0)
                  lhu          s11, -232(s0)
                  sb           t3, -56(s0)
                  div          a7, t2, a1
                  sb           a3, -75(s0)
                  c.srai       a3, 29
                  sb           t1, -117(s0)
                  lbu          a5, 196(s0)
                  c.addi       s3, -1
                  lh           s11, 122(s0) #end riscv_load_store_rand_instr_stream_4
                  la           tp, region_1+414 #start riscv_load_store_hazard_instr_stream_11
                  lbu          s6, -5(tp)
                  lb           a7, -11(tp)
                  lbu          t3, -9(tp)
                  lb           a1, -9(tp)
                  lb           a0, -5(tp)
                  xori         zero, t1, -820
                  lb           t1, 3(tp)
                  lb           a6, 3(tp)
                  lb           a0, 11(tp)
                  lbu          a1, 11(tp)
                  lb           s3, 11(tp)
                  lb           a5, 11(tp)
                  sb           a4, 11(tp)
                  sh           zero, -14(tp)
                  lbu          s2, -2(tp)
                  lb           s8, 3(tp)
                  sh           gp, -6(tp) #end riscv_load_store_hazard_instr_stream_11
                  addi         s10, zero, 7 #init loop 1 counter
                  and          a1, s0, t2
                  addi         s4, zero, -9 #init loop 1 limit
sub_3_86_1_t:     c.addi4spn   a1, sp, 736
                  addi         s10, s10, -4 #update loop 1 counter
                  addi         a0, zero, 10 #init loop 0 counter
                  xori         a3, t0, 1147
                  addi         zero, zero, 0 #init loop 0 limit
sub_3_86_0_t:     ori          s2, s3, -1970
                  nop
                  addi         a0, a0, -5 #update loop 0 counter
                  sll          s9, t2, a2
                  c.bnez       a0, sub_3_86_0_t #branch for loop 0
                  c.andi       a1, -1
                  bne          s10, s4, sub_3_86_1_t #branch for loop 1
                  nop
                  la           s9, region_0+1969 #start riscv_load_store_rand_instr_stream_1
                  and          a4, tp, sp
                  c.or         a3, a3
                  div          t3, s4, a0
                  c.addi       a7, -1
                  sb           s8, -1020(s9)
                  lb           a3, -172(s9)
                  lhu          a3, -1227(s9)
                  or           t0, s4, t0
                  divu         s5, s8, s10
                  xor          s8, ra, s11
                  c.addi       a3, -1
                  lhu          a7, -1639(s9)
                  lb           gp, -1117(s9)
                  sub          a1, tp, zero
                  ori          ra, t0, -1744
                  c.mv         a6, s5
                  sb           s0, -705(s9)
                  lbu          s11, -1007(s9)
                  lb           s7, -1514(s9)
                  lbu          a6, -154(s9)
                  sb           s7, -1611(s9)
                  lbu          t3, -600(s9)
                  lhu          a6, -1283(s9)
                  c.or         a0, a1
                  slti         a4, a7, -1950
                  c.addi       s7, -1
                  auipc        s4, 933514
                  c.or         a3, a3
                  lb           tp, -548(s9)
                  lbu          s8, -1930(s9)
                  sb           s3, -156(s9)
                  lb           t4, -424(s9)
                  c.srli       a5, 18
                  c.and        s1, a1
                  sb           s5, -1876(s9)
                  lb           s1, -1198(s9)
                  slti         tp, s11, -1668
                  c.andi       a3, -1
                  or           t1, sp, s8
                  c.sub        a2, s0
                  remu         a0, a0, a4
                  c.nop
                  or           a2, t0, s7
                  mulh         t0, gp, t4
                  lb           t4, -39(s9)
                  sb           s6, -1284(s9) #end riscv_load_store_rand_instr_stream_1
                  la           s6, region_0+1763 #start riscv_load_store_hazard_instr_stream_12
                  lb           a5, 7(s6)
                  lb           s7, 7(s6)
                  lb           a6, 8(s6)
                  lb           a0, 8(s6)
                  lbu          t0, 8(s6)
                  lb           t0, 8(s6)
                  lb           a4, 8(s6)
                  sb           s5, 8(s6)
                  sra          a7, s1, a1
                  rem          s3, t3, a3
                  slt          a1, zero, s4
                  lh           a2, -15(s6)
                  and          s7, s3, s5
                  slli         s7, a5, 20
                  mulhsu       zero, a2, tp
                  lhu          s11, -15(s6) #end riscv_load_store_hazard_instr_stream_12
                  la           t3, region_1+1386 #start riscv_load_store_hazard_instr_stream_3
                  lbu          s8, 14(t3)
                  c.nop
                  sw           s3, 14(t3)
                  c.or         a0, a1
                  lbu          s4, 14(t3)
                  lbu          s11, 14(t3)
                  c.srli       a0, 16
                  sh           s6, 14(t3)
                  sb           t3, -49(t3)
                  lbu          gp, 59(t3)
                  lb           t0, 59(t3)
                  sb           s1, 59(t3)
                  lb           s6, 59(t3) #end riscv_load_store_hazard_instr_stream_3
                  la           a1, region_0+1474 #start riscv_load_store_hazard_instr_stream_10
                  sb           t3, 171(a1)
                  lui          a0, 442857
                  lbu          zero, -249(a1)
                  mul          s3, s5, a4
                  xor          a5, t5, s11
                  or           s9, t3, a6
                  lw           tp, -218(a1)
                  lhu          t0, -218(a1)
                  sb           t4, -218(a1)
                  c.srli       s0, 14
                  sub          t4, a3, t5
                  divu         s11, s8, a6
                  sw           a3, -218(a1)
                  lbu          gp, -246(a1)
                  sb           ra, -246(a1)
                  lbu          a3, -246(a1)
                  lhu          t3, 224(a1)
                  sb           s2, -178(a1)
                  sh           a3, 176(a1)
                  lb           a5, 176(a1)
                  lh           t4, 176(a1)
                  lb           t3, 176(a1)
                  lb           s11, -101(a1) #end riscv_load_store_hazard_instr_stream_10
                  la           gp, region_0+597 #start load_store_instr_stream_3
                  la           s8, region_0+840 #start load_store_instr_stream_0
                  la           a5, region_0+200 #start load_store_instr_stream_1
                  lh           s2, -71(gp)
                  la           s7, region_0+883 #start load_store_instr_stream_4
                  lhu          a6, 143(gp)
                  lb           a3, 485(a5)
                  lbu          t6, 75(gp)
                  la           ra, region_0+1482 #start load_store_instr_stream_2
                  sb           sp, 477(a5)
                  sb           s7, -200(gp)
                  lh           a3, -974(ra)
                  sb           t0, -2(s8)
                  sb           a4, 1735(a5)
                  lb           t4, -172(gp)
                  lb           s10, -549(ra)
                  sb           s9, 18(s7)
                  lbu          s4, 188(gp)
                  lh           a7, 10(s8)
                  lbu          s0, -147(gp)
                  lbu          s0, 147(a5)
                  sb           a5, 1679(a5)
                  sb           ra, -52(s7)
                  lbu          s6, -983(ra)
                  lbu          a0, -11(s8)
                  sb           s0, 1116(a5)
                  lb           s2, -14(s8)
                  lbu          s6, -138(gp)
                  lbu          s1, 1(s8)
                  sb           t3, 13(s7)
                  lhu          t1, 249(gp)
                  sb           ra, -769(ra)
                  lbu          s9, -10(s8)
                  lh           s2, 63(s7)
                  lb           s5, 1760(a5)
                  lh           tp, 189(gp) #end load_store_instr_stream_3
                  lbu          t1, 12(s8)
                  sh           s10, 920(a5)
                  lh           s5, -9(s7) #end load_store_instr_stream_4
                  lb           a7, 339(a5)
                  lh           s5, -412(ra) #end load_store_instr_stream_2
                  lh           a2, 406(a5) #end load_store_instr_stream_1
                  lb           a3, 15(s8) #end load_store_instr_stream_0
                  la           a6, region_1+740 #start riscv_hazard_instr_stream_10
                  sb           a7, 33(a6)
                  add          a3, tp, s9
                  sb           tp, -6(a6)
                  mulh         a7, a7, s3
                  lhu          s3, 34(a6)
                  c.srli       a3, 29
                  lb           a3, 5(a6)
                  and          a3, s9, tp
                  auipc        a2, 22548
                  andi         s9, s3, 62
                  c.sub        a2, a3
                  sb           tp, -25(a6)
                  auipc        tp, 11260
                  sb           a2, 62(a6)
                  c.lui        tp, 1
                  c.mv         s3, a2
                  lw           a7, 0(a6)
                  sh           s9, -34(a6)
                  lbu          s9, 64(a6)
                  lh           a7, -16(a6)
                  sb           s3, 26(a6)
                  lbu          a3, 30(a6)
                  remu         tp, a3, s3
                  sll          a3, a3, s9
                  sb           s9, -31(a6)
                  srl          s9, s3, s3
                  c.mv         a3, a3
                  lbu          a7, 58(a6)
                  c.li         a3, -1
                  sh           a2, -32(a6)
                  addi         s3, s9, -327
                  lhu          s9, 34(a6)
                  lb           s3, 54(a6)
                  lbu          a3, 3(a6)
                  c.srli       a3, 29
                  lbu          s3, 33(a6)
                  sra          s3, tp, s9
                  lbu          a2, -63(a6) #end riscv_hazard_instr_stream_10
                  la           a1, region_0+222 #start riscv_load_store_hazard_instr_stream_14
                  sh           a6, 8(a1)
                  lbu          t0, 8(a1)
                  sb           s11, -9(a1)
                  lh           s2, 16(a1)
                  lbu          a7, 13(a1)
                  slti         a2, s5, -762
                  sb           t0, 13(a1)
                  sh           gp, -2(a1)
                  sh           s11, -2(a1)
                  lbu          t4, -2(a1)
                  sb           t4, -2(a1)
                  sb           t6, 1(a1)
                  lbu          t4, 1(a1)
                  c.sub        a2, a0
                  sb           gp, 1(a1)
                  lb           s7, 1(a1)
                  lbu          t6, 1(a1) #end riscv_load_store_hazard_instr_stream_14
                  addi         a1, zero, 8 #init loop 0 counter
                  divu         s9, s1, s10
                  addi         zero, zero, 0 #init loop 0 limit
                  nop
                  divu         t3, s9, s11
                  c.or         a4, a3
                  srl          a6, s6, tp
                  slt          s1, sp, s7
                  c.andi       a5, 6
sub_3_85_0_t:     nop
                  remu         s8, a4, s7
                  addi         a1, a1, -8 #update loop 0 counter
                  c.or         a4, a1
                  ori          a6, sp, -1727
                  c.srli       s1, 8
                  c.addi       a3, 27
                  c.beqz       a1, sub_3_85_0_t #branch for loop 0
                  c.lui        t6, 10
                  la           t0, region_1+719 #start load_store_instr_stream_1
                  la           s2, region_0+879 #start load_store_instr_stream_0
                  lb           a2, -24(t0)
                  lw           zero, -39(s2)
                  lbu          t4, 59(t0)
                  lhu          s10, 15(s2)
                  lw           a0, 29(s2)
                  lb           s0, 4(s2)
                  lb           zero, -16(s2)
                  lh           s3, 139(t0)
                  lw           s1, -43(s2)
                  lh           ra, -121(t0)
                  sb           a4, -62(t0) #end load_store_instr_stream_1
                  lb           s11, 56(s2)
                  sb           s1, -31(s2) #end load_store_instr_stream_0
sub_3_42:         jal          a0, 2f
0:                c.jal        5f
1:                jal          ra, 13f
2:                c.j          15f
3:                jal          t1, 12f
4:                jal          t3, 6f
5:                c.j          3b
6:                jal          tp, 9f
7:                c.j          19f
8:                jal          t1, 4b
9:                jal          ra, 10f
10:               c.j          17f
11:               jal          ra, 1b
12:               c.j          7b
13:               jal          a6, 8b
14:               jal          ra, 16f
15:               c.j          11b
16:               c.jal        18f
17:               jal          t0, 14b
18:               c.jal        0b
19:               c.mv         a4, tp
                  la           s6, amo_0+36 #start riscv_lr_sc_instr_stream_0
                  auipc        t1, 145626
                  c.li         t3, -1
                  sltiu        t0, a4, -598
                  c.nop
                  lr.w          a4, (s6)
                  lui          t3, 432565
                  sc.w.rl       zero, s2, (s6) #end riscv_lr_sc_instr_stream_0
                  la           s3, region_1+952 #start riscv_load_store_hazard_instr_stream_5
                  lbu          a2, -7(s3)
                  lbu          s6, -7(s3)
                  sb           s10, -7(s3)
                  sb           s5, -7(s3)
                  nop
                  lbu          ra, 16(s3)
                  srli         s11, a0, 7
                  lw           s5, 16(s3)
                  sh           t3, 16(s3)
                  lbu          a7, 16(s3)
                  mulh         a6, s9, t4
                  lbu          t0, 16(s3)
                  lhu          zero, 16(s3)
                  lb           a4, 16(s3)
                  lw           a5, 16(s3)
                  sub          a1, a4, s6
                  lhu          a3, 16(s3)
                  lhu          gp, 16(s3)
                  lw           a2, 16(s3)
                  sh           s3, 16(s3)
                  sh           a2, 16(s3) #end riscv_load_store_hazard_instr_stream_5
sub_3_32:         jal          a0, 2f
0:                c.j          11f
1:                c.jal        5f
2:                c.j          10f
3:                c.j          0b
4:                c.j          1b
5:                c.jal        6f
6:                c.jal        7f
7:                c.j          8f
8:                c.j          3b
9:                c.j          4b
10:               c.jal        9b
11:               c.nop
                  la           s9, amo_0+8 #start riscv_lr_sc_instr_stream_3
                  lr.w.rl       a2, (s9)
                  sc.w          s1, gp, (s9) #end riscv_lr_sc_instr_stream_3
                  la           s0, region_0+1826 #start riscv_hazard_instr_stream_4
                  sb           s7, -15(s0)
                  sb           t0, 13(s0)
                  ori          t0, t0, -1692
                  lhu          tp, 54(s0)
                  divu         s7, s7, s7
                  sh           tp, 52(s0)
                  lb           tp, -23(s0)
                  lbu          t0, -36(s0)
                  lh           a2, 58(s0)
                  lb           a3, 23(s0)
                  lb           s7, -11(s0)
                  c.lui        s7, 21
                  lbu          s7, -11(s0)
                  sb           tp, 31(s0)
                  lh           s5, -50(s0)
                  sw           tp, 22(s0)
                  sb           s7, -34(s0)
                  add          a2, s7, t0
                  c.slli       a2, 30
                  or           s5, s5, a3
                  sub          s5, t0, s5
                  sb           a2, 45(s0)
                  lh           s7, 8(s0)
                  lb           t0, 17(s0)
                  andi         a3, t0, -510
                  sb           tp, 11(s0)
                  lh           s5, 50(s0)
                  sb           tp, 27(s0)
                  c.xor        a3, a2
                  c.xor        a2, a2
                  lh           a2, 26(s0)
                  lbu          a3, -45(s0)
                  srli         a3, a2, 1
                  lh           t0, -62(s0)
                  c.sub        a3, a3
                  lb           a3, -5(s0)
                  lh           a2, -16(s0)
                  lb           s5, 27(s0)
                  lbu          t0, -49(s0)
                  lbu          tp, -18(s0)
                  lb           tp, 20(s0) #end riscv_hazard_instr_stream_4
                  la           s9, region_0+1755 #start riscv_hazard_instr_stream_14
                  c.srai       a4, 6
                  or           ra, a4, a4
                  remu         s1, t0, t0
                  srli         s10, t0, 7
                  c.nop
                  sh           t0, -77(s9)
                  lb           ra, -171(s9)
                  lb           t0, -98(s9)
                  c.nop
                  lbu          a4, -178(s9)
                  lbu          ra, -218(s9)
                  rem          s6, t0, t0
                  sb           ra, 84(s9)
                  c.srai       s1, 19
                  lh           t0, 87(s9)
                  c.and        a4, s1
                  sb           a4, 242(s9)
                  sh           s6, -213(s9)
                  srl          s1, t0, s6
                  srai         s10, s6, 29
                  sub          s6, s1, s10
                  xori         s1, a4, 1694
                  and          t0, t0, ra
                  rem          t0, t0, a4
                  lb           ra, 150(s9)
                  lb           s10, -80(s9)
                  lb           s1, 80(s9) #end riscv_hazard_instr_stream_14
sub_3_43:         jal          a0, 0f
0:                c.j          3f
1:                c.j          15f
2:                c.jal        5f
3:                c.jal        4f
4:                c.jal        11f
5:                jal          s7, 6f
6:                c.jal        8f
7:                c.jal        1b
8:                c.j          9f
9:                jal          ra, 12f
10:               c.jal        14f
11:               c.j          10b
12:               jal          ra, 13f
13:               c.jal        7b
14:               jal          a4, 2b
15:               c.jal        16f
16:               c.or         a5, a5
                  la           a4, region_0+1850 #start load_store_instr_stream_2
                  la           s9, region_0+1793 #start load_store_instr_stream_0
                  la           t1, region_0+1100 #start load_store_instr_stream_1
                  sb           a0, -36(s9)
                  sh           t2, 0(a4)
                  sh           a7, 46(t1)
                  lh           s2, 9(s9)
                  lb           s4, -116(t1)
                  lbu          a7, 2(s9)
                  lb           a2, -55(t1)
                  lhu          s8, 9(s9)
                  lb           t0, -54(s9)
                  sh           gp, 120(t1)
                  lhu          s7, -17(s9)
                  sw           s10, -14(a4)
                  sb           s10, -18(s9)
                  lb           a5, -52(s9)
                  lh           ra, -32(t1)
                  sh           t5, -110(t1)
                  lbu          zero, 5(a4)
                  lb           t6, 202(t1)
                  lbu          a6, 51(s9)
                  lb           s10, -185(t1)
                  sb           a3, -33(a4)
                  lbu          zero, 14(t1) #end load_store_instr_stream_1
                  lh           a5, 64(a4) #end load_store_instr_stream_2
                  lb           s3, 34(s9) #end load_store_instr_stream_0
sub_3_30:         jal          a0, 9f
0:                jal          ra, 12f
1:                jal          ra, 20f
2:                c.j          3f
3:                c.j          24f
4:                c.jal        17f
5:                c.j          0b
6:                c.j          8f
7:                jal          ra, 6b
8:                c.j          13f
9:                c.j          16f
10:               c.j          5b
11:               jal          ra, 7b
12:               jal          tp, 22f
13:               jal          ra, 25f
14:               c.jal        21f
15:               c.jal        4b
16:               jal          s10, 18f
17:               c.jal        14b
18:               jal          a5, 2b
19:               jal          ra, 11b
20:               jal          ra, 19b
21:               c.j          26f
22:               jal          ra, 27f
23:               jal          ra, 15b
24:               c.jal        23b
25:               c.jal        10b
26:               c.j          1b
27:               xor          s5, t4, s1
sub_3_33:         jal          a0, 16f
0:                jal          t1, 15f
1:                jal          t1, 0b
2:                c.j          6f
3:                jal          ra, 2b
4:                jal          s10, 11f
5:                jal          a4, 12f
6:                c.jal        4b
7:                jal          ra, 18f
8:                jal          ra, 21f
9:                c.jal        10f
10:               jal          t0, 17f
11:               c.j          7b
12:               c.j          22f
13:               c.jal        1b
14:               jal          t1, 8b
15:               jal          s1, 14b
16:               c.jal        9b
17:               c.j          25f
18:               c.jal        5b
19:               jal          ra, 26f
20:               c.j          13b
21:               jal          tp, 19b
22:               c.j          24f
23:               jal          a2, 20b
24:               c.jal        23b
25:               jal          s6, 3b
26:               xori         zero, gp, 964
sub_3_31:         jal          a0, 5f
0:                jal          ra, 12f
1:                jal          t1, 10f
2:                jal          a6, 9f
3:                c.jal        4f
4:                c.j          0b
5:                c.jal        7f
6:                jal          ra, 1b
7:                c.j          11f
8:                c.jal        6b
9:                c.jal        8b
10:               c.j          3b
11:               jal          a5, 2b
12:               andi         a4, s5, 735
                  la           s1, amo_0+16 #start riscv_lr_sc_instr_stream_8
                  sltu         a6, a5, a5
                  lr.w.rl       t6, (s1)
                  sra          a6, a1, s3
                  sc.w.rl       a5, s10, (s1) #end riscv_lr_sc_instr_stream_8
                  la           t4, region_0+337 #start riscv_load_store_hazard_instr_stream_16
                  lb           s5, 31(t4)
                  lb           s1, 17(t4)
                  sb           zero, 17(t4)
                  lbu          s3, 17(t4)
                  div          s9, s10, s8
                  lbu          gp, 17(t4)
                  lhu          a7, 17(t4)
                  lh           t3, 17(t4)
                  sb           s6, -52(t4)
                  lb           s9, 18(t4)
                  sh           a3, -33(t4)
                  sh           sp, 47(t4)
                  lh           s3, 9(t4)
                  lbu          s4, 9(t4)
                  xor          a1, s6, sp
                  lbu          a3, 15(t4)
                  c.andi       a4, -1
                  sb           s8, 15(t4)
                  lw           s11, 15(t4)
                  lb           ra, 15(t4)
                  sh           a3, 15(t4)
                  mulh         s0, s5, t1
                  remu         s6, s11, a5
                  sh           s8, 15(t4) #end riscv_load_store_hazard_instr_stream_16
                  la           s3, region_1+1967 #start riscv_load_store_hazard_instr_stream_4
                  lbu          t0, 28(s3)
                  lbu          t3, 28(s3)
                  lb           t6, 28(s3)
                  c.or         s1, a2
                  lbu          s2, 28(s3)
                  sra          a2, s10, s4
                  lbu          s9, 28(s3)
                  lbu          tp, 28(s3)
                  c.lui        s6, 18
                  sb           s2, -25(s3)
                  lhu          s9, -7(s3)
                  mulh         zero, s1, a5
                  lbu          tp, -7(s3)
                  lw           t4, -7(s3)
                  lbu          t3, -7(s3)
                  nop
                  lbu          s0, -7(s3)
                  sh           t0, -7(s3)
                  sh           s5, -7(s3)
                  slli         a3, a3, 3
                  divu         t0, t1, tp
                  lbu          a5, -7(s3)
                  sw           t4, -7(s3)
                  lhu          s5, -7(s3)
                  sb           s9, -5(s3) #end riscv_load_store_hazard_instr_stream_4
                  la           s6, region_1+677 #start load_store_instr_stream_1
                  la           a7, region_0+1799 #start load_store_instr_stream_0
                  sw           s9, -7(a7)
                  lbu          t0, -152(s6)
                  sb           a2, 4(a7)
                  lb           s11, -71(s6)
                  lb           s8, 182(s6)
                  lb           t4, -7(a7)
                  sb           a2, 5(a7)
                  sb           s10, 229(s6)
                  sh           s7, -13(a7)
                  lb           s9, -68(s6)
                  sh           s0, -3(a7)
                  lw           t4, -241(s6) #end load_store_instr_stream_1
                  sb           a3, -10(a7)
                  lh           s10, -5(a7) #end load_store_instr_stream_0
                  la           s2, amo_0+0 #start riscv_lr_sc_instr_stream_5
                  lr.w.rl       s7, (s2)
                  sc.w          s1, s0, (s2) #end riscv_lr_sc_instr_stream_5
                  la           s11, region_0+1580 #start load_store_instr_stream_0
                  lb           s1, -53(s11)
                  la           s2, region_1+1221 #start load_store_instr_stream_1
                  sw           t0, 108(s11)
                  sb           zero, 255(s11)
                  sh           a6, 61(s2)
                  sb           a2, -27(s11)
                  lbu          t0, -64(s2)
                  sb           s7, 62(s11)
                  sb           t5, 55(s11)
                  lbu          a0, -6(s2)
                  sb           s11, 2(s11)
                  lbu          a1, -205(s11)
                  sw           s10, -61(s2)
                  sb           sp, 53(s2)
                  lbu          gp, 12(s2) #end load_store_instr_stream_1
                  lbu          a6, 166(s11)
                  lb           s1, -199(s11) #end load_store_instr_stream_0
sub_3_45:         jal          a0, 4f
0:                c.j          10f
1:                c.jal        7f
2:                c.j          23f
3:                jal          s6, 22f
4:                jal          tp, 3b
5:                jal          ra, 19f
6:                c.jal        0b
7:                c.jal        12f
8:                c.jal        2b
9:                jal          s7, 11f
10:               jal          a2, 17f
11:               c.j          21f
12:               jal          ra, 24f
13:               c.jal        20f
14:               c.j          18f
15:               c.jal        6b
16:               c.jal        25f
17:               c.jal        14b
18:               c.j          8b
19:               c.j          16b
20:               c.j          9b
21:               c.j          5b
22:               c.jal        1b
23:               c.jal        13b
24:               c.j          15b
25:               c.srli       a5, 27
                  la           s8, region_1+1532 #start riscv_load_store_rand_instr_stream_5
                  c.or         a3, a3
                  lb           s7, -9(s8)
                  lbu          s4, -8(s8)
                  lb           zero, 8(s8)
                  addi         s6, a7, -1386
                  lhu          s4, -10(s8)
                  sltu         a1, s7, a0
                  lbu          t6, -10(s8)
                  c.lui        s4, 23
                  lb           a3, -1(s8)
                  c.add        s5, t2
                  sw           a5, 4(s8)
                  sh           sp, 16(s8)
                  lbu          a3, -11(s8)
                  sra          a3, s7, a4
                  c.mv         a0, sp
                  sltiu        s2, t0, 284
                  sh           a7, -4(s8)
                  mulh         a3, s1, ra
                  sw           t0, -16(s8)
                  sh           s0, -12(s8)
                  c.andi       a4, -1
                  lbu          t3, -15(s8)
                  c.and        a3, a4
                  mulhsu       a0, s9, t4
                  sb           t4, -14(s8)
                  mul          s6, t2, t3
                  sb           a3, -5(s8)
                  auipc        s4, 61983
                  sb           s4, 13(s8)
                  lbu          s2, 12(s8)
                  sb           a6, -11(s8)
                  lhu          a7, 6(s8)
                  slli         s3, s7, 24
                  sb           a7, 9(s8)
                  lb           a1, 1(s8)
                  sb           s1, 9(s8)
                  sh           a4, -8(s8) #end riscv_load_store_rand_instr_stream_5
                  la           gp, amo_0+12 #start riscv_amo_instr_stream_7
                  la           a6, amo_0+32
                  sll          s0, s9, s7
                  amomax.w      t6, s1, (gp)
                  c.xor        a4, s1
                  amoxor.w.aq   ra, s6, (a6) #end riscv_amo_instr_stream_7
                  la           s2, amo_0+24 #start riscv_amo_instr_stream_0
                  la           s1, amo_0+8
                  la           t6, amo_0+40
                  la           a0, amo_0+12
                  amominu.w.rl  s10, s11, (t6)
                  slt          t0, s0, s11
                  amoand.w.rl   s10, s11, (a0)
                  amomaxu.w.rl  s3, s1, (s1)
                  c.li         s8, -1
                  amomin.w.rl   t3, a5, (s2)
                  amoor.w.rl    t0, s8, (a0) #end riscv_amo_instr_stream_0
                  la           s11, region_1+73 #start riscv_load_store_rand_instr_stream_15
                  lb           tp, 15(s11)
                  lbu          s0, -6(s11)
                  lh           s6, 1(s11)
                  sb           a1, 5(s11)
                  c.xor        a2, s0
                  lb           s6, 15(s11)
                  or           s9, s0, s10
                  sh           s7, -5(s11)
                  lb           s2, 0(s11)
                  sh           t0, -13(s11)
                  lh           s10, -5(s11)
                  c.lui        a2, 9
                  rem          t4, sp, s6
                  lbu          s4, 16(s11)
                  sltiu        zero, a1, 1143
                  andi         zero, t4, 1537
                  slti         tp, a7, 496
                  lh           a7, 13(s11)
                  sra          a1, s4, a3
                  slti         a5, s4, 1698
                  slt          t3, a5, zero
                  sh           t2, 1(s11)
                  lb           s5, -8(s11)
                  c.slli       t0, 17
                  mul          s10, a7, tp
                  lui          a4, 33093
                  c.mv         s1, gp
                  rem          t1, s10, a5
                  auipc        t4, 546586
                  c.andi       a0, 21
                  divu         s6, t3, a5
                  xori         a2, t1, 1805
                  sltiu        a1, ra, 935
                  sb           a4, 4(s11) #end riscv_load_store_rand_instr_stream_15
                  la           tp, region_0+1286 #start load_store_instr_stream_0
                  la           s8, region_0+39 #start load_store_instr_stream_1
                  lw           zero, -62(tp)
                  lb           t1, 17(s8)
                  lbu          s3, 243(s8)
                  sb           s5, 98(tp)
                  sh           s11, -7(s8)
                  sb           a0, 107(tp)
                  sb           gp, 32(s8)
                  lb           t3, 6(s8)
                  sb           a6, 30(s8)
                  lbu          t1, 179(s8)
                  lbu          a7, 187(tp)
                  sb           s8, 5(tp)
                  lh           t1, 141(s8)
                  lh           s3, -172(tp)
                  sb           t4, 231(s8)
                  lh           gp, 223(s8) #end load_store_instr_stream_1
                  lh           a7, 256(tp) #end load_store_instr_stream_0
                  la           a1, region_1+1810 #start load_store_instr_stream_1
                  sb           a3, -9(a1)
                  la           t4, region_1+236 #start load_store_instr_stream_0
                  sw           a7, -10(a1)
                  la           s11, region_1+1323 #start load_store_instr_stream_2
                  lbu          s10, 11(t4)
                  lw           a2, -10(a1)
                  lbu          s4, -2(s11)
                  lh           s0, 2(t4)
                  lh           s3, 2(t4)
                  sb           tp, -8(s11)
                  lbu          a7, 5(a1)
                  lb           a0, -7(s11)
                  sb           s10, -7(a1)
                  sb           s10, -4(s11)
                  lb           s5, -16(a1)
                  lh           s4, -16(t4)
                  sb           t2, -8(s11)
                  lb           a3, -12(a1)
                  sb           s5, 6(s11) #end load_store_instr_stream_2
                  sb           t6, 9(a1) #end load_store_instr_stream_1
                  lhu          s7, -8(t4) #end load_store_instr_stream_0
                  la           s6, region_0+111 #start riscv_load_store_rand_instr_stream_14
                  lbu          s9, 6(s6)
                  sh           s0, 15(s6)
                  andi         s0, t6, 1667
                  srai         a5, a4, 27
                  xor          s4, a0, s2
                  mulhu        a4, t5, s0
                  lh           s5, 1(s6)
                  sw           a2, 1(s6)
                  lbu          tp, 10(s6)
                  lbu          gp, 10(s6)
                  rem          zero, a4, t6
                  lb           t3, 7(s6)
                  sw           a3, -7(s6)
                  addi         a2, zero, 438
                  lbu          s4, 12(s6)
                  c.nop
                  nop
                  sb           zero, -14(s6)
                  lh           a0, -1(s6)
                  div          a5, a4, a0
                  lbu          s3, 16(s6)
                  lbu          s11, -6(s6)
                  lb           a1, 8(s6)
                  srl          s8, s11, tp
                  c.srli       a2, 2
                  lh           t1, 3(s6)
                  c.srli       a1, 3
                  lbu          a5, -15(s6)
                  sb           a7, -9(s6)
                  c.lui        s3, 30
                  lbu          a2, 5(s6)
                  c.addi       tp, -1
                  lbu          s10, 6(s6)
                  mul          s1, t2, a4
                  sra          a5, s8, a2
                  lb           a5, -4(s6)
                  sltiu        t1, t4, -1437
                  c.sub        a4, a2
                  lh           a0, -13(s6)
                  c.srai       a3, 7
                  c.lui        s2, 25
                  lbu          s7, 2(s6) #end riscv_load_store_rand_instr_stream_14
                  la           t0, amo_0+4 #start riscv_lr_sc_instr_stream_7
                  c.mv         s9, s5
                  addi         s6, a0, -1518
                  lr.w.aq       t4, (t0)
                  c.lui        a7, 11
                  c.add        a4, a4
                  sra          t1, a4, a6
                  sc.w.aq       s4, s6, (t0) #end riscv_lr_sc_instr_stream_7
                  la           tp, region_1+881 #start riscv_load_store_rand_instr_stream_7
                  c.li         s3, -1
                  c.addi       t6, 16
                  auipc        s9, 301169
                  lhu          t0, 5(tp)
                  sw           a3, 3(tp)
                  lb           t3, 5(tp)
                  rem          a7, a2, s11
                  sh           a2, 3(tp)
                  xori         a0, t6, -365
                  sub          ra, t6, a5
                  c.andi       a3, -1
                  lb           t3, 1(tp)
                  sb           s5, -4(tp)
                  c.srai       a3, 2
                  sh           t3, -7(tp)
                  divu         s10, s0, t1
                  c.andi       a5, -1
                  lbu          s11, -7(tp)
                  c.li         a0, -1
                  add          s2, s2, s0
                  slti         a4, t5, 1787
                  andi         t0, t2, -676
                  lbu          s6, 15(tp)
                  c.li         s11, -1
                  sll          s5, tp, a0
                  auipc        s3, 423091
                  lbu          t3, 12(tp)
                  sb           s6, 12(tp)
                  lh           t0, 13(tp)
                  sb           s11, -8(tp)
                  lbu          t0, 5(tp)
                  c.addi       a7, 24
                  lb           s6, -16(tp)
                  nop
                  lw           t1, -5(tp)
                  sb           a0, -4(tp)
                  lbu          t4, 12(tp)
                  srli         a3, t0, 2
                  sh           sp, -15(tp)
                  c.or         a4, s0
                  sll          t4, s7, t4
                  sb           t6, -5(tp)
                  sw           a0, 3(tp)
                  mulh         s3, a7, a5
                  auipc        a6, 95271
                  lb           s9, -11(tp)
                  lbu          gp, 6(tp)
                  slli         t1, s11, 13
                  lb           a6, 12(tp) #end riscv_load_store_rand_instr_stream_7
                  la           a0, region_1+735 #start load_store_instr_stream_1
                  la           s0, region_1+147 #start load_store_instr_stream_3
                  la           s3, region_1+578 #start load_store_instr_stream_0
                  lhu          a4, 255(a0)
                  lbu          s9, 43(a0)
                  sb           s0, 196(a0)
                  lbu          tp, 4(s0)
                  lb           s8, -70(s3)
                  la           t1, region_1+1853 #start load_store_instr_stream_2
                  sh           tp, -59(t1)
                  sb           a5, -248(a0)
                  sb           s0, 120(s3)
                  lh           s9, 41(t1)
                  lbu          s5, -16(s0)
                  lb           s1, -34(a0) #end load_store_instr_stream_1
                  sh           t4, 80(s3)
                  lbu          t0, -8(t1)
                  sb           a0, 246(s3)
                  sb           s2, -2(s3)
                  sb           t4, -14(s0)
                  lb           s7, -20(t1)
                  lbu          s9, 14(t1)
                  lbu          t3, -89(s3)
                  lb           s10, 27(s0)
                  sb           s8, 26(s0) #end load_store_instr_stream_3
                  lbu          s6, 54(t1) #end load_store_instr_stream_2
                  lh           s1, 232(s3) #end load_store_instr_stream_0
                  la           a3, region_1+1957 #start load_store_instr_stream_3
                  la           t3, region_1+1614 #start load_store_instr_stream_1
                  sb           t6, -1391(t3)
                  la           gp, region_1+464 #start load_store_instr_stream_2
                  la           t0, region_1+1583 #start load_store_instr_stream_4
                  la           s11, region_1+121 #start load_store_instr_stream_0
                  lbu          a4, 33(gp)
                  lbu          a7, -856(t0)
                  lhu          a2, -15(s11)
                  sb           s4, 20(gp)
                  lh           s1, -207(a3)
                  lb           a0, -1429(t3)
                  sh           t6, 6(gp)
                  lhu          tp, -75(a3)
                  lb           tp, 60(s11)
                  lbu          t1, -171(t3)
                  sw           t3, -37(s11)
                  sb           t5, -1154(t0)
                  lbu          t1, 55(t3)
                  lh           s2, 10(gp)
                  lb           s8, 64(gp)
                  lbu          t4, -183(a3)
                  lb           s7, 27(s11)
                  sb           s6, 13(gp)
                  lb           s1, -214(a3)
                  lbu          s3, -20(s11)
                  sb           t2, -52(s11)
                  lbu          s9, 37(a3)
                  lb           a6, -1462(t0)
                  sb           s3, -275(t3)
                  lhu          s8, -977(t0)
                  lh           s5, -6(gp)
                  lb           t4, -1101(t3)
                  lb           a4, -29(s11)
                  lb           zero, -111(a3)
                  lbu          s1, -34(gp) #end load_store_instr_stream_2
                  lb           s5, -629(t3)
                  sb           a4, -244(t3)
                  lb           s7, 49(s11)
                  lb           a4, -177(t0) #end load_store_instr_stream_4
                  lhu          ra, 184(t3) #end load_store_instr_stream_1
                  sb           t0, -110(a3) #end load_store_instr_stream_3
                  lb           tp, -14(s11) #end load_store_instr_stream_0
                  la           s9, region_0+630 #start load_store_instr_stream_0
                  lb           s7, 45(s9)
                  la           a3, region_1+202 #start load_store_instr_stream_1
                  sb           t4, -20(s9)
                  lbu          s3, -39(s9)
                  sb           s0, -170(a3)
                  sb           gp, 33(s9)
                  lbu          a2, -43(a3)
                  lb           t3, 73(a3)
                  sb           s7, 55(s9)
                  lh           a2, 140(a3)
                  lbu          s8, -63(s9)
                  lbu          t4, 178(a3)
                  lh           a6, 198(a3)
                  lbu          tp, 1(s9)
                  lb           s3, 123(a3) #end load_store_instr_stream_1
                  sb           s0, -24(s9) #end load_store_instr_stream_0
                  la           gp, region_1+332 #start load_store_instr_stream_1
                  la           a3, region_1+168 #start load_store_instr_stream_0
                  lb           t4, -7(a3)
                  lbu          a0, 169(a3)
                  lb           a6, -61(gp)
                  lbu          a0, 65(a3)
                  lb           a0, -35(a3)
                  lbu          a6, 159(gp)
                  lbu          s8, -27(gp)
                  lb           t4, 37(a3)
                  sb           a1, 20(gp)
                  sb           t1, -178(gp) #end load_store_instr_stream_1
                  sb           a3, -93(a3)
                  sw           a5, 156(a3)
                  sb           s8, -123(a3)
                  lb           a6, 99(a3) #end load_store_instr_stream_0
sub_3_37:         jal          a0, 5f
0:                c.j          1f
1:                jal          s7, 8f
2:                c.jal        4f
3:                c.jal        7f
4:                jal          gp, 9f
5:                c.j          2b
6:                c.j          10f
7:                jal          ra, 6b
8:                c.jal        3b
9:                c.j          0b
10:               c.j          11f
11:               add          s4, s1, s10
                  la           s5, region_0+1732 #start load_store_instr_stream_1
                  la           s6, region_1+1045 #start load_store_instr_stream_0
                  lb           s7, 171(s5)
                  lbu          a5, 16(s6)
                  lbu          s7, 7(s5)
                  lbu          t4, -2(s6)
                  sb           a2, 6(s6)
                  sb           t3, 8(s6)
                  lbu          t3, -252(s5)
                  lw           t1, -5(s6)
                  sh           s4, -130(s5)
                  lb           s7, -60(s5) #end load_store_instr_stream_1
                  sh           tp, -13(s6)
                  lw           a4, 7(s6) #end load_store_instr_stream_0
                  la           s9, region_1+1035 #start riscv_load_store_hazard_instr_stream_2
                  lbu          s0, -13(s9)
                  sb           ra, -13(s9)
                  c.slli       tp, 28
                  lh           s11, -9(s9)
                  lhu          s3, -9(s9)
                  lbu          ra, 2(s9)
                  sb           sp, 2(s9)
                  sb           s10, 2(s9)
                  lb           s2, 2(s9)
                  lbu          t0, 2(s9)
                  lbu          a1, 2(s9)
                  sb           gp, 2(s9)
                  lbu          t0, 2(s9)
                  sb           s7, 2(s9)
                  lb           s5, 2(s9)
                  lb           ra, 2(s9)
                  lbu          s6, 15(s9)
                  sh           t1, 15(s9)
                  lh           ra, 13(s9)
                  mul          s0, s1, t4
                  lw           a4, 13(s9)
                  sb           s7, -14(s9) #end riscv_load_store_hazard_instr_stream_2
                  la           t3, region_0+313 #start riscv_hazard_instr_stream_2
                  nop
                  lw           s8, 3(t3)
                  mulh         s8, a4, s8
                  sltiu        t1, s6, 1863
                  lh           s10, -37(t3)
                  c.xor        a4, a4
                  sub          s8, a4, s8
                  lb           s3, 58(t3)
                  sh           s6, -43(t3)
                  sh           s3, 35(t3)
                  c.lui        s8, 1
                  lb           s3, -56(t3)
                  ori          a4, s6, -88
                  c.mv         s8, t1
                  srai         a4, s3, 24
                  lb           a4, 58(t3)
                  lh           s8, 9(t3)
                  sb           a4, 13(t3)
                  lb           s10, 47(t3)
                  sb           s6, -60(t3)
                  lhu          s10, -17(t3)
                  lh           s10, 45(t3)
                  lbu          s3, 4(t3)
                  lhu          s10, 51(t3)
                  sub          s10, a4, s8
                  lbu          t1, -44(t3)
                  mulh         s8, s10, s10
                  andi         s8, s6, 527
                  sb           s8, 60(t3)
                  sb           a4, -56(t3)
                  sb           s6, 7(t3)
                  sh           s3, -5(t3)
                  lbu          s10, -18(t3)
                  lb           t1, -8(t3)
                  srli         t1, s10, 31
                  lb           s6, -44(t3)
                  lbu          s10, 35(t3)
                  lbu          s3, -2(t3)
                  sb           s3, 34(t3)
                  auipc        s10, 605954
                  sltiu        a4, s3, -860
                  c.add        t1, s10
                  lbu          s8, -59(t3) #end riscv_hazard_instr_stream_2
                  la           s9, region_1+119 #start riscv_load_store_hazard_instr_stream_7
                  slti         a5, tp, 1248
                  lh           tp, -51(s9)
                  sb           t0, 28(s9)
                  and          a4, t6, a0
                  lb           a2, -26(s9)
                  lbu          s0, -26(s9)
                  sb           a4, -15(s9)
                  add          a4, s5, t4
                  lb           a4, -20(s9)
                  sb           s1, -20(s9)
                  sb           sp, -20(s9)
                  lw           s1, -43(s9)
                  lb           s5, -14(s9)
                  lbu          a6, -28(s9)
                  lbu          s1, -28(s9)
                  sb           t4, -32(s9)
                  sb           s9, -32(s9)
                  lb           s6, 17(s9)
                  c.andi       a2, -1
                  lbu          ra, -46(s9)
                  lh           s10, 21(s9) #end riscv_load_store_hazard_instr_stream_7
                  la           s9, region_1+1702 #start riscv_hazard_instr_stream_5
                  sb           s11, 175(s9)
                  c.and        a5, a5
                  c.add        s5, a5
                  c.sub        a5, a5
                  lb           s8, 199(s9)
                  lhu          a5, -150(s9)
                  lhu          s5, -254(s9)
                  andi         t4, s11, 320
                  lb           a5, -209(s9)
                  lb           s11, -59(s9)
                  andi         s11, s11, 1080
                  ori          a5, t4, -731
                  c.xor        a5, a5
                  lb           s11, 77(s9)
                  xor          s5, tp, a5
                  mulhu        a5, a5, s8
                  lh           s8, 50(s9)
                  div          s8, a5, t4
                  lh           s11, -48(s9)
                  sra          tp, a5, s5
                  rem          tp, a5, tp
                  lb           t4, 127(s9)
                  sb           tp, -224(s9)
                  sb           tp, 139(s9)
                  lb           s8, -103(s9)
                  lb           a5, 198(s9)
                  xori         tp, t4, -1209
                  sltiu        a5, s11, 1773
                  lb           tp, -22(s9)
                  c.sub        a5, a5
                  lh           a5, -28(s9)
                  sh           s5, -240(s9)
                  slli         t4, t4, 15
                  lb           t4, -125(s9)
                  sb           s8, 95(s9)
                  c.mv         tp, a5
                  lb           t4, 13(s9)
                  lb           s5, 145(s9)
                  sb           a5, 163(s9)
                  sltiu        s11, s11, 496
                  sb           tp, -103(s9)
                  mul          s5, tp, s11
                  lh           s11, 2(s9)
                  lb           s11, -255(s9)
                  lbu          a5, -112(s9)
                  sh           s5, -208(s9)
                  add          a5, s8, tp
                  sb           s8, -161(s9)
                  addi         tp, s5, -340
                  lbu          s11, 138(s9) #end riscv_hazard_instr_stream_5
                  la           s10, amo_0+56 #start riscv_amo_instr_stream_10
                  la           a6, amo_0+12
                  la           a4, amo_0+4
                  la           s1, amo_0+28
                  amoswap.w.rl  s5, sp, (s1)
                  ori          a1, s9, 1448
                  amoand.w      s11, ra, (s10)
                  amomin.w.rl   s3, s9, (a4)
                  amominu.w     a0, t3, (s10)
                  amomin.w      t3, a2, (a6) #end riscv_amo_instr_stream_10
                  la           s6, region_0+298 #start riscv_load_store_hazard_instr_stream_6
                  lbu          t3, -127(s6)
                  sub          t0, gp, s5
                  sb           s3, -127(s6)
                  sb           a3, -127(s6)
                  sb           s4, -127(s6)
                  lui          a1, 656141
                  xori         s8, zero, -511
                  lbu          ra, -127(s6)
                  lb           gp, 168(s6)
                  lhu          a2, 168(s6)
                  sh           s8, 168(s6)
                  lbu          a0, 168(s6)
                  lb           s2, 168(s6)
                  sh           s6, 168(s6)
                  or           s4, s1, t1
                  lh           a5, 168(s6)
                  sb           s2, 168(s6)
                  sh           s7, 168(s6)
                  lbu          s1, 109(s6)
                  lb           a4, 109(s6)
                  lbu          s8, 109(s6)
                  lbu          s10, 109(s6)
                  lbu          s9, 109(s6) #end riscv_load_store_hazard_instr_stream_6
sub_3_36:         jal          a0, 12f
0:                jal          ra, 8f
1:                c.jal        4f
2:                jal          t6, 13f
3:                c.jal        2b
4:                c.jal        5f
5:                c.j          3b
6:                c.jal        1b
7:                jal          ra, 0b
8:                jal          t1, 9f
9:                c.jal        11f
10:               c.j          14f
11:               c.jal        6b
12:               jal          t0, 7b
13:               jal          t1, 10b
14:               c.li         ra, -1
                  la           a6, region_0+481 #start riscv_load_store_hazard_instr_stream_1
                  lbu          s2, 1(a6)
                  sh           a3, 1(a6)
                  lbu          gp, 14(a6)
                  lbu          s8, 14(a6)
                  lb           s6, 14(a6)
                  sb           sp, 14(a6)
                  sb           s10, 14(a6)
                  remu         t1, t4, ra
                  srai         t3, s0, 11
                  sb           t5, 11(a6)
                  lw           s9, 3(a6)
                  lh           s3, 3(a6)
                  sw           a5, 3(a6)
                  lhu          s6, 3(a6)
                  lb           t6, 3(a6)
                  sb           a0, 16(a6)
                  lbu          s5, -8(a6) #end riscv_load_store_hazard_instr_stream_1
                  la           a0, region_1+1859 #start riscv_load_store_rand_instr_stream_3
                  remu         a2, t1, t0
                  slti         t4, s9, 1650
                  lbu          a5, -276(a0)
                  mulh         s7, s3, s10
                  srli         zero, t5, 11
                  div          tp, a0, a2
                  c.srli       a2, 29
                  lbu          t3, -1807(a0)
                  srai         t4, s6, 22
                  slti         s7, s4, 637
                  lb           s1, -1082(a0)
                  ori          t4, tp, 1598
                  xor          s6, a6, tp
                  lb           s0, -1001(a0)
                  sltiu        ra, a1, -897
                  and          a5, s2, t0
                  sltu         s10, ra, a3
                  sltu         s2, t6, s9
                  sub          t6, s10, t6
                  c.or         a1, a0
                  sub          a1, s1, t3
                  sb           s7, -1323(a0)
                  lb           s6, -1546(a0)
                  divu         a7, a0, s0
                  c.srli       s1, 27
                  sub          s10, a0, s7
                  srli         gp, t0, 0
                  sltu         s10, ra, t3
                  ori          a7, a0, -510
                  nop
                  lb           t6, -732(a0)
                  sltiu        s2, t0, -1496
                  lb           a2, -120(a0)
                  lbu          s8, -374(a0)
                  c.and        s0, a0
                  c.xor        a1, a0
                  andi         t3, t2, -1078
                  lb           gp, -330(a0) #end riscv_load_store_rand_instr_stream_3
                  addi         a0, zero, 10 #init loop 0 counter
                  c.sub        a5, a0
                  divu         s6, gp, s1
                  slt          a6, sp, a0
                  c.addi       tp, 1
                  c.addi       a5, -1
                  remu         t0, s9, a1
                  sltiu        a5, a2, 1997
                  addi         zero, zero, 0 #init loop 0 limit
                  lui          s7, 327813
                  slti         s5, a7, 1760
                  lui          a4, 454841
sub_3_87_0_t:     mulhsu       s6, a1, a7
                  c.addi       ra, -1
                  auipc        a3, 50858
                  mul          tp, a7, a4
                  c.or         a5, a0
                  nop
                  c.nop
                  srl          a3, s5, t1
                  addi         a0, a0, -10 #update loop 0 counter
                  div          s7, s10, s11
                  c.sub        a2, a0
                  c.addi       s8, 26
                  add          t6, s3, a0
                  c.bnez       a0, sub_3_87_0_t #branch for loop 0
                  c.mv         s4, s5
                  la           s3, region_0+1726 #start load_store_instr_stream_3
                  la           a3, region_0+1226 #start load_store_instr_stream_1
                  la           a7, region_0+1822 #start load_store_instr_stream_2
                  la           tp, region_0+323 #start load_store_instr_stream_0
                  lbu          s9, -333(s3)
                  lb           a0, -761(a7)
                  sb           t0, -741(a7)
                  sw           s8, -1590(s3)
                  lb           t6, -1523(a7)
                  lbu          t4, -41(tp)
                  sw           ra, 13(tp)
                  sb           sp, 26(tp)
                  lh           a5, -266(a3)
                  lbu          a1, -997(a7)
                  lb           zero, -93(a7)
                  sb           s7, 10(tp)
                  lb           t4, 227(a3)
                  sw           a4, -138(s3)
                  lh           s5, -274(a3)
                  lbu          t3, -211(s3)
                  lh           t4, -1244(a7)
                  lbu          t6, -749(a3)
                  sb           t4, 108(s3)
                  sb           s10, -1221(a7)
                  lh           gp, -61(tp)
                  lbu          ra, -45(a7)
                  lbu          a4, -711(a3)
                  sh           ra, -1034(a7)
                  sb           a2, -29(tp)
                  lb           s4, -1140(s3)
                  sh           s9, -2(a3)
                  sw           t3, 33(tp)
                  lb           s10, -472(a3)
                  sb           s4, -1565(a7) #end load_store_instr_stream_2
                  lbu          s4, 193(a3) #end load_store_instr_stream_1
                  lb           s8, -191(s3) #end load_store_instr_stream_3
                  lb           s0, -20(tp) #end load_store_instr_stream_0
                  la           t6, amo_0+12 #start riscv_amo_instr_stream_4
                  la           tp, amo_0+12
                  la           a0, amo_0+44
                  c.add        t4, s0
                  amoand.w      s5, zero, (t6)
                  amoand.w      s9, t5, (t6)
                  amoor.w       a3, s10, (tp)
                  c.sub        s1, s0
                  amoxor.w.rl   a6, t3, (t6)
                  c.add        s11, t6
                  amoadd.w      ra, s9, (t6)
                  mul          s7, a4, a3
                  c.nop
                  amoor.w       gp, a4, (tp)
                  amoswap.w.aq  t4, s1, (a0) #end riscv_amo_instr_stream_4
sub_3_40:         jal          a0, 5f
0:                c.j          7f
1:                c.jal        3f
2:                c.j          4f
3:                c.j          2b
4:                c.jal        13f
5:                c.j          17f
6:                c.jal        16f
7:                c.j          9f
8:                c.jal        1b
9:                c.jal        10f
10:               c.j          11f
11:               jal          s7, 12f
12:               jal          t0, 19f
13:               jal          ra, 18f
14:               jal          t3, 0b
15:               c.jal        8b
16:               c.j          14b
17:               c.jal        15b
18:               c.j          6b
19:               mulh         s0, a6, t0
                  la           a2, amo_0+32 #start riscv_amo_instr_stream_5
                  la           s0, amo_0+20
                  amomax.w      a5, t0, (a2)
                  amomin.w.aq   gp, tp, (a2)
                  amominu.w.aq  s10, t6, (s0) #end riscv_amo_instr_stream_5
                  addi         ra, zero, -8 #init loop 1 counter
                  divu         s2, t1, s10
                  mul          s10, a0, a3
                  addi         t1, zero, 18 #init loop 1 limit
                  c.nop
sub_3_81_1_t:     ori          t0, t6, -1439
                  c.add        a1, t0
                  addi         ra, ra, 2 #update loop 1 counter
                  sltiu        t0, t4, 565
                  addi         tp, zero, -5 #init loop 0 counter
                  mul          a4, a0, a2
                  addi         a5, zero, -19 #init loop 0 limit
sub_3_81_0_t:     div          t0, a0, a1
                  addi         tp, tp, -7 #update loop 0 counter
                  nop
                  auipc        t4, 35032
                  bne          tp, a5, sub_3_81_0_t #branch for loop 0
                  blt          ra, t1, sub_3_81_1_t #branch for loop 1
                  c.and        a0, a2
                  addi         s7, zero, -8 #init loop 0 counter
                  addi         tp, zero, -13 #init loop 0 limit
                  c.nop
                  c.or         a0, a1
sub_3_89_0_t:     c.andi       a2, -1
                  slli         s10, s3, 24
                  mulhsu       a7, s9, s9
                  mulhsu       a1, s0, t5
                  or           s4, a2, a3
                  c.addi       s3, 5
                  nop
                  slti         s6, s6, -343
                  addi         s7, s7, -1 #update loop 0 counter
                  c.and        a1, a4
                  srai         t4, a1, 7
                  bge          s7, tp, sub_3_89_0_t #branch for loop 0
                  nop
                  la           s1, region_0+1317 #start riscv_load_store_rand_instr_stream_16
                  c.li         t0, 2
                  c.add        a6, s5
                  lb           a3, -1(s1)
                  rem          t1, t2, t3
                  lbu          ra, 8(s1)
                  sh           a3, -11(s1)
                  sb           s5, -4(s1)
                  sb           t1, 6(s1)
                  c.srli       a0, 28
                  sb           s10, 4(s1)
                  sltiu        s7, t3, 1022
                  c.nop
                  c.and        a0, a2
                  sltiu        zero, t3, 1798
                  c.slli       a3, 23
                  mul          s7, t3, s0
                  lbu          s11, 2(s1)
                  c.li         tp, 15
                  lbu          s8, 13(s1)
                  slt          s11, t3, t5
                  divu         a0, t3, s4
                  lb           zero, 8(s1)
                  and          t4, s2, sp
                  c.addi       t0, 8
                  mulhsu       s8, a2, a5
                  xori         a5, s7, 857
                  sb           a3, 9(s1)
                  mul          a1, a0, tp
                  sb           tp, -10(s1)
                  slti         a1, s3, 1859
                  divu         t4, zero, t2
                  slli         s11, t3, 14
                  srli         s4, s10, 2
                  lb           gp, 4(s1)
                  lb           t1, -15(s1)
                  mulhsu       a1, t3, t2
                  c.nop
                  auipc        a0, 834570
                  xori         a5, s11, -811
                  slti         s6, a5, 1208
                  sb           t0, 4(s1) #end riscv_load_store_rand_instr_stream_16
                  la           s9, region_1+904 #start riscv_hazard_instr_stream_9
                  sb           ra, 607(s9)
                  lbu          s0, 315(s9)
                  c.nop
                  sh           t6, -748(s9)
                  c.add        s6, s0
                  lbu          a2, 590(s9)
                  lb           s6, 243(s9)
                  and          a6, s0, a6
                  divu         a2, s0, t6
                  sw           s0, -780(s9)
                  c.lui        s6, 22
                  c.srli       a2, 8
                  slt          s0, s6, a2
                  lbu          ra, -833(s9)
                  lbu          s0, 1089(s9)
                  xor          s6, s0, a2
                  lb           s0, 688(s9)
                  lbu          a2, -685(s9)
                  lhu          s0, -40(s9)
                  or           a6, t6, ra
                  lbu          a2, 756(s9)
                  div          a2, a6, a6
                  srl          s0, s0, ra
                  sh           s0, 886(s9)
                  c.nop
                  addi         a6, s6, -142
                  lbu          a6, 1025(s9)
                  mulh         s0, a2, s6
                  lw           s6, 784(s9)
                  lh           t6, 74(s9)
                  c.sub        s0, s0
                  sh           t6, 186(s9)
                  lb           a6, -275(s9)
                  xori         s6, ra, -255
                  lh           t6, 1038(s9) #end riscv_hazard_instr_stream_9
                  la           s0, region_0+1866 #start riscv_load_store_rand_instr_stream_12
                  and          s10, gp, tp
                  xori         a2, s1, 147
                  sh           a1, -32(s0)
                  sb           ra, -28(s0)
                  lbu          a5, -49(s0)
                  lhu          a7, 48(s0)
                  c.xor        a3, a0
                  lbu          s8, -46(s0)
                  divu         a7, s6, gp
                  lhu          a6, 32(s0)
                  lbu          a1, 27(s0)
                  lb           a7, -44(s0)
                  sb           a6, 61(s0)
                  sb           t0, -7(s0)
                  nop
                  sh           a1, 34(s0)
                  lbu          a0, -53(s0)
                  slt          s10, t4, s2
                  lhu          s11, 58(s0)
                  sb           t3, 62(s0)
                  sh           s5, -30(s0)
                  c.sub        a0, a1
                  lb           a7, -33(s0)
                  sltiu        s6, s11, -1502
                  c.or         a1, a0
                  div          gp, t0, a4
                  sh           a1, 46(s0)
                  lb           s10, -30(s0)
                  lui          s1, 918998
                  lbu          a2, -25(s0)
                  sb           t2, 39(s0)
                  srli         a4, t6, 2
                  lbu          a6, -53(s0)
                  lh           a6, -14(s0)
                  mul          t1, s6, t6
                  lb           t3, 30(s0)
                  lbu          t0, -38(s0) #end riscv_load_store_rand_instr_stream_12
                  la           s7, amo_0+28 #start riscv_lr_sc_instr_stream_9
                  c.addi       s4, 13
                  and          t4, zero, t5
                  c.nop
                  xor          t0, a0, s3
                  srai         t4, gp, 14
                  lr.w          s3, (s7)
                  sc.w.aq       a5, s9, (s7) #end riscv_lr_sc_instr_stream_9
                  la           a1, region_1+647 #start riscv_load_store_rand_instr_stream_0
                  sb           t2, 20(a1)
                  c.andi       a4, 12
                  lbu          s11, 63(a1)
                  lui          s7, 87769
                  sltu         a7, zero, s5
                  sra          s2, t1, t1
                  sw           t2, 1(a1)
                  slt          s4, a1, t5
                  sb           s4, -29(a1)
                  ori          a2, a5, -1193
                  or           t3, t6, t0
                  lh           a4, -15(a1)
                  lbu          zero, -52(a1)
                  mul          s2, gp, s4
                  lb           a5, 4(a1)
                  c.slli       s3, 1
                  mulh         s8, a3, t2
                  lbu          s0, -20(a1)
                  lh           t3, 27(a1)
                  slti         a3, sp, 1655
                  andi         a5, a3, -848
                  sub          s8, t0, s1
                  sb           t3, 50(a1) #end riscv_load_store_rand_instr_stream_0
                  addi         a2, zero, 10 #init loop 1 counter
                  addi         zero, zero, 0 #init loop 1 limit
sub_3_88_1_t:     mulhu        s7, zero, a4
                  addi         a2, a2, -2 #update loop 1 counter
                  addi         a7, zero, 8 #init loop 0 counter
                  addi         tp, zero, 14 #init loop 0 limit
                  add          t3, t5, s4
sub_3_88_0_t:     lui          s1, 905856
                  addi         a7, a7, 6 #update loop 0 counter
                  bne          a7, tp, sub_3_88_0_t #branch for loop 0
                  c.beqz       a2, sub_3_88_1_t #branch for loop 1
                  sltiu        a5, s6, 1535
sub_3_29:         jal          a0, 0f
0:                jal          t1, 6f
1:                jal          a5, 12f
2:                c.j          3f
3:                c.jal        17f
4:                jal          ra, 7f
5:                c.jal        10f
6:                c.jal        18f
7:                jal          ra, 13f
8:                jal          a1, 16f
9:                jal          t1, 19f
10:               c.j          2b
11:               c.jal        9b
12:               c.jal        15f
13:               c.j          14f
14:               c.jal        1b
15:               c.jal        8b
16:               jal          t1, 11b
17:               c.jal        4b
18:               c.jal        5b
19:               slt          gp, t2, s3
                  la           s2, region_1+52 #start riscv_load_store_rand_instr_stream_2
                  lh           s8, 58(s2)
                  sb           zero, 11(s2)
                  c.andi       a0, -1
                  sb           s2, 42(s2)
                  c.srai       a4, 28
                  mul          t0, t0, s3
                  mulh         s8, s3, s8
                  and          s1, t2, t6
                  sb           a1, 32(s2)
                  slti         s11, s5, 1496
                  sh           t3, 42(s2)
                  xori         t1, a5, -2029
                  lbu          a4, 59(s2)
                  lbu          s9, -49(s2)
                  sb           s4, 37(s2)
                  sb           a4, 38(s2)
                  mulhsu       s9, a0, t2
                  div          s0, s1, s2
                  lbu          a2, 31(s2)
                  sra          s0, s5, t1
                  nop
                  lb           s3, -25(s2)
                  lw           t1, -52(s2)
                  lb           a2, 43(s2)
                  sw           a6, 28(s2)
                  sb           a1, 18(s2)
                  srli         s4, gp, 6
                  divu         t4, a2, a6
                  sb           t5, -42(s2)
                  sb           s0, 18(s2)
                  sub          a6, a1, s2
                  c.li         a0, 18
                  rem          s1, s11, a2
                  sh           tp, 54(s2)
                  lbu          t6, 9(s2)
                  lb           s6, 22(s2)
                  lbu          a3, 47(s2)
                  lh           ra, 20(s2)
                  sh           s4, 38(s2)
                  or           tp, a5, s11
                  and          a3, a0, a4
                  slt          s8, t0, s1
                  divu         t0, tp, a5
                  lb           s1, -43(s2)
                  lw           a2, 20(s2)
                  sb           s11, -3(s2)
                  lh           tp, -44(s2)
                  and          a4, t6, a2
                  sra          a2, a6, t6
                  mulhu        t4, tp, a5
                  lh           s8, 42(s2)
                  lb           a3, 4(s2) #end riscv_load_store_rand_instr_stream_2
                  la           gp, region_1+1610 #start load_store_instr_stream_0
                  la           t1, region_0+1752 #start load_store_instr_stream_1
                  sb           t2, -43(gp)
                  lbu          s0, -132(t1)
                  lbu          a0, -691(t1)
                  lbu          s0, -27(gp)
                  lh           a3, -60(gp)
                  lbu          a1, 171(t1)
                  sh           t5, -514(t1)
                  sb           s9, -51(gp)
                  lbu          t0, -43(gp)
                  lbu          s10, -1138(t1)
                  sh           s7, -1474(t1)
                  lbu          s9, -1159(t1)
                  lbu          a3, 15(gp)
                  sw           s8, -20(t1)
                  lh           t0, 58(gp)
                  lbu          a0, -1119(t1)
                  lbu          s1, -40(gp)
                  lb           a2, -1509(t1) #end load_store_instr_stream_1
                  sb           zero, 48(gp) #end load_store_instr_stream_0
                  la           tp, region_0+376 #start load_store_instr_stream_1
                  lb           s11, 583(tp)
                  la           t0, region_1+349 #start load_store_instr_stream_0
                  lb           a7, -29(tp)
                  lh           a4, 296(tp)
                  lhu          zero, -31(t0)
                  sb           t4, 1053(tp)
                  lb           s7, -10(t0)
                  lb           ra, 953(tp)
                  lb           s2, 50(t0)
                  lh           t4, 57(t0)
                  lb           s11, 1243(tp)
                  lbu          s4, 14(t0)
                  sb           a7, 1345(tp)
                  lh           s7, 9(t0)
                  lh           s3, -57(t0)
                  sb           a2, -159(tp) #end load_store_instr_stream_1
                  lb           s2, 45(t0) #end load_store_instr_stream_0
                  la           t3, region_0+1179 #start load_store_instr_stream_2
                  la           s11, region_0+790 #start load_store_instr_stream_1
                  lh           s2, 424(s11)
                  lbu          s2, 2(t3)
                  la           s9, region_0+1942 #start load_store_instr_stream_0
                  lbu          t4, -11(s9)
                  lb           gp, -157(s9)
                  lb           s1, 11(t3)
                  lw           t1, -218(s9)
                  lb           a4, 449(s11)
                  sb           a3, -16(t3)
                  lbu          t4, 24(s9)
                  lb           s8, 5(t3)
                  lb           ra, -1(t3)
                  lb           a3, 765(s11)
                  lbu          s0, 3(t3)
                  sw           gp, 834(s11)
                  sb           s4, 715(s11)
                  sb           s5, -491(s11)
                  sw           sp, -90(s9)
                  sw           a3, -3(t3)
                  sh           a1, 686(s11)
                  lb           s10, 8(s9)
                  sh           t0, 558(s11) #end load_store_instr_stream_1
                  sb           t3, 11(t3)
                  lbu          s5, 4(t3)
                  lh           s4, -134(s9)
                  lh           a2, 7(t3) #end load_store_instr_stream_2
                  lb           a1, 0(s9) #end load_store_instr_stream_0
                  la           a5, region_0+224 #start riscv_hazard_instr_stream_15
                  slti         a6, t6, 1205
                  sb           t6, 700(a5)
                  mulhu        s11, t3, a3
                  lb           t0, 926(a5)
                  lb           s11, 335(a5)
                  div          t6, a3, s11
                  sw           t6, 1480(a5)
                  c.lui        a6, 8
                  lb           a3, -197(a5)
                  lbu          t6, 1336(a5)
                  xor          t3, t3, a3
                  lhu          a3, 792(a5)
                  sh           s11, 640(a5)
                  slli         t0, s11, 22
                  c.srai       a3, 29
                  sb           t0, 1685(a5)
                  lbu          s11, 662(a5)
                  andi         a6, a6, 756
                  sb           t0, -17(a5)
                  lb           t6, -33(a5)
                  c.add        a6, t3
                  lbu          a3, 1644(a5)
                  mul          t6, t0, t0
                  lb           a6, 627(a5)
                  lbu          a6, 1324(a5)
                  sll          t3, t3, t0
                  c.andi       a3, 10
                  lb           s11, 704(a5)
                  lhu          a6, 1050(a5)
                  lui          t6, 164354
                  sw           a3, 1348(a5)
                  srl          t3, a6, a6
                  slt          s11, t6, t6
                  sb           a6, 905(a5)
                  sb           t6, 645(a5)
                  c.andi       a3, -1
                  sub          a3, a6, a3
                  srl          s11, t3, t3
                  lbu          s11, 263(a5)
                  lb           a3, 564(a5)
                  lb           t6, 1355(a5)
                  addi         a3, a3, 1463
                  lb           t0, 188(a5)
                  c.li         s11, -1
                  sb           a3, 1521(a5) #end riscv_hazard_instr_stream_15
                  la           t4, amo_0+52 #start riscv_lr_sc_instr_stream_2
                  xor          s0, s4, tp
                  c.srli       a0, 1
                  ori          s5, a5, -90
                  addi         s6, a0, -1154
                  c.xor        s1, a4
                  lr.w.aq       s6, (t4)
                  c.mv         a1, t2
                  c.mv         ra, s10
                  add          a0, s10, s11
                  slli         zero, gp, 21
                  c.slli       tp, 11
                  c.srli       s1, 20
                  sc.w.aq       s0, s3, (t4) #end riscv_lr_sc_instr_stream_2
                  la           tp, region_1+1087 #start riscv_hazard_instr_stream_13
                  sb           zero, 459(tp)
                  sh           a6, -123(tp)
                  lbu          a2, 902(tp)
                  sltu         s0, s0, a2
                  addi         a6, a6, 647
                  divu         s0, s0, zero
                  srli         zero, s8, 20
                  andi         s0, zero, -1845
                  addi         a6, a6, -1530
                  lh           s0, 569(tp)
                  lbu          zero, -500(tp)
                  lb           zero, 726(tp)
                  lh           s8, 493(tp)
                  ori          s0, s9, 1248
                  sb           zero, -453(tp)
                  lbu          a2, 673(tp)
                  c.slli       s0, 1
                  sb           s9, -716(tp)
                  c.mv         a6, s8
                  sw           s0, 693(tp)
                  lb           s8, 0(tp)
                  sb           a6, -977(tp)
                  sh           s8, 587(tp)
                  c.slli       s8, 2
                  c.srai       a2, 31
                  c.add        a6, a2
                  sw           s9, -947(tp)
                  sltiu        s9, s0, -1650
                  lbu          s8, -830(tp) #end riscv_hazard_instr_stream_13
                  la           s9, region_0+453 #start riscv_load_store_rand_instr_stream_9
                  sb           s4, 12(s9)
                  sb           gp, 6(s9)
                  sb           s0, 0(s9)
                  lb           tp, 0(s9)
                  sb           s5, 1(s9)
                  c.lui        a7, 5
                  nop
                  c.andi       s1, 28
                  lbu          s0, 4(s9)
                  auipc        a7, 952091
                  sh           t0, -3(s9)
                  lb           a7, -15(s9)
                  c.add        t3, a3
                  c.mv         a2, a5
                  c.slli       s0, 15
                  lb           a5, 10(s9)
                  mul          a5, t4, s10
                  c.sub        a2, a2
                  div          a5, a0, s10
                  or           t4, a0, s7
                  lbu          a0, 3(s9)
                  mulhu        t1, a2, a7
                  sb           a4, 12(s9)
                  lbu          a3, -1(s9)
                  c.addi       s2, -1
                  lbu          a2, 14(s9)
                  lb           t6, 10(s9)
                  c.nop
                  c.xor        s1, a1
                  sb           s2, 14(s9)
                  sh           s10, 3(s9)
                  lb           a4, 10(s9)
                  mulhu        a6, zero, ra
                  add          a1, s3, s8
                  sh           s5, 3(s9)
                  sb           a4, 4(s9)
                  sra          s1, s9, t0
                  lbu          zero, -13(s9)
                  mulh         t0, ra, s3
                  lb           s7, 13(s9)
                  mulhsu       t4, s3, a5
                  sub          gp, s2, s11
                  addi         t6, s9, -549
                  lb           s3, 12(s9)
                  mulhsu       ra, a3, s8
                  sb           t3, -12(s9)
                  sb           s8, -10(s9)
                  c.andi       a1, -1
                  lbu          t0, 4(s9)
                  sltu         a5, s4, t5
                  sb           s9, -10(s9)
                  lbu          gp, -14(s9)
                  sb           a4, -8(s9) #end riscv_load_store_rand_instr_stream_9
                  la           s5, region_1+1525 #start riscv_load_store_rand_instr_stream_11
                  add          s11, s5, s11
                  lb           a1, -13(s5)
                  sb           s9, -16(s5)
                  lbu          a2, 2(s5)
                  sb           s1, 0(s5)
                  lh           s10, -15(s5)
                  sb           a7, -12(s5)
                  sb           t0, -5(s5)
                  lbu          a2, -4(s5)
                  c.li         t4, 9
                  xor          a2, gp, t0
                  srl          a0, tp, t6
                  lbu          zero, 5(s5)
                  sb           a3, 1(s5)
                  sb           t2, -6(s5)
                  c.add        s11, t0
                  ori          gp, s9, 1284
                  auipc        t4, 651173
                  lbu          a5, 0(s5)
                  lhu          t1, 11(s5)
                  sb           ra, 14(s5)
                  c.xor        a4, a0
                  sw           s5, -9(s5)
                  auipc        s10, 576574
                  srai         s4, s0, 0
                  sb           zero, -12(s5)
                  sll          a2, s0, t6
                  lbu          t1, -10(s5)
                  lb           s2, 4(s5)
                  c.li         s2, 10
                  nop
                  div          t0, s11, s7
                  slli         a5, s8, 6
                  c.and        s0, s1
                  lh           t6, 13(s5)
                  sw           t1, -9(s5) #end riscv_load_store_rand_instr_stream_11
                  la           a4, region_0+1237 #start load_store_instr_stream_1
                  sh           sp, -11(a4)
                  la           s5, region_1+1790 #start load_store_instr_stream_0
                  lbu          s8, 108(s5)
                  lh           s6, -9(a4)
                  sw           t5, 15(a4)
                  lb           s8, 123(s5)
                  lbu          s10, 1(a4)
                  sb           tp, 148(s5)
                  sb           t6, -12(a4)
                  lh           gp, -84(s5)
                  lb           tp, -8(a4)
                  lhu          gp, -13(a4)
                  sb           a6, -13(a4)
                  lb           a3, 0(a4)
                  lbu          t4, -53(s5)
                  lhu          t0, 1(a4) #end load_store_instr_stream_1
                  sb           s11, 201(s5)
                  lb           s10, -200(s5) #end load_store_instr_stream_0
                  la           a1, region_0+566 #start riscv_hazard_instr_stream_11
                  sb           a4, 255(a1)
                  divu         zero, a2, s7
                  sb           s7, 316(a1)
                  lb           a4, 1277(a1)
                  c.or         a4, a4
                  xori         zero, s7, -1925
                  xor          a5, a4, s7
                  sb           s7, -125(a1)
                  sh           zero, -566(a1)
                  c.xor        s1, s1
                  sh           zero, 264(a1)
                  lui          a5, 744652
                  c.or         a5, s1
                  lb           a5, 545(a1)
                  sb           s1, 1276(a1)
                  c.and        a5, s1
                  sub          a5, zero, a2
                  slt          a4, s1, a2
                  slli         s1, zero, 15
                  lbu          s1, 1042(a1)
                  sw           a2, 582(a1)
                  mulhu        a4, a4, zero
                  add          zero, a5, a2
                  lb           zero, -483(a1)
                  sh           s1, 1128(a1)
                  andi         a4, zero, 1434
                  lbu          a2, -159(a1)
                  lh           s1, 346(a1)
                  or           s1, zero, a4
                  c.nop
                  c.addi       s7, -1
                  auipc        a2, 539195
                  sh           zero, 914(a1)
                  lb           a2, 325(a1)
                  lb           s7, 436(a1)
                  sb           zero, 1119(a1)
                  slti         a5, a2, -1728
                  or           s7, s7, s1
                  or           s7, a2, s7
                  sh           s7, 932(a1)
                  c.nop
                  sb           a4, -221(a1)
                  lb           s7, 845(a1)
                  mulhu        s1, s1, a5
                  ori          a4, s7, -340
                  c.mv         a4, s1
                  c.lui        a5, 14
                  slt          s1, zero, s7
                  c.or         s1, a5
                  lbu          a2, 1196(a1)
                  lw           a5, 802(a1) #end riscv_hazard_instr_stream_11
                  addi         s5, zero, 10 #init loop 1 counter
                  addi         zero, tp, 1917
                  auipc        ra, 130325
                  auipc        t0, 47277
                  sra          t6, t3, zero
                  auipc        s6, 865295
                  addi         s1, zero, 16 #init loop 1 limit
                  div          s4, s0, ra
                  mulhu        t0, a2, s5
                  c.mv         s8, s1
sub_3_83_1_t:     sltu         s9, ra, t5
                  sll          t3, s5, a2
                  c.add        s0, a6
                  addi         s5, s5, 6 #update loop 1 counter
                  srl          a0, s10, t6
                  addi         a4, zero, 10 #init loop 0 counter
                  slli         a6, ra, 8
                  addi         s3, zero, 16 #init loop 0 limit
                  srli         s7, a5, 10
                  c.mv         t6, s10
                  mulh         a1, s11, t5
                  sra          gp, s7, s3
sub_3_83_0_t:     c.addi       tp, 15
                  div          s9, s3, s1
                  addi         a4, a4, 3 #update loop 0 counter
                  c.add        t6, s10
                  or           t3, t5, t1
                  c.or         a1, a5
                  xor          a7, gp, t6
                  div          s2, s9, t2
                  blt          a4, s3, sub_3_83_0_t #branch for loop 0
                  remu         ra, t4, s8
                  bne          s5, s1, sub_3_83_1_t #branch for loop 1
                  or           t4, s6, t6
sub_3_41:         jal          a0, 0f
0:                jal          s11, 14f
1:                c.j          5f
2:                c.jal        4f
3:                c.jal        13f
4:                jal          s10, 15f
5:                jal          ra, 2b
6:                jal          ra, 7f
7:                c.j          16f
8:                c.j          6b
9:                jal          ra, 3b
10:               c.jal        1b
11:               jal          ra, 8b
12:               c.j          11b
13:               c.j          12b
14:               c.jal        10b
15:               jal          t0, 9b
16:               remu         s8, a0, a4
                  la           a5, amo_0+44 #start riscv_lr_sc_instr_stream_1
                  lr.w          gp, (a5)
                  c.or         s0, a0
                  c.srai       a1, 17
                  c.srai       a1, 23
                  xor          t3, a5, a4
                  slti         s8, s8, -793
                  slt          s7, zero, gp
                  nop
                  srli         a0, tp, 11
                  sll          s1, a5, sp
                  lui          s2, 8459
                  sc.w.aq       a3, t5, (a5) #end riscv_lr_sc_instr_stream_1
                  la           a4, region_0+715 #start load_store_instr_stream_0
                  lbu          s10, 17(a4)
                  lhu          s6, -25(a4)
                  la           s8, region_1+808 #start load_store_instr_stream_1
                  lhu          s3, 4(s8)
                  sb           s5, -58(a4)
                  sb           a7, -27(a4)
                  lhu          t3, 45(a4)
                  lbu          s9, 4(s8)
                  lh           s7, -55(a4)
                  sb           s4, 7(s8)
                  lh           a6, -8(s8)
                  lb           gp, 37(a4)
                  lbu          a5, -10(s8) #end load_store_instr_stream_1
                  sb           s1, -32(a4)
                  sb           t5, -40(a4) #end load_store_instr_stream_0
                  la           a3, region_0+1414 #start load_store_instr_stream_1
                  lbu          s6, -13(a3)
                  lh           s0, -8(a3)
                  la           t0, region_0+1063 #start load_store_instr_stream_0
                  sh           gp, -9(t0)
                  lw           zero, 14(a3)
                  lbu          s3, -10(t0)
                  sb           a5, -15(t0)
                  lbu          t6, 14(t0)
                  lbu          s5, 5(a3)
                  lb           s3, -12(a3)
                  lb           a1, 10(t0)
                  sb           s6, 7(a3) #end load_store_instr_stream_1
                  sb           s0, -12(t0) #end load_store_instr_stream_0
                  addi         t3, zero, 10 #init loop 0 counter
                  addi         s3, zero, -11 #init loop 0 limit
sub_3_82_0_t:     c.mv         s4, s1
                  addi         t3, t3, -1 #update loop 0 counter
                  bge          t3, s3, sub_3_82_0_t #branch for loop 0
                  andi         s6, a1, 27
                  la           a6, region_0+1582 #start load_store_instr_stream_0
                  lw           a3, -10(a6)
                  lb           s6, 34(a6)
                  lbu          s5, -46(a6)
                  lbu          a5, 59(a6)
                  lhu          a3, 60(a6)
                  la           ra, region_1+1090 #start load_store_instr_stream_1
                  sw           s3, -122(ra)
                  lbu          s2, -235(ra)
                  lbu          s11, -55(a6)
                  lw           a1, -210(ra)
                  lh           gp, -220(ra)
                  sb           gp, -55(ra)
                  lb           s10, -25(a6)
                  lhu          s5, -92(ra) #end load_store_instr_stream_1
                  lb           t3, 60(a6) #end load_store_instr_stream_0
                  la           a5, amo_0+12 #start riscv_amo_instr_stream_9
                  and          t4, s10, a1
                  amoswap.w.aq  s11, s10, (a5) #end riscv_amo_instr_stream_9
                  c.bnez       a4, 1f
1:                andi         s1, a2, -151
                  srai         s1, a6, 28
                  xori         s1, zero, 2039
                  sra          a4, s10, a2
                  sra          t6, a5, ra
                  rem          a1, a6, a5
                  beq          a0, s2, 9f
                  sll          t0, s7, s11
9:                c.addi       a5, 15
                  auipc        s6, 568031
                  beq          t0, a5, 13f
                  mulh         zero, s2, s10
13:               c.add        s8, s5
                  srl          a4, a5, t2
                  c.beqz       a1, 18f
                  rem          tp, s4, ra
                  sub          ra, ra, sp
18:               remu         t6, ra, s6
                  srai         t6, s2, 21
                  nop
                  sra          s6, a3, s7
                  lui          s3, 1025559
                  blt          s0, a2, 28f
                  c.nop
                  c.li         s10, 9
                  sub          tp, ra, zero
                  c.slli       t4, 4
28:               slti         tp, a5, -1556
                  and          s11, a7, t4
                  c.li         s0, 20
                  c.xor        a5, a1
                  beq          a4, a3, 52f
                  c.srai       a3, 17
                  c.add        s6, a4
                  sll          s7, t4, t5
                  add          s9, s9, s3
                  ori          t3, s0, -1120
                  c.li         s11, 11
                  c.xor        a3, a0
                  c.beqz       s0, 60f
                  c.slli       s3, 1
                  c.srli       s0, 19
                  blt          t2, t0, 47f
                  c.andi       a5, -1
                  or           a6, t0, t2
                  remu         gp, s0, a1
47:               c.beqz       a1, 67f
                  nop
                  bge          t1, s6, 63f
                  c.srai       s0, 20
                  xori         s8, t6, 1951
52:               c.slli       a6, 25
                  and          s5, s8, a1
                  ori          a0, s4, -1747
                  c.bnez       a3, 64f
                  c.srli       a3, 15
                  mulhsu       a0, t5, s6
                  div          a7, s10, s4
                  addi         t0, a6, 149
60:               rem          s3, s7, s5
                  c.lui        a1, 16
                  div          s3, s2, t5
63:               sra          s9, a2, t5
64:               addi         s11, t6, -1465
                  c.beqz       a1, 67f
                  c.add        gp, a3
67:               or           s11, s9, t4
                  sra          s6, t0, s9
                  srli         a7, s7, 14
                  srli         s2, s3, 3
                  sll          a6, a6, t2
                  or           a0, a5, a4
                  nop
                  c.and        a4, s1
                  bgeu         ra, s7, 92f
                  sll          s9, t2, s11
                  c.or         a3, a0
                  c.or         s0, a0
                  c.sub        a2, a4
                  c.sub        s0, a2
                  ori          a5, zero, 692
                  xor          s9, s11, s9
                  sub          s2, t2, t5
                  mulhsu       a0, a5, sp
                  c.beqz       a0, 99f
                  xori         s2, t0, 1082
                  c.andi       a1, -1
                  sub          s0, t0, s5
                  c.xor        s0, a3
                  bltu         s11, s2, 110f
                  bge          s9, s4, 92f
92:               div          s2, t6, a5
                  slli         s1, sp, 30
                  c.xor        s1, a3
                  c.mv         t3, s3
                  srli         a7, s4, 18
                  andi         s7, s7, -1386
                  c.lui        s10, 15
99:               c.and        s1, s0
                  sra          tp, zero, a4
                  remu         a2, s6, s5
                  bgeu         a0, zero, 111f
                  c.or         s1, a4
                  mulhu        a7, a7, t1
                  bne          a1, t1, 115f
                  nop
                  c.sub        a4, a1
                  andi         s3, s11, 344
                  nop
110:              srai         a3, a5, 17
111:              rem          gp, s0, gp
                  bne          s1, s6, 120f
                  and          gp, a1, s4
                  add          a2, a2, a6
115:              bne          t2, t5, 121f
                  mulhsu       t0, t2, a5
                  bge          a0, s4, 127f
                  ori          a5, a2, 212
                  ori          t1, a7, -485
120:              div          s5, a2, a7
121:              addi         s7, s6, 299
                  blt          s2, t2, 136f
                  slti         s1, t4, 1357
                  ori          zero, s1, 1747
                  slli         t4, s11, 27
                  ori          t0, s10, -988
127:              slti         a0, a4, 519
                  ori          s5, s0, -1614
                  sll          gp, t0, ra
                  srai         t0, s8, 16
                  andi         a1, s11, 698
                  bne          a1, s1, 133f
133:              sltiu        t0, a7, -653
                  sltu         s2, s7, s4
                  sltu         s10, gp, s7
136:              ori          t3, s6, 1350
                  auipc        a3, 125151
                  c.srli       s1, 30
                  bltu         a6, t1, 148f
                  rem          a6, s2, s4
                  and          s11, ra, s1
                  c.lui        s5, 10
                  and          t3, t4, s1
                  c.srli       s1, 25
                  add          zero, s0, s0
                  sra          zero, a7, a3
                  divu         a1, a3, t1
148:              lui          s7, 649710
                  mulh         s4, a5, zero
                  c.lui        s8, 1
                  srli         a2, a2, 13
                  auipc        a1, 798911
                  sra          ra, s1, zero
                  bne          ra, s3, 160f
                  mulh         s8, s7, t5
                  sub          ra, a3, a2
                  mulh         tp, zero, s2
                  xori         s4, t6, 895
                  mulh         a7, gp, s6
160:              c.sub        a4, a2
                  blt          s7, t6, 175f
                  lui          a4, 696679
                  c.andi       a1, -1
                  c.lui        s0, 11
                  blt          t5, a1, 171f
                  xori         s8, ra, 767
                  auipc        t1, 717799
                  srl          a7, t1, s11
                  auipc        zero, 44405
                  sll          s10, sp, t0
171:              xori         t0, a3, -837
                  c.and        s1, a4
                  c.lui        ra, 11
                  c.sub        a5, a1
175:              slt          t6, t2, s5
                  c.andi       s0, 2
                  c.li         a1, 16
                  nop
                  c.xor        a1, a3
                  srl          s6, a1, s3
                  sltu         gp, a0, t0
                  xor          s8, a4, a1
                  sub          a2, s8, tp
                  slti         s3, a1, -1644
                  auipc        a2, 63452
                  andi         t1, s1, 360
                  sll          a4, t0, a4
                  c.nop
                  div          a7, ra, t2
                  nop
                  slt          s8, a6, s8
                  ori          a1, s11, -1258
                  c.srai       a3, 6
                  and          s7, a6, s10
                  c.beqz       a0, 206f
                  or           a2, s5, a6
                  sub          s7, a1, s1
                  bne          s11, gp, 217f
                  or           s10, gp, a5
                  ori          ra, s5, 1039
                  add          s1, s7, s6
                  c.srai       a1, 9
                  rem          s3, s1, a0
                  mulh         t0, a7, a3
                  sltiu        s6, a3, -1162
206:              div          t6, s5, s5
                  c.sub        a0, s0
                  srl          s9, a2, s8
                  c.addi       t6, 6
                  bge          gp, s4, 224f
                  sll          ra, a4, s3
                  lui          a1, 761963
                  xori         t4, s7, 594
                  srai         s7, s0, 29
                  xor          s11, zero, t4
                  andi         a4, a4, 438
217:              c.addi       a5, -1
                  c.nop
                  c.and        a4, a2
                  slli         s0, s0, 6
                  beq          tp, s0, 241f
                  sltiu        a3, s1, 774
                  c.slli       t0, 24
                  la           a7, region_1+1752 #start riscv_hazard_instr_stream_12
                  srli         a2, s10, 6
                  lw           s6, -112(a7)
                  lhu          a6, 70(a7)
                  lb           tp, -198(a7)
                  sb           s6, -155(a7)
                  c.nop
                  lb           s3, -212(a7)
                  sh           tp, -74(a7)
                  c.sub        a2, a2
                  lhu          s10, -164(a7)
                  lh           a2, 206(a7)
                  sltu         s6, s3, a6
                  lb           s10, -63(a7)
                  addi         a6, s3, -1171
                  addi         a6, s10, 1066
                  sb           a6, -66(a7)
                  lbu          tp, 181(a7)
                  sll          s6, a2, s6
                  sb           s3, 186(a7)
                  lbu          s10, 41(a7)
                  lbu          s3, 57(a7)
                  lui          s10, 441012
                  lh           s10, 166(a7)
                  lui          a6, 869240
                  lh           s3, -248(a7)
                  lbu          s3, 47(a7)
                  sb           tp, -124(a7)
                  lh           s3, -12(a7)
                  nop
                  sltu         a6, s6, s6
                  c.and        a2, a2
                  c.xor        a2, a2
                  lbu          a6, -105(a7)
                  srl          a2, s10, tp
                  sltu         a6, a6, s6
                  lbu          s10, 92(a7)
                  srli         s6, s10, 16
                  c.sub        a2, a2
                  lhu          s3, 238(a7)
                  lb           s6, 118(a7)
                  lb           s6, 170(a7) #end riscv_hazard_instr_stream_12
224:              bltu         s6, a7, 225f
225:              sltu         s5, a4, t6
                  slt          s2, s7, a0
                  auipc        s11, 916007
                  c.add        s8, ra
                  sra          a1, a0, s11
                  c.addi       gp, 26
                  xor          a5, s3, s9
                  xor          a4, t0, a3
                  sll          s9, t1, ra
                  bgeu         t4, a6, 240f
                  c.sub        a0, a3
                  divu         a0, t3, t2
                  c.mv         a2, s7
                  c.add        s8, t4
                  c.beqz       a4, 250f
240:              addi         gp, a5, 748
241:              remu         t6, a2, s9
                  c.bnez       s1, 247f
                  c.or         s1, a1
                  lui          s2, 1015314
                  c.li         ra, -1
                  bltu         t4, s4, 260f
247:              add          s2, s0, t0
                  slli         ra, t6, 26
                  blt          t2, s11, 251f
250:              c.sub        s1, a2
251:              rem          t3, zero, t4
                  sltiu        s10, s6, 962
                  andi         s4, a5, 782
                  rem          s7, t0, a4
                  bgeu         a1, t1, 258f
                  mulh         a7, a0, t4
                  c.andi       a0, -1
258:              c.and        a2, a4
                  c.andi       a3, 6
260:              c.and        a3, a5
                  mulh         s8, tp, t0
                  c.beqz       s1, 282f
                  c.andi       a2, 10
                  srl          a0, t2, sp
                  c.mv         s8, a1
                  c.sub        a0, a4
                  beq          s2, gp, 281f
                  xor          s2, a7, s5
                  add          s5, t5, t4
                  bltu         a0, s9, 279f
                  bge          a4, s7, 281f
                  divu         t4, t0, s5
                  srl          a6, zero, t5
                  beq          ra, s2, 288f
                  slt          s7, a3, t4
                  srl          a2, s6, a0
                  mul          tp, t6, s5
                  c.nop
279:              mulhsu       t6, s5, s6
                  sub          s6, t6, a2
281:              slt          t1, s5, gp
282:              bge          t5, t6, 302f
                  xori         a3, s3, -1137
                  xori         a0, ra, -1198
                  c.add        s3, a3
                  c.nop
                  div          a2, a7, s11
288:              ori          s6, zero, -1955
                  bge          s11, s10, 295f
                  c.add        s11, a2
                  c.or         a0, a2
                  slt          zero, sp, s7
                  c.and        a4, a2
                  mulhu        s10, tp, a7
295:              xor          s6, sp, tp
                  add          s10, s9, s10
                  c.slli       s0, 12
                  mulhsu       gp, s6, t0
                  divu         a6, s0, t5
                  auipc        s8, 828704
                  c.lui        s4, 11
302:              c.nop
                  srai         t1, ra, 10
                  rem          a2, a0, s4
                  xor          s11, s1, s3
                  c.lui        s2, 28
                  srl          s10, tp, zero
                  c.addi       s2, 17
                  c.srli       a4, 15
                  sll          t0, t4, a1
                  beq          s10, s3, 330f
                  c.beqz       a2, 314f
                  mulhu        s4, s11, a0
314:              c.xor        a0, a3
                  c.addi       a7, -1
                  andi         t3, a3, 1165
                  bgeu         s8, s11, 326f
                  c.slli       s4, 2
                  c.li         a2, -1
                  rem          tp, s9, zero
                  lui          s2, 392867
                  bge          a0, a1, 332f
                  ori          s6, s1, -1015
                  bne          s7, s3, 325f
325:              bne          a7, s7, 327f
326:              div          a3, s3, s6
327:              c.lui        a7, 17
                  c.lui        a1, 18
                  mulh         t3, a2, s7
330:              rem          a0, ra, s0
                  xor          a7, t5, s7
332:              blt          s11, s4, 341f
                  bgeu         s10, a7, 334f
334:              mulhsu       s11, a6, a0
                  mulh         tp, a4, s11
                  c.add        s1, s0
                  remu         a6, a2, s11
                  andi         s8, s4, -1092
                  c.bnez       a0, 343f
                  ori          s4, s6, -602
341:              auipc        a7, 394810
                  c.srli       a5, 6
343:              mulhsu       a2, s6, s5
                  sra          a0, s1, ra
                  or           s11, ra, t1
                  rem          ra, a0, a2
                  c.xor        a1, a3
                  mul          gp, s8, a1
                  remu         s8, a1, sp
                  c.beqz       s1, 364f
                  slti         s3, s3, 1929
                  c.bnez       s1, 372f
                  mulhsu       t1, s7, a7
                  auipc        tp, 41139
                  beq          s2, t2, 361f
                  auipc        s2, 10114
                  c.mv         a3, tp
                  andi         t1, a5, 1474
                  sub          t4, sp, a3
                  addi         s10, t2, -1587
361:              mulh         t4, s5, a3
                  auipc        s11, 288853
                  c.slli       t3, 30
364:              bgeu         t5, t5, 381f
                  xor          t4, a6, t0
                  srl          s11, s7, a0
                  sltiu        tp, t5, -1216
                  mulhu        a4, zero, s4
                  c.nop
                  ori          a7, t0, -1609
                  c.srli       a2, 28
372:              bne          a0, s0, 380f
                  sub          t1, s10, ra
                  c.lui        s6, 25
                  srli         t1, s5, 10
                  rem          t4, s6, s6
                  srai         a7, gp, 4
                  c.addi       s1, -1
                  or           s5, a4, a0
380:              sltu         t3, t4, s5
381:              c.li         s1, 13
                  c.add        a0, tp
                  or           t0, t2, s10
                  mul          s11, tp, s6
                  srl          t0, s8, t0
                  sll          ra, tp, t6
                  c.beqz       a3, 401f
                  c.addi       s10, 16
                  auipc        s3, 706584
                  srli         a5, s5, 7
                  sll          s0, a1, s7
                  slti         s6, zero, 2005
                  blt          zero, t6, 399f
                  divu         t6, t1, tp
                  c.nop
                  mul          s2, zero, s8
                  sra          a4, s8, tp
                  lui          a5, 515245
399:              nop
                  c.beqz       a2, 408f
401:              c.sub        s1, a0
                  mul          s10, t2, ra
                  andi         t0, t6, 1194
                  xor          gp, s1, t0
                  c.nop
                  blt          t5, s10, 420f
                  c.lui        s3, 17
408:              sub          a3, t3, t5
                  andi         t6, s4, 1461
                  ori          a2, t5, -1358
                  divu         s7, gp, s4
                  c.xor        s1, a3
                  c.addi       s8, -1
                  rem          a2, a4, zero
                  andi         t6, s10, 871
                  c.addi       gp, 16
                  remu         s10, t4, ra
                  bgeu         a3, gp, 428f
                  c.andi       a3, 5
420:              nop
                  nop
                  sub          ra, t3, a0
                  mulhu        a0, s8, ra
                  c.or         a3, s1
                  srl          a1, s11, s11
                  divu         t1, sp, s3
                  c.andi       a0, 26
428:              sra          a1, s7, a1
                  c.mv         s8, a2
                  slti         s8, a2, -1993
                  blt          s8, a5, 437f
                  mulh         s10, s9, t5
                  slt          a0, gp, s11
                  ori          t1, a5, -1014
                  c.lui        a4, 28
                  or           t3, gp, t4
437:              c.lui        a2, 4
                  bne          t1, sp, 440f
                  c.or         a5, s0
440:              remu         s6, s1, ra
                  sltu         a7, a3, tp
                  auipc        ra, 777753
                  c.lui        s6, 27
                  mulhsu       a0, s11, t0
                  mulhsu       tp, tp, a3
                  mul          a6, sp, gp
                  c.srli       a5, 10
                  andi         tp, s2, 1849
                  c.mv         s6, ra
                  srl          s1, s2, t6
                  bge          t5, ra, 471f
                  sltu         s11, t1, s1
                  c.beqz       a2, 467f
                  c.nop
                  c.lui        s7, 18
                  beq          t2, s2, 476f
                  c.addi       tp, -1
                  addi         a2, zero, 8
                  c.srli       a5, 9
                  blt          t2, s6, 461f
461:              divu         a1, t4, s2
                  add          zero, s9, t5
                  c.sub        a3, s1
                  c.srai       s0, 31
                  sll          a0, a6, s7
                  srai         zero, s8, 9
467:              srl          s0, a2, s6
                  div          t4, zero, s0
                  bltu         zero, s5, 483f
                  blt          a1, s1, 489f
471:              c.xor        a2, a0
                  slti         a7, sp, -987
                  div          gp, t4, t3
                  srli         t1, s11, 1
                  slt          s9, s8, t1
476:              lui          ra, 308152
                  div          a7, a2, t0
                  remu         tp, t0, s0
                  bne          t4, t6, 490f
                  c.and        a3, a4
                  c.srai       a3, 27
                  c.addi       s2, -1
483:              c.beqz       a2, 485f
                  c.add        s7, t1
                  la           a5, region_1+1414 #start load_store_instr_stream_1
                  la           gp, region_0+1341 #start load_store_instr_stream_0
                  lbu          a6, -764(gp)
                  lbu          s6, 43(a5)
                  lbu          a0, -1212(gp)
                  lhu          t1, 38(a5)
                  lbu          s5, 7(a5)
                  lb           s1, -276(gp)
                  lb           a6, -55(a5)
                  lbu          t1, -420(gp)
                  lbu          s4, -43(a5)
                  lbu          t4, -56(gp)
                  lb           s2, -142(gp)
                  lbu          a0, 518(gp)
                  lbu          a0, 256(gp)
                  sh           t4, -773(gp)
                  lb           t3, 60(a5) #end load_store_instr_stream_1
                  lbu          s0, -170(gp) #end load_store_instr_stream_0
485:              c.beqz       a1, 499f
                  sra          t0, t4, t3
                  div          s4, a2, sp
                  and          zero, a1, a3
489:              c.and        a2, a5
490:              bne          s11, t0, 500f
                  divu         t6, s9, t2
                  slli         s1, s0, 27
                  slt          zero, a0, a0
                  sra          a7, a3, a6
                  c.or         a2, s1
                  blt          s0, s8, 505f
                  c.sub        s0, a5
                  mulh         t6, s9, t2
499:              c.addi       s4, -1
500:              blt          t3, a3, 509f
                  c.addi       s3, 3
                  or           s10, s4, a7
                  sra          a0, s8, zero
                  c.lui        a0, 6
505:              srai         t6, a6, 8
                  xori         t6, s3, -1794
                  or           t3, s6, s2
                  c.bnez       a2, 525f
509:              bgeu         s9, a3, 529f
                  srli         a3, s0, 7
                  sll          s10, s8, t1
                  auipc        s11, 731734
                  beq          s0, a6, 522f
                  c.xor        a1, s0
                  andi         s11, s8, 168
                  c.or         a1, a3
                  c.srai       a3, 14
                  c.and        s0, s0
                  xori         a3, a5, 1432
                  srai         s0, a1, 17
                  c.sub        a1, s0
522:              c.mv         t6, sp
                  c.srli       a2, 1
                  xori         t1, s6, 1684
525:              c.slli       a7, 15
                  slti         s4, a4, 623
                  sub          ra, t5, t4
                  c.andi       a1, -1
529:              c.xor        s1, a1
                  and          s1, t0, gp
                  bgeu         a7, s7, 537f
                  c.andi       a1, -1
                  sra          a0, s9, s3
                  c.li         s7, -1
                  sltiu        a1, tp, 1603
                  lui          s1, 664323
537:              and          s6, a3, t5
                  c.nop
                  remu         t0, s6, t5
                  c.beqz       a4, 541f
541:              mul          s7, s2, s10
                  mulhsu       a0, a1, gp
                  mul          t4, s5, t6
                  bltu         t1, s3, 549f
                  c.addi       s6, 16
                  c.mv         a2, a4
                  mulhu        s1, t4, t0
                  remu         a5, t3, gp
549:              rem          a3, ra, zero
                  ori          s5, s1, 786
                  c.sub        a5, a5
                  auipc        ra, 111465
                  c.slli       s9, 23
                  or           s11, tp, zero
                  addi         tp, a0, 577
                  c.lui        s4, 18
                  slti         gp, t1, 1854
                  c.slli       t1, 1
                  srai         a5, zero, 23
                  c.mv         a0, a3
                  srai         s9, s2, 2
                  c.srli       a1, 7
                  c.srli       s0, 28
                  sltiu        s1, s10, 839
                  bge          zero, a5, 569f
                  andi         s10, s10, -372
                  sra          a6, a5, gp
                  slt          s11, a2, a0
569:              addi         a5, t2, -1499
                  c.and        a1, a2
                  beq          a2, s11, 573f
                  sll          zero, s6, gp
573:              c.sub        a1, a1
                  srai         s0, a4, 31
                  c.nop
                  mulh         zero, t1, a5
                  c.srai       s1, 2
                  c.addi       s10, 16
                  c.xor        a3, a4
                  c.or         a4, s0
                  xori         t1, a6, -1662
                  c.sub        a5, s1
                  c.xor        a2, s1
                  blt          s7, a1, 598f
                  addi         s9, t3, -773
                  remu         s6, a6, s5
                  mulhsu       a4, a7, s9
                  bltu         a5, s1, 608f
                  sra          s7, t5, t5
                  slt          s9, s2, ra
                  xor          ra, t0, s7
                  xori         a7, t6, -454
                  c.or         s1, a1
                  add          t6, a7, zero
                  c.srai       s0, 4
                  sltu         a7, a0, a5
                  xori         s5, zero, -1021
598:              auipc        s6, 1029604
                  divu         t0, a6, s2
                  nop
                  c.addi       t0, 30
                  sub          a6, t0, s6
                  c.srai       a5, 31
                  c.add        s11, s1
                  slli         s6, a2, 30
                  sll          s7, a3, s4
                  c.beqz       s1, 608f
608:              nop
                  xori         t3, a5, 1516
                  c.srli       a4, 13
                  c.sub        a4, a4
                  xori         t6, t1, 1578
                  c.beqz       a2, 616f
                  bltu         s8, t0, 620f
                  slti         s3, a4, -193
616:              sltu         s7, t1, s9
                  add          a2, a3, ra
                  xor          s7, s2, s10
                  c.and        a5, a4
620:              srai         a6, s9, 17
                  xor          s5, s6, a5
                  ori          t1, t4, -383
                  divu         t4, gp, s10
                  auipc        t4, 978542
                  c.xor        a0, a5
                  addi         s8, t5, -831
                  or           zero, a2, s0
                  c.bnez       a2, 642f
                  bne          s9, s9, 643f
                  c.andi       a1, 22
                  remu         t3, a3, a3
                  c.bnez       a1, 633f
                  addi         s11, zero, 1 #init loop 0 counter
                  remu         a4, gp, a2
                  addi         t3, zero, -17 #init loop 0 limit
                  nop
                  addi         gp, s1, -139
                  lui          a5, 1036321
                  c.or         s1, a3
                  sltu         a0, s6, s7
                  divu         s5, s0, sp
                  c.lui        s2, 10
                  c.or         a2, s0
                  xor          t6, s6, t4
                  c.add        ra, a1
sub_3_84_0_t:     c.li         a1, -1
                  nop
                  c.li         t1, 4
                  addi         s11, s11, -3 #update loop 0 counter
                  srai         s10, t4, 30
                  and          s8, t4, t0
                  c.addi       t6, 27
                  c.li         s7, -1
                  nop
                  div          zero, a2, s10
                  remu         zero, a4, a6
                  bge          s11, t3, sub_3_84_0_t #branch for loop 0
                  c.lui        t6, 8
633:              remu         s1, s6, s10
                  blt          s0, t6, 643f
                  srai         s5, s10, 17
                  lui          tp, 162690
                  c.li         s6, -1
                  srl          a3, s8, ra
                  sra          a7, a1, s5
                  c.mv         t1, s7
                  xori         s2, s11, -1643
642:              blt          sp, a6, 648f
643:              remu         a2, a2, gp
                  c.slli       s8, 12
                  or           s6, t1, s2
                  bgeu         sp, t4, 655f
                  slli         a4, a2, 24
648:              bge          s4, tp, 662f
                  blt          a7, s11, 666f
                  blt          a1, zero, 655f
                  xor          s0, t1, a3
                  add          t6, ra, s3
                  andi         s7, a6, 848
                  c.add        s7, s7
655:              c.beqz       s0, 675f
                  auipc        s3, 905756
                  c.xor        a0, a5
                  rem          s5, a4, a2
                  bne          s5, t0, 673f
                  add          a0, s10, t4
                  c.srli       a3, 18
662:              mulhu        s1, zero, a7
                  mulhu        s5, s0, s5
                  c.and        a5, a5
                  nop
666:              c.srai       a3, 26
                  sltu         gp, s2, t6
                  c.mv         t3, sp
                  c.li         a3, -1
                  sub          a3, t3, s11
                  divu         s5, a1, s10
                  sub          a0, t5, s1
673:              bgeu         gp, s3, 683f
                  c.add        a1, ra
675:              nop
                  divu         s0, s2, s0
                  srli         gp, zero, 10
                  c.and        a2, s0
                  c.li         s1, 11
                  div          a6, s0, sp
                  c.bnez       a0, 701f
                  xor          a3, s8, gp
683:              sll          a3, a4, t3
                  add          s0, a0, t4
                  srl          s6, a2, a3
                  sltiu        s11, s7, -1025
                  xori         t4, s9, -473
                  c.lui        a6, 26
                  mulhsu       t1, s5, s9
                  xor          s4, a4, s8
                  andi         s9, t2, 1457
                  c.andi       s1, 5
                  c.xor        a1, a2
                  c.xor        a5, s1
                  bgeu         a6, s3, 699f
                  c.addi       s4, -1
                  c.add        s2, a4
                  c.srai       s1, 3
699:              auipc        t1, 705224
                  sub          s2, tp, s4
701:              c.srai       a5, 17
                  add          s7, s11, sp
                  div          zero, t2, t2
                  and          a6, s8, t1
                  c.and        s0, a3
                  c.nop
                  bltu         zero, zero, 716f
                  mulh         s6, t3, s4
                  c.mv         a3, s11
                  xori         s3, gp, -1397
                  remu         a4, ra, t6
                  sra          a2, t0, a0
                  blt          s1, t3, 715f
                  c.sub        s0, a5
715:              c.beqz       a5, 725f
716:              xor          s6, zero, s1
                  lui          s11, 633061
                  bne          s6, s3, 721f
                  slt          gp, s0, t0
                  slli         t1, a1, 1
721:              andi         s2, t6, 1920
                  c.slli       s8, 7
                  c.beqz       a2, 724f
724:              andi         tp, s0, -1379
725:              auipc        t1, 1004814
                  xori         a1, s8, 2004
                  sltu         t6, t5, s4
                  c.or         a0, a5
                  beq          a7, a0, 730f
730:              c.nop
                  c.sub        a4, a0
                  slli         a2, s2, 23
                  remu         s5, s8, a5
                  mulhu        t1, s7, t3
                  sltu         t3, ra, a4
                  blt          s1, a2, 742f
                  c.sub        a5, a2
                  divu         a4, t6, s10
                  auipc        a5, 182906
                  or           t3, a6, s10
                  addi         tp, a7, 1028
742:              beq          tp, a2, 744f
                  slti         a5, tp, 689
744:              bltu         s9, a3, 746f
                  lui          a3, 251864
746:              blt          s8, t5, 766f
                  c.lui        a4, 25
                  div          s10, t4, t2
                  add          a3, a0, tp
                  c.andi       a5, -1
                  c.srli       s1, 26
                  c.add        s4, a3
                  c.slli       a3, 28
                  c.lui        a2, 27
                  lui          s8, 301219
                  beq          t4, s10, 767f
                  lui          zero, 673587
                  c.add        s0, a7
                  sll          s10, s7, s1
                  andi         a2, s11, 1553
                  c.nop
                  bge          s0, t6, 781f
                  bge          t1, ra, 783f
                  c.srai       a5, 1
                  mul          a7, gp, a3
766:              xori         s9, gp, -1257
767:              slti         s9, t0, -45
                  xori         t1, t0, 1797
                  slti         tp, gp, -34
                  c.lui        a6, 18
                  addi         s6, tp, 1139
                  beq          a6, t6, 786f
                  rem          a7, s7, s2
                  c.li         s9, 1
                  c.lui        gp, 9
                  c.srli       a4, 28
                  c.beqz       s0, 785f
                  mulhsu       s11, a5, s10
                  c.andi       s0, 12
                  mulhsu       s4, s0, s9
781:              rem          a5, a0, s8
                  slt          a0, ra, tp
783:              sra          t3, s3, a1
                  ori          s9, a4, -841
785:              remu         a2, a7, s3
786:              c.xor        a3, a2
                  c.addi       a3, -1
                  addi         gp, a2, 445
                  slli         t6, a5, 12
                  srai         s8, a7, 15
                  c.srai       s0, 4
                  and          t6, t6, s10
                  slt          s4, t6, a1
                  c.beqz       s1, 814f
                  srli         a2, t3, 19
                  or           t1, sp, s10
                  c.beqz       a3, 798f
798:              c.addi       t3, -1
                  c.bnez       a2, 816f
                  remu         a0, t6, s0
                  add          s4, t0, a4
                  bltu         gp, ra, 822f
                  c.sub        a1, a1
                  slti         a2, s2, 185
                  bge          a3, a3, 811f
                  c.mv         t6, tp
                  sll          s9, t0, s10
                  c.srai       a2, 10
                  addi         s10, t2, 1549
                  c.nop
811:              ori          a2, a1, -71
                  mulhsu       a7, s9, ra
                  c.lui        t4, 1
814:              andi         a2, a2, -1839
                  lui          s6, 593451
816:              sltiu        a6, a1, -581
                  blt          s0, a6, 831f
                  remu         tp, ra, a6
                  slti         a1, ra, -545
                  c.add        s11, s8
                  blt          gp, t5, 835f
822:              nop
                  ori          a3, a7, -370
                  add          tp, a7, gp
                  beq          s6, a7, 833f
                  xor          a0, t3, zero
                  mulhsu       t3, t4, a2
                  bgeu         s0, s7, 839f
                  sub          s1, sp, s1
                  sll          t3, a4, t3
831:              c.sub        a5, a4
                  and          a6, s3, gp
833:              srai         s8, tp, 27
                  c.lui        gp, 21
835:              c.bnez       a1, 839f
                  nop
                  lui          a0, 533152
                  c.and        a2, s0
839:              bge          s8, a7, 853f
                  c.srai       s1, 30
                  sub          a4, ra, sp
                  div          s3, t1, s5
                  bgeu         gp, ra, 863f
                  or           s3, s0, s9
                  slti         a6, s11, -2018
                  c.lui        a7, 28
                  divu         t1, a4, t2
                  xori         s0, sp, 911
                  blt          sp, s0, 863f
                  slli         s0, s5, 21
                  xori         a1, t6, 956
                  bltu         gp, a1, 854f
853:              div          s1, sp, t1
854:              mulhu        zero, a6, s9
                  sll          a6, s4, s10
                  srai         a5, t0, 7
                  c.lui        s7, 14
                  xor          s9, tp, ra
                  c.sub        a1, a4
                  add          a6, sp, s4
                  c.srai       s0, 27
                  slti         s5, s6, -586
863:              c.bnez       a0, 877f
                  div          s9, a4, ra
                  and          a7, s11, a5
                  or           zero, s9, a2
                  slli         a4, s8, 5
                  slli         s5, a6, 1
                  c.sub        a2, a2
                  beq          tp, a4, 871f
871:              andi         a4, t1, 601
                  slt          s10, s9, a6
                  blt          s9, s0, 876f
                  or           t6, a3, a1
                  mulhu        s3, a4, gp
876:              nop
877:              c.mv         s11, t0
                  xori         a1, a2, -976
                  andi         s9, t4, 1186
                  bne          t5, t2, 882f
                  ori          s0, a0, 132
882:              sltu         a7, s7, a4
                  sll          a6, t1, s7
                  and          a0, sp, a5
                  or           zero, a5, s7
                  srl          t4, t0, s3
                  div          s0, a0, s5
                  sltu         s9, t2, s1
                  c.slli       s9, 18
                  c.beqz       a1, 900f
                  bge          a0, t5, 900f
                  mulhu        s11, a3, t2
                  slli         a0, tp, 6
                  c.li         t6, -1
                  mulhsu       zero, a1, s10
                  divu         t0, t3, t3
                  c.li         gp, 7
                  c.addi       s2, 30
                  c.lui        a6, 1
900:              c.andi       a3, -1
                  c.srli       s1, 21
                  remu         a5, a5, t4
                  sra          a1, t5, s6
                  c.xor        a1, a5
                  mul          t0, ra, s4
                  slt          s2, s11, a3
                  c.srai       a1, 1
                  c.sub        a4, a0
                  srli         s1, gp, 1
                  nop
                  lui          a4, 224788
                  bltu         tp, gp, 922f
                  sra          s3, s2, ra
                  c.bnez       a0, 934f
                  c.srai       a0, 25
                  bltu         ra, s1, 925f
                  c.and        a4, a3
                  c.bnez       a0, 927f
                  c.mv         a4, a5
                  beq          a2, s0, 926f
                  c.xor        a5, a1
922:              c.srli       a3, 12
                  rem          a7, t2, s11
                  ori          s8, t1, 745
925:              andi         s6, gp, 1043
926:              blt          t4, s8, 931f
927:              srli         a2, t3, 26
                  lui          zero, 261526
                  c.or         a0, s0
                  xori         tp, s8, -766
931:              c.addi       t0, -1
                  andi         zero, a6, -132
                  c.beqz       a0, 935f
                  la           s2, region_1+395 #start riscv_hazard_instr_stream_16
                  mul          a0, s9, s9
                  ori          t1, s9, -568
                  auipc        a2, 795724
                  remu         t1, a0, s7
                  c.lui        a2, 13
                  lb           s7, 38(s2)
                  c.sub        a0, a2
                  lh           t1, 175(s2)
                  c.nop
                  and          a2, s5, s5
                  lbu          s7, 158(s2)
                  mul          s7, s9, s5
                  lb           a2, -106(s2)
                  lbu          s7, 184(s2)
                  and          s9, t1, a0
                  lui          s9, 469654
                  divu         a0, s7, s9
                  lb           a0, 204(s2)
                  xor          s5, s7, t1
                  c.xor        a0, a2
                  srl          a0, a2, a2
                  sb           a0, -172(s2)
                  rem          s7, s9, a2
                  lb           s7, 94(s2)
                  lhu          s9, -185(s2)
                  sltu         s5, s5, t1
                  sb           s5, 16(s2)
                  srli         s7, t1, 26
                  lh           t1, 17(s2)
                  lbu          a0, -194(s2)
                  lbu          s5, -190(s2)
                  div          a0, s5, a0
                  mul          a0, s9, t1
                  sb           s5, 74(s2)
                  sb           t1, 95(s2)
                  lw           s9, 37(s2)
                  lbu          a2, -225(s2)
                  sb           s5, -178(s2)
                  lbu          a0, 218(s2)
                  lb           a2, 164(s2)
                  c.addi       s7, 10
                  lb           s9, 0(s2)
                  sb           a0, 249(s2)
                  or           s9, a2, a0
                  add          s5, a2, s9
                  ori          a2, s7, -354
                  sra          t1, s9, s5
                  sb           s9, -202(s2)
                  nop
                  remu         s5, s9, s5
                  sra          a0, t1, a2
                  lb           t1, -122(s2) #end riscv_hazard_instr_stream_16
934:              c.bnez       a4, 935f
935:              c.or         a1, a5
                  sltu         t1, s3, a3
                  c.xor        s1, s0
                  srl          a0, s9, s10
                  c.beqz       a1, 945f
                  c.mv         a5, s0
                  bne          t5, t2, 960f
                  ori          s10, t2, 248
                  add          s0, t0, a5
                  bgeu         t3, tp, 952f
945:              c.or         s1, a0
                  andi         tp, a5, -1939
                  c.slli       t0, 29
                  srl          s10, t2, s1
                  srl          s11, t0, a7
                  auipc        t0, 361086
                  mulhu        s1, s7, zero
952:              c.li         s6, -1
                  ori          a3, s0, -741
                  sub          s4, t2, a7
                  beq          a0, t3, 957f
                  c.srli       a5, 21
957:              c.beqz       a4, 968f
                  c.bnez       a1, 961f
                  xor          t3, t3, t1
960:              rem          s3, t2, t5
961:              c.xor        a0, s1
                  sub          s3, s8, s5
                  divu         s3, t5, s7
                  sra          s6, t4, ra
                  remu         s0, s0, s2
                  c.beqz       s1, 983f
                  sra          a3, s8, t4
968:              c.srli       s1, 4
                  blt          a7, a6, 979f
                  divu         a2, s5, a0
                  auipc        s5, 179159
                  nop
                  ori          s4, s3, -1998
                  add          a7, zero, gp
                  c.srli       a3, 19
                  c.srli       s0, 9
                  mulhsu       s8, t3, t5
                  div          t1, sp, s4
979:              andi         a2, t0, 1105
                  c.add        s9, s2
                  sll          s6, tp, t6
                  addi         t4, a2, 199
983:              rem          s8, s8, s10
                  srl          a5, s5, gp
                  c.srai       a1, 20
                  sltu         zero, t6, s3
                  c.sub        s0, a4
                  c.nop
                  xor          s9, t6, s9
                  sltiu        s7, tp, -1636
                  mulhu        s7, s8, t0
                  c.andi       a3, -1
                  addi         s0, s11, 1234
                  c.li         s1, 3
                  c.sub        a4, a3
                  or           a0, s10, t0
                  sll          s5, ra, s7
                  la           s0, amo_0+56 #start riscv_amo_instr_stream_8
                  la           tp, amo_0+40
                  amoor.w       t1, t6, (tp)
                  c.sub        a2, s0
                  amoadd.w.rl   a3, ra, (tp)
                  amoadd.w.rl   s10, s7, (s0)
                  amoand.w.aq   s9, zero, (tp)
                  srai         t0, s8, 30
                  mulhsu       s7, t2, a5
                  amomaxu.w.rl  s2, ra, (s0)
                  amomaxu.w     a2, s0, (s0)
                  rem          a5, s0, a6
                  amomax.w      a5, a6, (s0)
                  amomaxu.w.aq  a4, t1, (s0) #end riscv_amo_instr_stream_8
                  slli         s11, t4, 24
                  c.nop
                  c.addi       a5, -1
                  or           ra, s10, a7
                  c.li         tp, 16
                  slt          s10, t6, s8
                  mulh         a2, s3, s9
                  or           gp, a1, gp
                  rem          s2, a5, a5
                  c.and        a1, s0
                  c.mv         a4, a4
                  bge          t5, sp, 1023f
                  bne          t0, s10, 1030f
                  sub          a2, s0, s5
                  c.li         t1, 23
                  nop
                  xori         zero, s10, -320
                  andi         a3, sp, 1147
                  sub          a1, t2, s9
                  lui          a2, 197311
                  c.xor        s0, a4
                  c.mv         s10, a3
                  sll          t0, s9, t5
                  mulhsu       a4, s0, s10
                  auipc        t1, 752455
1023:             and          s3, t2, gp
                  and          s1, a7, a5
                  slti         a1, s2, -1303
                  andi         s8, t1, 368
                  bltu         a2, s3, 1041f
                  c.srli       a1, 12
                  xori         a1, a0, 1400
1030:             sra          s10, a3, t2
                  mul          s8, a5, a6
                  divu         s7, s5, t5
                  sltu         t6, a7, s1
                  andi         t0, t5, -1071
                  c.or         a1, a5
                  nop
                  c.srli       s0, 26
                  sltu         s8, a4, a0
                  mulh         a2, a1, a2
                  c.sub        s0, a5
1041:             rem          s11, a5, zero
                  bgeu         s1, zero, 1052f
                  c.and        a2, a0
                  mulh         a1, t3, t5
                  div          s0, a0, a4
                  bgeu         s4, s10, 1060f
                  sra          s0, t5, a4
                  c.or         a2, s1
                  sltiu        s2, a4, -1750
                  sltu         ra, s10, a0
                  add          ra, s6, s3
1052:             bgeu         gp, s6, 1053f
1053:             ori          a0, t2, -1385
                  beq          t6, a3, 1060f
                  mulhsu       ra, s8, t1
                  c.li         gp, 9
                  bge          s0, s10, 1071f
                  c.or         s1, a4
                  remu         s1, s7, gp
1060:             rem          s0, t3, s10
                  add          s2, a3, t2
                  slti         s11, s9, 799
                  andi         s8, s2, 2025
                  c.or         a1, a1
                  srli         s0, a4, 4
                  sltiu        s10, a1, -1359
                  c.lui        t1, 26
                  bge          a4, s7, 1077f
                  addi         a4, s7, 504
                  c.sub        s0, a1
1071:             c.add        a3, sp
                  c.lui        t0, 18
                  c.srli       a0, 5
                  c.srli       a1, 29
                  c.srai       a3, 19
                  sub          zero, s4, s1
1077:             c.xor        a4, a2
                  add          a4, s7, t0
                  bgeu         s0, s8, 1081f
                  andi         a7, t3, 859
1081:             divu         ra, a3, zero
                  lui          s6, 895068
                  add          a6, a7, t3
                  bge          t4, t2, 1086f
                  c.li         t1, 9
1086:             remu         a4, t6, tp
                  c.lui        a3, 24
                  srl          zero, s1, t0
                  srai         s8, s1, 1
                  slt          a5, s11, a2
                  rem          zero, t1, t5
                  lui          s2, 641724
                  srl          gp, zero, a4
                  addi         s7, t6, 915
                  blt          sp, s4, 1096f
1096:             sltu         s8, sp, s1
                  and          s10, t6, s5
                  c.beqz       a2, 1104f
                  addi         s6, a1, -1364
                  rem          a0, a3, s1
                  c.and        a5, a5
                  andi         t3, s2, 1078
                  bltu         s10, s7, 1109f
1104:             remu         s3, s4, s6
                  xor          t4, s8, a2
                  c.beqz       s0, 1126f
                  rem          s6, t5, t4
                  add          a4, a0, s8
1109:             bltu         s10, a4, 1123f
                  c.mv         s6, t4
                  or           s2, t5, zero
                  c.or         a3, a4
                  beq          a2, t6, 1133f
                  sltu         a4, a7, a1
                  div          t1, a5, s1
                  sub          s3, a3, t1
                  sltiu        s1, s0, -242
                  c.slli       a5, 26
                  c.bnez       a1, 1120f
1120:             sltu         a4, s3, s7
                  nop
                  c.mv         a6, a2
1123:             c.xor        a3, a3
                  c.beqz       a0, 1128f
                  c.li         s6, -1
1126:             c.mv         tp, a3
                  mulh         s1, s6, s2
1128:             c.xor        a3, s1
                  sll          a7, s7, zero
                  sra          a1, ra, s9
                  mulhsu       a4, a7, s2
                  add          s5, a4, a2
1133:             sub          s0, gp, s2
                  xori         s0, sp, -496
                  mulhu        s2, s8, sp
                  addi         zero, gp, 1538
                  c.lui        t6, 27
                  mulh         a1, t1, s2
                  c.srai       a3, 25
                  sra          tp, a3, s7
                  c.srli       a1, 3
                  or           gp, s3, gp
                  rem          s0, t6, s9
                  c.and        a1, s0
                  sra          s2, a7, a4
                  c.nop
                  mulhsu       s9, s5, s4
                  sltu         ra, s2, a7
                  c.srai       a1, 30
                  c.andi       s0, 0
                  slt          s1, a7, a0
                  xor          zero, s11, t0
                  c.or         a3, a2
                  lui          a0, 124874
                  andi         t0, a2, 800
                  srl          s1, s9, s7
                  xor          a1, s5, s10
                  addi         s10, t5, 1815
                  bge          s2, gp, 1179f
                  srli         t3, s9, 9
                  c.slli       a7, 9
                  auipc        t4, 596464
                  c.and        a0, a4
                  addi         t6, gp, -4
                  bge          t6, s10, 1184f
                  c.and        a0, a1
                  div          zero, t4, a3
                  andi         s0, s8, 1467
                  slt          a4, t6, s6
                  mulhsu       s0, s5, a3
                  and          s3, a6, a4
                  c.srli       a0, 10
                  sra          s0, s0, s8
                  nop
                  sub          a7, s3, s3
                  mulhu        a6, s5, t6
                  sltu         s5, s11, s4
                  srl          a3, gp, sp
1179:             sltu         t4, t2, a6
                  sra          a2, t3, s4
                  mulhu        s9, t1, a0
                  c.li         a2, 24
                  xor          s6, a5, s10
1184:             bltu         a1, t4, 1193f
                  nop
                  c.nop
                  div          a5, s7, t4
                  xor          s8, a2, s10
                  and          a4, s1, a6
                  blt          s4, gp, 1199f
                  c.andi       a1, -1
                  andi         tp, s7, 657
1193:             xori         zero, tp, 1917
                  divu         a6, s10, t1
                  c.li         s3, 20
                  slli         ra, s4, 25
                  c.xor        a3, a2
                  sltu         a5, s9, a2
1199:             c.or         s0, s1
                  srl          tp, t1, t4
                  c.srli       s1, 20
                  xori         s5, s9, -11
                  c.addi       a2, 11
                  c.bnez       s1, 1209f
                  srai         a2, s3, 27
                  srl          t3, s7, a0
                  mulh         a5, a1, a3
                  mulhu        s1, a5, zero
1209:             c.lui        ra, 3
                  c.bnez       a5, 1230f
                  sub          a5, zero, s3
                  mul          s5, s5, zero
                  c.sub        a0, a2
                  bltu         s5, t6, 1228f
                  c.slli       t0, 30
                  c.bnez       s0, 1235f
                  sltiu        a2, s0, -647
                  xor          s5, t1, s0
                  slti         s10, a3, 767
                  srli         s6, s1, 20
                  rem          a6, t1, s1
                  mulh         t4, gp, t2
                  c.andi       a0, -1
                  remu         a6, a1, a2
                  and          s11, s8, s10
                  slti         t3, zero, 612
                  bge          a7, a5, 1241f
1228:             bge          s6, a2, 1238f
                  nop
1230:             sll          t4, s4, t6
                  sll          s1, a6, a1
                  andi         a1, a4, -12
                  c.mv         t1, a6
                  mulhsu       tp, ra, s6
1235:             c.sub        a4, a0
                  and          zero, t5, a4
                  c.addi       gp, -1
1238:             slti         s8, s5, -1004
                  div          zero, a3, a6
                  and          s5, t2, t4
1241:             and          t1, a5, gp
                  div          s7, t4, t1
                  sra          a2, s2, tp
                  c.and        a3, a0
                  andi         zero, s3, 171
                  srai         tp, t5, 17
                  xor          a1, t1, s1
                  and          a7, t2, sp
                  bge          a3, s6, 1269f
                  blt          s9, a0, 1252f
                  mul          a1, ra, s10
1252:             c.addi       t4, -1
                  c.srli       s1, 26
                  bne          tp, a3, 1255f
1255:             c.srai       a0, 4
                  blt          a1, t1, 1258f
                  mulh         a1, gp, a2
1258:             add          a5, s6, ra
                  srli         s3, a0, 28
                  mul          a0, s8, t4
                  c.slli       t1, 20
                  auipc        s0, 424241
                  mul          s5, a4, t1
                  srai         s1, ra, 16
                  mulhu        s2, s11, t3
                  c.sub        a5, a0
                  slti         s9, t1, -831
                  c.beqz       s1, 1285f
1269:             nop
                  srl          t4, t6, s4
                  addi         a4, a1, -1390
                  mulhsu       a1, t3, t0
                  or           tp, a0, s3
                  sltu         t3, t3, t0
                  slti         s1, s1, 1634
                  sub          t0, t2, a1
                  bltu         s3, ra, 1280f
                  bgeu         t3, t1, 1283f
                  srl          a2, tp, tp
1280:             c.srli       s1, 12
                  mulh         t0, t0, s6
                  mulhu        a7, a5, a1
1283:             c.andi       a5, 21
                  div          a7, a2, t6
1285:             srl          t3, s11, s1
                  la           a0, region_1+495 #start riscv_hazard_instr_stream_8
                  andi         a1, s11, 736
                  sw           s6, 1165(a0)
                  c.srai       a4, 6
                  sb           a1, 999(a0)
                  c.slli       s6, 2
                  lbu          a1, 190(a0)
                  lb           a4, 279(a0)
                  addi         a1, a1, 1270
                  add          s6, a4, s4
                  lb           s5, 587(a0)
                  lbu          s4, -440(a0)
                  lb           s5, 747(a0)
                  lb           a1, 356(a0)
                  sb           a4, 1440(a0)
                  addi         s11, s11, 1306
                  c.or         a4, a1
                  c.or         a1, a4
                  lhu          s11, 1015(a0)
                  lbu          s11, -171(a0)
                  lb           s4, 65(a0)
                  sb           a4, 900(a0)
                  lbu          a1, -324(a0)
                  lhu          s5, -337(a0)
                  lb           a1, 162(a0)
                  lbu          s5, 518(a0)
                  lb           s5, -47(a0)
                  lb           s5, 494(a0)
                  slti         a4, s4, 120
                  sb           s4, 1038(a0)
                  andi         s4, s4, -1855
                  sb           a1, -226(a0)
                  lbu          s11, 192(a0)
                  addi         a1, a1, -673
                  add          a1, s6, a4
                  c.add        s4, s4
                  sb           a1, -486(a0)
                  addi         s11, a1, 43
                  c.slli       a4, 2
                  lh           a4, -327(a0)
                  lb           a4, 317(a0)
                  c.slli       a1, 1
                  sb           s6, 1255(a0)
                  lbu          s5, 792(a0)
                  c.nop
                  add          a1, s6, a1
                  lb           a1, 1041(a0) #end riscv_hazard_instr_stream_8
                  bgeu         t4, s1, 1295f
                  c.sub        a2, s1
                  c.add        s4, s7
                  lui          s7, 876933
                  addi         s0, t0, 1802
                  c.srai       a5, 18
                  or           ra, gp, sp
                  bge          a5, ra, 1299f
                  sltu         a4, s2, tp
1295:             c.andi       s0, -1
                  c.add        s7, s3
                  c.srli       a5, 11
                  c.mv         t0, t4
1299:             c.srli       a5, 16
                  sll          s0, s1, s0
                  auipc        s9, 143878
                  bne          t4, t3, 1308f
                  rem          s8, a0, t3
                  c.nop
                  div          t0, s8, s9
                  sltiu        s8, sp, 89
                  mulhsu       zero, a4, zero
1308:             c.nop
                  bne          s11, s3, 1323f
                  lui          a4, 393190
                  or           t0, s9, s4
                  divu         s6, t6, t0
                  c.beqz       s1, 1321f
                  c.xor        a2, a1
                  c.srli       a0, 27
                  sub          a1, s9, a6
                  slti         s9, s4, -776
                  rem          s4, s4, t4
                  beq          a3, a2, 1339f
                  and          s1, a5, a2
1321:             mulhsu       a0, a4, s1
                  mulhu        s6, s8, s5
1323:             srai         s10, s3, 19
                  nop
                  xor          t0, zero, t0
                  srli         s3, t3, 2
                  c.mv         s9, s1
                  srai         s9, s6, 1
                  c.add        a0, s8
                  addi         t4, ra, 128
                  sra          s3, a6, t6
                  beq          t5, s9, 1352f
                  c.sub        s1, a3
                  lui          s8, 484056
                  or           t4, a5, a4
                  c.beqz       s1, 1350f
                  auipc        t3, 353555
                  c.nop
1339:             mulhu        a6, t5, t3
                  slli         s4, t6, 18
                  xor          a2, s2, a2
                  bltu         s10, s5, 1353f
                  mulhu        t0, a6, t1
                  or           a7, a1, t2
                  sll          a6, s9, ra
                  c.bnez       a2, 1347f
1347:             c.and        a0, a4
                  remu         t6, t4, t1
                  add          s5, t3, s10
1350:             bne          a1, a5, 1356f
                  c.lui        a5, 21
1352:             ori          a7, t6, -1509
1353:             c.slli       t1, 21
                  div          a3, s5, a2
                  div          t1, zero, a3
1356:             c.or         s1, s0
                  or           a0, t6, t6
                  lui          a0, 729887
                  sltiu        a0, t6, 886
                  beq          t1, gp, 1369f
                  c.li         tp, -1
                  c.add        t6, a6
                  c.nop
                  mulh         s10, s5, a2
                  ori          tp, a5, -432
                  c.nop
                  c.add        tp, s1
                  mulh         t4, s0, s8
1369:             c.srai       a2, 5
                  bge          a1, gp, 1379f
                  c.srai       s1, 11
                  c.and        a1, a3
                  c.nop
                  nop
                  c.srli       a4, 26
                  c.and        a2, a5
                  and          tp, s1, s6
                  c.andi       a3, 15
1379:             beq          a3, t5, 1393f
                  bge          t4, a0, 1381f
1381:             bgeu         t5, t3, 1385f
                  nop
                  c.beqz       s1, 1393f
                  beq          zero, a3, 1386f
1385:             c.mv         t1, a4
1386:             rem          a1, s5, s1
                  sltiu        t3, s8, 758
                  xori         s1, zero, -73
                  bne          s2, s3, 1403f
                  or           t6, s0, ra
                  blt          s4, a1, 1396f
                  mul          a5, a6, ra
1393:             srai         s10, a0, 17
                  sltu         a5, zero, a4
                  c.beqz       a5, 1401f
1396:             ori          a1, ra, -156
                  c.andi       a3, 29
                  srli         a6, a3, 25
                  c.li         a5, -1
                  c.xor        a5, a2
1401:             c.slli       s4, 2
                  andi         a1, a7, 169
1403:             c.nop
                  c.lui        gp, 26
                  mulh         zero, a6, zero
                  rem          s5, s5, t5
                  srai         a3, a4, 6
                  c.sub        s1, a5
                  c.andi       a0, 23
                  blt          t4, ra, 1412f
                  add          s8, a4, s5
1412:             mul          t0, s6, s1
                  addi         a4, s5, 1199
                  xor          tp, t4, s11
                  mul          t3, s10, a0
                  lui          a6, 700714
                  srli         a7, s7, 26
                  bgeu         s1, gp, 1429f
                  sll          s5, s3, s8
                  remu         a4, a6, s11
                  slli         s11, s6, 25
                  divu         t3, s3, a2
                  remu         s4, s9, t1
                  srl          tp, a4, a3
                  srl          gp, a5, sp
                  or           s7, t0, s2
                  srai         t1, t2, 9
                  add          s9, t6, t1
1429:             mul          s0, t3, ra
                  c.addi       s8, -1
                  c.srli       a0, 28
                  andi         a3, zero, -1184
                  c.beqz       a5, 1453f
                  rem          s2, t0, s10
                  lui          s5, 871381
                  mul          a0, a3, s6
                  ori          a3, a2, -208
                  sub          s2, s1, s2
                  add          s11, s11, gp
                  c.bnez       a3, 1441f
1441:             xori         s10, tp, -1141
                  or           s1, t6, t3
                  c.nop
                  rem          gp, t3, tp
                  auipc        a7, 59129
                  c.add        s1, s7
                  c.sub        s0, a3
                  c.andi       a3, -1
                  c.srai       a2, 7
                  divu         s0, t6, t3
                  bltu         a3, s11, 1457f
                  beq          a3, t4, 1460f
1453:             c.mv         gp, a2
                  mulhsu       ra, sp, s8
                  bgeu         t3, a0, 1464f
                  bne          s0, s2, 1458f
1457:             sltiu        a6, gp, -1189
1458:             sra          t1, s0, sp
                  srl          t4, s6, s3
1460:             bltu         a7, s7, 1470f
                  ori          s4, gp, 663
                  bge          a6, s10, 1481f
                  c.add        s3, tp
1464:             srl          a0, a4, tp
                  or           s1, zero, a4
                  div          a5, s8, t3
                  or           s7, tp, a6
                  and          s11, t3, a4
                  or           a1, a2, a0
1470:             bltu         ra, t4, 1484f
                  addi         t1, t2, 1090
                  nop
                  c.srli       a1, 26
                  addi         s2, a0, 1658
                  srli         a3, s4, 15
                  addi         t1, a1, -1049
                  slt          s4, a2, a0
                  c.slli       a7, 6
                  sra          s1, s10, s5
                  slt          a5, s11, a2
1481:             slt          a1, s2, a7
                  srai         gp, a4, 9
                  mulh         a6, a0, t1
1484:             blt          zero, sp, 1488f
                  or           s11, gp, t2
                  andi         gp, a6, 1329
                  beq          s11, zero, 1507f
1488:             ori          t1, s5, -913
                  c.slli       tp, 19
                  mulhu        zero, t3, zero
                  c.addi       s2, 29
                  c.andi       a0, 13
                  c.sub        a3, s0
                  div          s0, ra, a3
                  c.add        s10, tp
                  sll          s1, a4, a4
                  slt          a6, s9, s4
                  c.and        a5, a0
                  mulh         gp, s2, s8
                  lui          t1, 9475
                  bne          s1, sp, 1502f
1502:             nop
                  xori         a1, a3, -403
                  sub          a0, ra, a5
                  lui          s5, 1043104
                  addi         s11, s4, 1996
1507:             c.beqz       a0, 1508f
1508:             c.or         a3, a4
                  xor          s0, s7, a7
                  srai         t1, t3, 23
                  auipc        s2, 805692
                  bne          a0, s6, 1526f
                  slt          t3, t3, t1
                  sll          s1, t4, a1
                  c.mv         t3, a6
                  bge          sp, t3, 1530f
                  sll          t1, s7, t1
                  ori          t4, a3, -1801
                  bne          zero, t1, 1525f
                  rem          s4, s1, ra
                  xori         a6, a5, 778
                  addi         a5, tp, 1029
                  c.bnez       a2, 1525f
                  sra          a4, t4, ra
1525:             bge          gp, a3, 1545f
1526:             blt          t6, a1, 1529f
                  sub          zero, s5, t3
                  sra          s3, t6, s7
1529:             c.nop
1530:             srli         gp, zero, 30
                  c.lui        s9, 17
                  div          a2, s2, sp
                  mul          s3, sp, sp
                  divu         a4, t6, a0
                  bne          sp, t0, 1545f
                  c.mv         s2, a1
                  c.mv         tp, gp
                  mulhu        s9, a7, s8
                  remu         a1, s11, tp
                  mulhu        s0, s0, s2
                  srai         t3, a3, 17
                  blt          t5, t4, 1559f
                  c.srai       s0, 15
                  auipc        s6, 648573
1545:             rem          s7, t5, t0
                  sltu         a1, zero, s0
                  nop
                  bltu         t1, t6, 1557f
                  c.srli       s1, 12
                  slli         s6, s2, 19
                  c.srai       a3, 27
                  bgeu         gp, a0, 1572f
                  bne          a1, s2, 1567f
                  srai         s3, s9, 19
                  c.beqz       a1, 1564f
                  c.sub        a0, a0
1557:             c.srai       s1, 7
                  rem          s7, tp, a6
1559:             andi         s11, s7, -1643
                  xori         s5, a2, 1593
                  add          s10, t1, zero
                  mulh         gp, s7, a5
                  ori          a2, sp, -125
1564:             c.xor        s0, a5
                  add          s5, a1, gp
                  rem          s9, t2, s0
1567:             c.beqz       a5, 1570f
                  c.or         a2, a5
                  c.mv         a7, a7
1570:             c.slli       t3, 17
                  c.nop
1572:             beq          t3, s11, 1582f
                  nop
                  c.and        a4, a2
                  beq          s3, s3, 1589f
                  sltu         a2, t5, t3
                  divu         t4, t1, ra
                  srli         s9, t4, 13
                  bgeu         a2, s8, 1585f
                  slti         s8, s3, 1414
                  srli         a4, s10, 2
1582:             bge          t1, zero, 1584f
                  slli         a5, sp, 12
1584:             sll          t6, t4, gp
1585:             c.nop
                  sll          s2, s11, s8
                  bltu         a3, s4, 1596f
                  bgeu         t4, sp, 1596f
1589:             c.add        s7, a2
                  or           a1, sp, s2
                  c.sub        a4, s1
                  c.li         gp, 9
                  c.lui        a5, 11
                  sub          a0, t0, ra
                  c.xor        a3, a0
1596:             add          a6, gp, ra
                  bgeu         t4, a6, 1607f
                  c.beqz       s1, 1609f
                  srl          zero, a1, a6
                  bltu         a3, a5, 1604f
                  c.bnez       a3, 1615f
                  sltu         a1, s0, a5
                  slt          s2, s3, a0
1604:             remu         s3, s9, t6
                  c.lui        a7, 12
                  mulhsu       t6, t0, s5
1607:             c.srai       a2, 20
                  slli         t6, a1, 27
1609:             bltu         ra, s6, 1611f
                  lui          s10, 613672
1611:             divu         t4, gp, s8
                  mulhsu       tp, t2, gp
                  c.bnez       a0, 1627f
                  c.and        s0, a0
1615:             c.sub        a4, a0
                  c.sub        a3, a1
                  slt          s2, s0, t4
                  c.srai       a3, 10
                  andi         t1, zero, -38
                  slti         s4, s11, 1186
                  beq          s1, t5, 1635f
                  divu         t0, s7, a0
                  c.beqz       s0, 1632f
                  c.mv         s9, s11
                  mulh         s3, t1, gp
                  c.beqz       a5, 1643f
1627:             xori         s1, s8, 1761
                  sltiu        s4, t3, 619
                  bne          a3, s6, 1634f
                  bgeu         a1, s1, 1636f
                  auipc        a6, 530782
1632:             sra          s3, a5, a3
                  c.or         a5, a3
1634:             c.lui        a0, 1
1635:             srli         s10, zero, 16
1636:             c.srli       a2, 6
                  srl          s5, sp, a3
                  xor          s3, a6, s9
                  and          a3, zero, a6
                  div          s4, t0, s11
                  sra          s10, t5, s11
                  c.xor        a3, a5
1643:             srl          gp, s9, sp
                  c.sub        a3, s1
                  sltu         zero, s6, s11
                  bge          s0, a0, 1655f
                  c.nop
                  c.beqz       a0, 1649f
1649:             srli         a2, a2, 12
                  xori         s4, s3, 1985
                  andi         a2, t1, 907
                  sll          t6, s4, a2
                  rem          s6, t2, s5
                  add          s3, t1, gp
1655:             bne          s5, ra, 1656f
1656:             addi         a1, s11, -249
                  c.or         a0, a5
                  and          s1, a1, s3
                  beq          s10, s7, 1661f
                  srli         s7, t4, 23
1661:             srl          s2, s10, a5
                  div          s4, zero, s9
                  ori          s11, s10, 1828
                  bltu         s4, t1, 1684f
                  remu         t4, s1, s3
                  bltu         a4, s0, 1680f
                  sub          a0, a5, a7
                  sra          s0, tp, a4
                  slt          s11, s9, t2
                  blt          s10, s7, 1690f
                  sltu         a1, s9, s2
                  c.srai       a2, 26
                  c.sub        a3, a2
                  remu         s4, tp, s0
                  blt          s7, a6, 1676f
1676:             remu         t3, t3, tp
                  c.srli       s1, 19
                  c.addi       gp, -1
                  or           s9, s6, s0
1680:             c.srai       a1, 17
                  c.sub        a3, a4
                  c.srli       s1, 30
                  sltiu        s11, t0, -1221
1684:             lui          a4, 9186
                  auipc        s3, 732686
                  c.mv         ra, t2
                  c.sub        s1, a0
                  bgeu         s10, t1, 1708f
                  mulhu        s5, a3, tp
1690:             srai         gp, gp, 23
                  mulhu        s9, zero, s7
                  auipc        a4, 11209
                  c.sub        a3, s0
                  c.addi       s6, 17
                  bgeu         gp, t4, 1715f
                  mulh         t4, t4, a5
                  sltu         s5, s10, a2
                  beq          t2, a0, 1717f
                  rem          t6, tp, t0
                  addi         s6, t2, -176
                  slli         a5, t3, 10
                  and          tp, sp, a1
                  mulhu        t0, t2, ra
                  c.addi       tp, 16
                  divu         t3, t2, t6
                  srai         t6, a6, 23
                  c.mv         s8, s10
1708:             c.nop
                  mulh         s11, s2, s6
                  c.slli       a0, 10
                  c.add        a2, s11
                  sub          t0, a0, s7
                  sub          a3, t3, t3
                  bgeu         s5, s3, 1720f
1715:             srli         gp, s0, 2
                  bne          t5, s6, 1722f
1717:             mul          a4, s6, a1
                  c.srli       s0, 4
                  add          s3, zero, a0
1720:             sltu         a0, a4, s8
                  rem          a4, a4, t5
1722:             rem          t4, gp, s2
                  c.srli       a4, 27
                  srl          s11, a5, t5
                  sub          s1, zero, s10
                  or           s1, s7, a7
                  c.andi       a1, -1
                  bne          zero, s5, 1745f
                  mul          s6, t3, tp
                  mul          s5, s7, t3
                  add          ra, s5, zero
                  bge          a7, s4, 1737f
                  mulh         a0, s2, s10
                  andi         t0, ra, -1606
                  div          s3, s2, t5
                  slli         s9, a1, 13
1737:             srl          a4, s1, s1
                  xor          s1, a5, s8
                  bgeu         s7, s0, 1741f
                  xori         s11, s6, 1597
1741:             blt          t1, s9, 1755f
                  c.and        s0, a3
                  c.srai       a4, 7
                  mul          a1, a5, t6
1745:             xori         s8, s9, 1846
                  c.srai       a4, 1
                  mulhu        a5, a5, s2
                  addi         a2, s4, 776
                  c.li         s11, 28
                  or           s10, s8, tp
                  sub          a4, s4, t2
                  xor          zero, t3, gp
                  divu         tp, tp, tp
                  c.srai       a5, 7
                  nop
                  blt          s5, a7, sub_3_j7 #branch to jump instr
                  c.lui        a4, 27
                  rem          s4, tp, s11
                  c.mv         a1, t1
                  sltu         s9, t0, t1
sub_3_j7:         jal          a0, sub_4 #jump sub_3 -> sub_4
1755:             mulhu        a2, t5, s6
                  c.addi       a0, 17
                  mulh         t6, t6, a2
                  mulhu        t6, a0, sp
                  sub          t3, a2, t3
                  c.beqz       a1, 1761f
1761:             sll          tp, sp, a5
                  or           s3, t2, s0
                  c.srli       a2, 6
                  bltu         t5, t5, 1784f
                  mulhu        a1, a3, a5
                  c.andi       a5, -1
                  auipc        t4, 913857
                  rem          ra, s5, t5
                  mulhu        a7, a3, gp
                  rem          s7, s4, t3
                  sll          t3, a3, t2
                  c.bnez       s1, 1786f
                  mulhu        gp, t0, ra
                  beq          s6, t6, 1777f
                  mul          tp, a1, t5
                  ori          t1, t6, 1137
1777:             c.lui        s8, 9
                  blt          t3, a1, 1784f
                  div          a4, s8, zero
                  and          a3, a7, s11
                  rem          a0, a5, t3
                  bltu         gp, gp, 1802f
                  bne          s4, t2, 1792f
1784:             slli         s2, a4, 14
                  c.or         a1, a5
1786:             or           tp, t0, s7
                  auipc        s2, 172096
                  bltu         s9, a6, 1808f
                  div          a2, a2, a3
                  addi         s3, s5, -1204
                  slt          s8, ra, t6
1792:             or           t3, s9, t4
                  and          gp, a6, ra
                  blt          s9, s8, 1795f
1795:             beq          t1, a3, 1806f
                  slti         a4, s3, -907
                  bgeu         t2, s0, 1805f
                  mulhsu       t0, s11, ra
                  mul          t0, t6, t5
                  blt          t3, a4, 1802f
                  c.and        a0, a0
1802:             sra          a2, s7, sp
                  div          s6, t1, s11
                  sltiu        a0, s4, 919
1805:             xori         t3, s3, 609
1806:             bgeu         s11, s4, 1820f
                  or           a3, ra, a7
1808:             c.beqz       s0, 1822f
                  auipc        t4, 944337
                  xor          t4, ra, s1
                  xor          s1, s11, a2
                  c.srai       a5, 17
                  c.mv         s6, s0
                  div          s4, t4, a0
                  c.andi       a3, 14
                  srli         s4, zero, 8
                  slt          s8, s11, ra
                  c.xor        a3, a0
                  c.mv         s8, ra
1820:             c.srli       a1, 3
                  bne          t6, t2, 1831f
1822:             bne          s11, t6, 1826f
                  xori         t1, s9, -26
                  c.or         s1, s1
                  blt          s0, a5, 1831f
1826:             mul          t3, gp, sp
                  remu         a0, a3, a0
                  srl          s8, s4, a0
                  addi         t4, a1, 1786
                  bne          t4, t6, 1832f
1831:             auipc        s4, 695675
1832:             rem          s2, t4, s0
                  slli         s11, a1, 11
                  bltu         a4, s8, 1854f
                  bgeu         a1, t5, 1854f
                  bltu         s11, s4, 1845f
                  c.mv         a4, s2
                  c.sub        a3, a3
                  beq          s1, s3, 1848f
                  bne          a2, ra, 1841f
1841:             c.sub        a0, s1
                  c.andi       a0, 25
                  c.beqz       a3, 1857f
                  bgeu         t3, a0, 1854f
1845:             sltiu        t3, t0, 1199
                  c.or         s1, a4
                  mulhsu       s2, t1, sp
1848:             c.addi       gp, 21
                  xor          s3, t3, a3
                  remu         a6, a2, t3
                  xori         s0, s8, -1474
                  bgeu         zero, sp, 1854f
                  beq          s7, s11, 1867f
1854:             add          gp, a1, s3
                  c.sub        a2, a5
                  andi         s11, a0, 951
1857:             c.lui        a6, 6
                  rem          t1, t6, a3
                  slti         s8, sp, 952
                  ori          s0, zero, -1289
                  div          a1, sp, s1
                  c.xor        s0, s0
                  sltiu        s0, t5, 212
                  bltu         ra, t6, 1874f
                  c.nop
                  rem          s7, a3, a1
1867:             andi         a1, s10, 573
                  srli         tp, ra, 7
                  srli         gp, a4, 8
                  lui          t3, 298323
                  sra          a1, tp, t4
                  c.sub        a1, a0
                  beq          gp, a7, 1874f
1874:             andi         s11, s0, 1093
                  sub          t3, a2, s9
                  mulh         a3, s4, t5
                  c.mv         s6, t5
                  divu         a4, sp, sp
                  c.or         a4, s0
                  sltiu        a2, sp, 1398
                  andi         s11, t3, 837
                  rem          a4, s9, t6
                  bltu         t6, t4, 1903f
                  c.sub        a0, a5
                  nop
                  ori          s7, a5, -620
                  c.addi       ra, 24
                  c.li         s4, 25
                  addi         s1, gp, -753
                  slt          t3, gp, sp
                  srai         s4, s8, 4
                  andi         tp, s3, -364
                  bne          t6, a2, 1902f
                  blt          a2, ra, 1903f
                  bltu         a0, sp, 1898f
                  c.slli       tp, 22
                  mulhsu       ra, s7, a0
1898:             c.beqz       a2, 1918f
                  c.mv         t4, a3
                  srl          t0, a0, a7
                  c.beqz       a5, 1903f
1902:             c.lui        a0, 6
1903:             andi         s2, s1, -126
                  c.srai       a1, 7
                  ori          a2, a5, -879
                  bgeu         s2, a4, 1912f
                  mulhu        s0, sp, s9
                  mulhu        zero, gp, s8
                  bltu         s8, a3, 1923f
                  srl          a1, s6, tp
                  addi         s8, a7, -778
1912:             c.or         a5, a1
                  bltu         t0, s3, 1919f
                  nop
                  c.mv         s0, a1
                  c.srli       a4, 2
                  c.sub        a5, a0
1918:             auipc        s8, 802071
1919:             sra          t4, sp, s3
                  lui          t1, 878485
                  slli         zero, a5, 7
                  srai         s8, s0, 12
1923:             add          s5, t2, a3
                  sll          s5, t5, s2
                  sub          ra, t6, a0
                  and          s11, s11, s2
                  bge          t2, a2, 1931f
                  c.bnez       a4, 1929f
1929:             div          t0, s2, a6
                  auipc        t4, 355809
1931:             rem          t0, a4, a5
                  c.addi       t3, -1
                  c.addi       t1, -1
                  srai         t0, s9, 15
                  div          a4, a7, gp
                  or           tp, s8, s2
                  c.and        a0, s0
                  divu         a7, s6, t1
                  rem          tp, s7, t2
                  sltiu        t1, s6, -248
                  c.slli       a4, 16
                  bne          t6, gp, 1951f
                  addi         t4, s9, 914
                  sll          a4, t3, zero
                  c.and        s1, a2
                  c.andi       s1, -1
                  c.xor        a1, a1
                  c.xor        s1, a4
                  c.bnez       a0, 1963f
                  bgeu         a3, a7, 1951f
1951:             c.beqz       a1, 1970f
                  mulh         a6, s0, a0
                  bge          a5, s5, 1967f
                  auipc        s1, 938166
                  bne          s1, s1, 1963f
                  add          s3, s9, a7
                  sltu         s2, s4, a4
                  sub          s3, t6, s10
                  sub          s2, t0, a7
                  mulhu        s11, t4, a1
                  sub          a6, a4, a4
                  slli         t4, t0, 12
1963:             c.srai       a0, 17
                  beq          s5, a1, 1984f
                  bge          s2, s8, 1979f
                  addi         t1, s6, -1547
1967:             c.or         a2, s1
                  divu         s3, t6, a6
                  c.slli       a4, 1
1970:             slti         gp, s7, -2005
                  c.srli       a1, 20
                  sll          a4, t3, a3
                  slt          s0, zero, s5
                  sltiu        a0, a3, -1043
                  mulh         zero, s2, s5
                  c.and        a5, s1
                  remu         t1, a6, t1
                  c.or         a1, a3
1979:             remu         s3, t4, s4
                  c.mv         s0, s6
                  mulh         s10, s3, s7
                  divu         s2, tp, s9
                  auipc        a4, 443837
1984:             c.xor        s1, s0
                  andi         s3, s6, 1272
                  bltu         sp, ra, 2003f
                  c.xor        a0, a5
                  c.lui        tp, 26
                  c.or         a1, a5
                  c.beqz       s0, 1992f
                  c.srli       a5, 26
1992:             auipc        tp, 86147
                  c.li         a4, 7
                  mulh         s8, a3, s0
                  slti         a7, t4, -420
                  c.andi       a4, 20
                  c.lui        a5, 7
                  nop
                  mulhsu       a6, s6, a6
                  sub          s8, s6, s8
                  sltiu        s8, s3, -328
                  c.beqz       a3, 2007f
2003:             add          t1, s6, s1
                  c.or         s1, a0
                  sra          s3, s10, a0
                  ori          s4, s8, 1978
2007:             mulhsu       a0, s6, s6
                  addi         a0, t4, 1757
                  lui          a3, 467304
                  and          tp, sp, ra
                  sltu         a3, a0, s2
                  andi         a4, s7, -252
                  sll          s3, t3, s9
                  bge          sp, t2, 2024f
                  sra          t4, ra, ra
                  c.bnez       a5, 2027f
                  sub          gp, tp, s10
                  bltu         a2, a1, 2038f
                  slti         a5, a3, -744
                  addi         gp, a3, 1829
                  remu         s7, t4, s1
                  c.bnez       a1, 2028f
                  beq          s8, t1, 2033f
2024:             sll          t1, s9, t0
                  add          t0, a0, t5
                  c.slli       a5, 3
2027:             c.bnez       s0, 2047f
2028:             blt          a1, s10, 2030f
                  auipc        zero, 399913
2030:             c.bnez       a5, 2044f
                  c.li         t0, 26
                  c.li         a4, -1
2033:             sltu         s8, t2, a2
                  xori         s2, t0, -1092
                  c.slli       a7, 1
                  c.addi       s0, -1
                  beq          t2, s6, 2043f
2038:             nop
                  c.beqz       a0, 2047f
                  mulh         tp, a3, s10
                  xori         ra, sp, 1666
                  xor          a7, t3, t6
2043:             c.xor        a1, a2
2044:             divu         s4, a6, gp
                  slt          s11, sp, t6
                  add          s4, s9, sp
2047:             and          s11, a2, a5
                  xor          s0, s8, a1
                  andi         s2, s10, -649
                  sltu         s9, a7, s3
                  c.add        a7, a6
                  c.beqz       a3, 2061f
                  c.nop
                  sub          s0, sp, s6
                  srai         a5, a5, 22
                  xor          a4, tp, a6
                  div          a6, s4, a2
                  or           a6, a6, s2
                  sra          s1, s4, t3
                  sltiu        t3, t2, 1781
2061:             c.or         a0, a4
                  mulh         zero, s2, s9
                  c.srli       a5, 15
                  nop
                  srl          zero, s3, a0
                  bge          t5, s8, 2086f
                  auipc        ra, 871764
                  c.srai       a4, 3
                  srl          a5, s1, ra
                  bge          s0, a2, 2084f
                  sra          s8, t6, s11
                  c.li         s3, -1
                  remu         zero, s8, t2
                  slti         a0, tp, 971
                  and          s4, a6, ra
                  addi         gp, s8, -85
                  andi         s0, t3, -681
                  slti         a2, s11, 487
                  c.addi       s11, -1
                  mulh         s6, ra, ra
                  c.addi       tp, 30
                  c.mv         s1, t6
                  slti         s8, sp, -123
2084:             mulh         a7, t0, t5
                  bltu         a3, a6, 2099f
2086:             rem          a3, a4, a7
                  div          s2, s4, a5
                  c.li         t0, 25
                  srl          t0, t3, s2
                  c.srai       a0, 20
                  mulhu        t6, a5, a2
                  xor          gp, a0, tp
                  c.sub        a4, s0
                  c.and        a2, a4
                  bne          t5, sp, 2109f
                  remu         s8, ra, a2
                  lui          s11, 638581
                  c.beqz       a0, 2118f
2099:             mulhu        a0, t3, s11
                  bgeu         gp, t0, 2110f
                  mulhsu       a2, t3, ra
                  remu         s10, tp, zero
                  c.lui        s2, 20
                  sub          s3, t5, a1
                  c.andi       s0, -1
                  slti         gp, a6, -529
                  c.sub        s0, a1
                  or           s8, a4, a4
2109:             xori         s10, s10, -1355
2110:             srai         a3, s2, 0
                  c.mv         s7, s8
                  bgeu         s8, s10, 2114f
                  mulhsu       s3, s3, a0
2114:             remu         ra, a3, tp
                  mulhu        s4, t1, s6
                  lui          s0, 696771
                  lui          s6, 1008694
2118:             c.srli       s0, 21
                  sra          a2, ra, s3
                  bltu         s1, zero, 2126f
                  slti         s5, s0, 232
                  slt          a4, t5, s0
                  andi         s4, t1, 1341
                  sub          a6, s5, s7
                  remu         t6, tp, t3
2126:             ori          s5, s2, -1892
                  c.li         a3, 2
                  lui          s1, 226020
                  srai         a6, s10, 11
                  div          a5, zero, s5
                  srli         s8, gp, 6
                  blt          s7, t4, 2137f
                  and          s7, ra, s0
                  c.lui        s10, 5
                  bge          a0, s10, 2154f
                  and          s1, s4, ra
2137:             c.andi       a2, -1
                  c.srli       s0, 30
                  c.xor        a0, a0
                  c.andi       s1, -1
                  mul          s7, t4, s1
                  sltiu        s5, s10, 1581
                  slt          s6, s4, s0
                  sltiu        t3, ra, 113
                  c.andi       a3, -1
                  remu         s2, tp, a3
                  slt          a3, s6, zero
                  mulh         a1, s6, t5
                  beq          a2, s5, 2158f
                  c.srai       a1, 11
                  andi         a1, tp, 236
                  c.add        t6, s1
                  c.srli       a5, 17
2154:             c.srai       a5, 25
                  mul          t0, a3, s2
                  mulh         s5, sp, s7
                  c.slli       a5, 1
2158:             slt          t6, t0, a2
                  xori         s3, s8, -218
                  c.mv         a1, t6
                  sltiu        ra, a7, -930
                  c.slli       s1, 25
                  c.or         a1, s0
                  c.srli       a5, 9
                  c.lui        tp, 3
                  nop
                  c.srai       a2, 4
                  divu         a2, gp, tp
                  c.srai       a3, 12
                  andi         s2, a6, -2026
                  mulhu        a6, a7, a0
                  and          zero, a7, s8
                  slli         a0, s9, 12
                  sub          s7, s6, s4
                  c.andi       s1, 25
                  divu         s1, s5, t0
                  remu         a2, t1, gp
                  c.nop
                  div          a4, s7, a3
                  and          s2, zero, s9
                  srli         s4, a1, 31
                  c.bnez       a3, 2184f
                  mulh         gp, tp, a0
2184:             slli         s11, a7, 13
                  mulh         a5, s11, s7
                  sub          s9, s1, a5
                  add          s9, t5, t2
                  ori          s11, s7, 1368
                  bltu         gp, t4, 2190f
2190:             c.add        s8, s11
                  xor          t4, a4, t6
                  sra          s7, t0, s10
                  slti         s4, zero, -206
                  xor          gp, s4, ra
                  c.slli       a6, 11
                  c.li         s2, 25
                  c.add        s0, t5
                  mulh         s7, gp, s7
                  c.and        a1, a3
                  srai         s10, a4, 15
                  rem          t4, s6, s11
                  srli         gp, s1, 22
                  mulhsu       t4, s10, a4
                  c.sub        a0, a4
                  c.srli       s1, 28
                  c.xor        a0, a1
                  divu         t3, t5, s1
                  divu         s11, s1, a3
                  andi         s7, s0, -1931
                  sltu         a3, s3, a1
                  slti         s8, zero, -1097
                  andi         gp, zero, 1901
                  c.srli       a1, 24
                  slti         tp, a5, -1878
                  slt          s2, a4, gp
                  c.bnez       a0, 2220f
                  mul          tp, tp, s9
                  c.xor        a5, s0
                  c.beqz       s0, 2225f
2220:             remu         tp, a1, ra
                  srl          t0, a3, tp
                  add          a1, a6, a7
                  sub          s6, t1, s10
                  sltu         s6, t6, a4
2225:             c.slli       ra, 9
                  ori          tp, t4, 1704
                  ori          s0, tp, -1791
                  c.or         s1, a0
                  blt          a6, s1, 2230f
2230:             c.beqz       s0, 2250f
                  sll          t1, s2, a4
                  rem          s6, a4, a1
                  c.and        a4, a3
                  bltu         s9, t4, 2251f
                  srai         s6, s10, 16
                  c.add        s5, a6
                  blt          ra, gp, 2240f
                  sltiu        s5, a1, 253
                  c.sub        a2, s0
2240:             mulh         a1, zero, s7
                  divu         s2, t1, s11
                  rem          zero, a1, s11
                  c.addi       a1, -1
                  c.sub        s1, a1
                  c.srli       s1, 4
                  c.andi       a2, -1
                  srli         s4, gp, 18
                  add          s8, a5, s7
                  c.lui        a0, 21
2250:             div          t4, ra, s11
2251:             lui          a3, 760539
                  xor          s7, zero, s7
                  slti         s2, s9, 716
                  remu         s7, t2, s0
                  c.slli       s4, 27
                  bne          s7, a4, 2270f
                  ori          a6, s3, -1638
                  c.add        t3, sp
                  xor          s6, t3, s11
                  xori         s5, t1, 1082
                  sub          s8, s5, t2
                  sltu         s10, s9, zero
                  blt          zero, t6, 2272f
                  c.addi       s3, -1
                  xor          t4, a7, s8
                  mulh         t6, s9, t4
                  remu         a4, t1, t6
                  c.or         a4, a0
                  xori         a4, t6, 1448
2270:             mulh         t0, a4, a6
                  xor          s7, s2, sp
2272:             beq          a5, a2, 2273f
2273:             div          t1, a0, t0
                  bltu         s1, s5, 2285f
                  mul          s11, t1, t0
                  rem          s11, s1, s8
                  xori         s2, tp, 514
                  ori          a1, s7, -525
                  sltu         ra, gp, s5
                  c.li         s7, 17
                  mul          s1, t4, a1
                  slti         t3, a5, -2025
                  bgeu         gp, s4, 2303f
                  slli         s2, a6, 3
2285:             c.addi       a3, 2
                  lui          s7, 602573
                  blt          a6, sp, 2289f
                  c.nop
2289:             beq          s6, a0, 2291f
                  add          s2, a6, a6
2291:             srli         s10, t1, 20
                  mulh         a1, s7, a1
                  blt          s0, s1, 2313f
                  xor          s7, s2, s5
                  c.or         a4, a3
                  mulhu        s10, a5, a1
                  c.xor        a5, a0
                  c.srli       a0, 22
                  divu         a5, t0, s4
                  add          a3, t6, s5
                  bltu         a2, a2, 2315f
                  add          t3, s9, s10
2303:             and          zero, t6, a4
                  c.slli       a5, 30
                  srl          a7, sp, t5
                  c.srai       a4, 4
                  andi         a3, tp, -950
                  beq          t1, s2, 2317f
                  c.nop
                  div          t0, a0, a5
                  c.beqz       a0, 2313f
                  mulhsu       a0, s10, a1
2313:             c.or         a4, a2
                  c.slli       a3, 18
2315:             rem          t1, s9, t4
                  c.mv         s3, s5
2317:             ori          t1, t3, -599
                  c.or         a4, s0
                  c.srai       a4, 16
                  or           t6, s11, a4
                  c.srai       a3, 7
                  mulhu        s3, a1, t1
                  mulhsu       s1, t4, s0
                  andi         a0, s0, -1911
                  srli         s0, s8, 14
                  sra          a1, a2, a6
                  mulhsu       s7, ra, s9
                  sll          t0, a1, s10
                  xori         s6, sp, 228
                  bge          a6, s11, 2349f
                  slli         gp, s8, 2
                  slti         a7, t4, 1291
                  sra          a5, a1, s1
                  slt          a4, s3, tp
                  mulhu        a6, a2, a6
                  lui          s7, 874575
                  srli         s7, s10, 7
                  mulhsu       a1, a3, a1
                  c.andi       a4, 7
                  c.or         a5, a0
                  xori         s0, s3, -1168
                  sll          s2, a6, s2
                  lui          s2, 123416
                  c.sub        a2, a1
                  mulhu        s9, s8, s10
                  bge          s10, s10, 2352f
                  beq          s1, s1, 2357f
                  bne          tp, s1, 2353f
2349:             c.add        a7, s7
                  remu         a0, s7, t6
                  ori          s11, zero, 453
2352:             c.addi       a6, -1
2353:             rem          s7, tp, s7
                  c.mv         t3, s4
                  c.and        s1, a3
                  c.and        a1, a3
2357:             c.beqz       a4, 2371f
                  c.beqz       a4, 2367f
                  c.lui        a1, 16
                  c.srli       a0, 10
                  bge          a3, ra, 2364f
                  mulh         t1, s0, zero
                  bge          t5, t6, 2383f
2364:             c.bnez       a4, 2368f
                  c.lui        a5, 28
                  sub          a3, t4, s9
2367:             c.mv         a5, a2
2368:             and          s1, s8, sp
                  c.sub        s1, a5
                  c.add        a7, s3
2371:             c.xor        a5, a5
                  sub          s6, a3, s4
                  xor          s3, t4, zero
                  c.add        t6, t0
                  sra          a1, s0, s6
                  beq          s11, zero, 2390f
                  srai         s6, t3, 12
                  bltu         s9, a1, 2379f
2379:             c.bnez       s0, 2399f
                  bne          a4, a4, 2389f
                  add          s1, a3, s5
                  bne          s3, zero, 2393f
2383:             c.beqz       a2, 2384f
2384:             c.or         a2, a5
                  mulh         t3, a2, t1
                  divu         s7, s7, s0
                  slli         t1, a4, 3
                  c.srli       a3, 22
2389:             sra          s4, s9, a6
2390:             mulhu        a0, tp, s10
                  c.sub        a4, a5
                  sltu         s11, s7, a3
2393:             nop
                  rem          t0, s0, sp
                  and          a6, gp, s6
                  c.beqz       s0, 2402f
                  slti         a6, t0, 1602
                  c.sub        a1, a0
2399:             xori         t0, s0, 532
                  c.srli       a1, 4
                  c.or         a4, s0
2402:             mulh         t6, a7, s7
                  slt          s5, sp, t1
                  c.nop
                  srai         tp, s1, 24
                  c.xor        s1, a3
                  c.andi       a3, 8
                  slt          gp, t1, t6
                  sub          s8, s10, s9
                  c.andi       a1, -1
                  mulhsu       a1, a2, s3
                  xor          s5, t2, t0
                  bltu         t0, t4, 2427f
                  auipc        s9, 495385
                  sltiu        s3, t5, 1000
                  mulh         s6, ra, a2
                  beq          s10, a6, 2431f
                  mul          s5, t0, s3
                  slti         gp, a2, 2024
                  sltu         a5, s8, s8
                  bne          s8, t5, 2422f
2422:             blt          s7, s11, 2432f
                  c.nop
                  nop
                  slti         s9, t6, 226
                  c.sub        a0, a5
2427:             or           s10, s2, s0
                  srli         s0, s9, 29
                  xori         gp, tp, -1575
                  nop
2431:             bge          tp, s8, 2439f
2432:             c.sub        a5, a1
                  bge          t3, zero, 2450f
                  nop
                  lui          s9, 517047
                  div          s7, t6, ra
                  bgeu         a0, a2, 2443f
                  c.addi       s6, 15
2439:             sltu         s11, t4, t3
                  sub          zero, gp, s10
                  c.and        s0, a3
                  bne          t6, a1, 2459f
2443:             beq          s8, s4, 2454f
                  c.bnez       a0, 2464f
                  c.andi       a1, 2
                  lui          s0, 584285
                  sll          s10, s3, s10
                  slti         t6, sp, 986
                  c.andi       a0, 11
2450:             c.and        s0, s1
                  bne          a4, a2, 2457f
                  c.lui        a6, 2
                  c.slli       s6, 19
2454:             slt          s6, s0, a3
                  andi         s3, a2, -499
                  sltu         a4, a5, sp
2457:             lui          s5, 881799
                  mul          s0, a7, gp
2459:             srli         a7, s4, 20
                  c.lui        a1, 1
                  c.add        t4, t4
                  mulh         s11, t3, a6
                  srl          gp, zero, s6
2464:             sll          a3, s10, s8
                  sub          a3, a5, s9
                  auipc        s2, 402511
                  c.beqz       s1, 2476f
                  sll          a4, s10, s10
                  sltiu        t0, zero, 1476
                  srai         s3, a4, 6
                  slti         a3, s0, 2039
                  c.xor        a4, a2
                  c.and        a5, a5
                  c.add        s0, a6
                  c.addi       s6, 6
2476:             c.slli       ra, 28
                  srli         a5, gp, 30
                  xori         s10, a6, 1715
                  bge          s3, s9, 2499f
                  c.xor        a0, a4
                  beq          s2, t1, 2482f
2482:             c.li         s3, -1
                  c.andi       a3, -1
                  c.xor        a3, a4
                  sll          s11, tp, a3
                  bge          t2, ra, 2496f
                  mulhu        s4, s5, s1
                  lui          a2, 944290
                  sltu         zero, t1, s0
                  and          a6, s6, s0
                  c.nop
                  beq          a3, a5, 2512f
                  c.beqz       a2, 2497f
                  c.li         t4, 2
                  c.bnez       a3, 2498f
2496:             sltu         s3, s8, s5
2497:             mul          a5, gp, ra
2498:             and          s5, gp, a1
2499:             add          s11, zero, t0
                  c.srai       s0, 3
                  beq          s0, s2, 2506f
                  sub          s1, a2, s5
                  c.addi       gp, -1
                  slli         a4, s7, 8
                  blt          s11, s1, 2515f
2506:             slt          s6, s8, s0
                  auipc        a7, 1020051
                  c.beqz       a0, 2514f
                  c.li         a3, 5
                  divu         gp, a5, a5
                  c.or         a0, a5
2512:             c.xor        a4, a2
                  mulh         a6, sp, gp
2514:             c.add        a3, s4
2515:             c.add        s11, s8
                  slt          tp, zero, ra
                  c.srli       a4, 15
                  sub          t1, a5, s3
                  sltu         s8, t6, a2
                  sub          t1, t4, t4
                  addi         t1, zero, -492
                  c.srli       a5, 17
                  bge          t6, s5, 2542f
                  srai         a5, a5, 5
                  blt          a2, a3, 2531f
                  sll          a7, s9, s2
                  slli         a4, s9, 31
                  div          s11, tp, sp
                  c.bnez       a2, 2543f
                  c.lui        s11, 30
2531:             sltiu        s1, a0, 227
                  srl          zero, s10, s2
                  bgeu         sp, t6, 2547f
                  c.mv         s11, s1
                  c.li         t3, -1
                  sltiu        a3, a4, -659
                  srli         a4, s1, 21
                  divu         t6, ra, a5
                  sltu         tp, s2, gp
                  c.xor        a1, a5
                  slt          t1, gp, s3
2542:             auipc        a5, 916651
2543:             bgeu         t6, s3, 2545f
                  rem          s2, a1, a4
2545:             c.add        a6, a5
                  c.and        a0, a5
2547:             srai         s4, s9, 2
                  div          a4, s8, a7
                  addi         a3, a4, -208
                  blt          t4, a3, 2552f
                  c.mv         t3, t1
2552:             lui          zero, 849901
                  slt          s10, s3, sp
                  mulh         s3, a6, s6
                  rem          ra, t1, s4
                  nop
                  c.srli       a2, 4
                  c.li         t1, -1
                  bne          s2, t2, 2560f
2560:             c.and        a4, s1
                  mul          t4, s4, gp
                  slti         a0, s0, -1204
                  mulhu        t6, s5, s3
                  mul          s1, t5, a6
                  lui          s4, 834196
                  c.lui        a1, 12
                  c.srli       s1, 7
                  slli         s1, sp, 1
                  bge          t3, a0, 2570f
2570:             divu         a4, a2, a5
                  bltu         s5, t0, 2585f
                  auipc        a1, 341456
                  c.nop
                  div          zero, ra, a2
                  xor          a6, s4, s9
                  blt          a2, t1, 2585f
                  c.bnez       a4, 2585f
                  c.nop
                  auipc        s2, 702699
                  c.xor        a3, s1
                  c.lui        t0, 28
                  c.addi       a3, -1
                  xor          s5, s7, s3
                  remu         s2, a2, sp
2585:             bgeu         a5, s3, 2599f
                  add          s11, s4, gp
                  slt          s2, t2, s7
                  bltu         s4, s10, 2602f
                  nop
                  bgeu         gp, zero, 2592f
                  srai         ra, s3, 2
2592:             c.add        gp, t3
                  sltu         a2, tp, s1
                  srl          t6, s8, gp
                  c.xor        a2, s0
                  c.addi       s10, -1
                  c.and        a0, a5
                  c.mv         s10, s0
2599:             mul          a5, s8, a2
                  blt          gp, s0, 2620f
                  c.srai       a5, 27
2602:             divu         s5, s11, a3
                  div          t6, zero, t6
                  bltu         s4, zero, 2613f
                  sub          a4, a3, a1
                  add          t0, ra, s7
                  add          s8, tp, t6
                  rem          a2, s0, t4
                  slti         s1, s10, 1141
                  addi         s5, t0, -1301
                  mulhu        s4, s8, s8
                  nop
2613:             divu         a2, s2, s11
                  sra          a5, a7, t4
                  c.nop
                  c.add        t6, s10
                  c.xor        a5, a4
                  c.andi       a0, 18
                  mulhsu       a4, a3, t3
2620:             bne          t2, s10, 2640f
                  c.sub        a5, a0
                  and          s7, s0, a3
                  blt          a6, sp, 2642f
                  blt          s8, t3, 2628f
                  lui          s9, 555705
                  blt          s10, t4, 2632f
                  c.bnez       a0, 2644f
2628:             srai         s5, t5, 17
                  c.or         a3, a2
                  c.nop
                  lui          t4, 441628
2632:             div          s3, s0, s9
                  lui          tp, 56654
                  xor          a1, t4, a4
                  c.addi       s8, 27
                  c.andi       a2, -1
                  xor          s2, s1, t4
                  nop
                  bge          s2, t0, 2641f
2640:             c.mv         s10, s11
2641:             c.add        s0, s7
2642:             c.and        a4, a0
                  sltu         gp, zero, t0
2644:             div          a4, a4, a4
                  mulhu        tp, a3, s9
                  mulhu        s0, t6, a4
                  add          s11, s5, s5
                  add          t6, t4, t3
                  c.li         a7, -1
                  c.addi       s1, 26
                  bne          s6, s1, 2659f
                  c.nop
                  slti         a3, t6, -1691
                  slt          s9, a4, a4
                  sra          t1, tp, t2
                  c.nop
                  c.srli       a4, 11
                  sll          s0, t2, s10
2659:             and          t0, a5, tp
                  c.beqz       a3, 2661f
2661:             div          t4, a7, s6
                  bge          s0, a6, 2671f
                  xor          gp, a5, s6
                  lui          a2, 329687
                  divu         t3, t6, s2
                  sltu         zero, s6, s2
                  ori          a6, a5, 938
                  mulhsu       a7, s5, t0
                  c.srai       a1, 11
                  c.lui        s6, 17
2671:             slli         a3, s5, 18
                  c.addi       s10, 23
                  bge          s11, a0, 2679f
                  mulhu        a6, s0, tp
                  xor          s4, ra, tp
                  sub          t3, s8, s2
                  andi         s9, a3, 1890
                  rem          ra, a6, zero
2679:             or           a1, t2, t3
                  mulhsu       a6, sp, a7
                  bge          s3, t1, 2683f
                  mulhsu       a0, s7, s10
2683:             c.beqz       s0, 2703f
                  c.and        a5, s1
                  c.nop
                  auipc        a3, 239914
                  c.slli       s5, 10
                  c.sub        a4, a4
                  c.li         t4, -1
                  and          tp, a5, a1
                  xori         t3, zero, 800
                  bgeu         s4, s6, 2693f
2693:             c.nop
                  div          s3, sp, s10
                  add          s7, s3, a6
                  c.addi       s9, -1
                  mulhsu       s11, a4, s11
                  srai         a1, gp, 23
                  mulhu        a3, a4, s10
                  andi         s5, t3, -814
                  lui          zero, 742420
                  bge          a0, zero, 2711f
2703:             srai         s8, s11, 13
                  addi         a1, s1, 17
                  mulhsu       s2, s4, s11
                  bgeu         a2, s5, 2715f
                  divu         a2, sp, ra
                  sra          s2, s9, a4
                  c.xor        s0, a0
                  sub          s3, tp, a0
2711:             or           s6, a7, t2
                  mulhsu       t1, s4, s10
                  srai         s11, t6, 4
                  slli         t4, t3, 26
2715:             c.xor        a2, a3
                  slt          s6, s8, tp
                  slt          gp, s6, tp
                  divu         s0, s0, s5
                  bgeu         t1, tp, 2729f
                  beq          s9, a3, 2740f
                  sltu         a6, s10, s11
                  sub          s9, s6, s6
                  slti         a5, s10, -2033
                  c.xor        s0, s0
                  c.beqz       a3, 2727f
                  c.addi       a3, -1
2727:             mulh         a0, t6, t0
                  div          t4, a4, a3
2729:             c.lui        s7, 3
                  lui          s10, 998699
                  srai         a1, t1, 0
                  sub          s0, t5, s9
                  ori          s8, s3, 1598
                  or           s1, a7, s1
                  or           s2, s8, s9
                  c.beqz       s0, 2742f
                  slti         t6, gp, -49
                  nop
                  mulh         t3, t3, a5
2740:             rem          a4, t5, t0
                  c.and        a1, a1
2742:             c.slli       s11, 26
                  c.andi       a3, 4
                  c.xor        a3, s1
                  sra          a7, a6, a4
                  srli         t6, a4, 23
                  c.sub        s0, a4
                  sltu         a2, s9, a4
                  mul          a6, t2, t5
                  c.beqz       a5, 2764f
                  add          s10, s1, a4
                  rem          a3, s11, s0
                  srli         t3, s2, 0
                  c.addi       s3, 30
                  beq          s6, s9, 2756f
2756:             bne          s10, t5, 2770f
                  sll          s8, a2, s11
                  c.li         s9, 17
                  c.andi       a0, 18
                  slti         a3, a2, -1069
                  sltu         a0, s0, t1
                  bltu         s2, a5, 2773f
                  remu         t0, t5, t5
2764:             slti         s6, s0, 519
                  mulhu        a6, s3, ra
                  nop
                  xori         s3, zero, 1430
                  c.sub        s0, a2
                  la           a5, region_1+1477 #start riscv_hazard_instr_stream_3
                  auipc        tp, 250401
                  lhu          t4, -5(a5)
                  c.srai       s1, 2
                  srli         s1, t4, 25
                  xor          t4, s1, t4
                  rem          t6, t4, a7
                  mulhu        t4, t4, a3
                  lui          a3, 877906
                  lb           a7, -1(a5)
                  c.srai       s1, 27
                  c.nop
                  c.srai       s1, 12
                  lhu          s1, -7(a5)
                  srli         s1, tp, 26
                  and          t6, t4, a3
                  mulhsu       a3, tp, t4
                  sll          a3, a3, s1
                  c.srai       a3, 2
                  or           t4, t6, s1
                  lhu          t4, 15(a5)
                  lbu          a3, 2(a5)
                  sb           t6, -13(a5)
                  lb           tp, 9(a5)
                  srai         t4, t6, 23
                  c.and        a3, a3
                  auipc        s1, 75048
                  lbu          t4, -2(a5)
                  c.add        s1, s1
                  lb           tp, -5(a5)
                  nop
                  sb           a3, -11(a5)
                  ori          a3, tp, -1750
                  c.xor        s1, s1
                  lb           s1, -9(a5)
                  mulh         a3, t6, t4
                  c.li         tp, -1
                  sh           a7, 7(a5) #end riscv_hazard_instr_stream_3
                  c.slli       s3, 26
2770:             sll          t1, a6, s6
                  beq          tp, t1, 2774f
                  srl          s8, t2, a1
2773:             addi         s5, s0, -874
2774:             nop
                  bltu         t6, s4, 2795f
                  c.srai       s1, 22
                  c.lui        a6, 20
                  c.add        a2, a6
                  xori         t0, a3, -884
                  c.add        t4, t4
                  nop
                  srai         a5, t3, 11
                  slti         s3, t1, 881
                  rem          t3, a5, t6
                  slli         a4, t4, 18
                  slti         s2, s9, 1337
                  bgeu         s5, a7, 2792f
                  mulh         s11, a1, gp
                  slti         s2, s9, -1841
                  and          t1, s9, s3
                  c.beqz       a5, 2801f
2792:             c.andi       s0, -1
                  bgeu         a5, a5, 2807f
                  or           s0, a5, gp
2795:             lui          s10, 806361
                  c.and        s0, a5
                  div          s11, sp, s2
                  bge          a5, a6, 2812f
                  c.beqz       a1, 2813f
                  remu         s1, s10, s8
2801:             c.lui        s11, 29
                  c.addi       s0, 13
                  and          a4, a7, t1
                  blt          a3, t1, 2805f
2805:             nop
                  mulh         s1, sp, t1
2807:             or           ra, a0, s7
                  xori         s4, t2, -1284
                  c.bnez       s0, 2810f
2810:             sltiu        s5, s10, -1440
                  lui          s2, 739376
2812:             mulhu        a7, a2, s11
2813:             div          t3, a7, s8
                  c.srli       a1, 16
                  remu         s2, a4, s1
                  xor          s9, t2, zero
                  bne          s3, s2, 2823f
                  c.beqz       s0, 2828f
                  nop
                  rem          a3, a4, s7
                  rem          ra, s6, s5
                  div          a7, zero, tp
2823:             c.lui        s8, 14
                  blt          s9, a4, 2826f
                  blt          t4, t2, 2844f
2826:             bltu         a0, t1, 2835f
                  c.srli       a3, 5
2828:             mul          s5, s4, a0
                  c.mv         t3, s2
                  slli         s2, a5, 31
                  addi         ra, gp, 156
                  addi         a5, a2, 151
                  sltu         gp, s11, a1
                  slt          s11, s4, s11
2835:             bge          ra, s7, 2849f
                  c.sub        a0, a4
                  c.and        a5, s1
                  ori          t1, a0, -1448
                  bgeu         s5, t2, 2848f
                  bgeu         a2, t5, 2849f
                  addi         s3, a7, 1397
                  mulhsu       t0, t0, a5
                  xor          t1, sp, a5
2844:             add          s4, t2, t3
                  sll          t4, a0, a7
                  c.li         t6, 2
                  slt          a2, a2, s9
2848:             auipc        t3, 85884
2849:             c.add        t6, tp
                  srli         s0, t0, 9
                  c.add        t6, t3
                  c.li         s0, -1
                  slli         s4, s2, 15
                  sll          s10, s11, a3
                  divu         t3, a6, s8
                  c.and        a1, a4
                  slli         t6, a2, 9
                  mulh         s11, s6, t6
                  ori          t6, gp, -1492
                  sub          a1, a7, a1
                  andi         s4, s5, -735
                  slt          s3, s11, s2
                  c.mv         s1, s10
                  sltiu        t0, zero, -1962
                  sltiu        t4, s2, -842
                  slli         s10, s0, 11
                  c.nop
                  slt          a1, s11, a0
                  sra          gp, a3, a6
                  sub          t0, a0, a2
                  sll          s9, t1, s0
                  xori         s2, tp, 725
                  c.beqz       a1, 2893f
                  c.xor        s1, s0
                  mulhu        t1, tp, s11
                  c.beqz       a2, 2890f
                  remu         a7, gp, t0
                  c.mv         s2, t1
                  or           s6, s4, s9
                  c.and        s0, s1
                  divu         a0, zero, a5
                  bltu         a5, a3, 2896f
                  c.and        s0, a5
                  c.and        a1, s0
                  srl          s9, a1, s5
                  sltiu        a4, a5, 1762
                  c.nop
                  divu         s2, t6, s10
                  and          s3, s1, s10
2890:             add          s10, t0, zero
                  slti         t6, a0, -348
                  lui          a2, 212573
2893:             c.mv         s10, s0
                  sll          s1, sp, a6
                  slti         zero, s3, 1398
2896:             mulh         s3, s3, s1
                  c.beqz       a5, 2898f
2898:             slli         tp, a2, 3
                  ori          a7, t5, 230
                  and          zero, s5, s0
                  rem          s8, sp, gp
                  c.lui        s11, 23
                  slli         a6, t0, 14
                  and          tp, s0, s2
                  sll          a2, a6, a0
                  blt          t2, sp, 2912f
                  sltiu        t1, s2, -1930
                  c.srai       a5, 4
                  c.srli       a3, 16
                  mul          a1, a1, s6
                  add          s9, t0, a0
2912:             c.srli       a2, 30
                  slt          t4, ra, t3
                  rem          s2, ra, t1
                  mul          s10, a5, a7
                  divu         s2, a1, sp
                  bge          t4, zero, 2934f
                  c.addi       t1, 1
                  xor          s5, s6, a0
                  mulh         s5, sp, s2
                  sll          gp, ra, s2
                  sra          s8, a2, t1
                  rem          s2, s11, t6
                  bgeu         s9, a1, 2934f
                  slti         a6, t3, 1947
                  auipc        t0, 888771
                  c.andi       a4, 31
                  c.nop
                  and          a7, s11, s9
                  c.beqz       a4, 2935f
                  addi         gp, t2, -227
                  c.srai       a5, 7
                  xor          s9, s0, s2
2934:             sltu         a5, t3, a2
2935:             addi         s11, a3, -1020
                  divu         a6, t6, a1
                  rem          a4, s1, tp
                  bltu         zero, sp, 2940f
                  c.beqz       s1, 2959f
2940:             c.add        a6, t3
                  c.addi       tp, 27
                  slli         a4, t1, 26
                  and          t4, t5, s2
                  c.lui        t1, 28
                  nop
                  andi         s10, a1, -764
                  bgeu         t3, tp, 2961f
                  blt          s9, a0, 2951f
                  and          s10, t3, tp
                  blt          a4, s4, 2954f
2951:             srai         t6, zero, 13
                  c.andi       a3, -1
                  divu         s2, a7, s8
2954:             add          s5, s8, s10
                  c.addi       a4, 13
                  c.addi       gp, -1
                  sra          tp, t6, zero
                  bgeu         a6, zero, 2978f
2959:             bltu         t0, s7, 2970f
                  xori         s2, s7, -1205
2961:             c.li         a1, 4
                  c.srli       a3, 28
                  mulhu        s5, t2, s4
                  xor          s8, a2, s2
                  c.add        s2, s4
                  c.xor        a2, a5
                  and          a4, t6, s8
                  div          s1, a4, a0
                  sub          zero, s8, ra
2970:             mulhu        s6, t1, t3
                  slt          a0, s6, sp
                  c.or         a4, a5
                  srl          s1, s1, s2
                  c.srli       a0, 20
                  ori          t6, s6, -578
                  mulh         a2, ra, s9
                  blt          s7, zero, 2985f
2978:             mulhsu       t1, a6, s11
                  rem          s3, s3, a5
                  sll          s8, t3, tp
                  auipc        a2, 902792
                  bltu         t2, t3, 2996f
                  mulhsu       s10, a6, t1
                  addi         t4, tp, 1349
2985:             addi         ra, gp, 1643
                  srli         t4, s3, 23
                  lui          a3, 64500
                  sub          t3, t5, a6
                  sub          s2, a2, a7
                  bgeu         a5, t1, 2996f
                  ori          s2, s3, 907
                  c.li         a6, -1
                  bltu         s10, a3, 3013f
                  srai         s5, ra, 11
                  lui          s0, 21832
2996:             lui          a1, 705109
                  add          s1, s11, zero
                  blt          a3, s3, 3000f
                  srli         s9, t4, 9
3000:             andi         s10, s0, 537
                  c.and        a5, a1
                  and          s11, sp, a7
                  srl          s0, a4, a3
                  slt          s2, t4, s11
                  beq          s9, tp, 3025f
                  c.bnez       a5, 3023f
                  auipc        t3, 823331
                  srai         s3, s2, 29
                  bge          t5, s7, 3015f
                  or           s4, ra, a0
                  auipc        t6, 151787
                  slti         a1, s0, -1740
3013:             c.xor        a3, a4
                  srli         zero, a7, 23
3015:             or           zero, a0, a6
                  c.addi       a7, -1
                  bgeu         t2, s7, 3018f
3018:             div          a7, s1, s2
                  xor          s2, t4, s5
                  nop
                  srl          s11, s6, s8
                  c.beqz       a3, 3031f
3023:             sltiu        t0, t6, 1147
                  blt          t5, ra, 3034f
3025:             c.and        a5, a3
                  sltiu        s5, a5, -1628
                  c.lui        t4, 25
                  c.xor        a5, a0
                  lui          a1, 239674
                  bgeu         s2, s5, 3044f
3031:             c.addi       t1, 8
                  c.beqz       a2, 3043f
                  c.srli       a0, 19
3034:             mulh         a1, t0, t0
                  slti         s7, t4, -815
                  xor          t1, gp, a4
                  c.li         s1, 19
                  c.li         s11, 17
                  slt          s2, s8, t1
                  mulh         s5, tp, s8
                  beq          t6, ra, 3042f
3042:             ori          s1, ra, -1855
3043:             sltiu        s10, a4, -1707
3044:             lui          s11, 503954
                  c.add        s1, s7
                  c.bnez       a3, 3054f
                  sll          s3, s3, ra
                  c.slli       a7, 19
                  mul          s11, a0, ra
                  blt          s9, tp, 3053f
                  srl          a2, s0, t1
                  divu         s7, s8, s3
3053:             and          t0, s3, a2
3054:             xor          s8, t3, t5
                  c.and        a2, a3
                  rem          s5, s1, a2
                  sll          s7, t2, a4
                  c.li         s11, -1
                  and          s1, t1, s3
                  sub          a4, s6, a6
                  divu         s4, t4, s3
                  c.xor        a5, a5
                  sub          s4, a2, t3
                  mulh         s11, t0, t6
                  rem          t4, s5, zero
                  c.nop
                  lui          a7, 446603
                  c.add        a6, t6
                  mul          s6, s3, t5
                  c.slli       s3, 31
                  lui          s8, 637945
                  slt          s7, s7, a2
                  bne          s8, a4, 3087f
                  ori          t4, s4, -1058
                  lui          a1, 931104
                  remu         s1, t1, t6
                  add          s0, a6, s8
                  c.addi       a5, -1
                  sll          s8, s1, a0
                  c.beqz       a1, 3082f
                  c.bnez       s0, 3100f
3082:             sltu         s7, sp, t3
                  sltiu        a3, tp, 1112
                  c.mv         ra, s10
                  srli         s2, t3, 1
                  bgeu         t0, a7, 3090f
3087:             c.xor        a0, s1
                  mul          s11, s8, s7
                  xor          a6, t1, s1
3090:             sltiu        t0, s0, -1094
                  c.slli       a0, 8
                  remu         tp, s5, a3
                  c.beqz       a1, 3094f
3094:             bge          t4, s4, 3108f
                  slti         tp, zero, 1906
                  slli         s8, t5, 19
                  bgeu         s7, ra, 3117f
                  c.srai       s1, 29
                  c.add        a2, t5
3100:             xor          a3, a7, s2
                  c.add        s7, t2
                  srai         s9, s11, 6
                  sra          s6, s9, tp
                  c.sub        a0, s1
                  c.or         s0, a0
                  c.beqz       a2, 3112f
                  blt          a6, zero, 3117f
3108:             c.xor        s0, a2
                  add          tp, s2, s4
                  mulh         t6, t2, s10
                  c.addi       gp, -1
3112:             c.mv         a3, s5
                  c.addi       t1, 26
                  sub          zero, gp, a1
                  divu         s6, s1, t6
                  c.srli       a2, 25
3117:             srai         t1, s8, 22
                  c.xor        a1, a3
                  c.srli       s0, 31
                  divu         s0, zero, s5
                  sltiu        a7, s9, -332
                  srli         s7, s9, 15
                  c.beqz       a3, 3125f
                  sltu         gp, t3, t5
3125:             mulh         ra, a1, s1
                  c.addi       s10, -1
                  c.beqz       s0, 3141f
                  sltiu        a7, a0, -1431
                  c.sub        s0, a3
                  mulh         s1, a4, tp
                  c.nop
                  add          a3, s6, a5
                  andi         a3, s9, -1538
                  srai         s10, s2, 15
                  andi         gp, a5, 795
                  sll          t4, a3, s10
                  bltu         a2, t2, 3139f
                  beq          t1, s2, 3158f
3139:             c.add        s5, s3
                  srai         t0, a2, 29
3141:             blt          t2, s9, 3161f
                  c.bnez       a3, 3148f
                  c.sub        a5, s1
                  c.mv         a7, s7
                  xori         zero, t1, -1965
                  sltiu        s7, s9, 1057
                  c.add        s3, s4
3148:             lui          tp, 390270
                  c.lui        a7, 23
                  or           a1, s1, s1
                  c.li         s7, -1
                  c.li         tp, 31
                  mul          s11, a3, s8
                  c.srai       a4, 31
                  and          s3, t4, s1
                  c.slli       s2, 19
                  mulhu        t6, t2, zero
3158:             ori          zero, s8, 695
                  ori          a1, tp, -886
                  divu         a5, a1, s8
3161:             auipc        t0, 810830
                  bge          a5, s2, 3176f
                  or           t1, t3, a4
                  rem          ra, a2, tp
                  c.or         a2, a0
                  c.andi       a5, -1
                  divu         s4, t6, a3
                  rem          t0, s11, s7
                  c.lui        t0, 29
                  srai         t1, s0, 31
                  sub          t1, s1, t3
                  c.beqz       a2, 3177f
                  and          gp, s11, ra
                  c.srli       a4, 21
                  c.li         t4, 16
3176:             ori          a1, s11, -1271
3177:             srl          s10, sp, s2
                  c.li         s8, -1
                  sra          gp, s2, s8
                  addi         s5, s2, 733
                  div          s3, t1, a2
                  bne          s0, gp, 3191f
                  c.bnez       a3, 3192f
                  ori          s2, sp, 768
                  mulhu        zero, s4, a6
                  and          a4, a7, s4
                  c.bnez       a1, 3201f
                  c.lui        s4, 17
                  mulhsu       t1, a0, ra
                  sub          gp, a2, a1
3191:             slt          s9, s3, t3
3192:             or           t1, t6, zero
                  c.nop
                  c.xor        a0, a3
                  mulh         s1, s3, t1
                  andi         gp, a1, 210
                  divu         t1, a6, sp
                  c.sub        a0, a1
                  bne          a4, s9, 3201f
                  sll          t6, s3, s11
3201:             c.srli       a4, 7
                  c.bnez       a2, 3221f
                  c.or         s0, a2
                  c.lui        s6, 31
                  divu         a2, s7, t6
                  mulh         a1, s5, a3
                  c.li         s0, -1
                  c.mv         t0, a7
                  c.nop
                  mul          t1, a5, a6
                  c.beqz       a1, 3217f
                  beq          a0, s9, 3221f
                  c.addi       t1, -1
                  nop
                  remu         a7, ra, s7
                  c.andi       a5, -1
3217:             div          a6, s0, a7
                  srl          t1, s10, s8
                  c.beqz       s1, 3236f
                  c.lui        a1, 1
3221:             and          s3, s3, a2
                  c.slli       a5, 4
                  or           s9, s2, s10
                  sltiu        s3, s7, -1892
                  lui          a5, 958868
                  bltu         t5, s1, 3240f
                  addi         s0, ra, 1673
                  mulh         t0, a0, s3
                  slli         a1, a5, 25
                  rem          a7, a2, s1
                  c.mv         s1, ra
                  c.beqz       a1, 3235f
                  c.add        a2, s1
                  c.mv         a7, a7
3235:             c.sub        a2, a2
3236:             slt          t0, a4, t6
                  mul          s7, s3, s4
                  xor          tp, a3, t4
                  divu         s1, s5, a3
3240:             c.addi       s4, 27
                  c.nop
                  sub          t0, s6, s9
                  c.and        a3, a4
                  c.xor        s0, a2
                  c.and        s1, s0
                  add          tp, s0, t3
                  bge          s8, gp, 3267f
                  remu         s3, t6, a0
                  remu         ra, s7, s11
                  xor          s11, t1, t2
                  bge          s5, t1, 3252f
3252:             c.andi       a2, 17
                  slt          s8, a2, s2
                  mulhu        t6, t5, s8
                  c.sub        a3, a4
                  c.nop
                  blt          s3, t1, 3268f
                  c.or         a2, a1
                  div          s0, a2, s6
                  c.slli       gp, 18
                  div          s8, s6, s10
                  slli         tp, s6, 19
                  c.bnez       a0, 3273f
                  sltu         s10, s9, s0
                  lui          s8, 30082
                  sltiu        a0, sp, -1342
3267:             c.and        s0, a0
3268:             c.and        a5, a5
                  c.or         a3, a0
                  c.andi       a5, -1
                  addi         s1, zero, 333
                  slli         a5, a4, 22
3273:             c.add        a6, t2
                  slt          a7, sp, sp
                  sub          s2, a1, s0
                  sltu         s11, a4, t4
                  srai         zero, s5, 1
                  addi         t3, s1, 1713
                  sub          zero, gp, s1
                  sltu         s6, s7, s7
                  c.addi       a5, -1
                  c.beqz       a3, 3284f
                  bltu         s0, s4, 3287f
3284:             auipc        s6, 482980
                  div          s10, gp, s0
                  sltiu        s8, a2, 464
3287:             sra          s9, s9, s3
                  sra          s4, a5, a7
                  srai         a6, s1, 11
                  bne          s5, t3, 3298f
                  slli         s0, t6, 2
                  blt          t3, a7, 3312f
                  slt          zero, a4, a0
                  mulh         t3, ra, s9
                  c.sub        a5, a1
                  c.srli       s0, 30
                  divu         a0, t0, a6
3298:             mulhu        s0, t4, t6
                  c.li         s7, -1
                  remu         ra, s6, gp
                  beq          s10, s5, 3302f
3302:             mulh         s3, sp, ra
                  beq          s9, s1, 3312f
                  lui          tp, 784551
                  srl          s9, t3, s8
                  auipc        t6, 909121
                  lui          ra, 912605
                  c.sub        a2, a3
                  div          a3, s7, a3
                  slt          s1, a2, s11
                  bge          a6, a2, 3316f
3312:             c.bnez       a3, 3326f
                  remu         s1, a3, s9
                  c.bnez       a0, 3328f
                  mul          s1, a7, gp
3316:             bgeu         t4, sp, 3336f
                  c.nop
                  or           t4, a6, sp
                  ori          a0, t3, 1430
                  bne          s9, t0, 3329f
                  remu         s2, s0, s2
                  srli         tp, s0, 25
                  divu         t3, s3, s1
                  mulh         t3, s9, s8
                  and          s1, t4, s11
3326:             c.lui        s0, 22
                  sub          s8, gp, sp
3328:             bne          gp, t0, 3348f
3329:             auipc        s3, 324410
                  bne          s9, s4, 3332f
                  blt          tp, zero, 3337f
3332:             mul          s6, t2, s4
                  c.add        s1, s3
                  divu         s9, a1, t6
                  c.bnez       a4, 3341f
3336:             sll          s9, s7, a4
3337:             and          s7, s4, a3
                  c.mv         s0, gp
                  or           tp, a0, t2
                  blt          s6, s1, 3350f
3341:             xori         s6, a2, -1477
                  remu         s6, a3, a5
                  srli         s8, s3, 19
                  addi         a5, s10, 1671
                  addi         t3, a0, 491
                  c.li         ra, -1
                  c.srli       s0, 4
3348:             ori          t3, a5, 591
                  andi         s7, a0, 1762
3350:             or           s9, t6, s3
                  lui          s9, 623230
                  c.add        gp, ra
                  mulhsu       ra, s4, s8
                  or           s1, t4, a2
                  c.li         a5, -1
                  nop
                  slt          t3, a0, s3
                  andi         s2, s2, -1255
                  auipc        s1, 410482
                  nop
                  slti         t1, t3, -1491
                  c.srai       s1, 27
                  and          gp, a5, s4
                  slt          a5, tp, gp
                  bgeu         tp, ra, 3366f
3366:             lui          a6, 642468
                  bne          s3, ra, 3381f
                  mulh         a7, t6, s5
                  c.add        s0, t5
                  c.andi       a0, -1
                  ori          s10, t1, 959
                  auipc        s0, 43631
                  slt          s2, t0, t5
                  c.nop
                  beq          ra, s4, 3384f
                  xor          s6, s6, s11
                  or           a1, a2, a2
                  srl          s5, s10, a5
                  srl          s1, a6, t4
                  c.bnez       a2, 3381f
3381:             sltiu        a7, s2, -1526
                  c.mv         ra, s10
                  c.beqz       a4, 3393f
3384:             slt          s9, a4, a0
                  beq          s6, s4, 3386f
3386:             and          t6, a2, tp
                  c.add        a7, s7
                  lui          a4, 712506
                  bgeu         t3, s7, 3403f
                  sll          s4, s11, t1
                  sll          t1, s10, t1
                  remu         a6, tp, a0
3393:             c.li         s9, 30
                  bge          s7, a1, 3408f
                  beq          s8, gp, 3397f
                  or           t1, t0, s3
3397:             sll          t6, t2, sp
                  remu         s3, tp, tp
                  mulhu        a3, a1, a2
                  div          a2, ra, t0
                  c.li         a4, 20
                  mulhu        gp, s6, a3
3403:             slti         a7, t3, 1340
                  c.mv         ra, t3
                  c.srai       s0, 5
                  nop
                  nop
3408:             c.bnez       a5, 3411f
                  xori         a6, gp, -1059
                  sub          t6, s11, t5
3411:             auipc        gp, 762599
                  beq          zero, a1, 3416f
                  bge          s0, a0, 3427f
                  c.srai       a5, 17
                  srl          gp, s11, s0
3416:             c.beqz       a5, 3422f
                  lui          ra, 8913
                  c.or         a0, a5
                  bge          t0, t0, 3428f
                  div          s0, sp, a5
                  remu         a0, s9, a4
3422:             slti         a3, a2, -1068
                  bne          s10, s2, 3431f
                  xori         s9, s2, -553
                  slti         s5, t5, 1794
                  c.srai       s0, 6
3427:             sra          s2, s5, a4
3428:             bge          s2, gp, 3442f
                  c.srai       a2, 16
                  sltiu        tp, sp, -1760
3431:             sra          a6, s8, sp
                  rem          s4, a1, t3
                  div          t1, t5, s5
                  srli         a2, a1, 7
                  c.srai       a4, 26
                  c.lui        s5, 31
                  c.beqz       s1, 3443f
                  c.and        s0, a1
                  add          a7, t2, a2
                  blt          s4, s2, 3445f
                  nop
3442:             c.mv         gp, s11
3443:             remu         t3, s1, s5
                  c.beqz       a5, 3464f
3445:             slt          gp, s6, gp
                  xor          gp, a3, sp
                  slt          s3, a4, a4
                  bne          s3, a0, 3449f
3449:             andi         s7, s1, 1040
                  or           t4, sp, zero
                  c.srli       a0, 20
                  c.lui        s4, 20
                  c.lui        a1, 10
                  c.sub        a1, s0
                  c.sub        a0, a1
                  addi         s11, s2, -899
                  andi         a0, s1, 291
                  srl          s8, t5, a7
                  mulh         s1, t1, s7
                  and          a1, t4, a2
                  c.addi       a3, -1
                  sltu         tp, t4, s1
                  srli         s1, zero, 2
3464:             mulhsu       zero, s10, a5
                  c.srai       a3, 13
                  xori         t1, s10, -1287
                  c.li         s11, 24
                  auipc        s4, 578209
                  add          t1, s9, ra
                  c.xor        s1, a1
                  remu         gp, s6, gp
                  c.lui        s6, 21
                  c.andi       a5, 31
                  sltiu        a2, a2, -1858
                  mulh         s3, sp, s9
                  slli         s1, t3, 2
                  c.nop
                  sll          s5, tp, t5
                  and          s3, s3, s8
                  srl          s7, s3, t4
                  srai         a1, t1, 6
                  c.sub        a5, a1
                  c.xor        s0, a0
                  slti         a3, gp, 1221
                  mulhu        a1, s5, zero
                  andi         s11, t5, 358
                  mul          a4, t4, s11
                  beq          t3, a6, 3505f
                  addi         a2, zero, 464
                  bne          t6, sp, 3499f
                  c.mv         s10, s4
                  mulh         tp, t0, a6
                  rem          a2, s0, a0
                  slli         t3, tp, 6
                  c.srai       s0, 21
                  div          s8, s5, s4
                  c.bnez       a3, 3517f
                  and          s6, tp, s1
3499:             c.sub        a3, a3
                  rem          t1, a6, t6
                  bltu         t4, a1, 3515f
                  c.lui        s3, 2
                  andi         a4, gp, -224
                  mulhsu       s7, s2, s9
3505:             sra          gp, a6, a2
                  sra          a6, t0, s7
                  lui          s5, 12833
                  c.srai       a0, 5
                  sltu         s10, gp, s5
                  mulhsu       s8, a4, gp
                  blt          t0, t0, 3531f
                  slli         s6, a7, 15
                  beq          a7, a6, 3523f
                  mulhu        s8, a0, ra
3515:             sltu         ra, gp, s5
                  c.sub        a1, a0
3517:             remu         zero, s9, zero
                  c.bnez       s1, 3520f
                  sub          zero, zero, s8
3520:             c.add        t6, s3
                  srai         s5, t4, 4
                  nop
3523:             or           s2, a0, t4
                  bgeu         t1, t6, 3526f
                  c.or         s0, a0
3526:             slti         t0, s0, -1110
                  c.sub        a3, a0
                  sll          s0, s3, s2
                  or           s1, ra, a2
                  and          s3, a2, s10
3531:             lui          gp, 358464
                  sra          s6, a4, a5
                  beq          a5, s5, 3553f
                  bge          t3, s10, 3545f
                  c.nop
                  c.xor        a0, a1
                  beq          ra, a4, 3556f
                  c.add        a7, a7
                  blt          a6, t0, 3545f
                  srai         a7, a7, 20
                  c.sub        a4, a0
                  slt          t1, a2, a4
                  c.and        s0, s1
                  mulhu        s2, s0, a0
3545:             c.lui        a1, 26
                  divu         s2, a4, a1
                  srli         s11, zero, 25
                  blt          a1, a4, 3557f
                  bgeu         s0, gp, 3569f
                  sll          ra, zero, t4
                  c.or         a5, s0
                  div          a4, t6, a1
3553:             xor          s10, s6, t4
                  c.li         a2, 12
                  mulh         a3, t0, a4
3556:             mulhu        t1, t6, t4
3557:             bgeu         s1, s1, 3561f
                  c.sub        a3, a1
                  c.beqz       a1, 3567f
                  bltu         t5, a3, 3565f
3561:             c.addi       a5, -1
                  sub          s0, a3, s4
                  bne          sp, s6, 3577f
                  sra          t0, a1, s5
3565:             divu         s3, a6, s2
                  and          t4, s11, a0
3567:             addi         t1, t6, -1324
                  xori         s8, a2, -1612
3569:             c.xor        a0, a2
                  sub          t6, a7, a4
                  mulhsu       s7, a0, zero
                  beq          s10, s3, 3578f
                  or           t4, tp, t0
                  c.srli       a2, 28
                  xori         a5, a6, -150
                  srli         s5, a1, 1
3577:             c.sub        a4, a2
3578:             andi         a3, t6, -2010
                  xor          t3, s3, t1
                  c.beqz       a3, 3591f
                  nop
                  c.beqz       a1, 3596f
                  nop
                  c.srai       a1, 18
                  c.addi       s9, 21
                  or           s7, s11, a5
                  c.mv         t6, sp
                  xor          t4, a1, s4
                  c.slli       s10, 24
                  c.li         t1, -1
3591:             c.lui        s4, 23
                  andi         t0, a4, -1167
                  bge          a2, s8, 3602f
                  mulh         s2, s9, t4
                  addi         a2, t1, 1697
3596:             mulhu        zero, a0, s6
                  div          s3, s5, s10
                  c.and        s1, a2
                  mulh         t6, s9, s3
                  add          s9, t3, t5
                  bge          s7, a1, 3611f
3602:             or           t1, s1, t2
                  c.sub        s1, s0
                  mul          t0, s4, s7
                  c.slli       s9, 1
                  xori         a5, t0, 629
                  c.li         s4, -1
                  srl          ra, gp, ra
                  bge          s5, s8, 3629f
                  sltiu        gp, s2, 871
3611:             c.mv         a0, s7
                  mulhsu       a6, a1, s4
                  c.mv         s10, t6
                  c.srai       a4, 8
                  divu         a5, s9, s2
                  sra          a1, s2, tp
                  andi         a2, zero, -237
                  sltu         s7, ra, a2
                  auipc        s3, 859246
                  or           t0, s7, t6
                  srai         a4, a7, 18
                  sll          a4, a2, a5
                  sub          s7, s5, s6
                  c.bnez       s0, 3630f
                  sub          a5, s4, t5
                  c.or         s0, a3
                  c.or         a5, a4
                  sub          a7, a6, ra
3629:             bltu         sp, a4, 3639f
3630:             c.lui        a7, 21
                  bge          a3, s4, 3640f
                  and          t3, s3, s3
                  sra          a2, a7, zero
                  mul          s4, ra, t3
                  sltu         a0, s7, t3
                  auipc        t3, 270286
                  bge          s2, t4, 3640f
                  slt          a7, t0, a4
3639:             c.xor        a4, s1
3640:             srl          gp, sp, t0
                  add          s1, s1, s11
                  c.or         a2, a0
                  c.sub        a1, a3
                  c.bnez       a3, 3661f
                  c.slli       s2, 16
                  c.slli       s8, 28
                  beq          t6, s7, 3667f
                  srli         s7, a4, 19
                  srl          s0, ra, a3
                  slli         a0, ra, 30
                  ori          ra, t4, -937
                  andi         s6, s5, 113
                  srl          s0, a0, sp
                  add          s5, s9, s3
                  sll          s3, s5, a0
                  c.or         a5, a5
                  sra          t4, s3, s5
                  c.and        a2, a2
                  bgeu         s8, a4, 3660f
3660:             divu         t0, s10, t1
3661:             rem          gp, s11, s3
                  auipc        s4, 1025549
                  c.bnez       a4, 3664f
3664:             lui          t0, 804867
                  blt          s4, tp, 3671f
                  divu         t4, s6, a3
3667:             slti         s5, sp, 824
                  sub          ra, s11, s5
                  c.srli       a2, 15
                  blt          a2, a3, 3671f
3671:             nop
                  remu         s4, s2, s11
                  xori         t6, zero, -804
                  c.add        s7, s10
                  c.bnez       a4, 3677f
                  bge          s2, s3, 3690f
3677:             c.andi       a1, 13
                  rem          a4, t6, s5
                  bgeu         t6, t2, 3693f
                  sub          s3, s5, s5
                  srai         a3, s4, 0
                  bgeu         a4, s7, 3702f
                  sltiu        s10, sp, 1957
                  c.li         s4, 16
                  sltu         s4, t0, a5
                  sll          s2, ra, t6
                  c.and        s0, a5
                  nop
                  srl          gp, s2, s4
3690:             add          s7, t2, a3
                  bge          t4, t1, 3693f
                  nop
3693:             mulh         s6, a4, s10
                  blt          s2, s4, 3696f
                  mulhu        s0, s5, a1
3696:             ori          a2, t3, 207
                  c.srli       a0, 7
                  mulhsu       a1, a5, a7
                  c.beqz       s1, 3713f
                  ori          a7, a5, -225
                  mulhsu       s8, s5, t3
3702:             andi         a6, a5, 1201
                  mulhu        s11, t3, ra
                  bne          a5, s7, 3723f
                  mul          s7, zero, s4
                  xori         tp, s9, 663
                  srai         ra, a5, 23
                  remu         a4, a0, a1
                  bgeu         s4, s1, 3714f
                  srli         s4, s10, 3
                  c.xor        s0, a0
                  srli         s4, t2, 3
3713:             c.bnez       a5, 3714f
3714:             blt          zero, s4, 3724f
                  sltu         s1, t0, zero
                  sub          a1, gp, sp
                  mul          a7, a5, a1
                  divu         zero, s4, tp
                  mul          tp, s6, s2
                  bne          zero, tp, 3724f
                  xori         s7, a2, 234
                  srl          s0, a1, a0
3723:             sltu         a1, s2, s7
3724:             lui          s6, 613343
                  divu         a7, t0, s1
                  xori         s9, t5, 1329
                  bltu         a3, sp, 3747f
                  c.slli       a7, 1
                  c.li         a7, -1
                  andi         tp, t6, -206
                  c.slli       gp, 23
                  srai         s6, a1, 10
                  sltu         a4, t4, gp
                  c.andi       a1, -1
                  c.add        a6, s7
                  c.bnez       a3, 3745f
                  c.sub        a2, a3
                  xori         s8, sp, 1829
                  auipc        s4, 278181
                  c.or         a5, a3
                  srli         a5, t3, 29
                  bltu         a5, a5, 3744f
                  xori         gp, sp, -624
3744:             bgeu         s8, zero, 3750f
3745:             mulhu        a3, t6, t2
                  c.srli       a4, 26
3747:             sll          t0, s1, a7
                  c.nop
                  srl          s10, s0, tp
3750:             bgeu         t5, a0, 3770f
                  divu         a1, t2, zero
                  c.mv         s3, ra
                  mulhu        ra, a4, t5
                  bltu         a7, a7, 3760f
                  c.bnez       a0, 3769f
                  mulhu        zero, tp, a4
                  sub          s10, s0, a0
                  slli         a0, s8, 28
                  mulh         tp, t0, a7
3760:             srli         s7, s9, 22
                  addi         s2, sp, 1317
                  srl          s8, ra, gp
                  and          s4, t0, s7
                  add          s8, t5, a5
                  c.and        a4, a3
                  sll          s0, a2, gp
                  lui          s7, 378750
                  c.bnez       a4, 3782f
3769:             and          a6, t3, a3
3770:             c.and        s1, a2
                  slt          s8, t0, gp
                  srl          s4, a3, s4
                  c.lui        s3, 29
                  sra          a3, s0, t6
                  c.nop
                  c.and        a0, a0
                  sra          s9, a7, t3
                  sub          t0, s10, s8
                  sltiu        t6, s9, -1152
                  blt          zero, a7, 3783f
                  addi         a5, s6, -1523
3782:             divu         zero, s7, s9
3783:             c.andi       a3, -1
                  c.mv         s1, s5
                  c.sub        a0, s0
                  and          s2, s5, a5
                  remu         s8, s3, tp
                  sub          a4, a3, a2
                  and          a5, s1, a7
                  c.or         a3, a3
                  xori         a4, t4, 372
                  c.mv         a1, t6
                  ori          gp, s3, 1391
                  blt          s8, t4, 3796f
                  sltu         a2, zero, t5
3796:             c.srai       s0, 15
                  mulhsu       a2, s11, s7
                  mulhsu       s1, s6, t1
                  c.addi       s5, 23
                  c.li         a3, 19
                  slti         zero, s4, 1257
                  c.beqz       s0, 3821f
                  slt          zero, tp, ra
                  sltiu        s1, t2, -288
                  slli         a6, a7, 13
                  xori         a1, s7, -1091
                  c.srli       a4, 20
                  mulhsu       t3, s2, s11
                  remu         gp, s9, s0
                  c.nop
                  srli         t6, t5, 30
                  sltu         a7, s3, s10
                  c.nop
                  c.nop
                  auipc        a6, 146749
                  andi         s7, s9, -1236
                  slli         t3, s4, 20
                  add          tp, a6, zero
                  div          t3, t0, t3
                  c.sub        a2, a2
3821:             c.lui        s7, 7
                  mul          a5, t1, s8
                  c.xor        a0, a5
                  c.mv         s10, s0
                  la           s7, sub_5
                  c.nop
                  addi         s4, t3, 1785
                  addi         s7, s7, 453
                  c.add        s1, gp
                  addi         s5, ra, 1188
                  bge          t6, s11, sub_3_j8 #branch to jump instr
                  c.andi       a4, -1
sub_3_j8:         jalr         a0, s7, -452 #jump sub_3 -> sub_5
                  div          a6, s10, s4
                  c.xor        a4, s1
                  sltiu        a5, s7, -278
                  or           a7, t5, t6
                  sra          s2, sp, ra
                  div          t1, gp, t6
                  rem          a5, t4, a5
                  mulh         t4, t1, s11
                  div          s11, s7, t1
                  c.and        a2, s1
                  c.beqz       a3, 3842f
                  c.slli       a3, 1
                  slti         s6, zero, -947
                  srl          s8, a5, s5
                  nop
                  c.srli       a3, 14
                  c.andi       a2, -1
                  c.lui        t6, 18
                  mulhu        s10, s4, ra
3842:             mulh         s6, t2, a6
                  c.addi       a7, 26
                  c.srai       a5, 25
                  c.sub        a4, a4
                  xor          s1, a0, s11
                  c.and        a5, a1
                  xori         s7, a6, 1966
                  c.add        a4, t6
                  sltiu        s4, ra, -423
                  bge          t5, zero, 3853f
                  bltu         tp, t4, 3866f
3853:             c.and        a2, a2
                  c.lui        s8, 9
                  c.li         s9, -1
                  xor          a6, a0, s8
                  bgeu         tp, s9, 3874f
                  c.and        a3, a4
                  c.srai       a1, 31
                  divu         gp, a4, a3
                  srl          s11, s10, t4
                  addi         gp, a4, 1420
                  c.bnez       a5, 3883f
                  srai         s9, ra, 18
                  c.nop
3866:             addi         gp, a3, -482
                  beq          a1, a7, 3875f
                  bltu         a2, t0, 3882f
                  srli         zero, t1, 9
                  add          t1, s8, sp
                  c.and        s0, a4
                  remu         s8, ra, zero
                  beq          a7, s4, 3874f
3874:             c.beqz       a2, 3875f
3875:             slli         tp, t1, 26
                  slti         zero, gp, -986
                  c.srli       a1, 5
                  or           s4, a4, a3
                  sll          gp, a0, zero
                  ori          s8, s3, 1218
                  c.srli       a2, 29
3882:             sltu         a6, gp, s5
3883:             beq          t4, a3, 3893f
                  lui          s2, 97347
                  blt          gp, t5, 3905f
                  bne          s0, s8, 3895f
                  xori         s7, tp, 1370
                  slli         s10, sp, 1
                  mulhu        t1, a5, s3
                  c.andi       a1, 22
                  add          s10, a2, t6
                  bgeu         s2, ra, 3898f
3893:             xor          t0, a3, s5
                  bgeu         a3, s3, 3905f
3895:             c.addi       ra, -1
                  xor          s0, s6, s2
                  and          a5, s7, s3
3898:             srl          s3, s5, gp
                  bge          t3, a6, 3913f
                  c.sub        a2, s0
                  mulhsu       s10, t4, s2
                  c.lui        a2, 21
                  c.xor        a3, s1
                  sra          s4, s2, gp
3905:             c.or         a3, a4
                  mulhu        s8, s7, t6
                  divu         s4, s4, s10
                  div          a5, a6, tp
                  c.lui        a0, 18
                  srl          tp, s5, a7
                  c.add        s4, a3
                  c.add        a4, t6
3913:             c.srai       a2, 10
                  sub          s6, s10, s3
                  la           s5, region_1+1269 #start load_store_instr_stream_1
                  la           s8, region_1+495 #start load_store_instr_stream_0
                  la           s2, region_1+636 #start load_store_instr_stream_2
                  la           ra, region_1+273 #start load_store_instr_stream_3
                  lw           a3, 5(s8)
                  lb           s9, -77(s5)
                  lb           a5, 61(s2)
                  sb           tp, -5(s8)
                  sb           gp, 1614(ra)
                  lb           t4, 110(s5)
                  lb           t0, -616(s2)
                  lb           a2, 324(ra)
                  sb           t3, 2(s8)
                  lb           a0, 264(s2)
                  sb           gp, -68(ra)
                  sb           s7, 8(s8)
                  lh           a4, 854(s2)
                  sh           zero, 11(s8)
                  lbu          a6, 12(s8)
                  lbu          s7, -187(ra)
                  lh           s0, -11(s8)
                  sb           t4, 448(ra)
                  lbu          a5, 877(s2)
                  lb           a5, 21(s5)
                  sh           sp, 687(ra)
                  lbu          a7, 566(s2)
                  lb           a5, 1355(s2)
                  lh           s4, 3(s8)
                  lbu          t1, 914(s2)
                  sb           a2, -157(s5)
                  lb           a2, 2(s8)
                  lb           s1, -253(s5)
                  lh           a4, -152(s2)
                  lw           a6, 19(ra)
                  lb           s7, 147(s5) #end load_store_instr_stream_1
                  lb           t6, 74(s2) #end load_store_instr_stream_2
                  sw           t1, 1235(ra) #end load_store_instr_stream_3
                  lbu          t3, -4(s8) #end load_store_instr_stream_0
                  c.or         a3, s1
                  c.xor        a0, a3
                  c.lui        s11, 17
                  bgeu         s4, s2, 3932f
                  slli         s3, s0, 27
                  blt          sp, s9, 3930f
                  c.add        s9, s11
                  c.xor        a0, a1
                  c.xor        a5, s1
                  c.slli       gp, 4
                  c.and        s0, a2
                  add          s9, s8, a1
                  rem          s10, s0, t5
                  auipc        a2, 130427
                  la           s11, region_0+383 #start load_store_instr_stream_3
                  la           a2, region_0+1617 #start load_store_instr_stream_2
                  la           s7, region_0+361 #start load_store_instr_stream_1
                  la           a1, region_0+622 #start load_store_instr_stream_0
                  lbu          a3, 98(s11)
                  lbu          a6, 11(s7)
                  lh           tp, 43(a2)
                  lb           a4, -72(a1)
                  sb           s9, -13(s7)
                  lb           a5, -100(s11)
                  lbu          s0, 16(s7)
                  sb           s5, 6(s7)
                  sw           t3, 59(a2)
                  sb           t4, -20(a2)
                  lbu          s9, -158(a1)
                  sb           t1, 0(s7)
                  lw           s9, 55(a2)
                  lbu          s9, 130(s11)
                  lbu          t6, -4(s7)
                  lb           t6, 13(a2)
                  sh           t2, -84(a1)
                  sb           sp, -7(s7)
                  lh           s1, 23(a2)
                  lbu          a7, -39(a1)
                  lw           s2, -1(a2)
                  sb           t1, 4(s7)
                  lh           a7, -57(s11)
                  lbu          gp, -56(a2) #end load_store_instr_stream_2
                  lbu          a7, -204(s11) #end load_store_instr_stream_3
                  lb           s5, 6(s7) #end load_store_instr_stream_1
                  lh           a6, 244(a1) #end load_store_instr_stream_0
                  c.add        s8, s10
3930:             sra          s9, t4, t6
                  lui          a3, 401102
3932:             div          s8, s0, t3
                  c.mv         a0, ra
                  c.xor        a5, a1
                  addi         s0, a7, -1483
                  sltiu        ra, t5, 902
                  blt          a5, t6, 3951f
                  ori          s7, t4, -1724
                  andi         t1, t6, -1632
                  c.xor        s0, s1
                  sub          zero, ra, a0
                  rem          s5, sp, a7
                  blt          s3, a2, 3945f
                  sltu         a2, s9, a0
3945:             c.lui        t3, 19
                  sra          ra, t3, s9
                  sub          t0, s1, a6
                  or           ra, a4, s2
                  srl          ra, sp, t3
                  mulh         s7, s9, s4
3951:             xori         s11, t1, -1104
                  sra          gp, a7, sp
                  c.nop
                  c.xor        a3, s0
                  addi         zero, s2, 2004
                  bltu         s2, t6, 3962f
                  bltu         s7, t2, 3963f
                  mulh         t0, s8, ra
                  div          t6, s5, t1
                  c.addi       s7, 21
                  sltu         a7, a6, s8
3962:             c.srai       s0, 24
3963:             c.slli       gp, 14
                  c.beqz       a5, 3978f
                  c.lui        ra, 10
                  xor          s9, a3, t4
                  divu         gp, t5, s11
                  mulhsu       s6, t3, t5
                  mulhu        a2, s11, sp
                  mul          s3, gp, s11
                  c.addi       s6, -1
                  c.srai       s0, 14
                  mulhsu       a6, a4, s0
                  or           s11, sp, gp
                  and          zero, a0, a2
                  sltu         a0, a5, tp
                  c.srli       a1, 30
3978:             xori         t6, s1, -1149
                  c.nop
                  bgeu         t3, s9, 3990f
                  c.or         a3, a0
                  c.add        a5, ra
                  mulh         t6, a0, a6
                  c.and        s1, a3
                  slli         ra, s5, 8
                  c.mv         t0, sp
                  sltu         a2, t1, s1
                  c.andi       s1, 22
                  c.beqz       a5, 3994f
3990:             xori         a6, a3, 1858
                  c.or         a3, s1
                  sltiu        a5, s10, 1473
                  c.sub        s0, s0
3994:             nop
                  addi         gp, a6, 668
                  srai         s6, s5, 9
                  beq          s11, s6, 3999f
                  sltiu        s10, s9, -2033
3999:             sltu         s6, ra, s7
                  bge          a6, ra, 4017f
                  remu         ra, s6, t2
                  sltiu        zero, a1, -1457
                  addi         s0, zero, -6 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
                  sll          t3, gp, s2
                  add          t4, s2, a2
                  xori         s8, s3, 732
                  or           a3, a0, s2
sub_3_90_0_t:     c.and        s1, s1
                  addi         s0, s0, 6 #update loop 0 counter
                  sltiu        t4, a1, 768
                  c.li         t0, -1
                  c.li         a7, 26
                  andi         a1, s9, -524
                  rem          a1, a0, s5
                  sltiu        gp, ra, -568
                  mulh         t4, t0, a2
                  c.andi       a3, 11
                  c.li         a2, 30
                  c.beqz       s0, sub_3_90_0_t #branch for loop 0
                  div          a5, s1, s10
                  or           s3, gp, a2
                  sltiu        s7, tp, 1801
                  or           a0, t5, s3
                  c.and        a5, s0
                  c.li         t1, 23
                  c.nop
                  bne          ra, t4, 4020f
                  sltu         a3, t1, sp
                  lui          s7, 347851
                  or           a6, t2, s10
                  c.and        a2, s1
                  slti         a6, a1, 1342
                  c.or         a3, a4
                  c.srli       a2, 2
4017:             bltu         sp, a0, 4037f
                  ori          ra, s5, 764
                  c.bnez       s0, 4028f
4020:             andi         t1, s9, -1129
                  srli         s8, t3, 26
                  addi         a7, s9, 765
                  c.and        a1, a3
                  or           a5, a0, s5
                  c.add        s2, s10
                  c.beqz       a0, 4027f
4027:             mul          t0, s9, s1
4028:             slti         t6, s1, -174
                  bltu         a2, t1, 4049f
                  c.addi       s8, 26
                  nop
                  slt          a0, s0, t6
                  c.add        s1, a6
                  rem          s6, s6, a1
                  bne          s5, tp, 4039f
                  sltu         gp, a0, s4
4037:             bge          t0, a3, 4051f
                  slt          ra, sp, t3
4039:             c.li         a3, 8
                  auipc        s6, 431647
                  mulhsu       a6, tp, a2
                  c.andi       a0, 19
                  add          s1, s5, s11
                  bgeu         s8, a2, 4058f
                  andi         zero, zero, -1677
                  beq          a7, tp, 4055f
                  remu         s1, s3, a3
                  beq          a7, s5, 4068f
4049:             nop
                  lui          s4, 195894
4051:             xori         tp, t1, 1295
                  c.lui        a1, 14
                  auipc        t1, 114097
                  c.slli       s1, 14
4055:             lui          a5, 530853
                  blt          s1, s5, 4076f
                  sll          s10, s11, s1
4058:             sltu         s11, a4, a1
                  mulhsu       a2, t5, tp
                  slti         t6, a3, 1541
                  andi         gp, t3, 793
                  mulh         s4, t1, a7
                  c.sub        a1, a1
                  add          s10, s4, t1
                  c.nop
                  c.add        s10, s7
                  divu         s7, zero, t1
4068:             bgeu         s4, t5, 4070f
                  mulhu        s7, a6, t2
4070:             add          a4, zero, a7
                  addi         s1, a0, 665
                  c.or         a5, a0
                  bltu         a3, t3, 4074f
4074:             remu         tp, a6, a2
                  c.srli       a4, 18
4076:             bge          s7, s4, 4082f
                  sll          a3, a3, a5
                  and          ra, s1, s2
                  rem          zero, t5, a0
                  sltu         t4, a4, s10
                  c.or         a0, a2
4082:             c.lui        s11, 26
                  c.srai       s0, 26
                  sll          s9, a0, s9
                  auipc        s2, 227905
                  beq          s11, sp, 4089f
                  c.mv         a5, ra
                  xor          s3, a2, gp
4089:             c.slli       s0, 5
                  sltu         zero, zero, t6
                  lui          s1, 65565
                  c.addi       s3, 19
                  xor          a3, a0, a4
                  c.and        a0, a5
                  sltu         a3, s7, s5
                  bgeu         a6, t2, 4105f
                  sll          s8, t4, s10
                  mulhsu       s8, t0, a4
                  sltiu        t4, s10, -2044
                  c.or         a1, a1
                  auipc        t0, 747294
                  add          ra, s0, a5
                  c.bnez       s1, 4111f
                  c.bnez       a5, 4105f
4105:             c.slli       s4, 8
                  addi         s3, a5, -724
                  c.lui        s9, 24
                  xor          zero, sp, s1
                  addi         s8, s10, 1285
                  c.beqz       a0, 4129f
4111:             c.xor        a0, s0
                  bge          zero, a6, 4132f
                  xori         a0, s10, -1518
                  c.add        s7, s9
                  auipc        a2, 695637
                  c.bnez       a3, 4122f
                  lui          s9, 202923
                  srli         gp, a1, 19
                  c.addi       s3, 29
                  mulh         s5, a4, a6
                  mul          a4, tp, a7
4122:             xori         a1, s9, 1643
                  sra          s3, sp, zero
                  bltu         a4, gp, 4133f
                  c.add        s5, t1
                  srl          s4, a7, t0
                  remu         s4, t4, ra
                  c.srli       a1, 4
4129:             c.mv         s11, s6
                  rem          s7, a2, t5
                  sltu         s6, s7, a5
4132:             addi         s8, gp, 875
4133:             sra          s9, a5, a1
                  sub          t0, s3, a1
                  xori         s5, t6, 451
                  srli         a5, t4, 29
                  remu         s9, t0, t0
                  srli         tp, s6, 10
                  c.li         a1, 9
                  bgeu         t2, s11, 4149f
                  rem          a5, t5, a3
                  c.andi       a1, -1
                  srl          t3, zero, a5
                  bne          s9, t3, 4155f
                  add          s2, s7, a0
                  div          s6, a4, a3
                  c.or         s1, a5
                  div          a5, s2, s7
4149:             bltu         a5, a5, 4159f
                  nop
                  mul          a0, s8, s1
                  sub          s1, zero, s2
                  mul          s2, a0, t5
                  mul          t0, sp, s8
4155:             mul          a2, s2, s4
                  c.srli       s1, 5
                  divu         gp, t4, t4
                  nop
4159:             nop
                  nop
                  c.bnez       a1, 4181f
                  c.add        a4, a2
                  c.bnez       a1, 4166f
                  ori          s5, a5, 588
                  c.sub        s0, a3
4166:             mul          a2, t6, s11
                  nop
                  slli         a3, gp, 24
                  c.li         s2, 6
                  mulhu        a6, a5, s11
                  srli         a0, zero, 6
                  xori         gp, s8, 477
                  c.lui        t1, 3
                  sra          s9, a1, a1
                  mulh         tp, s2, s2
                  div          s8, a7, ra
                  slti         t1, s0, -1529
                  c.nop
                  sltiu        a3, s7, -1839
                  c.sub        a4, a5
4181:             slt          a3, a6, zero
                  c.srai       a3, 5
                  slt          zero, s7, s0
                  mulhsu       t6, a3, s0
                  c.bnez       s0, 4193f
                  auipc        t6, 311629
                  c.mv         a7, s6
                  sltiu        s10, zero, -1736
                  srai         a0, a1, 3
                  andi         t4, a0, -567
                  ori          s5, s0, -252
                  c.slli       a3, 19
4193:             bne          t4, tp, 4195f
                  sra          tp, s9, a5
4195:             c.srai       a2, 7
                  blt          a4, s5, 4197f
4197:             or           s2, a2, s0
                  c.add        t4, s1
                  andi         gp, t1, -1745
                  sra          t6, a2, s8
                  c.add        t4, s9
                  c.addi       s5, 26
                  ori          zero, s7, -1324
                  sll          s5, s0, s9
                  bne          a4, a0, 4219f
                  or           t6, s6, t5
                  c.mv         a2, t6
                  srai         s3, a6, 13
                  c.sub        a3, s0
                  and          a1, s7, a0
                  remu         s11, t1, s2
                  la           s10, region_1+1440 #start riscv_hazard_instr_stream_7
                  andi         s11, s7, 753
                  c.xor        s0, a0
                  addi         s2, s2, 141
                  c.andi       s0, -1
                  slti         s7, s7, -444
                  c.nop
                  lw           s11, 12(s10)
                  c.srli       a0, 1
                  auipc        s7, 923010
                  c.slli       s11, 28
                  lhu          s7, 36(s10)
                  c.add        a0, s0
                  sb           s2, -9(s10)
                  sb           s11, 50(s10)
                  srl          s5, s2, a0
                  mulhsu       s0, s2, s7
                  sb           s0, -39(s10)
                  lbu          s5, 57(s10)
                  lw           a0, 56(s10)
                  lbu          s11, -34(s10)
                  lbu          s2, -6(s10)
                  sll          a0, s0, s0
                  slli         s5, s2, 21
                  xor          s2, s11, s7
                  lhu          s11, 34(s10)
                  sb           s2, -49(s10)
                  lb           s11, -2(s10) #end riscv_hazard_instr_stream_7
                  c.slli       s8, 24
                  divu         t0, s10, t2
                  andi         a3, sp, 1919
                  sra          s6, t0, a0
                  c.srli       a2, 12
                  auipc        s9, 393296
                  sltiu        s5, a1, -160
4219:             c.srli       a2, 7
                  nop
                  mulh         a2, s6, s5
                  c.beqz       a5, 4228f
                  lui          zero, 462310
                  bge          t1, a5, 4238f
                  c.bnez       a0, 4245f
                  sll          s3, a7, tp
                  srai         t6, s0, 3
4228:             c.nop
                  mulh         ra, t3, a4
                  mulh         s8, zero, t0
                  and          a3, a5, t2
                  c.slli       s2, 17
                  remu         a5, t4, a3
                  c.or         s0, a5
                  bge          t1, s5, 4245f
                  mul          a5, s11, t4
                  c.addi       s6, 8
4238:             auipc        ra, 536385
                  remu         s2, a2, a1
                  mul          s9, a3, tp
                  c.bnez       s0, 4246f
                  c.addi       s10, 6
                  c.add        s7, a5
                  ori          s6, t3, 1453
4245:             sub          s4, s10, t2
4246:             sra          s0, s3, s5
                  rem          s1, t2, s10
                  bne          ra, t5, 4254f
                  add          s3, t5, t0
                  ori          t6, a7, 1713
                  srli         s3, t3, 0
                  c.xor        a5, a2
                  c.xor        a5, a5
4254:             ori          a7, tp, 1121
                  div          gp, a4, s8
                  srl          a5, sp, s3
                  sub          ra, t4, s10
                  c.addi       s11, -1
                  xor          ra, sp, t5
                  xori         s6, a0, 878
                  srai         s6, t5, 31
                  div          s1, s4, ra
                  c.and        a0, a3
                  c.add        a6, s1
                  c.li         t6, 13
                  sltiu        a1, s7, -1636
                  sub          gp, a5, s7
                  bne          s5, s3, 4269f
4269:             rem          a0, a4, s1
                  bgeu         t2, a4, 4273f
                  bltu         t6, gp, 4273f
                  divu         t1, s1, t1
4273:             c.add        s0, s1
                  slli         s0, a5, 28
                  lw           a0, 4(t5)
                  c.and        s1, a0
                  addi         t5, t5, 36
                  sltiu        t0, a4, 1155
                  or           s2, s4, t0
7565:             addi x14, x10, 0
7565:             c.jalr x14
sub_1:            srai         s0, tp, 14
                  xori         a1, ra, 1999
                  c.mv         a3, s8
                  addi         t5, t5, -40
                  c.slli       a5, 23
                  sw           a0, 4(t5)
                  and          t4, s3, a4
                  la           gp, sub_2
                  c.or         a1, a1
                  mul          t6, t3, a3
                  addi         gp, gp, -514
                  mulhsu       a2, a5, gp
                  blt          a7, s1, sub_1_j3 #branch to jump instr
                  c.and        s1, s1
                  xori         s11, t3, 1696
                  c.lui        ra, 3
                  c.or         a3, a0
                  mulh         a1, s5, a0
                  sub          s11, gp, a0
sub_1_j3:         jalr         a0, gp, 514 #jump sub_1 -> sub_2
                  sltiu        zero, a6, -1195
                  nop
                  la           a7, sub_2
                  lui          a3, 58777
                  c.xor        a1, a1
                  addi         a7, a7, -1001
                  bne          ra, t6, sub_1_j4 #branch to jump instr
                  add          s10, t4, gp
sub_1_j4:         jalr         a0, a7, 1002 #jump sub_1 -> sub_2
                  c.bnez       s0, 16f
                  xor          s10, a6, s6
                  andi         s7, a6, -831
                  c.sub        a0, a2
                  bge          s5, s2, 15f
                  srai         a0, a4, 13
                  srl          s11, t1, t3
                  beq          s6, t2, 18f
                  slt          s9, t3, s8
                  xor          a1, a5, s10
                  bltu         s4, t4, 16f
                  bgeu         s4, s5, 23f
                  rem          a1, t1, t6
                  sra          s6, a7, a2
                  ori          tp, a3, -1473
15:               c.and        a0, a1
16:               and          t0, ra, s7
                  and          gp, s4, a3
18:               c.beqz       a2, 37f
                  c.li         a6, 16
                  addi         t0, t2, -1423
                  c.li         a6, 17
                  sub          a4, t3, a6
23:               c.add        s10, a6
                  or           a5, a0, a2
                  c.addi       s0, -1
                  slt          a7, a6, a4
                  c.mv         s5, sp
                  c.and        a5, a3
                  slli         tp, t1, 19
                  addi         s5, s1, -1041
                  c.li         s2, -1
                  c.slli       s7, 25
                  c.srai       s0, 1
                  sll          ra, sp, s10
                  c.nop
                  rem          a5, gp, tp
37:               c.bnez       s1, 46f
                  slt          a7, gp, s11
                  c.xor        a2, a3
                  mulhu        a5, sp, a4
                  sltiu        s6, t0, 1842
                  ori          s10, a1, 701
                  c.add        s5, t4
                  c.bnez       a5, 50f
                  and          t4, tp, a0
46:               rem          s2, s11, a1
                  ori          t0, t4, -1635
                  sll          a7, a3, t5
                  c.xor        a4, a4
50:               div          s5, s8, s2
                  andi         t3, t4, 1992
                  c.slli       gp, 10
                  lw           a0, 4(t5)
                  c.andi       a5, -1
                  addi         t5, t5, 40
                  c.and        a5, a4
86:               addi x16, x10, 0
86:               jalr x16, x16, 0
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
.align           2
mtvec_handler:    
                  addi x2, x2, -4
                  sw  x30, (x2)
                  add x30, x2, zero
                  addi x30, x30, -128
                  sw  x1, 4(x30)
                  sw  x2, 8(x30)
                  sw  x3, 12(x30)
                  sw  x4, 16(x30)
                  sw  x5, 20(x30)
                  sw  x6, 24(x30)
                  sw  x7, 28(x30)
                  sw  x8, 32(x30)
                  sw  x9, 36(x30)
                  sw  x10, 40(x30)
                  sw  x11, 44(x30)
                  sw  x12, 48(x30)
                  sw  x13, 52(x30)
                  sw  x14, 56(x30)
                  sw  x15, 60(x30)
                  sw  x16, 64(x30)
                  sw  x17, 68(x30)
                  sw  x18, 72(x30)
                  sw  x19, 76(x30)
                  sw  x20, 80(x30)
                  sw  x21, 84(x30)
                  sw  x22, 88(x30)
                  sw  x23, 92(x30)
                  sw  x24, 96(x30)
                  sw  x25, 100(x30)
                  sw  x26, 104(x30)
                  sw  x27, 108(x30)
                  sw  x28, 112(x30)
                  sw  x29, 116(x30)
                  sw  x30, 120(x30)
                  sw  x31, 124(x30)
                  add x2, x30, zero
                  csrr x5, 0x300 # MSTATUS
                  csrr x5, 0x342 # MCAUSE
                  srli x5, x5, 31
                  bne x5, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x5, 0x341 # MEPC
                  csrr x5, 0x342 # MCAUSE
                  li x22, 0x3 # BREAKPOINT
                  beq x5, x22, ebreak_handler
                  li x22, 0x8 # ECALL_UMODE
                  beq x5, x22, ecall_handler
                  li x22, 0x9 # ECALL_SMODE
                  beq x5, x22, ecall_handler
                  li x22, 0xb # ECALL_MMODE
                  beq x5, x22, ecall_handler
                  li x22, 0x1
                  beq x5, x22, instr_fault_handler
                  li x22, 0x5
                  beq x5, x22, load_fault_handler
                  li x22, 0x7
                  beq x5, x22, store_fault_handler
                  li x22, 0xc
                  beq x5, x22, pt_fault_handler
                  li x22, 0xd
                  beq x5, x22, pt_fault_handler
                  li x22, 0xf
                  beq x5, x22, pt_fault_handler
                  li x22, 0x2 # ILLEGAL_INSTRUCTION
                  beq x5, x22, illegal_instr_handler
                  csrr x22, 0x343 # MTVAL
                  1: la x7, test_done
                  jalr x1, x7, 0

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
                  la x7, write_tohost
                  jalr x0, x7, 0

instr_fault_handler:
                  add x30, x2, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x2, x30, zero
                  lw  x30, (x2)
                  addi x2, x2, 4
                  mret

load_fault_handler:
                  add x30, x2, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x2, x30, zero
                  lw  x30, (x2)
                  addi x2, x2, 4
                  mret

store_fault_handler:
                  add x30, x2, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x2, x30, zero
                  lw  x30, (x2)
                  addi x2, x2, 4
                  mret

ebreak_handler:   
                  csrr  x5, 0x341
                  addi  x5, x5, 4
                  csrw  0x341, x5
                  add x30, x2, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x2, x30, zero
                  lw  x30, (x2)
                  addi x2, x2, 4
                  mret

illegal_instr_handler:
                  csrr  x5, 0x341
                  addi  x5, x5, 4
                  csrw  0x341, x5
                  add x30, x2, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x2, x30, zero
                  lw  x30, (x2)
                  addi x2, x2, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x5, 0x300 # MSTATUS;
                  csrr  x5, 0x304 # MIE;
                  csrr  x5, 0x344 # MIP;
                  csrrc x5, 0x344, x5 # MIP;
                  add x30, x2, zero
                  lw  x1, 4(x30)
                  lw  x2, 8(x30)
                  lw  x3, 12(x30)
                  lw  x4, 16(x30)
                  lw  x5, 20(x30)
                  lw  x6, 24(x30)
                  lw  x7, 28(x30)
                  lw  x8, 32(x30)
                  lw  x9, 36(x30)
                  lw  x10, 40(x30)
                  lw  x11, 44(x30)
                  lw  x12, 48(x30)
                  lw  x13, 52(x30)
                  lw  x14, 56(x30)
                  lw  x15, 60(x30)
                  lw  x16, 64(x30)
                  lw  x17, 68(x30)
                  lw  x18, 72(x30)
                  lw  x19, 76(x30)
                  lw  x20, 80(x30)
                  lw  x21, 84(x30)
                  lw  x22, 88(x30)
                  lw  x23, 92(x30)
                  lw  x24, 96(x30)
                  lw  x25, 100(x30)
                  lw  x26, 104(x30)
                  lw  x27, 108(x30)
                  lw  x28, 112(x30)
                  lw  x29, 116(x30)
                  lw  x30, 120(x30)
                  lw  x31, 124(x30)
                  addi x30, x30, 128
                  add x2, x30, zero
                  lw  x30, (x2)
                  addi x2, x2, 4
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
