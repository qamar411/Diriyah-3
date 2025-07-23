.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x17, h0_start
jalr x0, x17, 0
h0_start:
                  li x4, 0x40001105
                  csrw 0x301, x4
kernel_sp:        
                  la x18, kernel_stack_end

trap_vec_init:    
                  la x4, mtvec_handler
                  ori x4, x4, 0
                  csrw 0x305, x4 # MTVEC

mepc_setup:       
                  la x4, init
                  csrw 0x341, x4

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x4, 0x1800
                  csrw 0x300, x4 # MSTATUS
                  li x4, 0x0
                  csrw 0x304, x4 # MIE
                  mret
init:             
                  li x0, 0xfcd34892
                  li x1, 0x80000000
                  li x2, 0x0
                  li x3, 0x485fb229
                  li x4, 0x0
                  li x5, 0x33062e96
                  li x6, 0xf02a36d1
                  li x7, 0x80000000
                  li x8, 0xf24689e2
                  li x9, 0x80000000
                  li x10, 0x0
                  li x11, 0x9
                  li x12, 0xf171c014
                  li x13, 0x0
                  li x14, 0xa
                  li x15, 0x0
                  li x16, 0x0
                  li x17, 0x0
                  li x19, 0x80000000
                  li x20, 0x80000000
                  li x22, 0x0
                  li x23, 0xf74bcb4c
                  li x24, 0x80000000
                  li x25, 0xf2ee170a
                  li x26, 0x0
                  li x27, 0x80000000
                  li x28, 0xbde322ff
                  li x29, 0x2
                  li x30, 0x0
                  li x31, 0xf3d1c867
                  la x21, user_stack_end
main:             la           t2, amo_0+12 #start riscv_amo_instr_stream_0
                  la           a6, amo_0+56
                  amominu.w.rl  s9, s9, (t2)
                  amomaxu.w.rl  a5, s6, (a6)
                  or           t4, tp, t1
                  amoswap.w     a5, t6, (t2)
                  amoadd.w      tp, s5, (t2)
                  amoor.w       a2, s6, (a6) #end riscv_amo_instr_stream_0
                  la           s7, region_0+648 #start riscv_hazard_instr_stream_0
                  slti         ra, t3, 626
                  lb           t1, -165(s7)
                  sb           t3, -239(s7)
                  c.xor        a2, s0
                  srli         ra, a2, 22
                  lbu          s0, -221(s7)
                  ori          ra, t1, 948
                  lb           ra, -177(s7)
                  sb           ra, 219(s7)
                  sw           a1, -8(s7)
                  lb           ra, 195(s7)
                  sltu         a2, ra, a2
                  slli         a2, t3, 10
                  slli         a2, a2, 9
                  lbu          t1, 208(s7)
                  and          t3, ra, t1
                  lh           ra, 10(s7)
                  slti         a1, t3, 1674
                  sb           a2, -233(s7)
                  divu         t1, a2, t3
                  xor          a2, s0, ra
                  sb           a1, 190(s7)
                  sw           a2, -108(s7)
                  ori          ra, a2, 219
                  lb           s0, 147(s7)
                  mulhu        t1, ra, ra
                  sh           ra, 132(s7)
                  mul          s0, a1, t1
                  srai         a2, s0, 20
                  lhu          ra, 36(s7)
                  sb           a1, -127(s7)
                  sh           t1, 254(s7)
                  c.li         s0, -1
                  lb           s0, -123(s7)
                  mulhu        t3, ra, a2
                  lw           a1, -216(s7)
                  sh           t1, 210(s7)
                  lb           s0, 247(s7)
                  sb           t3, -61(s7)
                  lb           s0, 65(s7)
                  lbu          ra, -62(s7)
                  slti         a2, ra, -370
                  sltiu        s0, t1, 531
                  sb           t3, -145(s7)
                  mul          t1, ra, a1
                  c.andi       s0, 16
                  div          a2, t1, t1
                  lb           t3, -201(s7) #end riscv_hazard_instr_stream_0
                  la           t2, amo_0+4 #start riscv_lr_sc_instr_stream_0
                  lr.w.rl       a2, (t2)
                  or           s3, t2, zero
                  mulhu        a2, s7, t2
                  c.addi4spn   a0, sp, 816
                  srli         a5, a4, 21
                  sub          s8, t3, s7
                  c.lui        s10, 21
                  andi         a4, s0, 473
                  mulhsu       a4, a1, s1
                  sc.w.aq       a5, s8, (t2) #end riscv_lr_sc_instr_stream_0
                  la           sp, region_1+1311 #start riscv_load_store_hazard_instr_stream_0
                  lb           s9, -6(sp)
                  sb           s10, 7(sp)
                  lhu          zero, 7(sp)
                  lbu          t4, 7(sp)
                  c.mv         s6, s5
                  sh           t0, -5(sp)
                  lbu          t1, -5(sp)
                  c.srai       a5, 9
                  lb           tp, -5(sp)
                  sb           sp, -5(sp)
                  lh           s3, -5(sp)
                  lh           s7, 15(sp)
                  lh           s6, 15(sp)
                  lh           s11, 15(sp)
                  sb           a0, 15(sp)
                  sb           t5, 15(sp)
                  c.mv         s8, a7
                  c.sub        s0, s1
                  sb           a7, 6(sp)
                  lw           t4, 5(sp) #end riscv_load_store_hazard_instr_stream_0
                  la           sp, region_1+1668 #start riscv_load_store_rand_instr_stream_0
                  and          t4, gp, a4
                  lhu          t3, 6(sp)
                  c.li         t5, 3
                  c.xor        a2, a0
                  lui          s1, 280092
                  xori         s4, t2, -1999
                  remu         a6, s8, t6
                  c.lwsp       s10, 16(sp)
                  c.swsp       s5, 48(sp)
                  lb           s3, -3(sp)
                  addi         zero, a6, -970
                  remu         t0, a5, t4
                  c.xor        s0, a0
                  mulh         a6, sp, s8
                  sb           gp, -79(sp)
                  c.mv         t1, a3
                  c.nop
                  sb           t1, -53(sp)
                  xori         t5, t4, 1390
                  xor          a1, s3, s0
                  sb           t4, -93(sp)
                  c.swsp       s8, 72(sp)
                  sltiu        tp, zero, -1094
                  or           t2, zero, sp
                  srli         s7, t6, 13
                  lbu          t0, -87(sp)
                  lhu          t5, 174(sp)
                  andi         t4, s3, -376
                  sra          t4, s1, zero
                  lbu          a1, -6(sp)
                  lb           s0, 13(sp)
                  lbu          zero, 109(sp)
                  lb           a3, -150(sp)
                  sll          ra, t0, s7
                  ori          s4, tp, -127
                  addi         s1, s2, 1706
                  lbu          a2, -57(sp)
                  addi         gp, tp, -1586
                  xor          a6, t3, a2
                  remu         ra, t2, t2
                  c.xor        a1, s0
                  sb           s4, -60(sp)
                  div          s3, zero, s11
                  lb           t6, -221(sp)
                  div          t1, s5, a4
                  lb           a0, -179(sp)
                  sh           t3, -180(sp) #end riscv_load_store_rand_instr_stream_0
                  la           t4, region_0+1487 #start load_store_instr_stream_0
                  sw           s1, -15(t4)
                  la           t0, region_1+1633 #start load_store_instr_stream_1
                  sb           a7, -1280(t4)
                  lb           tp, -19(t0)
                  lbu          ra, 37(t0)
                  lh           gp, 305(t4)
                  lbu          t5, -40(t0)
                  lh           a0, 385(t4)
                  lhu          ra, -39(t0)
                  lh           s0, -23(t0)
                  sb           s7, -42(t0)
                  lbu          zero, -250(t4)
                  lbu          t3, 22(t0) #end load_store_instr_stream_1
                  sb           s3, -1208(t4)
                  lhu          s0, -749(t4) #end load_store_instr_stream_0
main_2:           jal          ra, 20f
0:                c.j          27f
1:                c.j          22f
2:                c.j          10f
3:                jal          ra, 14f
4:                jal          ra, 21f
5:                jal          ra, 23f
6:                c.j          9f
7:                c.jal        15f
8:                c.j          26f
9:                c.j          7b
10:               jal          t1, 6b
11:               jal          ra, 30f
12:               c.j          25f
13:               c.j          0b
14:               jal          ra, 19f
15:               jal          ra, 16f
16:               c.j          8b
17:               jal          sp, 18f
18:               c.j          28f
19:               jal          t1, 2b
20:               c.j          1b
21:               c.j          24f
22:               jal          ra, 29f
23:               c.jal        13b
24:               jal          ra, 11b
25:               c.j          3b
26:               c.j          4b
27:               c.jal        12b
28:               jal          t1, 5b
29:               jal          ra, 17b
30:               c.li         t5, 20
                  slt          s10, s9, s11
                  xor          a4, s1, s9
                  addi         a6, t5, -54
                  lui          a5, 266392
                  addi         t2, t0, 587
                  c.li         t6, 20
                  remu         s9, t4, t4
                  mul          a1, t2, t6
                  andi         s11, ra, 486
                  c.addi16sp   sp, -16
                  add          s7, t3, a0
                  c.add        t6, a6
                  beq          t6, s8, 32f
                  c.slli       t2, 10
                  c.sub        a3, s0
                  c.addi16sp   sp, -16
                  mulhu        t4, a3, s7
                  c.addi4spn   s0, sp, 432
                  mul          a1, s9, s8
                  addi         s7, zero, -10 #init loop 1 counter
                  sltu         s6, s0, s9
                  c.mv         gp, a5
                  c.sub        a3, s0
                  addi         t1, s5, -465
                  rem          t6, s10, s8
                  c.srai       a0, 20
                  c.and        a0, s0
                  addi         a4, zero, 17 #init loop 1 limit
                  xori         t5, a4, 474
main_5_1_t:       sub          a3, s8, t1
                  c.add        gp, ra
                  addi         s7, s7, 4 #update loop 1 counter
                  slt          s4, zero, s4
                  addi         s8, zero, 0 #init loop 0 counter
                  addi         zero, t0, -1733
                  c.srai       s1, 14
                  c.add        ra, gp
                  addi         s10, zero, -19 #init loop 0 limit
                  c.addi       t5, -1
                  c.add        gp, a2
main_5_0_t:       slti         tp, t3, -258
                  addi         gp, s9, -1961
                  nop
                  c.li         ra, -1
                  sltu         s6, t0, a3
                  c.addi4spn   s1, sp, 896
                  addi         s8, s8, -6 #update loop 0 counter
                  sra          a6, t1, t4
                  bge          s8, s10, main_5_0_t #branch for loop 0
                  xori         t3, ra, 1701
                  bltu         s7, a4, main_5_1_t #branch for loop 1
                  andi         s9, s3, -1111
                  mulhsu       tp, s7, a2
                  slt          s0, s10, a7
                  sltiu        s8, s2, 1509
                  remu         s6, a3, a0
                  c.beqz       a4, 32f
                  srai         zero, s11, 3
                  c.nop
                  bltu         s1, a5, 27f
27:               slt          ra, s3, s11
                  srli         s8, s1, 20
                  c.li         s11, 29
                  c.addi4spn   a3, sp, 16
                  bgeu         s7, zero, 37f
32:               c.nop
                  xori         a6, t3, 1777
                  bgeu         gp, zero, 44f
                  auipc        t4, 925984
                  slt          t1, a7, s9
37:               c.sub        a0, s0
                  mul          ra, s2, s5
                  add          s7, t0, s5
                  sra          sp, s5, a3
                  c.sub        a0, a1
                  sltu         sp, a6, tp
                  c.bnez       s0, 55f
44:               sub          a2, a2, a3
                  nop
                  beq          t5, s1, 57f
                  c.xor        a4, s0
                  bge          t1, a2, 49f
49:               xor          t1, gp, zero
                  blt          s9, s10, 57f
                  c.addi16sp   sp, 336
                  c.mv         s0, t6
                  c.addi       s8, -1
                  sra          a5, tp, s2
55:               c.slli       a2, 4
                  xori         sp, s6, 1394
57:               sub          s0, a0, a4
                  srli         tp, a7, 25
                  xori         a1, s0, 223
                  c.lui        s0, 17
                  sltu         t3, s4, a2
                  sltu         a4, gp, a7
                  mulh         t1, s7, a6
                  srai         a6, s4, 4
                  add          t3, a7, t3
                  remu         zero, t5, s5
                  mulhsu       t0, s0, gp
                  and          s10, s10, s0
                  beq          t5, s5, 76f
                  div          t5, a7, s11
                  rem          gp, t6, s4
                  c.srli       s1, 14
                  slli         t6, s5, 26
                  mulh         s9, s11, t6
                  sll          s7, a1, s4
76:               c.bnez       a2, 78f
                  andi         a4, t5, 25
78:               c.srai       a2, 11
                  beq          gp, a2, 92f
                  bge          t1, s5, 99f
                  c.li         sp, 1
                  sltu         a2, s3, s1
                  c.addi16sp   sp, 400
                  blt          a2, t2, 92f
                  c.nop
                  mulh         zero, t0, s8
                  c.andi       a4, 18
                  c.beqz       a1, 93f
                  mulh         a4, s10, t4
                  and          s8, gp, a7
                  c.beqz       a3, 105f
92:               c.or         s1, a5
93:               c.nop
                  xor          a6, sp, zero
                  c.mv         s11, s11
                  slt          s3, tp, a5
                  and          ra, zero, s7
                  c.or         a3, a3
99:               remu         s1, s7, a4
                  xor          s4, s5, a4
                  add          s4, t3, t4
                  srai         t0, a2, 4
                  add          s6, t5, tp
                  xori         a0, t6, -1811
105:              c.srai       a2, 11
                  remu         s6, s6, a7
                  div          s1, t4, zero
                  sltu         tp, s2, a0
                  c.slli       t3, 13
                  sub          a5, a5, t5
                  c.add        tp, a0
                  andi         a4, s4, -627
                  c.sub        a0, a4
                  sltiu        t6, s1, -1272
                  c.add        sp, s9
                  mul          a2, sp, s11
                  remu         t1, s6, t0
                  la           s8, region_1+1251 #start load_store_instr_stream_0
                  lbu          a3, 625(s8)
                  la           s3, region_1+433 #start load_store_instr_stream_1
                  lb           t0, 256(s8)
                  lh           t4, -329(s8)
                  lw           s1, -511(s8)
                  lbu          s11, 62(s3)
                  lb           t4, -983(s8)
                  lb           a4, 25(s3)
                  sb           gp, 1(s3)
                  lb           s10, 62(s3)
                  lb           a0, -376(s8)
                  lbu          a5, 25(s3)
                  lh           t1, 307(s8)
                  sh           s0, 63(s3)
                  sh           s3, -47(s3) #end load_store_instr_stream_1
                  lh           s7, -1157(s8)
                  lhu          a5, -683(s8) #end load_store_instr_stream_0
                  remu         a5, s11, s9
                  add          gp, s6, t5
                  slti         s11, s5, -456
                  add          t1, a1, s11
                  c.nop
                  c.srli       s0, 16
                  andi         s7, s9, -1059
                  c.lui        s11, 10
                  remu         a1, s10, a2
                  c.srli       a5, 3
                  bltu         s9, s0, 137f
                  div          s10, a6, s6
                  c.xor        a3, a1
                  rem          s8, a4, s6
                  c.srai       a5, 8
                  auipc        s0, 386505
                  c.addi       tp, 30
                  bne          s0, s6, 141f
                  c.srli       s1, 16
137:              andi         zero, s6, 971
                  c.mv         t5, t1
                  divu         gp, s1, s6
                  bltu         t0, t0, 154f
141:              c.mv         t6, s4
                  xori         s3, ra, 1921
                  c.li         t5, 21
                  slti         a4, gp, -1609
                  divu         tp, t5, t3
                  bne          s4, ra, 150f
                  c.mv         t5, t4
                  sltiu        s3, a2, -1042
                  c.and        a0, s0
150:              mul          gp, t5, a6
                  slti         s3, s9, -1698
                  bltu         t2, a6, 160f
                  sra          s3, t2, a4
154:              beq          a4, a1, 168f
                  mul          a3, zero, a4
                  bne          t4, a7, 173f
                  and          s3, a0, a2
                  slli         sp, t0, 13
                  sra          s7, ra, tp
160:              xori         t4, t2, -870
                  xori         s10, t0, 17
                  xori         sp, s4, 1223
                  c.srli       a4, 10
                  divu         t1, a7, s5
                  c.addi4spn   a1, sp, 608
                  slt          t6, t3, ra
                  blt          a1, t6, 176f
168:              or           a1, a4, t0
                  slt          sp, t1, s5
                  srli         s1, sp, 23
                  slt          a6, s3, t0
                  mulhu        t1, s7, a7
173:              c.add        s7, t4
                  c.andi       a4, 26
                  c.xor        a5, s1
176:              slt          sp, a7, t4
                  c.srai       s0, 12
                  srl          t5, t3, t6
                  slli         a3, t1, 23
                  c.xor        a4, a5
                  mulhsu       s10, a0, s2
                  c.add        t5, sp
                  srl          sp, t0, a5
                  sub          zero, t5, s8
                  c.mv         t0, t3
                  c.mv         tp, s7
                  slt          s10, s5, tp
                  mulhu        s6, s2, gp
                  srli         t0, s6, 1
                  mulh         s6, s9, s1
                  sltu         zero, s3, t4
                  ori          s0, a3, 1489
                  mulhu        sp, a4, a0
                  auipc        a2, 1015973
                  c.add        a2, s3
                  blt          t2, a0, 214f
                  mulhu        s11, gp, s1
                  slli         s4, s4, 26
                  mulhsu       s7, tp, s11
                  slli         t6, s8, 21
                  nop
                  sub          a1, a7, a5
                  div          t6, a1, s0
                  slti         t2, t2, -674
                  blt          tp, s7, 209f
                  bltu         a0, s2, 216f
                  add          a6, tp, a6
                  c.sub        s1, s0
209:              c.bnez       s0, 215f
                  beq          t1, s2, 215f
                  and          s0, s1, s9
                  bge          s4, t3, 229f
                  c.add        s1, gp
214:              lui          s8, 523652
215:              nop
216:              srli         sp, a6, 8
                  sub          zero, s4, s8
                  blt          t0, s0, 219f
219:              andi         tp, s8, 940
                  c.mv         a3, s11
                  div          ra, a5, tp
                  blt          s0, s9, 232f
                  div          a1, ra, a0
                  sltu         a4, tp, a5
                  c.addi16sp   sp, -16
                  srl          t0, gp, tp
                  slli         s0, sp, 10
                  c.xor        a3, a2
229:              slti         s11, s3, 11
                  c.slli       t4, 4
                  c.bnez       a2, 242f
232:              c.srai       s0, 20
                  c.srli       s0, 11
                  c.addi       a1, -1
                  slli         a6, t0, 2
                  remu         t3, a6, s8
                  nop
                  divu         t1, a6, s3
                  c.xor        a3, a5
                  c.add        a5, a0
                  bgeu         t0, t3, 247f
242:              sltiu        s8, s3, 259
                  bltu         s9, ra, 263f
                  beq          ra, s0, 257f
                  mulhu        a1, s0, s5
                  mulh         t1, tp, s4
247:              blt          t2, t1, 256f
                  xor          s0, s2, zero
                  c.li         a3, 25
                  bne          tp, s5, 254f
                  c.or         a5, s1
                  divu         s1, t1, tp
                  c.or         s1, a3
254:              c.bnez       a3, 273f
                  slti         t4, t4, 2044
256:              c.andi       a5, 16
257:              divu         zero, s1, t5
                  andi         a3, ra, -338
                  c.addi4spn   a0, sp, 1008
                  srl          a5, a0, sp
                  xor          t5, a5, s7
                  mulhu        s11, s6, s11
263:              sltiu        tp, t6, -683
                  and          a0, t0, tp
                  beq          s10, a7, 279f
                  mul          s0, gp, a7
                  remu         a6, s8, t3
                  c.xor        a5, s1
                  c.and        a3, s1
                  lui          a6, 301399
                  add          s11, s5, a6
                  c.lui        s10, 15
273:              c.andi       a4, -1
                  sub          s9, s4, a0
                  addi         t5, t3, 897
                  lui          s6, 1040793
                  bltu         t0, s0, 291f
                  c.addi       a6, 19
279:              c.srai       a4, 23
                  addi         a4, s3, -1050
                  c.slli       a1, 17
                  divu         a4, t5, s2
                  slti         a2, t0, -959
                  bltu         sp, s1, 298f
                  c.lui        s3, 16
                  srai         a6, s2, 10
                  c.addi16sp   sp, -16
                  bge          a6, s3, 306f
                  c.or         s0, a2
                  c.and        a5, a2
291:              c.addi4spn   s0, sp, 720
                  mulhsu       t1, s8, a5
                  c.addi4spn   s1, sp, 144
                  c.sub        a2, a3
                  mulh         a4, s10, t3
                  xor          a1, s2, a0
                  c.sub        a3, a3
298:              beq          s11, t1, 315f
                  c.nop
                  c.sub        s0, a4
                  add          s10, t1, a0
                  mul          tp, t4, a5
                  remu         s8, s10, zero
                  c.li         a6, -1
                  c.andi       a4, 29
306:              slli         zero, t6, 9
                  c.andi       a3, 26
                  srli         zero, ra, 11
                  xori         a4, a5, 318
                  bge          s10, s1, 319f
                  bge          s2, t4, 315f
                  andi         ra, gp, 707
                  sltu         a3, s2, t6
                  add          a1, s4, t4
315:              srl          gp, s11, s8
                  c.or         a0, a0
                  and          t2, s1, s0
                  c.srai       s1, 11
319:              add          s1, sp, s0
                  sll          a0, ra, ra
                  slt          a3, gp, t4
                  addi         a5, gp, -1399
                  c.slli       t6, 17
                  sra          a0, t6, s4
                  add          t1, s7, a3
                  divu         s8, s3, s4
                  sltiu        s4, t0, -139
                  div          a5, a4, a4
                  div          sp, t6, s2
                  c.bnez       a4, 331f
331:              mulhsu       zero, t4, a2
                  c.and        a4, a3
                  mulhu        a4, s9, s11
                  c.addi16sp   sp, 208
                  addi         s1, a6, -527
                  c.or         a4, a1
                  xori         a4, s3, -1974
                  c.addi       t5, 26
                  or           ra, s6, a0
                  mulh         s4, s2, a0
                  bgeu         s1, sp, 350f
                  sll          s3, s10, s3
                  and          s9, s2, s7
                  remu         s1, gp, gp
                  srai         s4, t2, 5
                  c.addi       a0, 6
                  or           a1, t3, a5
                  c.bnez       a0, 358f
                  mulh         t2, t6, sp
350:              c.andi       a4, -1
                  bne          s5, s1, 357f
                  c.addi       s8, 19
                  remu         t5, s2, t6
                  c.or         a5, s0
                  c.add        a5, a3
                  c.srli       s0, 19
357:              c.bnez       a0, 369f
358:              c.sub        a2, a1
                  c.xor        a2, a4
                  ori          a5, s4, -1041
                  c.nop
                  c.addi16sp   sp, -16
                  add          s7, a4, sp
                  blt          a5, gp, 369f
                  bne          a3, s3, 370f
                  addi         t4, s4, 1609
                  c.or         a3, a5
                  divu         s0, s11, s0
369:              bge          s5, ra, 377f
370:              sltiu        s8, zero, -965
                  nop
                  beq          zero, s10, 379f
                  nop
                  c.bnez       a5, 382f
                  c.and        s1, a5
                  c.li         s3, -1
377:              xori         t4, s1, -940
                  c.andi       a2, -1
379:              ori          a6, t4, -354
                  sltu         s10, a7, a7
                  c.sub        a5, a0
382:              add          a3, s0, s2
                  beq          s9, a1, 400f
                  c.or         a3, a4
                  c.and        a4, s0
                  sra          a2, s11, a3
                  c.addi4spn   a3, sp, 656
                  mul          t0, gp, a2
                  xori         t1, zero, 1378
                  bge          t0, s1, 392f
                  nop
392:              blt          s0, a0, 398f
                  srai         t6, zero, 11
                  mulhsu       a3, a4, s5
                  srl          s3, sp, t1
                  c.slli       s9, 11
                  slli         s6, s0, 17
398:              mulhu        t4, t5, s3
                  sub          s9, a2, s9
400:              sltu         s8, s5, s11
                  c.mv         s8, a0
                  or           t5, a1, a2
                  ori          t4, a3, 1440
                  and          a2, s11, s6
                  c.srai       a2, 1
                  slti         s11, t1, 1926
                  c.xor        s0, a5
                  andi         gp, t6, -1480
                  bge          t1, s8, 416f
                  xor          sp, s3, s2
                  sll          a6, s8, s11
                  c.lui        s3, 8
                  mulhu        t4, s11, s7
                  slt          s4, gp, s6
                  beq          a4, a2, 432f
416:              nop
                  srai         sp, tp, 11
                  sltiu        sp, tp, 1194
                  lui          s7, 851289
                  ori          s1, a2, -208
                  remu         s6, a1, sp
                  divu         t6, gp, a6
                  slti         s11, zero, 1778
                  or           gp, t6, t5
                  c.and        a3, s1
                  xori         a1, a0, -1776
                  sub          t3, s0, a4
                  bgeu         a2, s0, 439f
                  slli         a0, s6, 31
                  mulhu        s9, s10, a1
                  c.mv         a4, a7
432:              sll          s10, s8, t5
                  add          gp, t1, gp
                  auipc        t3, 984712
                  la           s0, sub_1
                  c.add        t5, s4
                  c.srai       a1, 24
                  xor          t4, a5, s1
                  addi         s0, s0, 613
                  or           s1, t2, tp
                  c.sub        a4, a3
                  beq          s6, t1, main_j1 #branch to jump instr
                  auipc        t1, 561229
main_j1:          jalr         ra, s0, -613 #jump main -> sub_1
                  c.li         s1, 9
                  add          s3, s5, t6
                  srl          s8, t1, s0
                  div          t3, gp, s10
439:              and          s9, sp, t6
                  la x17, test_done
                  jalr x0, x17, 0
test_done:        
                  li gp, 1
                  ecall
sub_5:            beq          a5, t1, sub_5_stack_p
                  srai         a3, t3, 26
                  c.li         a5, 10
                  c.lui        s3, 15
sub_5_stack_p:    addi         s5, s5, -52
                  c.sub        a1, a4
                  sw           ra, 4(s5)
                  auipc        s6, 208693
                  la           sp, region_0+1687 #start riscv_load_store_rand_instr_stream_0
                  lb           s1, 4(sp)
                  divu         s1, a3, a6
                  lbu          a0, -13(sp)
                  lhu          t6, 9(sp)
                  lhu          a3, -13(sp)
                  c.slli       t1, 1
                  lbu          zero, 3(sp)
                  sltu         gp, s5, zero
                  c.mv         t1, a4
                  sh           tp, 3(sp)
                  lb           t3, -15(sp)
                  mulhu        a3, s9, a7
                  sb           s1, 8(sp)
                  sb           s11, -2(sp)
                  lh           s1, -9(sp)
                  c.xor        s1, a4
                  xor          a3, a3, s2
                  srl          t2, s6, a3
                  andi         a6, s0, -188
                  sltiu        tp, s8, -506
                  sb           s4, 1(sp)
                  sb           sp, -13(sp)
                  xori         t4, t5, 290
                  lb           s7, 10(sp)
                  srli         a6, t6, 20
                  sll          s6, s2, a1
                  c.sub        a0, a2
                  c.addi       a5, 16
                  sb           t6, 8(sp)
                  lbu          s4, 3(sp)
                  lw           s4, -7(sp)
                  divu         s3, a4, s4
                  lbu          gp, -10(sp)
                  lb           a3, -9(sp)
                  sb           s3, -1(sp)
                  lbu          a3, 0(sp)
                  lhu          s9, 9(sp)
                  addi         ra, t3, -1796
                  lb           s0, -4(sp) #end riscv_load_store_rand_instr_stream_0
                  la           s4, amo_0+20 #start riscv_lr_sc_instr_stream_0
                  mulhsu       zero, t5, ra
                  sra          gp, t6, a2
                  c.addi       a6, -1
                  lr.w.rl       t2, (s4)
                  c.addi       s3, 6
                  slli         s3, s8, 8
                  sc.w.rl       a2, s5, (s4) #end riscv_lr_sc_instr_stream_0
                  la           a4, region_0+212 #start riscv_load_store_hazard_instr_stream_0
                  lh           s1, 16(a4)
                  sb           s5, 10(a4)
                  addi         t2, t4, 279
                  lhu          s3, -4(a4)
                  sh           s11, -14(a4)
                  lhu          a2, -4(a4)
                  lw           s8, -4(a4)
                  sh           t0, -4(a4)
                  lw           s7, -4(a4)
                  lb           t3, -11(a4)
                  lbu          s10, -11(a4)
                  lb           t5, 5(a4)
                  lh           a5, 14(a4)
                  lh           s10, 10(a4)
                  sw           s3, 0(a4)
                  lb           s3, 15(a4)
                  lb           s7, 15(a4)
                  lh           t0, 2(a4)
                  sb           a3, -13(a4)
                  lh           t4, 6(a4)
                  lbu          s3, 3(a4) #end riscv_load_store_hazard_instr_stream_0
                  la           sp, region_0+135 #start riscv_hazard_instr_stream_0
                  sb           a4, 168(sp)
                  slt          s1, t1, s1
                  lh           ra, 219(sp)
                  xori         ra, a4, 1100
                  sb           s1, 182(sp)
                  sh           gp, 131(sp)
                  sb           ra, 34(sp)
                  sltiu        a4, gp, 822
                  sb           a4, -64(sp)
                  remu         ra, t4, t4
                  c.add        s1, a4
                  lbu          t1, -109(sp)
                  mulhsu       ra, t1, ra
                  sb           a4, -116(sp)
                  c.slli       a4, 4
                  auipc        a4, 575544
                  lbu          gp, 242(sp)
                  lb           gp, 238(sp)
                  c.nop
                  c.slli       ra, 5
                  c.or         s1, a4
                  ori          t4, ra, -147
                  mulhsu       gp, t4, ra
                  and          gp, t4, ra
                  srl          gp, t1, t4
                  sb           s1, 170(sp)
                  c.srai       a4, 26
                  mul          ra, ra, t1
                  sra          t1, gp, s1
                  and          t1, gp, t4
                  sra          a4, s1, s1
                  sra          gp, t4, a4
                  sb           gp, 205(sp)
                  c.or         a4, a4
                  lb           s1, -124(sp)
                  lbu          t1, -40(sp)
                  sw           t4, 249(sp)
                  c.andi       s1, 4
                  sb           t1, -9(sp)
                  sb           gp, 131(sp)
                  lbu          t4, 31(sp) #end riscv_hazard_instr_stream_0
                  la           s4, region_1+1070 #start load_store_instr_stream_0
                  la           a5, region_1+1190 #start load_store_instr_stream_3
                  la           a0, region_1+322 #start load_store_instr_stream_2
                  la           tp, region_1+1746 #start load_store_instr_stream_4
                  sb           s7, 193(tp)
                  sb           s2, -177(a5)
                  lb           s9, 1569(a0)
                  la           t6, region_1+540 #start load_store_instr_stream_1
                  lbu          gp, 156(tp)
                  sw           a0, 1006(a0)
                  lb           s7, 327(s4)
                  lhu          s1, -116(tp)
                  lb           t1, -257(a0)
                  lbu          sp, -31(a5)
                  lh           t3, -874(a5)
                  lb           a1, 205(tp)
                  sb           t1, 167(s4)
                  sb           s1, 1207(a0)
                  sb           s2, -116(tp)
                  lb           zero, -711(a5)
                  lw           a1, 734(s4)
                  lbu          a4, 639(a5)
                  sb           s2, -198(t6)
                  lw           s8, 486(a5)
                  sb           a3, 993(a0)
                  lbu          s6, -26(t6)
                  lbu          s1, 345(s4)
                  lbu          a2, -354(a5)
                  lh           zero, 954(a0) #end load_store_instr_stream_2
                  sb           s6, 129(tp)
                  sb           a7, -743(s4)
                  lb           t5, 142(s4)
                  lb           s8, -201(t6)
                  lbu          s10, 733(a5) #end load_store_instr_stream_3
                  lw           gp, -86(tp)
                  lh           s6, 586(s4)
                  lb           s9, -243(t6)
                  lbu          ra, 190(t6) #end load_store_instr_stream_1
                  lbu          t2, 676(s4)
                  lbu          ra, 73(tp)
                  lw           s3, -150(tp) #end load_store_instr_stream_4
                  lbu          s8, 913(s4) #end load_store_instr_stream_0
                  la           gp, region_1+386 #start load_store_instr_stream_1
                  la           t0, region_0+877 #start load_store_instr_stream_0
                  lb           s4, -38(t0)
                  lb           sp, 10(t0)
                  lh           a0, -48(gp)
                  lb           s4, -43(gp)
                  lh           sp, -31(t0)
                  lb           s10, 43(gp)
                  lw           a5, -45(t0)
                  lbu          a4, -55(t0)
                  sb           a1, 36(gp)
                  lb           s11, 47(gp)
                  lb           a0, 48(t0)
                  lbu          s7, 49(gp)
                  lb           a1, 24(t0)
                  lhu          s6, -63(t0)
                  lbu          tp, 21(gp)
                  lhu          s11, -9(t0)
                  lh           a3, -52(gp)
                  lhu          s1, 42(gp) #end load_store_instr_stream_1
                  sb           t3, 28(t0) #end load_store_instr_stream_0
                  la           s9, amo_0+60 #start riscv_amo_instr_stream_0
                  amoand.w      t4, t2, (s9) #end riscv_amo_instr_stream_0
                  beq          s5, s5, 17f
                  c.addi       a2, -1
                  c.andi       a5, -1
                  slli         gp, t2, 21
                  mulhsu       tp, s10, a0
                  sub          s7, a0, a7
                  bltu         s9, s8, 9f
                  blt          s4, s11, 23f
                  add          s9, a4, a1
9:                c.addi16sp   sp, -16
                  xor          t4, s6, t3
                  c.or         a1, a0
                  c.and        a0, a4
                  divu         a0, a6, s10
                  bne          s7, ra, 20f
                  slt          t6, s1, s9
                  xor          zero, a7, t6
17:               sll          ra, s9, zero
                  sub          a5, a0, s1
                  c.nop
20:               sll          t0, gp, a7
                  xor          a5, t3, t3
                  bne          t5, a5, 26f
23:               c.bnez       a0, 27f
                  c.xor        a2, a0
                  srl          s11, s9, t6
26:               and          s9, tp, s0
27:               and          a5, t3, s0
                  mulh         s9, s5, s2
                  mulhu        s0, s4, t5
                  srli         s6, gp, 28
                  sltiu        s3, s5, 1516
                  auipc        t3, 489423
                  c.addi16sp   sp, 224
                  lui          t5, 953876
                  c.mv         s11, a0
                  srl          s8, s7, s11
                  xor          a1, a6, s8
                  c.beqz       a1, 41f
                  beq          t6, s5, 49f
                  c.xor        s1, a5
41:               mulh         ra, t0, a6
                  c.srli       a5, 21
                  auipc        sp, 933299
                  bltu         t4, t3, 45f
45:               c.li         s6, -1
                  c.nop
                  c.addi       sp, 31
                  beq          s11, s3, 67f
49:               divu         tp, a0, a5
                  c.srli       a2, 20
                  c.beqz       a2, 53f
                  and          a3, s3, s7
53:               slt          t4, t2, s0
                  c.xor        a0, a1
                  c.lui        tp, 2
                  c.add        s9, t4
                  or           t2, s2, t1
                  c.li         gp, 21
                  c.beqz       s0, 73f
                  c.srai       a0, 3
                  rem          s10, s0, s10
                  c.slli       t3, 17
                  c.add        gp, a2
                  srli         a6, s4, 2
                  c.lui        s10, 26
                  sra          t0, t0, sp
67:               c.mv         t3, s1
                  sltu         s0, t0, s8
                  c.addi       a1, -1
                  srai         t0, s11, 2
                  c.beqz       a4, 73f
                  divu         a0, t6, tp
73:               or           a3, t4, a1
sub_5_2:          jal          ra, 4f
0:                c.j          11f
1:                jal          ra, 7f
2:                jal          t1, 12f
3:                jal          ra, 10f
4:                jal          t1, 8f
5:                jal          ra, 2b
6:                c.j          5b
7:                c.j          0b
8:                c.j          3b
9:                c.j          6b
10:               c.jal        1b
11:               c.j          9b
12:               div          a5, a1, a2
                  beq          s10, gp, 88f
                  sra          a2, a0, t1
                  div          a3, t6, s2
                  bne          a3, t4, 85f
                  slti         ra, t2, 1678
                  bltu         s7, t6, 86f
                  sltiu        t5, a4, 13
                  addi         a1, zero, 8 #init loop 0 counter
                  srli         a0, s6, 26
                  c.and        a0, a5
                  sub          s7, a2, a6
                  c.slli       s0, 12
                  auipc        a5, 940105
                  srl          t4, t1, t3
                  addi         s1, zero, 6 #init loop 0 limit
sub_5_5_0_t:      ori          a5, t6, 816
                  srl          s10, a6, t4
                  mul          gp, tp, sp
                  addi         a1, a1, -4 #update loop 0 counter
                  slti         a2, t3, 920
                  c.li         tp, -1
                  div          t6, a7, s11
                  c.mv         tp, s11
                  slli         tp, s9, 18
                  nop
                  bgeu         a1, s1, sub_5_5_0_t #branch for loop 0
                  c.or         s0, a3
                  or           a5, s4, t0
                  slli         s6, a1, 27
                  blt          tp, a7, 91f
                  div          a3, zero, t2
85:               rem          t1, a4, zero
86:               c.addi16sp   sp, 464
                  c.add        t5, s6
88:               c.srai       a3, 26
                  xori         t2, s9, -261
                  sub          s4, t0, t4
91:               c.sub        s1, a3
                  addi         s3, s4, 1850
                  c.mv         t5, t1
                  xor          a2, s6, a4
                  nop
                  div          a2, tp, a3
                  sltiu        t6, sp, -1679
                  auipc        t0, 349945
                  mulh         a1, t0, s3
                  remu         s10, t0, t5
                  auipc        s8, 438326
                  sltiu        t6, s0, -59
                  srl          a0, s4, a1
                  add          gp, a3, t4
                  ori          s9, a6, 421
                  c.and        a1, s1
                  c.nop
                  c.andi       a0, 31
                  sltiu        t0, s3, 143
                  mulhu        s0, t2, s1
                  srl          a3, t1, s7
                  c.mv         t2, s5
                  auipc        s0, 105952
                  c.li         sp, 6
                  sra          s10, a1, s7
                  c.addi16sp   sp, 64
                  c.andi       a2, 2
                  c.addi16sp   sp, -16
                  c.li         a1, 12
                  slt          s4, a6, s5
                  c.beqz       a5, 127f
                  mulhu        t0, s2, s0
                  sltiu        a5, t5, 1939
                  mulhsu       s10, s2, t6
                  c.beqz       a3, 127f
                  mulh         a6, a5, a3
127:              mul          t4, a2, a4
                  sra          s4, s9, a6
                  divu         t5, s10, a0
                  rem          t1, t1, s2
                  c.add        s3, a7
                  c.add        s7, s1
                  mulh         s6, s8, t3
                  srli         t0, s8, 25
                  auipc        s1, 421770
                  or           t6, s8, a0
                  c.and        a5, s0
                  c.add        s7, s7
                  c.or         s1, a0
                  or           s8, a2, zero
                  c.sub        s1, s0
                  addi         a2, s2, 1558
                  sltu         a4, a6, a7
                  xori         gp, sp, 1994
                  c.and        a2, a3
                  or           s0, s7, a2
                  and          t0, t0, s2
                  sub          a4, a1, gp
                  c.xor        a2, a2
                  sub          a1, s9, s3
                  mul          a3, s2, a3
                  c.mv         s1, s3
                  beq          a0, s8, 172f
                  div          s8, s7, s4
                  c.or         a1, a3
                  mul          t6, s1, s9
                  blt          t2, t0, 162f
                  nop
                  xor          t6, a3, s6
                  sltiu        a4, s8, -1261
                  bne          t2, a1, 177f
162:              slli         s9, t6, 2
                  beq          a0, a7, 183f
                  srli         zero, a6, 29
                  bge          s8, s0, 180f
                  ori          s1, a5, 1471
                  srli         a4, gp, 12
                  c.bnez       a2, 174f
                  or           t1, s0, t5
                  c.li         s4, 14
                  srl          t2, t5, gp
172:              c.addi       a2, -1
                  bne          s3, s1, 186f
174:              srli         t4, s9, 2
                  and          s9, s1, gp
                  c.addi4spn   s1, sp, 432
177:              nop
                  div          s0, t3, a6
                  mulhu        s0, a1, s0
180:              sltu         a4, s8, s1
                  srai         tp, a5, 3
                  sltu         a3, s0, gp
183:              c.xor        a1, a3
                  bne          t4, s5, 187f
                  mulh         s4, t5, s0
186:              c.addi       t6, 20
187:              slti         t2, tp, 88
                  c.addi16sp   sp, -16
                  sltiu        tp, s9, -948
                  sltu         t5, t4, t4
                  rem          s1, gp, t1
                  c.add        ra, s5
                  divu         s1, s7, s1
                  sll          t2, a2, s4
                  rem          a2, sp, a6
                  addi         s0, zero, -1721
                  c.srli       a5, 31
                  c.addi       s0, 1
                  mulh         t1, t6, t5
                  slti         ra, a3, 1201
                  and          t2, s9, a5
                  sub          t4, sp, s7
                  c.addi16sp   sp, -16
                  c.addi4spn   a1, sp, 528
                  c.add        ra, a0
                  rem          a4, s2, t4
                  bge          sp, ra, 225f
                  c.and        a4, a0
                  slt          a1, s3, s2
                  c.mv         a2, a7
                  c.slli       t1, 26
                  ori          a4, t5, -251
                  c.andi       s0, -1
                  sltiu        ra, s7, -1326
                  add          s1, a2, s9
                  c.and        s1, a1
                  c.or         a1, a4
                  sll          s8, s3, t4
                  blt          a2, a4, 232f
                  auipc        t1, 551594
                  c.srai       a4, 24
                  slti         a3, s10, -145
                  sll          ra, a3, s1
                  c.sub        a0, a1
225:              c.bnez       s0, 238f
                  andi         s0, s3, 962
                  c.xor        s0, s1
                  rem          tp, a7, t1
                  c.andi       s1, 4
                  srl          a0, s9, s5
                  andi         s6, t3, 1614
232:              c.slli       s8, 16
                  c.or         s1, a1
                  c.mv         s9, s9
                  and          gp, t4, s3
                  mulhu        s10, ra, gp
                  c.lui        t4, 13
238:              and          s7, a0, zero
                  srli         a4, s1, 10
                  c.bnez       s0, 243f
                  c.add        s3, t5
                  slt          t2, a1, a2
243:              c.sub        a0, a0
                  mulh         s11, sp, s7
                  andi         t4, t4, -803
                  mulh         ra, a2, a2
                  srai         s7, a6, 9
                  mulh         a3, t4, s0
                  c.nop
                  slti         a3, t3, 379
                  c.or         a3, a1
                  rem          t6, s5, a5
                  and          a2, a7, s2
                  beq          gp, a0, 273f
                  bgeu         t3, t2, 269f
                  sra          t4, s1, s6
                  c.slli       s9, 23
                  auipc        a0, 886846
                  sltu         s11, s0, s1
                  c.mv         a1, s11
                  srli         sp, t5, 2
                  srl          t0, s3, s6
                  ori          s4, sp, -1404
                  c.andi       a3, 6
                  mulh         a4, s9, s9
                  beq          a2, zero, 276f
                  c.add        s4, t0
                  remu         s0, s3, a5
269:              c.mv         a5, s8
                  bne          s11, s8, 272f
                  c.nop
272:              c.or         a5, a2
273:              nop
                  andi         s1, s2, 1092
                  slt          t3, s0, s2
276:              c.srai       a4, 6
                  c.xor        a1, a4
                  bgeu         a0, s0, 280f
                  blt          zero, a0, 281f
280:              xor          sp, s2, s8
281:              andi         s0, a7, -809
                  srai         s6, s8, 7
                  c.li         a2, 9
                  and          a6, t5, sp
                  c.li         s1, -1
                  div          s7, s0, tp
                  c.lui        a6, 6
                  srl          gp, s10, a1
                  slti         s0, t3, 1731
                  slt          a1, t5, t4
                  mulhu        a3, zero, gp
                  mulhsu       s9, a6, t2
                  mulh         tp, s6, s4
                  andi         a1, a0, -861
                  slt          a4, s1, a3
                  c.xor        s0, s1
                  sub          t1, a0, tp
                  c.li         s10, 17
                  lui          s10, 374520
                  c.add        a3, gp
                  mul          t5, s3, s7
                  rem          s0, s10, s0
                  c.lui        t5, 3
                  c.addi4spn   a0, sp, 608
                  sub          zero, s10, t3
                  c.add        s0, a6
                  andi         t4, a6, -1769
                  srli         s9, t0, 5
                  sltiu        s0, sp, 504
                  srl          a4, t5, t1
                  bne          s0, t4, 324f
                  remu         s3, s11, s6
                  c.nop
                  rem          s0, t2, s3
                  srl          t2, t2, s6
                  c.addi16sp   sp, -16
                  srl          t5, s3, a1
                  add          s6, t6, ra
                  c.and        s1, a2
                  auipc        a2, 829189
                  c.slli       s8, 18
                  sub          t2, s1, ra
                  c.addi4spn   a2, sp, 608
324:              c.add        a2, s0
                  srl          a0, tp, a7
                  mul          t6, s7, t6
                  sub          s8, t1, gp
                  c.mv         s8, t2
                  c.andi       a5, 16
                  auipc        s0, 986085
                  c.beqz       a4, 339f
                  sub          s9, s7, a5
                  c.li         t5, 30
                  lui          s6, 442901
                  remu         t2, a6, a4
                  div          s4, a4, s6
                  c.andi       s1, -1
                  mulh         t2, s8, sp
339:              c.srai       a3, 20
                  c.beqz       a1, 344f
                  divu         a4, t3, s2
                  xori         s0, s5, -1509
                  c.xor        a3, a5
344:              and          a1, s4, s4
                  sra          s10, zero, s4
                  divu         a4, t0, a0
                  c.li         s3, -1
                  mul          a3, a3, a5
                  c.srai       s0, 23
                  auipc        s0, 384404
                  c.srai       a5, 26
                  bltu         s7, s4, 353f
353:              c.addi       ra, -1
                  sltiu        s8, a0, -1587
                  c.bnez       a0, 372f
                  remu         s9, t6, a0
                  c.mv         tp, gp
                  c.and        s1, a4
                  slt          s3, t4, t1
                  c.addi16sp   sp, -16
                  addi         s9, sp, 848
                  sltu         t1, gp, a6
                  slli         a3, t5, 12
                  sub          t1, s4, s6
                  slt          s3, a4, s10
                  ori          t1, tp, -1646
                  srl          a0, gp, t3
                  add          t6, s4, a7
                  xor          s10, s10, sp
                  c.sub        s0, a0
                  add          zero, a5, t1
372:              xor          a2, a4, s4
                  c.beqz       s1, 376f
                  bgeu         s0, s0, 376f
                  bgeu         zero, s9, 376f
376:              c.addi       s9, -1
                  c.lui        s4, 6
                  lw           ra, 4(s5)
                  sll          a3, gp, s9
                  addi         s5, s5, 52
                  slli         t4, s9, 0
601:              addi x26, x1, 0
601:              c.jalr x26
sub_4:            c.addi4spn   a4, sp, 1008
                  mulhu        s0, s2, t4
                  blt          a4, s4, sub_4_stack_p
                  c.addi       s4, -1
                  c.sub        a3, a3
sub_4_stack_p:    addi         s5, s5, -24
                  c.nop
                  nop
                  srl          t1, s3, s5
                  rem          s11, t2, s1
                  mulhu        t2, s5, gp
                  sw           ra, 4(s5)
                  srli         s10, s7, 24
                  la           t6, region_1+1457 #start riscv_load_store_hazard_instr_stream_4
                  lbu          a4, -1(t6)
                  sb           sp, -10(t6)
                  sb           a7, -10(t6)
                  sb           s4, -10(t6)
                  c.li         t5, 31
                  lb           t5, 9(t6)
                  lbu          a1, 9(t6)
                  lb           s11, 9(t6)
                  lh           tp, 9(t6)
                  sub          s7, t2, a6
                  c.addi4spn   s0, sp, 336
                  sh           s6, 9(t6)
                  lhu          gp, 9(t6)
                  c.srai       s1, 31
                  slti         t1, a7, -151
                  remu         s10, t0, s2
                  lbu          zero, 13(t6)
                  xor          a6, a5, a7
                  lh           a4, 13(t6) #end riscv_load_store_hazard_instr_stream_4
                  la           s9, region_0+668 #start riscv_hazard_instr_stream_1
                  mulh         s3, a2, s3
                  sw           t2, 4(s9)
                  c.xor        a2, a3
                  sb           s6, 15(s9)
                  sltiu        a3, t6, 1408
                  lw           s6, -16(s9)
                  lw           t2, -12(s9)
                  sb           t2, -11(s9)
                  sltiu        a2, a3, 455
                  lbu          t6, -3(s9)
                  and          s3, a2, a3
                  sb           s6, 10(s9)
                  lh           t2, -14(s9)
                  lbu          t2, 10(s9)
                  lb           s6, 1(s9)
                  c.addi       a3, 23
                  add          t6, s3, t6
                  sw           t2, 8(s9)
                  lb           a2, -15(s9)
                  nop
                  srli         t6, s3, 4
                  lb           s3, -7(s9)
                  lb           s3, 5(s9)
                  lb           s6, -10(s9)
                  div          a3, t2, t2
                  slt          a2, s6, s3
                  sh           a3, 14(s9)
                  div          s6, a3, a3
                  lb           a2, 5(s9)
                  sh           s6, 14(s9)
                  lbu          a3, 10(s9)
                  sub          t6, a3, t6
                  addi         s3, a2, 156
                  sb           a2, -6(s9)
                  lbu          s3, 6(s9)
                  lh           t2, 14(s9)
                  srl          t6, a3, s3
                  c.and        a2, a2
                  sb           t2, -5(s9)
                  lbu          a2, -1(s9)
                  sll          s3, a3, s3
                  andi         a3, s6, 119
                  lhu          t6, 8(s9)
                  c.sub        a2, a3
                  lb           a2, -11(s9)
                  lb           t2, -11(s9)
                  divu         s3, a2, t2
                  c.srli       a2, 6
                  sh           t2, -8(s9) #end riscv_hazard_instr_stream_1
                  la           a6, amo_0+56 #start riscv_amo_instr_stream_4
                  la           a1, amo_0+24
                  amominu.w.aq  a5, s7, (a1)
                  amoxor.w.rl   gp, a0, (a6)
                  amomaxu.w.rl  s1, a5, (a1) #end riscv_amo_instr_stream_4
                  la           sp, region_1+1522 #start riscv_hazard_instr_stream_9
                  lw           t5, -106(sp)
                  lw           s7, -94(sp)
                  lbu          t1, -221(sp)
                  sra          t5, s0, t5
                  mulhsu       s0, a2, s0
                  lh           s0, -178(sp)
                  sb           t1, -59(sp)
                  lbu          t5, 183(sp)
                  lb           s7, -5(sp)
                  sltiu        s0, s0, 308
                  lui          t1, 500838
                  ori          a2, t5, -280
                  slti         a2, s7, 1819
                  xor          s0, s6, t1
                  mulhu        a2, t1, a2
                  srli         s6, a2, 4
                  sh           t1, -220(sp)
                  slt          t1, t5, s0
                  sh           t1, 30(sp)
                  sh           s0, -18(sp)
                  sw           t5, 70(sp)
                  sb           t5, 13(sp)
                  andi         a2, a2, -1823
                  sb           a2, -27(sp)
                  lb           t5, -189(sp)
                  sub          s6, t5, t5
                  srl          a2, s7, t1
                  lb           t1, -3(sp)
                  or           t5, a2, a2
                  divu         t1, t5, t1
                  lbu          a2, 171(sp)
                  rem          t5, t1, a2
                  lb           t1, 235(sp)
                  slli         s7, a2, 7
                  ori          s7, s7, 755
                  sb           s7, 248(sp)
                  sh           s6, -150(sp)
                  mulhsu       t1, t1, a2
                  sh           s7, 68(sp)
                  c.andi       s0, 5
                  div          t1, t5, s6
                  c.srai       a2, 23
                  mulhu        s7, t1, t5
                  sh           s7, 78(sp)
                  lb           s6, 45(sp)
                  xori         a2, t1, 700
                  srl          t1, s7, s0
                  or           t1, t1, a2
                  sub          s0, s6, t1
                  lh           a2, -114(sp)
                  lbu          s0, -146(sp)
                  lb           s0, -144(sp) #end riscv_hazard_instr_stream_9
                  la           s8, amo_0+16 #start riscv_lr_sc_instr_stream_7
                  xori         s6, a0, 487
                  sll          ra, gp, t3
                  lr.w.aq       a3, (s8)
                  c.addi4spn   a3, sp, 656
                  add          a1, s7, ra
                  mul          a6, a7, s4
                  sll          t1, a5, a1
                  srli         s6, a2, 12
                  c.addi4spn   s1, sp, 432
                  add          gp, s9, s1
                  c.lui        t3, 14
                  div          s7, a6, s7
                  c.li         a4, 19
                  c.nop
                  c.or         a3, s0
                  c.srli       a0, 13
                  sc.w          t0, t5, (s8) #end riscv_lr_sc_instr_stream_7
                  la           t2, region_1+310 #start load_store_instr_stream_1
                  la           t1, region_1+343 #start load_store_instr_stream_2
                  la           t3, region_1+903 #start load_store_instr_stream_0
                  lb           s4, 204(t1)
                  sb           s4, -16(t3)
                  lbu          s1, 10(t2)
                  lhu          a3, -10(t2)
                  sw           s3, -7(t3)
                  lb           gp, -8(t2)
                  sb           s2, -4(t2)
                  lb           s0, 0(t3)
                  lb           ra, -12(t2)
                  sw           a6, -6(t2)
                  sb           a5, -70(t1)
                  lbu          s3, 2(t3)
                  lb           a4, 3(t2)
                  sb           a5, 16(t3)
                  lh           sp, -16(t2)
                  lhu          a4, -13(t3)
                  lbu          gp, 8(t3)
                  sb           a3, -129(t1)
                  lb           a0, 0(t1)
                  sb           s6, -3(t2)
                  lbu          s1, 0(t3)
                  sb           s7, 186(t1)
                  lbu          zero, -15(t2) #end load_store_instr_stream_1
                  sb           s1, 96(t1) #end load_store_instr_stream_2
                  sb           t0, -8(t3) #end load_store_instr_stream_0
                  addi         t3, zero, -10 #init loop 1 counter
                  c.slli       a6, 14
                  xori         t4, s11, -1426
                  addi         s11, zero, 15 #init loop 1 limit
                  mulh         s1, ra, s10
                  c.srai       a1, 28
                  sltiu        s6, a2, 1896
sub_4_53_1_t:     c.sub        a4, a4
                  mulh         s4, t0, s4
                  addi         t3, t3, 5 #update loop 1 counter
                  addi         ra, zero, 7 #init loop 0 counter
                  srai         t5, a5, 13
                  sll          s4, s10, t2
                  sll          t6, s11, s3
                  addi         t0, zero, 10 #init loop 0 limit
                  sll          t6, t2, t5
                  nop
                  sub          sp, s11, a3
sub_4_53_0_t:     c.and        a2, s0
                  mulhu        a2, ra, zero
                  slli         s8, s6, 17
                  slli         s6, a5, 10
                  slt          a4, s3, a1
                  addi         ra, ra, 10 #update loop 0 counter
                  bltu         ra, t0, sub_4_53_0_t #branch for loop 0
                  mul          gp, a0, s8
                  c.nop
                  sll          a4, t3, s10
                  bltu         t3, s11, sub_4_53_1_t #branch for loop 1
                  ori          sp, tp, -1173
                  la           t0, region_0+1335 #start load_store_instr_stream_0
                  sh           s9, -1039(t0)
                  la           a3, region_0+1276 #start load_store_instr_stream_2
                  la           gp, region_0+12 #start load_store_instr_stream_1
                  la           t3, region_0+1266 #start load_store_instr_stream_3
                  sb           s0, 591(a3)
                  lb           t2, -3(gp)
                  sw           a5, -230(t3)
                  sb           s8, 613(a3)
                  lbu          t2, -1174(t0)
                  lbu          s3, 231(a3)
                  sh           tp, -200(t3)
                  sw           sp, -2(t3)
                  lb           ra, 111(t3)
                  lbu          t1, -1034(a3)
                  lb           s4, 1849(gp)
                  lhu          t5, -387(t0)
                  lh           s11, -1151(t0)
                  lbu          a6, 380(t0)
                  sb           ra, -452(a3)
                  lh           s10, -831(t0)
                  sb           t5, -348(t0)
                  lbu          t4, 71(gp)
                  lbu          sp, -211(t3) #end load_store_instr_stream_3
                  sw           s7, -280(a3) #end load_store_instr_stream_2
                  sb           sp, 20(gp)
                  lb           s0, 1807(gp) #end load_store_instr_stream_1
                  lbu          s10, -1250(t0) #end load_store_instr_stream_0
                  addi         a5, zero, -10 #init loop 1 counter
                  and          sp, s7, t3
                  c.srai       a4, 25
                  c.andi       a3, 15
                  c.srai       s0, 23
                  addi         zero, zero, 0 #init loop 1 limit
                  slti         sp, tp, 611
                  sub          t4, gp, s6
                  xori         s7, s10, 1054
                  ori          s9, t6, 810
sub_4_57_1_t:     auipc        s6, 506271
                  sltu         s7, a1, t3
                  addi         a5, a5, 2 #update loop 1 counter
                  andi         s7, s8, -1874
                  addi         t2, zero, 3 #init loop 0 counter
                  addi         t6, zero, -5 #init loop 0 limit
                  c.lui        s7, 7
sub_4_57_0_t:     sub          s10, zero, t5
                  c.sub        a3, a0
                  c.xor        s1, a4
                  sra          s4, s6, s10
                  sltiu        t4, s5, 1808
                  lui          s1, 547811
                  c.xor        s1, a2
                  addi         t2, t2, -1 #update loop 0 counter
                  mulh         s3, s5, a3
                  bge          t2, t6, sub_4_57_0_t #branch for loop 0
                  c.beqz       a5, sub_4_57_1_t #branch for loop 1
                  sltu         s0, s4, s4
                  la           sp, region_1+861 #start riscv_hazard_instr_stream_7
                  lb           a6, 31(sp)
                  sh           s1, 37(sp)
                  sb           a2, 4(sp)
                  c.srai       a2, 3
                  lbu          s11, -32(sp)
                  sb           s11, 30(sp)
                  lhu          a6, -9(sp)
                  add          s1, a2, a2
                  auipc        a6, 168773
                  lbu          s1, -18(sp)
                  sb           s11, 36(sp)
                  lb           zero, 21(sp)
                  sh           zero, 5(sp)
                  srai         zero, a2, 24
                  c.andi       s1, 28
                  lb           s11, -57(sp)
                  sb           a6, -24(sp)
                  c.xor        s1, a2
                  rem          a2, a2, s1
                  lbu          a6, -12(sp)
                  lbu          s4, 14(sp)
                  srl          zero, s11, s1
                  srli         a6, s4, 8
                  remu         a2, s1, s11
                  sltu         s4, a6, a2
                  slt          s11, a6, s4
                  lbu          a6, -56(sp)
                  rem          s4, s11, a2
                  lb           zero, -45(sp)
                  slli         a6, s1, 16
                  lb           a2, 24(sp)
                  or           a6, s4, a6
                  sb           s11, -42(sp)
                  lh           s4, -59(sp)
                  lbu          zero, 61(sp)
                  sb           s11, 41(sp)
                  sb           s1, 30(sp)
                  lb           zero, 25(sp) #end riscv_hazard_instr_stream_7
                  la           a2, region_0+477 #start load_store_instr_stream_3
                  la           s9, region_0+283 #start load_store_instr_stream_2
                  lb           a6, -11(s9)
                  la           s4, region_0+567 #start load_store_instr_stream_1
                  la           s8, region_0+1173 #start load_store_instr_stream_0
                  lb           a1, -20(s4)
                  lb           zero, 26(s8)
                  lb           s3, 44(s4)
                  sb           t5, -53(s8)
                  sb           a7, -14(s9)
                  sb           ra, 123(s4)
                  lbu          t1, 110(a2)
                  lbu          s1, 16(s9)
                  sw           a4, -191(s4)
                  la           s6, region_0+822 #start load_store_instr_stream_4
                  lb           t1, -22(s8)
                  lb           t0, -12(s9)
                  lh           t6, -91(a2)
                  lb           a4, 168(s4)
                  lb           t0, 250(a2)
                  sh           t3, 182(s6)
                  sb           gp, -16(s9)
                  sw           a7, 914(s6)
                  sb           t4, -1(s9)
                  lhu          t5, 253(a2)
                  lbu          s10, 563(s6)
                  lb           s1, 42(s8)
                  lbu          a4, 96(a2)
                  sh           t5, -5(s9)
                  sb           a2, -7(s9)
                  sb           ra, 41(a2)
                  lbu          zero, -199(a2)
                  lb           ra, -199(s4)
                  lbu          ra, 433(s6)
                  sb           a2, 14(s9)
                  lb           a1, 144(a2)
                  lbu          s3, 315(s6)
                  lbu          sp, -202(a2)
                  sb           ra, 14(a2) #end load_store_instr_stream_3
                  lb           s1, -163(s4)
                  lb           t6, -8(s9) #end load_store_instr_stream_2
                  sh           s9, -792(s6) #end load_store_instr_stream_4
                  lhu          a4, 115(s4) #end load_store_instr_stream_1
                  lbu          s7, -4(s8) #end load_store_instr_stream_0
                  la           a6, region_1+784 #start load_store_instr_stream_3
                  la           s10, region_1+1454 #start load_store_instr_stream_1
                  la           ra, region_1+127 #start load_store_instr_stream_2
                  lb           zero, 4(s10)
                  lhu          zero, 324(a6)
                  la           gp, region_1+633 #start load_store_instr_stream_0
                  sb           zero, 1(s10)
                  sh           s1, 0(s10)
                  lbu          s4, -525(a6)
                  sb           s11, 1423(ra)
                  lbu          s1, -535(a6)
                  sb           s7, 10(s10)
                  lh           s9, -734(a6)
                  sb           tp, -11(gp)
                  lb           s7, -11(s10)
                  sh           sp, 4(s10)
                  sb           s4, 1(s10)
                  lbu          s11, 370(ra)
                  sb           s5, 1180(ra)
                  lbu          s0, -613(a6)
                  lb           s11, 1090(ra)
                  lh           a0, -1(gp)
                  sb           t4, 1331(ra)
                  sw           s9, 893(ra)
                  lb           a1, -3(s10)
                  sb           t6, 925(a6)
                  sb           s0, 1648(ra)
                  sb           s5, 1(s10)
                  lb           t4, 914(ra)
                  lhu          t1, -12(s10) #end load_store_instr_stream_1
                  lhu          a5, 1084(a6)
                  lbu          t6, 15(gp)
                  lhu          s3, -430(a6) #end load_store_instr_stream_3
                  lw           s7, 7(gp)
                  lb           a2, 1154(ra) #end load_store_instr_stream_2
                  lb           t1, 16(gp) #end load_store_instr_stream_0
                  la           t0, region_0+1396 #start riscv_load_store_hazard_instr_stream_0
                  lb           s8, 17(t0)
                  c.mv         t1, gp
                  lb           sp, 17(t0)
                  sb           s5, 17(t0)
                  lb           zero, 17(t0)
                  lbu          s3, 17(t0)
                  lbu          t4, 17(t0)
                  lbu          a5, 17(t0)
                  srli         a4, s11, 18
                  lb           sp, 17(t0)
                  lbu          s11, 17(t0)
                  sb           s5, 17(t0)
                  sb           t4, 17(t0)
                  c.addi4spn   s0, sp, 448
                  sb           a1, 17(t0)
                  sb           t4, 17(t0)
                  sb           s9, 17(t0)
                  sb           a5, 17(t0)
                  lb           t4, 17(t0) #end riscv_load_store_hazard_instr_stream_0
                  la           s10, amo_0+48 #start riscv_amo_instr_stream_6
                  amomaxu.w.aq  a3, s6, (s10)
                  amomaxu.w     s1, s0, (s10) #end riscv_amo_instr_stream_6
                  addi         a1, zero, -7 #init loop 0 counter
                  mulh         t6, a0, a0
                  sltu         a4, a5, zero
                  addi         s3, t2, 965
                  c.li         s11, -1
                  addi         a0, zero, -19 #init loop 0 limit
                  slti         s1, s2, 629
                  mulh         s8, a3, a3
                  c.and        a4, a0
                  slli         ra, s10, 7
                  srai         s7, zero, 25
                  and          a6, a3, zero
                  c.mv         ra, s7
                  c.addi       a4, 3
                  c.addi4spn   a3, sp, 960
sub_4_59_0_t:     div          t5, s9, a2
                  c.add        a3, t0
                  c.addi16sp   sp, -16
                  add          t3, a5, t3
                  addi         a1, a1, -1 #update loop 0 counter
                  mulhsu       a2, s6, gp
                  c.add        s1, sp
                  sra          s11, a4, t6
                  mulhsu       gp, s3, t6
                  slt          s10, a6, s11
                  c.sub        a3, a2
                  sub          t0, tp, zero
                  bge          a1, a0, sub_4_59_0_t #branch for loop 0
                  c.andi       a2, 11
                  la           sp, amo_0+0 #start riscv_lr_sc_instr_stream_2
                  c.srai       a2, 28
                  sll          t2, a1, s10
                  c.or         a2, a5
                  sltu         gp, sp, s11
                  srai         s3, s1, 0
                  sll          t4, a6, a6
                  slli         s7, s10, 16
                  c.addi       a1, -1
                  sub          a4, a6, s7
                  lr.w.aq       s8, (sp)
                  sltiu        a2, a4, 1944
                  sra          a4, zero, t1
                  c.lui        s8, 5
                  c.nop
                  sll          a0, sp, s2
                  sc.w.aq       s8, a5, (sp) #end riscv_lr_sc_instr_stream_2
                  la           t3, amo_0+48 #start riscv_amo_instr_stream_2
                  amoand.w.rl   s10, a7, (t3) #end riscv_amo_instr_stream_2
                  la           s7, region_1+425 #start riscv_load_store_rand_instr_stream_5
                  c.slli       sp, 23
                  c.andi       a5, -1
                  sw           s3, -381(s7)
                  sw           t5, 1111(s7)
                  c.addi4spn   a5, sp, 576
                  sw           t4, 107(s7)
                  srli         t3, sp, 20
                  or           a3, t0, s6
                  sb           t5, 759(s7)
                  andi         a4, zero, -1082
                  sltu         a6, sp, ra
                  mulh         t5, s1, s2
                  lb           s1, 342(s7)
                  divu         s8, a6, t0
                  c.lui        s0, 23
                  c.and        a2, a0
                  sll          s0, a0, a6
                  lb           t4, 1432(s7)
                  srl          a6, a1, s4
                  mulhsu       a2, a1, s2
                  lb           t1, 354(s7)
                  div          a4, t2, zero
                  mulhu        gp, t4, a0
                  c.addi16sp   sp, -16
                  sltiu        t1, s8, -117
                  lb           s10, 1446(s7)
                  lbu          tp, 275(s7)
                  mulh         ra, s10, zero
                  lhu          s6, 1299(s7)
                  c.and        a1, a4
                  c.sub        a5, a3
                  slti         zero, zero, -712
                  c.andi       a5, -1
                  sb           s11, 130(s7) #end riscv_load_store_rand_instr_stream_5
                  la           s1, region_0+1373 #start riscv_hazard_instr_stream_4
                  sb           s11, 7(s1)
                  c.srli       a5, 18
                  sb           a6, -14(s1)
                  sltu         s0, s7, s11
                  c.li         s0, 8
                  c.nop
                  lb           a5, 8(s1)
                  slt          a5, s11, s0
                  lw           s9, 15(s1)
                  c.add        a5, s7
                  sb           s9, -14(s1)
                  lbu          s9, 11(s1)
                  lui          s7, 1040323
                  lbu          s11, 16(s1)
                  sll          a5, s7, s7
                  slti         a6, a6, 17
                  slt          s0, s9, s11
                  c.add        s9, a6
                  lbu          a6, 11(s1)
                  lbu          a5, -10(s1)
                  lhu          s11, 3(s1)
                  sh           s7, -7(s1)
                  sb           a6, 13(s1)
                  lb           s7, 6(s1)
                  c.addi       s11, 4
                  or           s0, s9, a6
                  srai         a5, s11, 28
                  sb           a5, -6(s1)
                  sb           s7, -16(s1)
                  lh           s9, 1(s1)
                  div          a5, s11, a6
                  lhu          s9, -7(s1)
                  mulhu        s7, s0, a5
                  c.xor        a5, a5
                  lbu          a6, -16(s1)
                  c.srai       a5, 10
                  xor          s7, a6, a6
                  addi         s11, a5, 667
                  sb           a6, -16(s1)
                  sb           s11, 4(s1)
                  c.lui        a6, 6
                  sra          s0, s11, s7
                  mul          a6, a6, a6
                  slt          a6, s0, s0
                  mulh         s0, a6, s0
                  lh           a5, -7(s1)
                  c.and        a5, a5
                  c.nop
                  lw           s7, 7(s1)
                  sra          s7, s7, s9
                  divu         s9, s9, s0
                  lbu          s0, 12(s1) #end riscv_hazard_instr_stream_4
                  la           a3, region_0+895 #start riscv_load_store_rand_instr_stream_8
                  lb           tp, -146(a3)
                  sh           s3, -393(a3)
                  sb           s2, 556(a3)
                  c.li         s4, -1
                  andi         t2, s2, 1764
                  and          ra, s0, tp
                  sb           a7, -40(a3)
                  sb           t5, 517(a3)
                  lhu          t3, -63(a3)
                  divu         s9, s3, a1
                  sh           t4, -669(a3)
                  sb           t1, -90(a3)
                  srli         s7, s10, 13
                  srai         t4, s11, 28
                  lbu          ra, -449(a3)
                  c.nop
                  sll          s7, s9, t3
                  andi         t6, s11, -1421
                  sh           a7, 261(a3)
                  nop
                  lbu          t2, 1012(a3)
                  c.lui        a1, 7
                  c.andi       a4, -1
                  sb           s3, 752(a3) #end riscv_load_store_rand_instr_stream_8
sub_4_23:         jal          ra, 21f
0:                c.jal        17f
1:                jal          ra, 19f
2:                jal          a1, 4f
3:                jal          gp, 16f
4:                jal          ra, 8f
5:                c.j          6f
6:                c.j          14f
7:                jal          s11, 20f
8:                c.j          15f
9:                c.jal        7b
10:               c.j          12f
11:               c.j          25f
12:               c.jal        22f
13:               c.j          9b
14:               c.j          3b
15:               c.jal        10b
16:               jal          t1, 18f
17:               c.j          13b
18:               jal          ra, 1b
19:               c.j          11b
20:               jal          t1, 5b
21:               jal          ra, 2b
22:               c.jal        23f
23:               jal          a1, 24f
24:               c.jal        0b
25:               c.addi4spn   s0, sp, 528
                  la           t1, region_0+1878 #start load_store_instr_stream_1
                  la           a5, region_1+742 #start load_store_instr_stream_0
                  lh           s6, -16(t1)
                  lb           s6, -157(a5)
                  lb           s10, 229(a5)
                  lw           a1, 6(t1)
                  sb           a5, -147(a5)
                  lbu          s0, -11(t1)
                  lb           t5, 10(t1)
                  lbu          zero, -157(a5)
                  lb           s0, -12(t1)
                  lbu          t3, 13(t1)
                  lbu          t3, 5(t1) #end load_store_instr_stream_1
                  lb           s11, 103(a5)
                  lbu          s9, 98(a5) #end load_store_instr_stream_0
                  la           t3, region_1+921 #start load_store_instr_stream_1
                  lh           a0, 13(t3)
                  la           t6, region_0+1476 #start load_store_instr_stream_0
                  sh           a6, -5(t3)
                  lbu          a1, 6(t3)
                  sb           tp, -2(t3)
                  lhu          s9, -62(t6)
                  lbu          a6, -11(t3)
                  lb           a4, 4(t3)
                  lb           a4, -36(t6)
                  sh           a4, -7(t3)
                  lhu          a5, -34(t6)
                  sh           s2, -7(t3)
                  lh           s0, 4(t6)
                  lw           a0, 32(t6)
                  lw           a5, -1(t3)
                  lbu          a0, 39(t6)
                  sb           s10, 8(t3) #end load_store_instr_stream_1
                  lbu          s4, 64(t6) #end load_store_instr_stream_0
sub_4_20:         jal          ra, 20f
0:                jal          ra, 3f
1:                c.jal        22f
2:                c.jal        10f
3:                c.jal        25f
4:                c.jal        18f
5:                jal          t1, 26f
6:                c.j          17f
7:                c.j          4b
8:                jal          ra, 5b
9:                jal          ra, 13f
10:               c.jal        11f
11:               c.j          15f
12:               jal          tp, 14f
13:               c.jal        2b
14:               jal          ra, 6b
15:               c.jal        8b
16:               c.jal        23f
17:               c.jal        16b
18:               jal          ra, 9b
19:               jal          ra, 12b
20:               c.jal        1b
21:               jal          tp, 19b
22:               c.jal        0b
23:               c.j          24f
24:               jal          ra, 7b
25:               jal          ra, 21b
26:               mulhu        s10, sp, t4
                  la           t1, amo_0+20 #start riscv_lr_sc_instr_stream_3
                  c.and        a4, s1
                  rem          a3, gp, s7
                  srli         s8, s4, 14
                  c.nop
                  mulhsu       tp, s6, sp
                  ori          s7, gp, 1721
                  divu         s8, s10, t4
                  slt          tp, s3, a0
                  div          s0, t6, s10
                  lr.w.rl       t0, (t1)
                  srli         a6, t2, 9
                  mulh         s0, a1, zero
                  sc.w.aq       sp, s1, (t1) #end riscv_lr_sc_instr_stream_3
sub_4_28:         jal          ra, 24f
0:                jal          t2, 18f
1:                c.j          25f
2:                c.j          11f
3:                jal          ra, 10f
4:                c.j          17f
5:                jal          ra, 9f
6:                jal          t1, 2b
7:                c.jal        8f
8:                c.jal        4b
9:                c.j          7b
10:               c.jal        5b
11:               jal          a1, 15f
12:               c.jal        19f
13:               c.jal        16f
14:               c.j          21f
15:               c.j          1b
16:               jal          ra, 22f
17:               jal          sp, 13b
18:               c.j          3b
19:               jal          t1, 0b
20:               jal          ra, 23f
21:               c.jal        6b
22:               c.jal        20b
23:               c.j          14b
24:               c.j          12b
25:               c.and        a3, s1
                  la           t2, region_0+923 #start load_store_instr_stream_0
                  la           t1, region_1+537 #start load_store_instr_stream_1
                  lb           ra, 183(t2)
                  lb           s0, -59(t1)
                  lb           a0, -58(t1)
                  lbu          s7, -37(t1)
                  sb           s6, -14(t1)
                  sw           t0, 93(t2)
                  lh           ra, -61(t1)
                  sw           a5, -25(t1)
                  lb           t6, -18(t2)
                  sb           s0, 130(t2)
                  lhu          s3, -253(t2)
                  sb           s3, 62(t1) #end load_store_instr_stream_1
                  sh           a6, 211(t2)
                  lb           s0, -145(t2) #end load_store_instr_stream_0
                  la           s10, region_0+1592 #start riscv_load_store_hazard_instr_stream_2
                  lbu          a0, 293(s10)
                  xori         t1, t3, -1604
                  lbu          a0, 293(s10)
                  lb           s3, -1141(s10)
                  lb           a3, -1141(s10)
                  lbu          s3, -1141(s10)
                  lbu          s3, 57(s10)
                  sb           a7, -827(s10)
                  srl          t6, s5, a3
                  lb           a4, -827(s10)
                  lb           s4, -827(s10)
                  sb           s2, -827(s10)
                  sb           a5, -827(s10)
                  sb           s0, -827(s10)
                  lbu          s9, -827(s10)
                  sltiu        t3, gp, -1305
                  lb           s7, -827(s10)
                  mulhsu       a0, t3, s4
                  sb           t4, -827(s10)
                  sb           s7, -827(s10)
                  c.addi       gp, -1
                  c.add        t1, s11
                  sb           zero, -827(s10)
                  lb           t3, -827(s10)
                  div          t3, a0, tp
                  lbu          s9, -827(s10) #end riscv_load_store_hazard_instr_stream_2
                  la           s6, region_1+1653 #start load_store_instr_stream_4
                  la           t5, region_1+957 #start load_store_instr_stream_3
                  la           sp, region_1+363 #start load_store_instr_stream_1
                  la           ra, region_1+834 #start load_store_instr_stream_2
                  sh           s2, 11(s6)
                  sb           s0, 150(sp)
                  la           t3, region_1+727 #start load_store_instr_stream_0
                  lw           s9, -1(t5)
                  lb           t1, 9(t3)
                  lbu          s9, 46(s6)
                  lb           t1, 42(s6)
                  sb           a4, 65(ra)
                  lbu          t2, 181(ra)
                  lbu          a4, 219(sp)
                  lh           a0, -226(ra)
                  lhu          a5, -13(t5)
                  lbu          t4, -10(t3)
                  sh           s6, -1(t3)
                  lbu          gp, 2(t5)
                  sb           gp, -48(s6)
                  lb           s1, -246(ra)
                  sb           a0, 1358(sp)
                  lb           a5, 59(s6)
                  lw           t4, -5(s6)
                  sb           s3, 6(t3)
                  sb           a4, 1528(sp)
                  lh           s0, -46(ra)
                  lhu          s1, 13(t3)
                  lbu          a2, 1131(sp) #end load_store_instr_stream_1
                  sh           ra, 118(ra) #end load_store_instr_stream_2
                  lhu          t1, -7(t3)
                  lbu          gp, 10(t5)
                  lbu          t0, -36(s6)
                  lh           s11, 9(t3)
                  lb           a4, 20(s6)
                  lb           t2, -7(t5) #end load_store_instr_stream_3
                  lw           s11, 5(t3)
                  sb           s3, 40(s6)
                  lw           s10, -7(t3)
                  lb           s4, -14(s6) #end load_store_instr_stream_4
                  lb           s11, -6(t3) #end load_store_instr_stream_0
                  la           a0, region_0+1099 #start load_store_instr_stream_3
                  la           tp, region_0+1614 #start load_store_instr_stream_1
                  la           t4, region_0+1080 #start load_store_instr_stream_2
                  lh           t0, 18(tp)
                  lbu          t0, -186(a0)
                  lbu          t0, 52(tp)
                  la           s6, region_0+741 #start load_store_instr_stream_4
                  la           s0, region_0+1073 #start load_store_instr_stream_0
                  sh           s11, -41(a0)
                  lbu          a1, -51(t4)
                  lb           s7, 48(s6)
                  lbu          s1, 45(tp)
                  sb           s7, 23(t4)
                  lbu          a2, 106(s0)
                  lb           a2, -58(t4)
                  lbu          zero, 3(tp)
                  lb           t0, 32(s6)
                  lw           t1, -43(a0)
                  lb           t0, 23(tp)
                  lb           gp, 14(a0)
                  sb           s5, 33(tp)
                  lbu          t5, -8(s6)
                  lh           t2, 54(t4)
                  lw           s4, 251(s0)
                  lbu          ra, 42(a0)
                  lhu          s10, -10(tp)
                  lbu          a1, -10(s0)
                  lbu          s8, -49(t4)
                  lbu          sp, -34(s6)
                  sw           t4, 6(tp)
                  lb           ra, -220(s0)
                  lbu          s9, 9(tp)
                  lbu          t0, 112(a0)
                  lh           gp, 54(tp) #end load_store_instr_stream_1
                  sb           ra, -58(a0) #end load_store_instr_stream_3
                  lb           t5, 7(t4)
                  sw           s9, 36(t4) #end load_store_instr_stream_2
                  lb           a1, 25(s6) #end load_store_instr_stream_4
                  lbu          sp, 228(s0) #end load_store_instr_stream_0
                  la           t1, amo_0+28 #start riscv_amo_instr_stream_0
                  la           t5, amo_0+28
                  amomaxu.w     a1, s3, (t5)
                  amoxor.w.rl   s8, a2, (t1)
                  amoswap.w.aq  a0, s0, (t1)
                  amoor.w.rl    s0, s3, (t1)
                  amomin.w.aq   s9, a6, (t1)
                  c.srli       a4, 22
                  rem          s3, a2, s9
                  amominu.w     s0, sp, (t5) #end riscv_amo_instr_stream_0
                  la           s9, region_0+1342 #start riscv_load_store_rand_instr_stream_0
                  sra          s1, s5, a0
                  lb           ra, 9(s9)
                  sb           t4, -6(s9)
                  lw           a2, 2(s9)
                  addi         t0, a4, 595
                  lb           t1, -5(s9)
                  lb           s7, 10(s9)
                  lhu          ra, -2(s9)
                  remu         a1, s4, t1
                  lb           s1, 1(s9)
                  remu         zero, s8, s11
                  lbu          s6, -1(s9)
                  sll          t4, t5, s7
                  lb           a6, 10(s9)
                  c.slli       s11, 25
                  ori          t5, a0, -402
                  lb           t0, -4(s9)
                  lb           s3, 3(s9)
                  c.addi       a5, 27
                  srli         s1, t0, 1
                  lh           s10, 2(s9)
                  c.nop
                  andi         s3, a7, -1147
                  sb           tp, -9(s9)
                  slli         a1, a5, 6
                  add          t2, t4, a4
                  lbu          a6, -5(s9)
                  xori         s1, s8, -1067
                  slti         t6, s4, -658
                  c.srli       a2, 9
                  lb           t1, 6(s9)
                  lbu          s4, 7(s9)
                  srai         t3, s11, 23
                  lbu          s7, 1(s9)
                  lb           s10, 10(s9)
                  sub          a1, a2, s5
                  divu         t5, s11, tp
                  c.xor        a0, a1
                  lbu          s10, 9(s9)
                  lb           s8, 2(s9)
                  sh           s9, 0(s9)
                  sb           s3, -15(s9)
                  lb           a6, 15(s9)
                  sb           a3, -1(s9)
                  lhu          s1, 12(s9)
                  c.addi       a0, -1
                  c.nop
                  sw           zero, -2(s9)
                  sb           s6, 11(s9)
                  rem          t1, t2, ra
                  mulhu        s1, s11, a0
                  lhu          ra, -12(s9) #end riscv_load_store_rand_instr_stream_0
                  la           t2, region_1+1550 #start riscv_load_store_rand_instr_stream_2
                  srai         t5, s1, 10
                  lb           t4, 439(t2)
                  sb           s7, 334(t2)
                  lh           t3, -660(t2)
                  c.mv         a1, t0
                  srli         t3, s10, 14
                  lbu          a3, 67(t2)
                  sh           a4, 346(t2)
                  lhu          s9, -1424(t2)
                  mul          s8, sp, a0
                  sb           a2, -173(t2)
                  sb           s11, 64(t2)
                  lb           t1, -604(t2)
                  c.sub        s1, a0
                  mulhu        s9, s2, s6
                  lb           s1, -1439(t2)
                  lhu          a0, -306(t2)
                  lbu          zero, 0(t2)
                  c.and        a1, a3
                  c.and        a2, s0
                  c.add        ra, s2
                  sb           s4, -586(t2)
                  sb           s8, -1264(t2)
                  auipc        s3, 12657
                  lb           t1, 257(t2)
                  mulh         s10, t3, a4
                  lbu          s4, -333(t2)
                  mulhsu       s7, s8, s4
                  c.nop
                  lbu          a0, -1475(t2)
                  lbu          s11, -692(t2)
                  sra          a3, t6, s4
                  lbu          a3, -3(t2)
                  sb           s6, -713(t2)
                  lb           gp, -1277(t2)
                  lb           a4, -877(t2)
                  lhu          t5, -966(t2)
                  mulhu        gp, s2, s5
                  slti         s11, gp, 166
                  lb           t3, -721(t2)
                  lhu          tp, -4(t2)
                  sb           s7, -526(t2)
                  c.addi16sp   sp, 96
                  lb           s0, -455(t2) #end riscv_load_store_rand_instr_stream_2
                  la           sp, amo_0+52 #start riscv_amo_instr_stream_7
                  la           s0, amo_0+48
                  la           t3, amo_0+0
                  la           s8, amo_0+28
                  amomax.w.aq   t1, s6, (s8)
                  amomax.w.aq   zero, a5, (sp)
                  c.addi       t2, -1
                  amoand.w.rl   s10, a6, (s0)
                  amoor.w.aq    s9, s9, (s8)
                  mul          t4, a4, s9
                  amoadd.w      zero, tp, (sp)
                  amoand.w      a6, s3, (t3)
                  amoadd.w      t6, t4, (t3)
                  c.li         a0, 15
                  srl          s10, s0, a5
                  amomin.w.rl   s1, a0, (sp)
                  amoadd.w      a1, t3, (t3)
                  c.and        a5, a1
                  mulh         t5, tp, s8
                  amoor.w.rl    t1, t1, (s0) #end riscv_amo_instr_stream_7
                  la           a2, region_0+1842 #start load_store_instr_stream_1
                  lb           s6, -205(a2)
                  lb           a5, -113(a2)
                  lh           a3, -56(a2)
                  la           s10, region_1+1686 #start load_store_instr_stream_0
                  lb           s11, -39(a2)
                  sh           s11, -1178(s10)
                  lbu          ra, -156(a2)
                  lbu          s4, -712(s10)
                  lbu          ra, 26(a2)
                  sb           a5, -36(s10)
                  lbu          t3, 21(a2)
                  lb           s8, -1372(s10)
                  sb           t6, -127(a2)
                  lhu          a6, -416(s10)
                  sb           s2, -94(a2) #end load_store_instr_stream_1
                  lh           a4, -1632(s10) #end load_store_instr_stream_0
                  addi         t3, zero, 4 #init loop 0 counter
                  addi         t5, zero, 7 #init loop 0 limit
sub_4_54_0_t:     sub          a5, s10, a5
                  mul          s7, zero, s4
                  addi         t3, t3, 3 #update loop 0 counter
                  divu         t6, s4, s7
                  beq          t3, t5, sub_4_54_0_t #branch for loop 0
                  mulhsu       gp, a0, t3
                  la           s7, amo_0+20 #start riscv_lr_sc_instr_stream_5
                  addi         a3, ra, -1915
                  sub          sp, a1, t5
                  nop
                  add          s3, s9, s9
                  lr.w.rl       a4, (s7)
                  slt          tp, s0, a6
                  srai         a1, gp, 3
                  mulhu        a1, t5, t3
                  slti         ra, tp, -528
                  slli         t1, s10, 30
                  c.and        a2, a4
                  sc.w.aq       t0, a7, (s7) #end riscv_lr_sc_instr_stream_5
sub_4_25:         jal          ra, 11f
0:                jal          ra, 10f
1:                c.jal        8f
2:                c.j          1b
3:                c.jal        0b
4:                jal          ra, 12f
5:                jal          s3, 2b
6:                jal          ra, 7f
7:                c.jal        3b
8:                jal          t1, 6b
9:                c.jal        5b
10:               c.j          4b
11:               c.jal        9b
12:               mulhu        a5, a7, s10
                  la           s11, region_1+1577 #start riscv_load_store_rand_instr_stream_9
                  c.sub        a2, s0
                  lbu          a5, -770(s11)
                  srai         s3, a5, 7
                  c.slli       s10, 23
                  sw           a5, -793(s11)
                  div          a6, a5, s7
                  lhu          s0, 103(s11)
                  sb           a4, -1290(s11)
                  lbu          a2, -452(s11)
                  lb           ra, -493(s11)
                  auipc        t4, 648213
                  lh           a5, -545(s11)
                  srli         t2, s6, 14
                  lbu          zero, -214(s11)
                  lbu          t3, -1508(s11)
                  addi         s0, a1, -823
                  sll          s3, t0, a2
                  c.srai       a3, 8
                  sb           a7, -1210(s11)
                  mulh         s7, s7, s4
                  sub          t5, s1, a0
                  lb           zero, -1427(s11)
                  sb           a0, -716(s11)
                  lw           a5, -309(s11)
                  sb           s3, -606(s11)
                  c.srli       a4, 17
                  lbu          tp, -920(s11)
                  auipc        s6, 762591
                  lbu          a4, -120(s11)
                  c.li         s8, -1
                  lh           s0, -109(s11)
                  lbu          a4, -789(s11)
                  c.mv         gp, s8
                  c.andi       s1, 3
                  auipc        a3, 615101
                  nop
                  div          t1, s9, a4
                  remu         a5, t3, s8
                  divu         a3, s6, a2
                  sb           t4, -885(s11)
                  c.srli       a4, 7
                  lb           t0, -664(s11)
                  nop
                  lui          a0, 110689
                  sb           s3, -1356(s11)
                  lui          s6, 684060
                  c.li         a1, 26
                  c.addi4spn   a3, sp, 592
                  lhu          t0, -491(s11)
                  lb           tp, -66(s11)
                  mulh         s8, t4, t0
                  lbu          a6, -1111(s11)
                  srai         s3, t6, 0
                  lb           ra, 128(s11)
                  addi         zero, a2, -306
                  sb           a6, -1093(s11)
                  lb           t6, 129(s11)
                  lbu          s1, -58(s11) #end riscv_load_store_rand_instr_stream_9
                  la           s0, region_1+422 #start riscv_load_store_rand_instr_stream_4
                  c.and        s1, a2
                  lbu          t5, -14(s0)
                  c.and        a0, a0
                  or           sp, s9, a5
                  c.srai       a4, 4
                  c.addi4spn   a1, sp, 352
                  div          t1, s3, s10
                  add          tp, s4, s5
                  sb           a7, -4(s0)
                  sb           s1, -8(s0)
                  lbu          s3, -5(s0)
                  lbu          t0, -6(s0)
                  c.or         a2, a5
                  sltiu        t5, t2, -1722
                  or           s3, s1, a7
                  slti         s8, s8, 1073
                  c.lui        s9, 5
                  sll          t4, t4, t2
                  addi         gp, a0, 426
                  lbu          t1, 3(s0)
                  c.addi       a1, -1
                  lhu          s11, -10(s0)
                  div          a2, s11, a1
                  andi         ra, a4, 760
                  srli         t5, a5, 12
                  c.addi16sp   sp, 272
                  c.lui        gp, 12
                  c.mv         s10, s3
                  mulhu        s3, a4, a5
                  lb           s11, 6(s0)
                  sb           t2, 1(s0)
                  sb           gp, -16(s0)
                  sb           s0, 1(s0)
                  lbu          a2, -8(s0) #end riscv_load_store_rand_instr_stream_4
                  la           a2, region_1+1494 #start load_store_instr_stream_0
                  la           t0, region_1+896 #start load_store_instr_stream_2
                  lb           s9, 1(a2)
                  la           tp, region_1+296 #start load_store_instr_stream_1
                  lb           a5, 41(t0)
                  lh           t4, -194(tp)
                  lb           gp, 48(t0)
                  lb           s4, 239(tp)
                  lb           t3, 0(a2)
                  lb           a4, 32(tp)
                  lb           t5, -185(tp)
                  lb           s8, 2(a2)
                  lbu          s11, 243(tp)
                  lb           s10, 47(t0)
                  sb           t5, 15(t0)
                  lb           s11, 16(a2)
                  lh           s6, 46(t0)
                  sb           s0, 86(tp)
                  sh           s11, 40(t0) #end load_store_instr_stream_2
                  sb           a2, -33(tp) #end load_store_instr_stream_1
                  sb           s0, 4(a2)
                  lbu          s8, 5(a2) #end load_store_instr_stream_0
sub_4_27:         jal          ra, 10f
0:                jal          tp, 9f
1:                jal          sp, 15f
2:                c.jal        20f
3:                jal          ra, 13f
4:                jal          t1, 16f
5:                c.jal        17f
6:                jal          ra, 5b
7:                c.j          11f
8:                c.jal        4b
9:                jal          s0, 2b
10:               jal          ra, 8b
11:               c.j          18f
12:               jal          ra, 21f
13:               c.j          22f
14:               c.jal        19f
15:               c.j          23f
16:               c.j          3b
17:               c.jal        1b
18:               c.j          6b
19:               c.j          12b
20:               c.j          14b
21:               c.jal        7b
22:               jal          gp, 0b
23:               add          t1, t3, a0
                  la           s7, region_1+519 #start riscv_load_store_rand_instr_stream_3
                  auipc        t1, 851422
                  sltu         t2, a5, s11
                  c.or         a0, s0
                  xor          t5, t6, s11
                  nop
                  mulhsu       t4, s5, s0
                  c.srli       a4, 8
                  lui          s0, 953250
                  xor          s0, s2, a7
                  slt          sp, t0, s6
                  srl          a2, s6, s5
                  lbu          s0, 42(s7)
                  c.and        a3, a4
                  lhu          tp, -39(s7)
                  c.srai       a3, 31
                  sb           s1, -53(s7)
                  lw           a1, 17(s7)
                  lh           t6, -29(s7)
                  lb           t5, -11(s7)
                  c.srli       a0, 1
                  xor          zero, t2, s5
                  lb           a4, -45(s7)
                  sb           a3, -26(s7)
                  c.slli       t1, 17
                  sb           s1, -28(s7)
                  lhu          s8, -1(s7)
                  lbu          t6, 30(s7)
                  lhu          a1, -53(s7)
                  mulhsu       t6, t0, a0
                  sb           t2, -61(s7) #end riscv_load_store_rand_instr_stream_3
                  la           gp, region_0+1542 #start load_store_instr_stream_1
                  la           s3, region_0+77 #start load_store_instr_stream_3
                  lbu          s6, 1044(s3)
                  la           t6, region_0+85 #start load_store_instr_stream_2
                  lbu          a4, -665(gp)
                  sb           t4, 192(t6)
                  lbu          t0, -5(gp)
                  la           a1, region_0+407 #start load_store_instr_stream_0
                  sb           t1, 41(s3)
                  lbu          s1, -104(gp)
                  lbu          s10, -1418(gp)
                  lh           s4, -23(a1)
                  sw           s8, 43(t6)
                  lbu          s7, -36(a1)
                  lbu          zero, 1719(s3)
                  lb           t0, 359(gp)
                  lb           t2, 1646(s3)
                  lh           tp, 1487(s3)
                  sb           t3, 215(t6)
                  sb           t6, 6(a1)
                  lhu          s6, 1525(t6)
                  lhu          a0, -674(gp)
                  lhu          s4, 717(t6)
                  sh           a0, 13(a1)
                  lb           t1, 539(s3) #end load_store_instr_stream_3
                  lb           t1, 121(gp) #end load_store_instr_stream_1
                  lh           t0, 89(t6) #end load_store_instr_stream_2
                  lhu          s4, -35(a1) #end load_store_instr_stream_0
                  la           tp, region_0+698 #start load_store_instr_stream_1
                  sh           t0, -32(tp)
                  la           t5, region_1+711 #start load_store_instr_stream_0
                  lbu          t4, -33(tp)
                  lbu          ra, 7(t5)
                  lbu          s10, -55(tp)
                  lb           s6, 52(t5)
                  lb           a1, -24(t5)
                  lb           s7, -59(tp)
                  sb           zero, 9(tp)
                  lbu          t3, -3(tp)
                  lh           s3, -12(tp)
                  sb           t1, -16(tp)
                  lb           s7, -10(t5)
                  sb           s2, 62(t5)
                  lh           t0, 52(tp) #end load_store_instr_stream_1
                  lhu          s6, 43(t5) #end load_store_instr_stream_0
                  la           t6, region_1+1357 #start load_store_instr_stream_1
                  sb           s0, -63(t6)
                  la           a1, region_0+1658 #start load_store_instr_stream_0
                  lb           t3, -7(a1)
                  lbu          sp, 10(a1)
                  lh           a4, -8(a1)
                  lb           zero, 7(a1)
                  lb           t0, -9(a1)
                  lb           tp, -44(t6)
                  lbu          a2, -42(t6)
                  sb           s6, -3(a1)
                  lhu          zero, 16(a1)
                  sb           s1, -19(t6)
                  sw           zero, 31(t6)
                  lb           sp, -11(a1)
                  lh           t3, 33(t6)
                  lhu          tp, -17(t6) #end load_store_instr_stream_1
                  sb           t6, -1(a1) #end load_store_instr_stream_0
                  la           a3, region_1+213 #start riscv_hazard_instr_stream_8
                  lh           a2, 13(a3)
                  c.andi       a0, 20
                  xor          a1, a0, a1
                  and          a0, ra, ra
                  ori          a6, ra, 1895
                  auipc        a1, 698711
                  lbu          a6, 10(a3)
                  lb           a1, 0(a3)
                  srl          a6, ra, ra
                  c.or         a2, a2
                  lbu          t3, -12(a3)
                  lb           a0, 11(a3)
                  c.addi       ra, 1
                  lb           a0, 9(a3)
                  mulhu        a2, a2, a2
                  lh           ra, 3(a3)
                  nop
                  sh           a6, 15(a3)
                  c.xor        a2, a0
                  sub          a1, t3, a6
                  divu         t3, a2, a2
                  mulh         a2, t3, a6
                  lbu          a2, -10(a3)
                  sb           ra, 6(a3)
                  lhu          ra, -9(a3)
                  lh           a0, -3(a3)
                  addi         a0, t3, -1060
                  lui          a6, 889253
                  srli         a0, a0, 11
                  sb           a2, -7(a3)
                  ori          ra, a2, -784
                  add          a1, a2, a1
                  lhu          ra, -3(a3)
                  sh           a1, -5(a3) #end riscv_hazard_instr_stream_8
                  la           s6, region_0+541 #start load_store_instr_stream_1
                  lh           s9, 1(s6)
                  la           a4, region_1+1875 #start load_store_instr_stream_0
                  lbu          a2, 6(s6)
                  lbu          a3, 58(a4)
                  lb           tp, 6(s6)
                  lbu          a1, -38(a4)
                  sb           tp, 4(s6)
                  lb           gp, 54(a4)
                  lb           t3, 12(s6)
                  sb           a1, 39(a4)
                  lbu          t5, -2(s6)
                  sb           a7, -1(a4)
                  lb           s3, -6(s6)
                  lhu          s1, -35(a4)
                  lhu          sp, 13(s6)
                  lhu          s10, 11(s6) #end load_store_instr_stream_1
                  sh           s4, -45(a4) #end load_store_instr_stream_0
                  la           sp, region_0+806 #start riscv_load_store_hazard_instr_stream_5
                  sub          a5, s9, s2
                  lbu          t2, 34(sp)
                  lh           t2, 34(sp)
                  lhu          a5, -122(sp)
                  c.lui        t0, 3
                  lhu          s8, -166(sp)
                  lh           s8, -166(sp)
                  lb           zero, -55(sp)
                  sb           a4, -55(sp)
                  lbu          s3, -161(sp)
                  c.add        t3, t1
                  sb           sp, -23(sp)
                  sb           a1, -23(sp)
                  lh           s7, 110(sp)
                  lhu          s6, 110(sp)
                  lbu          s9, 149(sp)
                  lb           t2, 149(sp)
                  sb           s10, 251(sp)
                  lb           s11, 251(sp) #end riscv_load_store_hazard_instr_stream_5
                  la           s11, amo_0+28 #start riscv_amo_instr_stream_5
                  amomaxu.w.rl  t0, a6, (s11)
                  amoand.w      t3, s10, (s11)
                  amomax.w.aq   zero, t2, (s11)
                  amomin.w      zero, t3, (s11)
                  amoand.w.rl   a6, s2, (s11)
                  c.mv         s7, s9
                  amomax.w.rl   t4, gp, (s11)
                  amomaxu.w.rl  t0, s2, (s11) #end riscv_amo_instr_stream_5
                  la           sp, region_0+1624 #start riscv_hazard_instr_stream_0
                  lb           zero, 233(sp)
                  lw           a2, -44(sp)
                  c.li         a6, -1
                  lhu          s10, 202(sp)
                  lb           a4, -91(sp)
                  c.srli       a4, 15
                  lh           a2, 178(sp)
                  c.lwsp       s0, 112(sp)
                  c.andi       s0, -1
                  sb           a6, -26(sp)
                  sb           a4, -156(sp)
                  sb           s0, 171(sp)
                  lbu          s0, -16(sp)
                  lb           a6, -225(sp)
                  lb           s10, 203(sp)
                  sra          s0, s10, a6
                  sb           a2, -143(sp)
                  lbu          a6, -189(sp)
                  c.nop
                  lbu          a2, -147(sp)
                  lbu          a6, 25(sp)
                  sub          a6, s10, s0
                  lbu          a2, 119(sp)
                  c.or         s0, s0
                  sb           a2, -39(sp)
                  sh           a4, 158(sp)
                  mulhsu       a4, s0, zero
                  sub          zero, a2, a6
                  xor          zero, a4, s10
                  c.lwsp       a6, 100(sp)
                  lhu          a2, -154(sp)
                  sb           a2, 103(sp)
                  sb           a2, -251(sp) #end riscv_hazard_instr_stream_0
                  addi         a1, zero, 7 #init loop 0 counter
                  slt          t3, a1, s3
                  c.srli       a2, 3
                  mulhsu       s8, s0, s3
                  slt          tp, s3, t0
                  addi         zero, zero, 0 #init loop 0 limit
                  xor          tp, a3, t4
                  mulhu        t2, s0, s5
                  xori         t2, a5, -212
sub_4_58_0_t:     mul          t6, a0, s11
                  andi         t3, s10, 1214
                  addi         a1, a1, -7 #update loop 0 counter
                  srli         s7, gp, 31
                  nop
                  or           s9, ra, s3
                  slt          t1, a3, s7
                  sltiu        gp, t5, -1609
                  sub          s10, a0, zero
                  sub          t5, t0, a0
                  c.add        t4, s3
                  c.lui        s4, 2
                  c.bnez       a1, sub_4_58_0_t #branch for loop 0
                  c.or         a0, a0
sub_4_19:         jal          ra, 10f
0:                c.j          17f
1:                jal          ra, 26f
2:                c.jal        18f
3:                jal          tp, 19f
4:                jal          a5, 16f
5:                c.jal        23f
6:                c.jal        1b
7:                jal          t6, 15f
8:                c.jal        11f
9:                c.jal        6b
10:               jal          t1, 8b
11:               jal          ra, 12f
12:               jal          ra, 4b
13:               c.j          14f
14:               c.j          25f
15:               jal          t1, 24f
16:               jal          ra, 22f
17:               c.jal        3b
18:               jal          ra, 7b
19:               c.j          2b
20:               jal          ra, 9b
21:               c.j          13b
22:               jal          ra, 21b
23:               c.j          20b
24:               c.j          5b
25:               c.j          0b
26:               auipc        s7, 149613
                  la           ra, region_0+1816 #start load_store_instr_stream_0
                  la           t4, region_0+172 #start load_store_instr_stream_2
                  la           t3, region_0+1499 #start load_store_instr_stream_1
                  lb           a1, -55(ra)
                  sb           tp, 51(t4)
                  lb           s4, -169(t4)
                  sw           zero, 64(ra)
                  sw           s1, 20(ra)
                  lbu          s1, -162(t4)
                  lh           t6, -23(t3)
                  sb           s10, -41(t3)
                  sb           a6, -1(t3)
                  lh           gp, -42(t4)
                  lb           gp, -34(ra)
                  sb           t6, 170(t4)
                  lbu          s7, -22(t3)
                  lbu          s4, 68(t4)
                  sb           a3, -57(ra)
                  lbu          t0, 254(t4)
                  lb           sp, -63(t3)
                  sh           a1, 54(ra)
                  lb           gp, -62(ra)
                  sw           zero, -59(t3) #end load_store_instr_stream_1
                  lb           t5, 37(t4) #end load_store_instr_stream_2
                  lb           s3, -19(ra) #end load_store_instr_stream_0
                  la           s3, region_1+1202 #start riscv_load_store_hazard_instr_stream_3
                  lh           t2, 76(s3)
                  lb           a6, 177(s3)
                  lh           a0, 194(s3)
                  lhu          a4, -230(s3)
                  lw           zero, -230(s3)
                  lb           a6, 17(s3)
                  lbu          s7, 17(s3)
                  xori         tp, gp, -1289
                  auipc        a3, 796707
                  lw           a6, 194(s3)
                  lb           a3, 63(s3)
                  lhu          t5, -92(s3)
                  sh           t4, -212(s3)
                  lbu          s10, -212(s3) #end riscv_load_store_hazard_instr_stream_3
                  la           t5, region_0+758 #start load_store_instr_stream_1
                  la           t3, region_1+1961 #start load_store_instr_stream_0
                  lb           gp, -55(t5)
                  lw           s0, 19(t3)
                  lbu          s1, 25(t5)
                  lbu          tp, -57(t3)
                  sb           a4, -49(t5)
                  lbu          t2, -47(t5)
                  lbu          t1, 32(t3)
                  lb           t0, -63(t5)
                  sb           s0, 31(t3)
                  lb           a3, 21(t5)
                  lb           a1, -54(t3)
                  lb           s10, 16(t3)
                  lbu          a6, 53(t5)
                  sh           s5, -55(t3)
                  sb           s10, -19(t3)
                  lbu          a1, 45(t5) #end load_store_instr_stream_1
                  sh           a0, -9(t3)
                  sb           zero, 17(t3) #end load_store_instr_stream_0
                  la           a2, region_0+1697 #start riscv_hazard_instr_stream_2
                  sra          t5, a4, t5
                  lb           s8, -8(a2)
                  c.andi       a4, 7
                  c.addi       a4, 9
                  lb           t2, -31(a2)
                  sltu         t5, s0, t5
                  slli         a4, s8, 15
                  lbu          a4, 51(a2)
                  c.add        t5, s8
                  sb           zero, -38(a2)
                  mulhu        a4, s0, s0
                  and          t5, zero, t2
                  slti         s0, zero, -351
                  c.slli       s0, 23
                  rem          zero, s8, t2
                  sh           t2, 13(a2)
                  sll          s0, s0, t5
                  c.addi       t5, -1
                  lbu          t5, -47(a2)
                  c.slli       s0, 11
                  div          s0, a4, a4
                  c.nop
                  sb           s8, -35(a2)
                  c.addi       s0, -1
                  lbu          zero, -59(a2)
                  or           s0, s8, s0
                  lbu          s0, -41(a2)
                  rem          a4, s8, s0
                  c.mv         t5, t2
                  sub          t2, t5, s0
                  sw           zero, 39(a2)
                  xori         zero, t2, 1136
                  srl          s0, a4, s0
                  lb           s0, -9(a2)
                  sll          t2, t5, a4
                  lbu          t5, -16(a2)
                  lh           s8, -21(a2)
                  lbu          s0, 32(a2)
                  remu         zero, t5, t2
                  div          a4, s0, t2
                  lw           zero, -61(a2)
                  lb           s0, -56(a2)
                  mulh         a4, a4, s8
                  sh           t2, 49(a2)
                  lb           s8, 50(a2)
                  sb           zero, 33(a2)
                  rem          t5, a4, a4
                  lbu          zero, -32(a2)
                  lhu          t2, -53(a2)
                  sw           s0, 43(a2)
                  c.and        a4, s0
                  lbu          s0, 42(a2) #end riscv_hazard_instr_stream_2
sub_4_22:         jal          ra, 13f
0:                jal          ra, 15f
1:                jal          ra, 0b
2:                c.j          1b
3:                c.j          4f
4:                c.j          17f
5:                jal          ra, 12f
6:                jal          t1, 3b
7:                c.jal        6b
8:                jal          a0, 9f
9:                c.jal        19f
10:               jal          t1, 11f
11:               c.jal        16f
12:               c.jal        2b
13:               c.jal        5b
14:               c.j          18f
15:               c.jal        10b
16:               jal          ra, 7b
17:               jal          ra, 14b
18:               c.jal        8b
19:               c.addi4spn   a2, sp, 704
                  la           s8, amo_0+40 #start riscv_amo_instr_stream_1
                  la           a1, amo_0+24
                  la           s10, amo_0+32
                  la           s0, amo_0+4
                  amomin.w      sp, s8, (a1)
                  amoadd.w.rl   a4, ra, (a1)
                  c.mv         a6, s2
                  slti         gp, a3, -843
                  slli         s4, t0, 2
                  amominu.w     a3, a6, (s8)
                  amoor.w       t5, t1, (a1)
                  c.srai       a4, 2
                  amoxor.w.aq   s11, s9, (s0) #end riscv_amo_instr_stream_1
sub_4_24:         jal          ra, 25f
0:                jal          ra, 14f
1:                c.jal        27f
2:                c.jal        17f
3:                jal          t1, 16f
4:                jal          ra, 20f
5:                jal          ra, 8f
6:                jal          a2, 15f
7:                c.j          18f
8:                c.j          10f
9:                c.jal        7b
10:               c.jal        12f
11:               c.jal        28f
12:               c.jal        11b
13:               c.jal        21f
14:               c.jal        9b
15:               jal          ra, 24f
16:               c.jal        13b
17:               c.j          6b
18:               c.j          5b
19:               c.j          0b
20:               jal          t0, 29f
21:               jal          t1, 2b
22:               c.jal        26f
23:               jal          ra, 4b
24:               c.j          19b
25:               jal          s4, 3b
26:               c.j          1b
27:               jal          ra, 23b
28:               c.jal        22b
29:               auipc        t1, 466922
                  la           s3, amo_0+16 #start riscv_lr_sc_instr_stream_0
                  nop
                  srl          t5, s11, s1
                  ori          s0, a6, 144
                  c.addi4spn   a3, sp, 208
                  lr.w.rl       zero, (s3)
                  rem          s10, s2, a6
                  c.sub        a3, s1
                  mulhsu       tp, s9, s3
                  sc.w.rl       t1, ra, (s3) #end riscv_lr_sc_instr_stream_0
                  la           sp, region_0+1047 #start load_store_instr_stream_1
                  lbu          t0, 806(sp)
                  lbu          a6, 464(sp)
                  la           gp, region_1+1642 #start load_store_instr_stream_0
                  lhu          s1, -1001(sp)
                  lhu          t5, 4(gp)
                  lbu          s3, 266(sp)
                  sb           s9, -528(sp)
                  sb           t1, -5(gp)
                  lb           t2, -182(sp)
                  lbu          a5, -10(sp)
                  sb           t6, -16(gp)
                  sb           a6, 364(sp) #end load_store_instr_stream_1
                  lh           a1, 2(gp)
                  lhu          s1, -16(gp) #end load_store_instr_stream_0
                  la           s11, region_1+1686 #start riscv_load_store_rand_instr_stream_6
                  and          s10, t5, s3
                  sltiu        a0, s6, 1142
                  lb           a1, -279(s11)
                  lbu          t1, -1361(s11)
                  sw           a3, -754(s11)
                  lb           s1, -902(s11)
                  sll          s4, s4, t1
                  xori         tp, gp, -1862
                  c.srli       a5, 7
                  lb           s6, -271(s11)
                  or           s4, a0, tp
                  sb           t3, -1288(s11)
                  srl          a0, a0, tp
                  sb           s3, 194(s11)
                  sra          a5, t1, tp
                  c.andi       s0, -1
                  mulhu        s3, t6, ra
                  lb           ra, -1340(s11)
                  c.sub        a2, a1
                  lb           a3, -213(s11)
                  sb           s8, -817(s11)
                  slt          s0, ra, s8
                  lb           zero, -109(s11)
                  sw           s0, -1022(s11)
                  sb           s10, -1253(s11) #end riscv_load_store_rand_instr_stream_6
                  la           sp, region_1+624 #start riscv_load_store_hazard_instr_stream_1
                  sra          t0, t1, gp
                  sb           a4, -19(sp)
                  lbu          s9, -19(sp)
                  lw           a1, -256(sp)
                  sh           t2, -256(sp)
                  lb           t1, -175(sp)
                  lb           s8, -175(sp)
                  lbu          a5, -50(sp)
                  lh           s3, -50(sp)
                  lb           a3, -29(sp)
                  c.lwsp       s8, 68(sp)
                  lb           t0, 121(sp)
                  lhu          a1, -110(sp)
                  sra          a5, a4, t5
                  sb           s10, 221(sp)
                  lb           s4, 221(sp)
                  lhu          a1, -18(sp)
                  lb           t3, -18(sp)
                  lb           s6, -173(sp) #end riscv_load_store_hazard_instr_stream_1
                  la           t3, region_1+1295 #start riscv_load_store_hazard_instr_stream_9
                  and          a0, s1, t1
                  lbu          t0, -620(t3)
                  sw           t5, -343(t3)
                  lh           a1, -457(t3)
                  sb           t0, -457(t3)
                  sh           tp, 467(t3)
                  c.xor        a3, a2
                  mul          a0, s8, s6
                  lh           a5, 467(t3)
                  lb           s8, 695(t3)
                  lbu          s9, -204(t3)
                  sb           a1, -874(t3)
                  rem          t2, s0, gp
                  lb           a5, -217(t3)
                  sb           t2, -217(t3)
                  lbu          s0, -308(t3)
                  c.li         t0, 7
                  lb           tp, -308(t3)
                  lbu          s7, -308(t3)
                  lb           s0, 438(t3)
                  lh           s3, -1069(t3)
                  mulhsu       a6, t5, a4
                  c.add        t5, s0
                  lb           zero, -180(t3) #end riscv_load_store_hazard_instr_stream_9
                  la           a0, region_0+1565 #start load_store_instr_stream_0
                  la           sp, region_0+3 #start load_store_instr_stream_1
                  la           t6, region_0+348 #start load_store_instr_stream_3
                  lbu          a4, -19(t6)
                  la           ra, region_0+1548 #start load_store_instr_stream_2
                  lh           s6, 247(sp)
                  lbu          s10, 242(sp)
                  sw           t6, -12(t6)
                  lbu          a1, 187(sp)
                  sb           a5, -24(t6)
                  lw           t2, 8(t6)
                  sb           s8, 4(a0)
                  sb           s3, 7(a0)
                  sw           s9, -16(t6)
                  lb           a3, 155(sp)
                  lbu          t5, -24(ra)
                  sb           zero, -1(a0)
                  sb           s2, 61(t6)
                  lh           a3, 162(ra)
                  lbu          s4, 17(t6)
                  lb           a3, 64(t6)
                  sh           s6, 129(sp)
                  sh           tp, 132(ra)
                  sw           t3, 117(sp)
                  lhu          s10, -206(ra)
                  sb           t2, 19(t6)
                  sb           t1, 91(sp) #end load_store_instr_stream_1
                  lb           t4, -5(ra)
                  sw           t3, 120(ra)
                  lbu          t0, -6(a0)
                  lh           s3, 10(t6) #end load_store_instr_stream_3
                  sb           a3, 33(ra) #end load_store_instr_stream_2
                  lb           s10, 15(a0)
                  lb           s8, 1(a0) #end load_store_instr_stream_0
sub_4_21:         jal          ra, 10f
0:                jal          ra, 9f
1:                c.j          17f
2:                c.jal        1b
3:                jal          ra, 2b
4:                c.j          19f
5:                c.j          11f
6:                c.jal        14f
7:                c.j          5b
8:                jal          ra, 6b
9:                jal          ra, 7b
10:               c.jal        15f
11:               c.jal        18f
12:               jal          s11, 8b
13:               jal          ra, 4b
14:               c.j          20f
15:               c.j          16f
16:               jal          t1, 13b
17:               c.j          12b
18:               c.j          3b
19:               jal          ra, 0b
20:               divu         a1, s2, s9
                  la           s1, region_0+204 #start riscv_load_store_hazard_instr_stream_10
                  lh           s8, 162(s1)
                  lb           t4, 162(s1)
                  lhu          a2, 162(s1)
                  lb           t2, 162(s1)
                  mulhsu       s9, s11, tp
                  sb           t1, 162(s1)
                  lh           s10, 162(s1)
                  mulhsu       zero, s9, s11
                  sb           s3, -25(s1)
                  lb           s9, -25(s1)
                  lbu          s9, -25(s1)
                  c.xor        a1, s0
                  c.lui        a3, 29
                  lbu          s3, -25(s1)
                  lhu          s11, -92(s1)
                  lh           a4, -92(s1)
                  lw           s0, -92(s1)
                  sw           zero, -92(s1)
                  lb           a4, -92(s1)
                  lbu          s6, -92(s1) #end riscv_load_store_hazard_instr_stream_10
                  la           sp, region_0+138 #start riscv_load_store_hazard_instr_stream_8
                  lh           a2, 4(sp)
                  lbu          t6, 4(sp)
                  lb           s9, 4(sp)
                  lhu          a0, 4(sp)
                  lbu          a5, 4(sp)
                  sh           s10, 14(sp)
                  or           s11, s6, s3
                  c.andi       a2, 5
                  lw           t2, 14(sp)
                  lbu          gp, 14(sp)
                  lbu          t6, -13(sp)
                  slti         t2, a4, 788
                  c.andi       a4, -1
                  c.add        s6, t2
                  lh           gp, -8(sp)
                  srli         s10, t1, 10
                  sw           a2, -6(sp)
                  slti         t1, s0, 470
                  sw           s5, -6(sp)
                  lb           s11, -6(sp)
                  lhu          a3, -6(sp) #end riscv_load_store_hazard_instr_stream_8
                  la           gp, region_0+1572 #start load_store_instr_stream_1
                  la           s7, region_1+1799 #start load_store_instr_stream_0
                  sb           a4, -255(gp)
                  lbu          t2, -178(gp)
                  lh           a1, -986(gp)
                  lh           zero, 47(s7)
                  lbu          s0, -143(gp)
                  lbu          t2, 148(s7)
                  sb           s6, -1045(gp)
                  lh           s11, -127(s7)
                  lb           s9, -1401(gp)
                  lh           ra, -826(gp)
                  sb           a0, 117(s7)
                  lb           tp, 403(gp)
                  lbu          a0, -207(s7)
                  lb           t3, -78(s7)
                  lbu          a6, 37(gp) #end load_store_instr_stream_1
                  lbu          tp, 145(s7) #end load_store_instr_stream_0
                  la           sp, region_1+796 #start riscv_load_store_rand_instr_stream_10
                  addi         s8, a1, 889
                  sb           s9, -49(sp)
                  ori          t2, s11, 1269
                  lb           t2, 62(sp)
                  c.li         s9, -1
                  andi         s10, s3, 370
                  lb           s6, -55(sp)
                  c.andi       s0, 3
                  mulhu        a0, s0, s10
                  sb           a0, 5(sp)
                  lui          t3, 537802
                  c.lwsp       s0, 48(sp)
                  srl          tp, a1, s4
                  lb           a4, -58(sp)
                  lhu          s0, -24(sp)
                  add          t3, s9, tp
                  sra          t5, s7, s8
                  c.srai       a0, 25
                  remu         s7, tp, s4
                  c.nop
                  srli         a6, t2, 27
                  addi         t6, s0, 44
                  div          a0, s10, t3
                  sltiu        s8, s3, -852
                  lb           a5, 51(sp)
                  c.swsp       s2, 0(sp)
                  sb           a4, -57(sp)
                  c.lwsp       s6, 8(sp)
                  srli         t6, s6, 31
                  mulhsu       t3, zero, s2
                  sh           zero, -4(sp)
                  andi         t4, a6, 1733
                  sra          a0, t4, a4
                  sra          t6, a2, ra
                  mulh         a1, a6, ra
                  sb           s2, 26(sp)
                  lbu          t4, 7(sp)
                  c.add        s1, s9
                  mulhsu       a5, gp, t1
                  c.or         s0, s0
                  sb           s7, -2(sp)
                  sra          a6, t5, a7
                  c.li         s7, 10
                  lhu          s10, -16(sp) #end riscv_load_store_rand_instr_stream_10
sub_4_26:         jal          ra, 9f
0:                c.jal        12f
1:                c.j          6f
2:                jal          ra, 21f
3:                c.j          10f
4:                jal          s3, 8f
5:                jal          s1, 22f
6:                jal          t3, 19f
7:                c.j          14f
8:                c.jal        3b
9:                jal          ra, 2b
10:               c.jal        13f
11:               c.jal        16f
12:               jal          ra, 18f
13:               c.jal        0b
14:               jal          ra, 4b
15:               c.j          20f
16:               c.jal        1b
17:               c.j          15b
18:               c.jal        17b
19:               jal          ra, 5b
20:               c.j          11b
21:               jal          ra, 7b
22:               div          tp, a0, s4
                  addi         a0, zero, -1 #init loop 0 counter
                  c.nop
                  c.li         a6, -1
                  srl          a4, a7, t6
                  addi         t2, zero, 20 #init loop 0 limit
                  c.addi16sp   sp, 384
                  mul          s11, s6, ra
                  c.srai       s1, 11
sub_4_52_0_t:     sub          a1, a3, a6
                  sub          a6, s7, a2
                  divu         a1, t3, t3
                  addi         a0, a0, 7 #update loop 0 counter
                  divu         s6, a0, s7
                  sll          gp, sp, a2
                  c.sub        a1, a4
                  mul          s10, t0, s4
                  c.addi       s11, -1
                  c.or         a2, s1
                  bne          a0, t2, sub_4_52_0_t #branch for loop 0
                  srli         a4, a3, 10
                  la           sp, region_0+1051 #start riscv_load_store_hazard_instr_stream_6
                  srl          a3, sp, a1
                  sb           s6, -56(sp)
                  lb           s6, -598(sp)
                  lh           tp, -639(sp)
                  lbu          s1, -256(sp)
                  c.mv         a0, a1
                  srli         gp, a5, 6
                  sh           tp, 623(sp)
                  c.or         a4, a1
                  sh           t0, 623(sp)
                  lh           s8, 623(sp)
                  xori         a4, s7, -2023
                  lbu          t2, 623(sp)
                  lhu          t0, 623(sp)
                  lhu          ra, 623(sp)
                  lb           a1, 623(sp)
                  lb           a5, 623(sp) #end riscv_load_store_hazard_instr_stream_6
                  addi         s0, zero, 7 #init loop 0 counter
                  mulhsu       s9, t2, zero
                  c.srli       s1, 24
                  xor          gp, t0, a7
                  addi         zero, zero, 0 #init loop 0 limit
                  ori          s3, gp, -85
sub_4_56_0_t:     c.lui        s7, 2
                  addi         s0, s0, -7 #update loop 0 counter
                  sub          a0, s2, a1
                  andi         t3, sp, -1892
                  c.bnez       s0, sub_4_56_0_t #branch for loop 0
                  c.addi       t0, 1
                  la           sp, region_1+333 #start riscv_hazard_instr_stream_5
                  lb           t5, 53(sp)
                  srli         t5, a3, 5
                  lbu          t4, 62(sp)
                  lh           t5, -25(sp)
                  lbu          t4, -58(sp)
                  lbu          t5, -46(sp)
                  add          a6, a3, s9
                  lbu          t5, -22(sp)
                  c.mv         t4, s9
                  lb           a3, -52(sp)
                  sb           a4, 56(sp)
                  addi         t5, t4, 401
                  sra          a3, a3, a6
                  and          t5, a3, t4
                  sltu         a3, s9, a3
                  lbu          t5, 52(sp)
                  lbu          a4, -26(sp)
                  sltu         a6, a6, t4
                  lbu          a6, 52(sp)
                  c.and        a3, a4
                  auipc        s9, 827111
                  sb           t5, 56(sp)
                  lh           a4, -57(sp)
                  sb           a4, 59(sp)
                  sb           t5, -49(sp)
                  sb           t4, -62(sp)
                  c.sub        a3, a3
                  sb           t5, -8(sp)
                  c.srai       a3, 5
                  lbu          a3, -8(sp)
                  sh           t4, 49(sp)
                  divu         s9, t5, a4
                  lb           t4, -2(sp)
                  sub          a4, t5, t4
                  sb           a4, 0(sp) #end riscv_hazard_instr_stream_5
                  la           t5, amo_0+48 #start riscv_lr_sc_instr_stream_4
                  mulhsu       t1, tp, t4
                  andi         s11, s2, -1328
                  slti         t6, tp, 1028
                  mulhsu       s0, a5, s2
                  c.andi       s1, 23
                  lr.w.rl       a0, (t5)
                  c.srai       s1, 25
                  c.li         s11, -1
                  c.andi       s0, 0
                  slti         a0, s7, -344
                  lui          ra, 157569
                  sc.w.rl       s8, tp, (t5) #end riscv_lr_sc_instr_stream_4
                  la           sp, region_1+1640 #start riscv_hazard_instr_stream_3
                  sb           t3, -333(sp)
                  lb           a0, -213(sp)
                  c.add        s11, a0
                  c.and        a0, a0
                  xor          zero, a0, s11
                  divu         a1, t3, a0
                  sll          t3, zero, s8
                  c.mv         s11, a1
                  lh           s11, -1118(sp)
                  c.li         s8, 18
                  c.nop
                  srli         zero, s11, 9
                  sb           a1, -1059(sp)
                  remu         a0, s8, a0
                  c.xor        a1, a0
                  mul          a1, zero, zero
                  c.srai       a0, 8
                  lbu          s8, -450(sp)
                  slt          s8, zero, zero
                  xor          s11, s8, a1
                  sra          s8, a1, s11
                  mulhsu       a1, t3, a1
                  rem          t3, a1, a1
                  slli         a0, a1, 27
                  c.srli       a0, 3
                  c.or         a0, a1
                  auipc        t3, 25349
                  c.slli       s8, 12
                  add          a0, a0, a1
                  lw           zero, -340(sp)
                  lb           s11, -133(sp)
                  lh           a0, -1278(sp)
                  srli         s8, a1, 30
                  rem          a0, s11, a0
                  c.li         a1, -1
                  addi         s8, s8, 1890
                  nop
                  c.or         a1, a0
                  lb           t3, 305(sp)
                  sw           zero, -1148(sp) #end riscv_hazard_instr_stream_3
                  la           t1, region_1+1495 #start riscv_load_store_rand_instr_stream_1
                  c.li         tp, -1
                  sb           s1, 35(t1)
                  mul          t2, s4, t6
                  addi         s10, a3, -218
                  lhu          t4, -1(t1)
                  c.srai       s0, 26
                  sb           s11, 33(t1)
                  srai         t6, s10, 16
                  c.andi       s0, 18
                  lbu          gp, 0(t1)
                  divu         s1, tp, a7
                  lb           s9, -9(t1)
                  c.xor        a0, a5
                  div          s7, tp, s2
                  lh           s4, -3(t1)
                  srli         s7, a0, 27
                  mulhsu       s4, a1, s1
                  lhu          t3, -19(t1)
                  slt          tp, zero, a0
                  lh           t2, -49(t1)
                  sb           s0, -12(t1)
                  c.andi       a5, -1
                  lbu          a3, 1(t1)
                  c.srai       a2, 30
                  lbu          s8, -9(t1)
                  c.addi       t0, 18
                  ori          t2, t2, -1877
                  sh           s1, -1(t1)
                  c.srai       s0, 6
                  lb           a1, -63(t1)
                  srli         tp, t3, 6
                  mulhsu       t3, t5, s0
                  addi         s11, a7, -683
                  lb           t2, 54(t1)
                  rem          t4, t4, s9
                  c.andi       a0, 1
                  lhu          t6, -33(t1)
                  srai         t5, ra, 14
                  lb           s6, 38(t1)
                  c.slli       a2, 25
                  sltu         t6, s8, zero
                  div          s4, s9, a5
                  sub          t6, a0, tp
                  lbu          a6, 44(t1)
                  c.addi4spn   a3, sp, 560
                  sh           s0, 51(t1)
                  c.addi16sp   sp, -16
                  sw           t1, -59(t1)
                  nop
                  lh           a5, -5(t1) #end riscv_load_store_rand_instr_stream_1
                  sra          s9, t1, s5
                  slti         t5, t3, 182
                  lui          s0, 109922
                  lui          s10, 648208
                  c.mv         t5, t1
                  bne          s2, a1, 7f
                  rem          t5, s0, a1
7:                blt          sp, a5, 24f
                  srai         a5, zero, 3
                  or           sp, a3, t3
                  c.bnez       a2, 25f
                  div          sp, a3, a7
                  c.bnez       a4, 22f
                  mulhsu       t1, a4, a1
                  c.srli       a4, 17
                  c.xor        a1, a2
                  mulh         zero, t6, a2
                  div          a2, s9, s11
                  bge          s0, a0, 19f
19:               div          t1, t0, a3
                  slli         s9, tp, 22
                  mulhsu       s4, t1, a0
22:               mulhsu       a4, s7, gp
                  srli         t3, a0, 24
24:               srl          a6, s5, s2
25:               c.srai       s1, 31
                  lui          t0, 357079
                  and          a3, ra, s3
                  beq          t5, s1, 48f
                  c.bnez       s1, 36f
                  c.slli       a5, 1
                  divu         s3, sp, t2
                  ori          tp, t1, 1490
                  xor          t4, t2, sp
                  add          zero, tp, tp
                  c.andi       s0, -1
36:               c.addi16sp   sp, 272
                  bge          s6, t2, 54f
                  slti         s3, s1, 1659
                  c.addi       a0, -1
                  slt          t2, s11, sp
                  c.addi4spn   a4, sp, 704
                  add          t5, gp, a0
                  beq          a3, zero, 49f
                  bne          a0, s6, 58f
                  and          a3, s4, t0
                  c.or         a5, a4
                  beq          s6, s6, 55f
48:               nop
49:               c.lui        t3, 1
                  mulhu        s9, t4, ra
                  sltu         a3, a4, s3
                  srai         a1, a1, 30
                  mulhsu       a4, s9, s3
54:               ori          t4, a6, 885
55:               mulhu        t6, s8, a7
                  c.addi4spn   a2, sp, 560
                  c.xor        a5, s0
58:               bgeu         t3, tp, 62f
                  c.sub        a3, a0
                  bltu         ra, t4, 65f
                  blt          a7, gp, 68f
62:               bgeu         s2, a6, 77f
                  rem          s11, t1, t3
                  c.xor        a0, a3
65:               blt          s0, t5, 82f
                  mulhu        t4, a2, a3
                  add          s9, s4, t2
68:               or           gp, s2, s3
                  mulhu        a1, a1, s8
                  mulh         a4, a2, gp
                  lui          a4, 696282
                  slli         a6, s5, 24
                  andi         s10, s6, 1250
                  xor          a6, a2, t5
                  c.or         a0, a3
                  beq          s11, s5, 96f
77:               xori         zero, a7, 618
                  c.beqz       a3, 89f
                  add          gp, a2, zero
                  xori         s6, s6, -1001
                  lui          gp, 767566
82:               addi         gp, a5, -18
                  div          a1, s3, a0
                  c.andi       a1, -1
                  sltiu        a5, s7, -1798
                  c.andi       s0, 3
                  mul          a1, t4, ra
                  c.addi       s6, 24
89:               ori          a2, gp, -1921
                  mulhu        t3, a2, a0
                  add          gp, a4, s0
                  c.nop
                  srl          a3, t6, s0
                  c.or         a0, a2
                  c.li         a5, 2
96:               c.lui        s4, 10
                  or           t2, t6, sp
                  divu         t1, tp, gp
                  andi         s10, a6, 652
                  mulhsu       a2, s5, s1
                  divu         t1, t5, s7
                  c.nop
                  rem          s3, t3, s11
                  c.andi       a3, -1
                  c.srli       a2, 8
                  sll          zero, a1, t2
                  xor          ra, ra, s0
                  c.li         t3, 14
                  bgeu         gp, a1, 114f
                  c.andi       a5, 6
                  bge          zero, a3, 118f
                  c.addi16sp   sp, 80
                  nop
114:              c.beqz       a4, 122f
                  bltu         a7, s7, 122f
                  sltu         s1, s5, t6
                  xori         s7, a4, -391
118:              and          s1, s2, a2
                  c.slli       s11, 29
                  c.or         a2, a4
                  rem          s10, a7, t6
122:              c.slli       a1, 7
                  lui          gp, 294151
                  c.slli       a6, 25
                  c.add        s0, a0
                  beq          ra, s11, 132f
                  mulh         a3, zero, s1
                  sll          s4, zero, a0
                  add          s7, a0, ra
                  bne          s3, s3, 149f
                  c.slli       a1, 11
132:              xori         t1, a6, -1783
                  c.srai       a3, 18
                  c.addi16sp   sp, 352
                  c.addi4spn   a1, sp, 320
                  xor          t4, a6, t5
                  auipc        t1, 875471
                  sltu         t3, a2, s3
                  c.addi4spn   a5, sp, 1008
                  srai         s7, a1, 22
                  c.mv         s1, t1
                  sll          t6, s6, a6
                  beq          t4, s3, 152f
                  c.beqz       s0, 156f
                  c.and        a5, s1
                  srai         s6, t2, 18
                  sltu         sp, zero, tp
                  nop
149:              and          s1, zero, s10
                  c.and        a1, s0
                  c.srai       a4, 28
152:              c.add        a5, s9
                  mulh         sp, t2, ra
                  sub          t6, s6, a6
                  c.or         a2, s1
156:              lui          a3, 667975
                  remu         t0, s4, a1
                  srai         s0, a0, 7
                  mul          s6, s4, sp
                  addi         t0, s3, -686
                  c.or         a5, a3
                  srl          ra, t2, gp
                  c.and        a1, a2
                  c.srli       a0, 27
                  mulh         s1, t2, s2
                  bgeu         ra, t0, 172f
                  sra          a2, s0, s3
                  mulhsu       s4, a5, sp
                  c.xor        a1, a4
                  srai         s10, tp, 10
                  mulh         a3, t1, ra
172:              lui          t5, 639040
                  lui          t5, 1032226
                  addi         a0, a7, 782
                  bge          s10, a1, 181f
                  c.srai       s0, 8
                  c.add        a4, a7
                  div          a5, a4, s4
                  add          gp, t2, t2
                  addi         s9, a2, 167
181:              auipc        s4, 462530
                  bge          s7, s6, 197f
                  remu         s0, s4, t3
                  bltu         a7, t0, 197f
                  c.srli       a5, 10
                  bgeu         s0, a2, 187f
187:              srl          t0, t0, s2
                  slli         s3, gp, 8
                  mulhu        a4, s4, a0
                  c.slli       s11, 11
                  srai         t5, s4, 18
                  sltu         s9, t1, tp
                  bltu         t4, s9, 212f
                  sll          s6, s1, s11
                  beq          tp, s6, 212f
                  c.addi       a4, -1
197:              and          a2, a2, a3
                  mulhu        t2, t0, a2
                  or           t4, s8, a0
                  divu         a1, t4, t3
                  and          s9, a2, ra
                  slt          s11, s2, s4
                  c.sub        a2, a1
                  sub          t5, a1, a3
                  sltu         a1, s4, s0
                  c.sub        s0, s0
                  and          s10, s9, a1
                  auipc        a2, 957039
                  lui          s10, 1043239
                  c.li         s8, -1
                  mulhsu       a6, s4, a2
212:              c.slli       sp, 24
                  and          s7, t0, ra
                  c.or         s1, a5
                  srai         s10, s2, 16
                  c.sub        a1, a5
                  c.addi       gp, -1
                  bge          t6, s7, 233f
                  srli         s11, a1, 31
                  c.addi       a4, 13
                  xor          t5, a1, s1
                  div          a0, s10, s7
                  mul          s7, ra, a6
                  blt          s9, t3, 231f
                  c.bnez       a4, 236f
                  c.addi4spn   a4, sp, 720
                  or           s4, a5, t5
                  andi         s8, a3, -547
                  c.li         s4, -1
                  remu         s1, t3, t0
231:              sra          s0, t0, tp
                  remu         s3, t3, s2
233:              c.srai       a2, 8
                  mulhsu       tp, s5, t3
                  auipc        s10, 227958
236:              sltiu        sp, s10, -814
                  blt          tp, s5, 249f
                  bgeu         t2, zero, 242f
                  bne          a0, zero, 249f
                  mulh         s9, s1, s8
                  c.mv         t0, sp
242:              addi         s11, gp, -511
                  beq          a7, s7, 260f
                  c.add        a3, a0
                  bge          a3, a4, 265f
                  ori          zero, s6, 1362
                  sub          t5, t2, a5
                  c.sub        a2, a5
249:              slt          s8, s9, s6
                  slt          sp, zero, a0
                  srl          s10, t6, t6
                  ori          zero, s8, -474
                  addi         s4, s11, 1186
                  c.addi4spn   s1, sp, 80
                  rem          zero, s0, gp
                  remu         ra, zero, s5
                  or           s6, a1, a6
                  addi         s10, s3, 1754
                  addi         s1, gp, -840
260:              c.lui        gp, 4
                  c.lui        t3, 30
                  bltu         s9, zero, 264f
                  bge          s3, tp, 270f
264:              and          a6, s4, s7
265:              xori         a3, a4, -225
                  slt          a1, s11, s9
                  addi         t2, s5, -1924
                  c.srli       s0, 29
                  mulhsu       s1, ra, a6
270:              c.add        a1, s5
                  remu         gp, tp, t1
                  slt          s1, a7, s3
                  c.or         a1, a4
                  mulhsu       a2, t6, t3
                  div          a0, a6, s4
                  div          a2, s3, s0
                  sltiu        a1, s1, -502
                  slti         s11, t0, 312
                  c.srli       a4, 1
                  c.beqz       a3, 285f
                  or           a5, ra, a7
                  c.lui        tp, 13
                  bge          t0, ra, 288f
                  c.addi4spn   a3, sp, 784
285:              auipc        s1, 831133
                  c.add        a1, a4
                  bltu         sp, t3, 304f
288:              srli         t6, s11, 0
                  c.or         s1, s1
                  c.addi16sp   sp, 240
                  sll          a6, sp, a1
                  srai         a2, zero, 1
                  andi         a6, s1, 829
                  divu         s9, s3, t6
                  c.addi4spn   s0, sp, 432
                  c.sub        a4, a4
                  bne          t4, t0, 303f
                  c.add        sp, t3
                  c.xor        a4, a0
                  c.bnez       a0, 313f
                  and          s10, s10, t5
                  c.bnez       a5, 316f
303:              add          t3, a3, a5
304:              and          s1, s8, t0
                  mulhsu       s1, s4, t6
                  c.srai       s0, 20
                  bltu         a3, t4, 314f
                  ori          a4, t1, -856
                  mulhsu       t1, a2, t4
                  remu         t4, a5, a4
                  div          s1, a5, gp
                  lui          t5, 98092
313:              c.andi       a3, -1
314:              mulh         ra, a1, tp
                  c.addi16sp   sp, -16
316:              c.lui        tp, 20
                  c.andi       a2, -1
                  c.beqz       s1, 324f
                  c.nop
                  and          s4, s0, a0
                  c.li         a6, -1
                  sub          gp, s6, t0
                  mul          a6, gp, s4
324:              sra          a5, t4, s6
                  xori         s0, s1, -381
                  c.nop
                  bgeu         s9, t1, 347f
                  c.addi       a1, -1
                  srai         a5, s3, 29
                  c.andi       s0, 22
                  mulhsu       a0, a1, a7
                  c.addi4spn   s0, sp, 128
                  addi         s9, t4, -522
                  beq          s7, t0, 349f
                  c.nop
                  c.bnez       a2, 351f
                  slti         s0, t5, 2
                  bge          s1, a3, 346f
                  slti         zero, t2, 286
                  mulh         ra, s8, s10
                  c.lui        s10, 3
                  and          s11, t5, t3
                  and          s7, t3, s0
                  slti         sp, zero, 425
                  nop
346:              divu         t1, s5, s1
347:              c.srai       s1, 2
                  xori         t1, t2, -1486
349:              sra          t2, t4, ra
                  sub          s8, s1, a4
351:              mulh         a3, a2, s11
                  c.beqz       a2, 359f
                  c.srli       a5, 24
                  div          t3, t1, s10
                  sub          a6, a1, a0
                  bgeu         t2, t0, 365f
                  or           t1, t3, s2
                  mulh         s6, t1, s9
359:              c.andi       a1, -1
                  c.addi4spn   a1, sp, 80
                  andi         s3, a6, 1362
                  mul          t0, s1, zero
                  c.and        s0, s1
                  bne          gp, zero, 372f
365:              slli         t2, a7, 7
                  slti         sp, t4, -1369
                  c.bnez       a5, 373f
                  slti         a6, s0, 669
                  c.li         s1, -1
                  bltu         t4, sp, 376f
                  slli         s6, a7, 28
372:              bge          s6, gp, 392f
373:              div          s6, a5, t1
                  xor          ra, s5, s7
                  add          a1, a1, tp
376:              c.addi16sp   sp, -16
                  andi         t6, s11, 1580
                  c.addi16sp   sp, 240
                  add          s4, t5, s4
                  srl          a6, t6, s0
                  c.or         a0, a4
                  c.bnez       a1, 392f
                  c.or         s1, a0
                  c.beqz       a1, 392f
                  c.addi4spn   a2, sp, 64
                  c.li         s4, -1
                  remu         t5, a3, tp
                  slt          t2, s9, s2
                  sll          s8, s2, tp
                  mul          zero, s3, a2
                  c.xor        s0, a0
392:              slli         s11, s7, 27
                  remu         gp, s7, s9
                  blt          gp, a2, 409f
                  bge          s8, s2, 403f
                  c.bnez       a3, 405f
                  srl          s0, t1, a1
                  rem          t3, s9, s0
                  blt          a5, s3, 416f
                  div          ra, t1, t5
                  sub          s3, t1, a2
                  c.nop
403:              sub          ra, a4, s0
                  mul          t5, s0, a4
405:              c.li         a6, 16
                  sltiu        s8, a4, 1443
                  mulhu        t2, t5, a2
                  srli         t1, t1, 18
409:              c.add        a4, a1
                  c.addi       tp, 4
                  c.xor        a2, a3
                  c.lui        s10, 10
                  la           s4, region_1+1278 #start load_store_instr_stream_1
                  lb           s1, -11(s4)
                  la           a6, region_0+412 #start load_store_instr_stream_0
                  sw           s3, 252(a6)
                  sb           s8, 21(s4)
                  lb           s6, 42(a6)
                  sw           sp, -58(s4)
                  lb           gp, -19(s4)
                  lh           s1, -2(s4)
                  lbu          tp, -212(a6)
                  lb           a1, -179(a6)
                  lh           s9, 138(a6)
                  lhu          t5, -70(a6)
                  sb           s2, -181(a6)
                  sh           sp, 0(s4) #end load_store_instr_stream_1
                  lbu          s6, -67(a6) #end load_store_instr_stream_0
                  blt          s11, a0, 420f
                  and          a1, s7, s2
                  lui          s9, 959609
416:              andi         t1, s1, 1177
                  nop
                  remu         t3, t0, s2
                  srli         sp, t1, 19
420:              auipc        a5, 29002
                  nop
                  xori         a1, s11, 1361
                  nop
                  divu         t2, a6, a2
                  c.lui        s0, 27
                  c.srai       s1, 22
                  slt          a3, zero, s2
                  c.li         s1, -1
                  sub          s10, a7, zero
                  c.srli       a4, 31
                  or           a6, tp, t4
                  c.addi       a2, 10
                  and          s11, a0, s2
                  auipc        t6, 907785
                  ori          a1, gp, -1786
                  c.beqz       s1, 451f
                  c.bnez       a3, 444f
                  c.li         t6, -1
                  or           s10, s10, t4
                  srai         s0, s11, 10
                  sltiu        s7, a6, 24
                  andi         t6, s4, -1187
                  c.addi16sp   sp, 336
444:              bgeu         a6, t4, 446f
                  div          a6, s8, s8
446:              mulhu        s8, a3, a3
                  auipc        a5, 309174
                  srai         s0, t4, 18
                  ori          s0, a3, -2028
                  slli         s7, s7, 30
451:              c.lui        s6, 30
                  sltiu        a1, gp, 861
                  add          t4, s8, zero
                  sra          s6, s11, gp
                  c.beqz       a1, 467f
                  divu         t6, ra, s6
                  and          a1, t5, s3
                  or           s11, ra, a6
                  c.beqz       a4, 465f
                  remu         a3, a2, s0
                  c.and        s1, a5
                  c.li         t5, 2
                  blt          s0, s0, 478f
                  sltu         a0, tp, a0
465:              slti         s11, a2, -1255
                  slli         t4, s8, 15
467:              c.lui        tp, 8
                  c.li         gp, 13
                  and          s9, sp, s11
                  c.or         a5, a5
                  ori          s6, t1, 63
                  sra          s9, t1, t3
                  bgeu         s2, gp, 490f
                  c.li         s4, 13
                  bgeu         s7, t4, 481f
                  auipc        s9, 365091
                  bge          s8, a6, 496f
478:              srai         s7, s5, 25
                  auipc        ra, 181325
                  mulhu        tp, t6, ra
481:              add          s9, t6, a3
                  or           sp, sp, s9
                  la           t6, region_1+1899 #start riscv_hazard_instr_stream_10
                  auipc        sp, 230222
                  lbu          a3, -12(t6)
                  div          sp, sp, t1
                  c.addi16sp   sp, 400
                  lbu          tp, 7(t6)
                  sb           a3, -2(t6)
                  lui          a2, 649039
                  andi         t1, a2, -1776
                  sb           tp, -16(t6)
                  lhu          a2, -13(t6)
                  sb           a3, -9(t6)
                  lbu          a2, 12(t6)
                  sb           sp, 11(t6)
                  lhu          a3, 13(t6)
                  c.andi       a2, 17
                  lw           a3, 13(t6)
                  c.xor        a3, a2
                  xori         sp, a2, 1723
                  lb           s8, -12(t6)
                  c.li         tp, 2
                  lh           sp, -15(t6)
                  c.sub        a3, a3
                  c.xor        a2, a2
                  lb           a2, -1(t6)
                  lb           s8, 12(t6)
                  srli         sp, a3, 22
                  lb           a3, 0(t6)
                  mul          a2, a3, a2
                  sb           s8, 4(t6)
                  c.srli       a2, 1
                  sb           tp, -16(t6) #end riscv_hazard_instr_stream_10
                  c.and        s1, a3
                  addi         a2, zero, -1855
                  auipc        gp, 576559
                  sltu         t4, t6, s5
                  lui          t2, 602702
                  c.xor        a4, a3
                  c.mv         t0, t1
490:              and          t5, a2, t1
                  xori         s10, t1, -1299
                  c.add        s10, a1
                  rem          t3, sp, t0
                  rem          a5, s6, ra
                  bge          s7, t2, 501f
496:              beq          a4, a2, 509f
                  bne          a1, a6, 504f
                  c.bnez       a1, 504f
                  xori         t4, a5, 633
                  c.nop
501:              c.mv         s8, a1
                  srli         t5, s6, 28
                  add          t0, s8, s1
504:              sltu         t6, s9, a0
                  bne          s11, gp, 519f
                  c.xor        a3, a5
                  c.andi       a5, -1
                  c.addi16sp   sp, -16
509:              slt          t6, t3, a6
                  c.li         a5, -1
                  c.add        s11, a3
                  div          s8, t3, t5
                  sub          s8, s8, t3
                  add          a4, t0, a4
                  addi         s1, a5, -1034
                  sra          t3, a6, s5
                  mul          t0, t2, s11
                  bge          gp, s11, 523f
519:              xori         t0, t0, 1726
                  c.sub        a0, a5
                  beq          s5, t6, 541f
                  c.mv         t3, a2
523:              div          s3, s11, s2
                  c.srli       s0, 11
                  c.addi16sp   sp, 112
                  c.nop
                  c.sub        a4, a0
                  bne          s3, s4, 529f
                  la           tp, region_1+1638 #start riscv_load_store_hazard_instr_stream_7
                  lbu          t2, -200(tp)
                  sll          s10, s2, zero
                  lh           a6, -226(tp)
                  sb           gp, -226(tp)
                  lhu          s6, 48(tp)
                  lh           a5, 188(tp)
                  sb           a4, 232(tp)
                  lhu          a1, -70(tp)
                  sh           s3, -70(tp)
                  lbu          s3, 72(tp)
                  sb           s1, 13(tp)
                  lbu          a1, -204(tp)
                  sh           a0, -106(tp)
                  srli         t6, s3, 9
                  lh           s1, -106(tp)
                  lw           zero, -66(tp)
                  c.sub        s0, a1
                  lb           zero, -249(tp)
                  sb           sp, -249(tp)
                  lbu          s0, -249(tp) #end riscv_load_store_hazard_instr_stream_7
529:              slti         t2, a6, -1858
                  c.mv         t3, s2
                  c.lui        s8, 27
                  c.andi       a2, -1
                  blt          s2, gp, 544f
                  mulhu        t4, s4, a6
                  or           s0, t0, s4
                  c.beqz       a5, 553f
                  c.nop
                  add          a4, s2, s6
                  c.mv         t5, s2
                  c.and        a5, a2
541:              c.andi       a1, 17
                  remu         s4, a1, a3
                  c.sub        a1, a0
544:              c.andi       a4, 27
                  c.beqz       a5, 550f
                  c.sub        a1, a0
                  srai         s11, s8, 14
                  sltiu        s0, a6, 290
                  sll          gp, sp, t3
550:              nop
                  c.add        t4, a6
                  remu         a6, a3, s7
553:              ori          a4, zero, 1072
                  c.addi16sp   sp, -16
                  c.li         a3, -1
                  lui          ra, 188852
                  xori         s3, t1, -1325
                  andi         tp, s5, -596
                  divu         a1, s11, t5
                  sltiu        t0, s1, -495
                  sra          s11, t4, t3
                  mulh         s4, s8, s8
                  c.slli       s0, 28
                  divu         t4, gp, s2
                  c.li         a5, -1
                  slt          zero, a2, gp
                  c.bnez       a3, 571f
                  bltu         a7, gp, 575f
                  c.nop
                  bne          s3, a3, 578f
571:              c.xor        a4, a4
                  nop
                  sltiu        a2, s0, 695
                  c.addi       ra, -1
575:              mul          s0, t5, s8
                  xori         tp, a2, 484
                  srl          t5, t1, a7
578:              srai         s8, tp, 14
                  c.beqz       a3, 599f
                  sll          s6, a5, s8
                  add          s7, s8, s9
                  c.slli       t6, 7
                  c.andi       a2, -1
                  or           gp, ra, t3
                  c.srli       s1, 5
                  auipc        t0, 810673
                  c.mv         a3, t0
                  beq          t1, t0, 595f
                  divu         s8, t2, t1
                  srai         t0, s7, 0
                  c.mv         a3, s8
                  c.li         s8, 9
                  c.and        a0, a5
                  c.addi4spn   a2, sp, 720
595:              beq          s5, a5, 615f
                  c.sub        a0, a5
                  c.andi       s1, -1
                  or           t0, s7, s4
599:              mulhsu       s6, s9, sp
                  c.addi4spn   s0, sp, 832
                  divu         s11, a7, a7
                  ori          sp, s7, -1532
                  sltu         a5, s0, a2
                  c.li         s7, -1
                  c.or         a2, s0
                  srl          t2, s2, a0
                  bge          a1, sp, 617f
                  srai         ra, a6, 6
                  bltu         s1, s4, 622f
                  slt          a2, s6, s2
                  c.li         s8, -1
                  xor          ra, a5, a5
                  bne          a5, s2, 630f
                  c.slli       t6, 19
615:              divu         s8, s1, s1
                  c.srli       a0, 16
617:              c.li         s10, 18
                  c.addi       s9, -1
                  or           s9, t6, a5
                  auipc        s11, 694812
                  add          a1, a0, s10
622:              srli         s1, s2, 27
                  nop
                  c.bnez       a0, 638f
                  sltu         gp, a1, t5
                  srli         gp, a0, 6
                  rem          s10, s9, t3
                  xori         s11, sp, 1347
                  ori          s6, t0, -372
630:              slt          a0, t6, s11
                  slt          t4, a6, a1
                  beq          t3, s10, 639f
                  mulhsu       s6, gp, t0
                  c.srli       a2, 4
                  c.beqz       a4, 652f
                  xor          t6, s8, s8
                  div          a3, s6, t3
638:              add          zero, t6, t1
639:              auipc        t4, 311293
                  ori          s11, s5, 1768
                  bge          t0, s3, 647f
                  bge          t4, a0, 646f
                  srli         sp, sp, 16
                  sltiu        s10, a3, 279
                  rem          t5, t1, t1
646:              ori          s10, t4, 582
647:              bgeu         s9, s5, 648f
648:              srl          a3, s1, a2
                  blt          t2, s9, 655f
                  srl          zero, a7, t0
                  divu         s1, ra, s9
652:              xori         s10, a6, -1803
                  nop
                  srli         s6, a5, 18
655:              sub          ra, t4, s10
                  c.and        a3, s1
                  beq          s6, ra, 668f
                  c.li         a4, -1
                  c.beqz       a0, 666f
                  c.srli       s1, 18
                  lui          s10, 533028
                  xori         a3, s5, 1842
                  slt          sp, s11, a1
                  sll          a3, zero, a6
                  c.andi       a3, -1
666:              div          s7, ra, a4
                  mulhsu       a0, a4, s2
668:              bgeu         ra, a6, 674f
                  c.add        s1, s5
                  slli         s0, a1, 28
                  auipc        a3, 235156
                  sll          t4, t2, t3
                  sub          s6, t5, zero
674:              blt          tp, gp, 691f
                  srl          ra, t6, ra
                  c.and        a4, s0
                  slt          s1, sp, a2
                  mul          a0, t1, a7
                  mulh         t2, a1, tp
                  sltu         s10, s4, gp
                  nop
                  c.or         a5, a5
                  mul          s4, sp, s10
                  c.slli       s8, 3
                  ori          t6, s6, -1949
                  c.lui        t4, 22
                  addi         tp, tp, 1593
                  ori          a5, s0, -460
                  sltiu        t3, s7, 576
                  mulhu        t3, s7, a3
691:              beq          a5, s1, 703f
                  c.li         a2, -1
                  bltu         s6, a2, 708f
                  lui          s8, 671736
                  bge          a7, t1, 700f
                  add          t0, gp, t5
                  nop
                  slli         ra, t5, 8
                  divu         s1, a2, zero
700:              beq          s9, a0, 709f
                  and          t4, a6, s7
                  mulhu        s6, s0, a4
703:              c.addi       s8, 30
                  bne          s6, t1, 710f
                  slli         t4, a7, 21
                  c.xor        s0, a2
                  bge          s9, a5, 715f
708:              andi         s9, sp, -797
709:              bgeu         sp, ra, 711f
710:              sra          sp, s8, t0
711:              or           s4, s3, s11
                  bne          s9, s5, 717f
                  slti         ra, a0, -137
                  srai         s7, s8, 31
715:              c.bnez       a5, 734f
                  sll          a4, sp, s1
717:              divu         s7, a5, sp
                  c.slli       s1, 16
                  slli         s3, gp, 22
                  srli         t3, a7, 10
                  auipc        s10, 812543
                  bltu         t6, a3, 737f
                  bne          t4, sp, 738f
                  addi         a0, a6, 1985
                  andi         s7, zero, -1651
                  blt          a6, s5, 733f
                  divu         t2, t5, a5
                  or           a5, s1, s6
                  srai         zero, t0, 17
                  mulhsu       s11, a0, a2
                  slt          t4, t0, a7
                  c.addi16sp   sp, -16
733:              c.addi4spn   a1, sp, 784
734:              c.addi       a3, -1
                  srai         s9, s0, 5
                  srl          a0, t0, a2
737:              mulh         a5, a7, t1
738:              mul          t6, a0, t1
                  bne          t5, t4, 754f
                  div          tp, a3, a4
                  srai         s11, t0, 13
                  slli         t6, t5, 23
                  remu         a1, s1, a1
                  c.add        t0, s2
                  c.srai       a5, 2
                  sub          s11, t6, s8
                  srl          gp, s6, t2
                  mulhsu       s4, s1, s10
                  slli         t3, a4, 30
                  bltu         gp, a5, 756f
                  c.add        t5, s10
                  mulhsu       t6, s9, t5
                  slti         t0, sp, -916
754:              lui          s11, 567223
                  slt          gp, s4, a6
756:              c.addi16sp   sp, -16
                  c.addi       s10, -1
                  lui          t2, 320943
                  slt          a2, a6, t2
                  c.li         a4, 16
                  c.or         s0, a3
                  c.sub        a0, a5
                  divu         t1, s0, a7
                  remu         t0, t5, a2
                  and          a3, sp, a5
                  beq          tp, s2, 768f
                  c.lui        a2, 22
768:              c.or         a5, s1
                  c.li         t0, 26
                  xor          a2, ra, t3
                  c.andi       s0, 14
                  auipc        t3, 768968
                  bne          a5, s1, 790f
                  srai         t2, a7, 20
                  bne          gp, s6, 781f
                  mulhu        a5, gp, zero
                  c.srli       a0, 6
                  sub          t3, s1, s4
                  bne          a1, a2, 796f
                  sltu         a2, t3, s1
781:              slti         s10, s3, 739
                  c.srai       a5, 12
                  srl          ra, tp, s5
                  slli         sp, s0, 2
                  c.beqz       a3, 800f
                  bltu         s1, a2, 806f
                  c.andi       a5, 0
                  c.bnez       s0, 795f
                  c.xor        a4, a4
790:              srli         s7, s6, 13
                  c.srai       s0, 7
                  sltu         gp, tp, ra
                  srai         a3, s2, 27
                  sra          s9, a5, t1
795:              slli         a6, s2, 2
796:              srai         a1, s10, 21
                  sra          t4, t5, gp
                  slti         a6, s2, -1569
                  c.li         s3, -1
800:              bltu         s7, a7, 806f
                  and          zero, s7, t3
                  blt          s4, t2, 817f
                  and          a3, gp, t2
                  or           s11, t5, s1
                  c.beqz       a3, 809f
806:              lui          t2, 424193
                  beq          gp, a5, 814f
                  c.beqz       a4, 816f
809:              bge          s7, s0, 816f
                  srli         t0, tp, 30
                  srl          s1, a1, ra
                  bge          a3, zero, 824f
                  sltiu        gp, a3, 1686
814:              c.and        a2, a4
                  c.lui        s3, 14
816:              c.add        a6, t5
817:              c.lui        t5, 29
                  lui          a2, 704633
                  slli         gp, s8, 7
                  c.add        a6, t3
                  sub          t1, s11, s1
                  add          t6, t4, t6
                  mulh         ra, s2, a7
824:              andi         a1, a5, 184
                  c.andi       a0, -1
                  c.slli       a4, 13
                  srl          s0, s3, a2
                  c.addi       a4, -1
                  bltu         gp, a1, 830f
830:              c.srli       s1, 23
                  sll          t4, ra, ra
                  slli         s10, a6, 27
                  c.bnez       s0, 846f
                  addi         s6, a7, 1305
                  xori         a3, s11, 1698
                  c.mv         s11, s0
                  c.nop
                  slti         s8, t2, 1608
                  remu         s3, s10, t5
                  mulhsu       a5, a0, gp
                  c.addi4spn   s0, sp, 928
                  bge          a6, s2, 848f
                  sltu         t5, s1, s4
                  bne          ra, t4, 858f
                  sltu         s7, s0, gp
846:              bne          tp, a0, 866f
                  xori         gp, a7, 511
848:              bgeu         t3, t4, 853f
                  auipc        zero, 808125
                  c.addi       s0, -1
                  bgeu         t4, a0, 861f
                  srl          t3, t2, a0
853:              mul          s1, a7, t2
                  bgeu         sp, t4, 859f
                  remu         s8, zero, a2
                  c.beqz       s1, 873f
                  rem          t6, t6, ra
858:              div          t3, a1, s10
859:              blt          s1, s3, 868f
                  sll          s7, a6, a2
861:              mulhsu       t5, t3, s5
                  sltiu        a2, s0, 38
                  addi         t5, a3, -45
                  c.addi16sp   sp, -16
                  xor          s4, s0, a7
866:              xori         a3, s4, 819
                  sra          a0, a6, a4
868:              srai         t2, a3, 1
                  c.or         a1, a0
                  divu         t1, a6, t2
                  c.li         t1, -1
                  sltiu        s1, s1, 895
873:              c.or         a4, s0
                  rem          s3, a1, a0
                  and          ra, s11, a1
                  c.srai       a4, 8
                  c.addi4spn   a2, sp, 912
                  slt          sp, a5, s0
                  c.or         s1, a5
                  srai         s8, s9, 6
                  la           sp, region_1+1074 #start riscv_load_store_rand_instr_stream_7
                  slli         a6, a6, 15
                  rem          tp, ra, s5
                  c.srai       a0, 7
                  c.mv         gp, tp
                  c.xor        a0, a0
                  c.xor        a2, a2
                  xori         s10, zero, -1296
                  c.add        s8, t2
                  lbu          s9, 93(sp)
                  lbu          t2, 167(sp)
                  div          s9, s10, s0
                  lh           a1, 198(sp)
                  rem          s7, s4, s3
                  c.add        ra, t2
                  slt          s10, s8, s0
                  sh           s2, 196(sp)
                  lbu          t6, -241(sp)
                  sh           s0, 152(sp)
                  c.slli       t5, 9
                  rem          t2, ra, a3
                  sb           zero, -47(sp)
                  lb           s8, 132(sp)
                  xor          a1, t1, t0
                  lb           zero, -147(sp)
                  c.sub        a5, a3
                  addi         a1, s8, -1087
                  sb           a3, -123(sp)
                  lb           s6, -175(sp)
                  lbu          a2, -115(sp)
                  lbu          a6, 24(sp)
                  sra          t1, t1, s6
                  lb           t6, -157(sp)
                  c.sub        s0, a4
                  sltiu        a2, s6, 1496
                  lh           ra, 104(sp) #end riscv_load_store_rand_instr_stream_7
                  bgeu         gp, a3, 888f
                  rem          s11, s0, s0
                  sub          tp, t0, s3
                  rem          s4, s10, s3
                  slt          t2, s3, s9
                  divu         s8, s3, t2
                  blt          a2, t3, 895f
888:              bge          a3, t1, 899f
                  divu         s6, s5, s6
                  c.addi       t5, -1
                  la           a0, region_1+397 #start load_store_instr_stream_3
                  la           s6, region_1+1790 #start load_store_instr_stream_2
                  la           s10, region_1+344 #start load_store_instr_stream_4
                  sb           t4, 99(s6)
                  lh           s1, 1213(a0)
                  lb           s3, 318(s10)
                  sb           a6, -185(s10)
                  la           t5, region_1+554 #start load_store_instr_stream_1
                  sw           t5, -750(s6)
                  sb           a3, 195(t5)
                  sb           sp, -177(s10)
                  la           a2, region_1+1723 #start load_store_instr_stream_0
                  lh           ra, -266(s10)
                  lbu          gp, 488(t5)
                  lhu          a5, 1126(s10)
                  lhu          s4, -11(a2)
                  lb           s8, 1629(s10)
                  lh           ra, 310(s10)
                  lb           s0, 569(t5)
                  lhu          t1, -79(a0)
                  lb           s0, -1145(s6)
                  lbu          s11, -1109(s6)
                  lh           a4, 955(a0)
                  lbu          ra, -1216(s6)
                  lb           t6, 3(a2)
                  lbu          a6, -509(s6)
                  lb           ra, -937(s6)
                  sb           s4, 16(a2)
                  lh           tp, -248(t5)
                  lbu          tp, 43(a0)
                  sw           a5, -3(a2)
                  lb           t6, 272(a0)
                  sb           t2, 672(a0) #end load_store_instr_stream_3
                  lbu          s1, -1120(s6)
                  lb           sp, 1118(s10)
                  lw           s4, 1438(t5) #end load_store_instr_stream_1
                  sb           s9, 1227(s10) #end load_store_instr_stream_4
                  sb           t3, -603(s6) #end load_store_instr_stream_2
                  sb           s0, -2(a2) #end load_store_instr_stream_0
                  andi         s7, t4, -1895
                  slli         a4, s10, 29
                  c.addi       t0, 14
                  c.bnez       s0, 913f
895:              bge          t2, s2, 909f
                  lui          a3, 949788
                  c.addi16sp   sp, 48
                  blt          t3, s6, 902f
899:              c.srli       s1, 20
                  rem          s4, sp, s3
                  nop
902:              c.slli       t4, 22
                  remu         tp, t2, a4
                  mulh         s8, a0, t6
                  addi         s8, sp, 145
                  c.or         a1, a2
                  lui          t0, 78304
                  srai         s8, s3, 29
909:              sll          gp, a6, s7
                  mul          a0, a1, gp
                  sltu         s11, a2, t3
                  c.bnez       a3, 927f
913:              beq          t4, s8, 930f
                  andi         zero, t3, 1550
                  c.slli       a3, 6
                  blt          s0, sp, 924f
                  c.srli       a3, 29
                  sub          a6, s10, s3
                  c.slli       a3, 9
                  addi         t1, s9, -108
                  sra          t0, t3, s0
                  c.srli       a5, 8
                  srli         t2, a3, 30
924:              mul          tp, s10, t6
                  srli         t0, a1, 31
                  ori          zero, s6, -398
927:              c.lui        s4, 24
                  xori         zero, s3, -185
                  remu         gp, s3, gp
930:              mulh         t2, t5, gp
                  bne          tp, t5, 951f
                  xor          tp, t5, s11
                  sltu         t5, s7, s11
                  auipc        s3, 750527
                  xori         s8, a3, -399
                  slli         ra, s9, 17
                  xori         a3, a7, -13
                  sub          a5, s10, tp
                  c.or         s1, a1
                  c.slli       s10, 11
                  c.andi       s1, 28
                  c.srai       a3, 21
                  c.add        s0, s10
                  div          a1, gp, t5
                  c.lui        s3, 11
                  srli         s10, a0, 3
                  beq          a1, t6, 949f
                  andi         s7, a0, 1367
949:              c.addi       a1, 25
                  sll          a3, s0, t0
951:              c.mv         tp, a5
                  add          sp, s6, s5
                  c.lui        s4, 8
                  c.srli       a0, 2
                  add          t1, a6, a7
                  srl          s8, s6, s5
                  c.mv         s3, t5
                  mulh         t4, sp, s6
                  sub          a2, s3, s7
                  c.and        a4, a5
                  auipc        t3, 602442
                  and          t1, tp, a1
                  blt          gp, s10, 969f
                  bge          t2, t6, 972f
                  c.addi       s1, 29
                  c.bnez       a3, 981f
                  sub          s6, gp, s9
                  mulhu        zero, ra, s7
969:              c.andi       a5, 20
                  c.nop
                  sll          s0, t6, a3
972:              rem          a3, s11, s10
                  c.sub        a4, a0
                  c.add        sp, s3
                  c.li         t4, -1
                  addi         a6, s9, 1190
                  ori          t4, s11, 489
                  sll          zero, t3, a4
                  rem          s4, s8, s8
                  c.li         a1, 23
981:              srai         s0, t6, 26
                  lui          s6, 180015
                  srli         a2, s10, 17
                  addi         t5, gp, -1802
                  bne          t0, a5, 1004f
                  sra          tp, s6, a2
                  sra          t6, a0, a5
                  bgeu         a2, s11, 995f
                  bgeu         a5, t3, 1009f
                  mulhsu       s1, s0, t0
                  srai         a0, t5, 4
                  c.srli       a3, 26
                  mul          s10, s2, a2
                  auipc        sp, 476698
995:              andi         tp, a4, 1608
                  ori          s10, t6, 1964
                  mulhsu       s4, a7, a0
                  c.addi       tp, -1
                  c.mv         s6, sp
                  xori         s8, s5, -1925
                  c.addi       a4, -1
                  slti         s0, s3, -1837
                  andi         t3, a6, -2006
1004:             c.srli       a2, 3
                  slli         t0, sp, 16
                  lui          s8, 840386
                  rem          s9, a2, s10
                  c.bnez       a5, 1018f
1009:             c.sub        a1, a0
                  nop
                  sra          t2, s2, t4
                  bgeu         t3, t5, 1021f
                  bgeu         gp, tp, 1019f
                  and          zero, tp, s2
                  bge          a2, a5, 1016f
1016:             c.sub        a4, s1
                  divu         a0, s11, s0
1018:             slti         t6, sp, 440
1019:             and          s3, s2, t6
                  nop
1021:             mulh         s11, tp, s0
                  remu         t3, s5, s10
                  srai         t1, gp, 30
                  mulhu        t1, a6, s5
                  c.beqz       a3, 1031f
                  c.xor        s1, a4
                  bgeu         s5, t2, 1032f
                  c.sub        s1, s1
                  c.srli       a0, 25
                  sll          a4, a5, t0
1031:             auipc        t5, 522695
1032:             sltiu        s6, sp, -866
                  sltu         s10, sp, a7
                  c.addi16sp   sp, -16
                  c.srai       s0, 8
                  sltu         gp, ra, gp
                  addi         a0, a3, -821
                  srli         s7, a2, 15
                  bgeu         t4, a5, 1052f
                  c.addi       a0, -1
                  c.addi16sp   sp, 80
                  or           t5, zero, t1
                  div          s11, s10, s2
                  c.or         s0, s1
                  auipc        t5, 440898
                  c.beqz       a2, 1053f
                  lui          t2, 436041
                  c.beqz       s1, 1065f
                  c.addi16sp   sp, 400
                  lui          tp, 255990
                  sltiu        a6, zero, 1860
1052:             remu         a0, t0, zero
1053:             c.or         a3, a3
                  c.beqz       a4, 1060f
                  c.slli       a5, 2
                  srli         t4, gp, 2
                  sltu         gp, s5, t2
                  srai         zero, a3, 8
                  srli         a4, gp, 22
1060:             beq          a7, t1, 1067f
                  c.mv         s3, s6
                  c.bnez       a3, 1069f
                  or           tp, a3, s7
                  add          t0, s7, a5
1065:             mulhu        a5, a1, t3
                  c.srli       s0, 28
1067:             blt          t1, gp, 1072f
                  blt          a2, s3, 1080f
1069:             srli         s0, a0, 24
                  slli         sp, s9, 5
                  c.li         gp, 19
1072:             andi         a4, t4, -1626
                  addi         t3, tp, 1725
                  bltu         s1, sp, 1091f
                  sltu         a1, t2, t1
                  rem          a0, t2, s11
                  c.lui        a6, 18
                  c.addi       s11, 30
                  ori          s0, s1, 2029
1080:             add          a2, t1, a1
                  ori          t6, s3, -356
                  sltu         sp, a7, a1
                  and          gp, t2, s5
                  slt          s10, a1, t1
                  and          a3, s9, t3
                  c.li         a0, 12
                  bgeu         s4, a6, 1102f
                  slli         t0, s8, 3
                  add          t0, a4, zero
                  c.addi       a5, 27
1091:             sra          t5, t3, sp
                  srli         a2, s7, 24
                  sll          t1, a5, s3
                  lui          s1, 519588
                  xor          a4, a7, sp
                  bltu         a1, s6, 1107f
                  c.nop
                  c.and        a4, a5
                  sltiu        s11, t6, -75
                  mulh         a2, s8, a1
                  slt          a6, s6, s4
1102:             c.addi       a3, 25
                  or           a2, t5, ra
                  lui          sp, 673603
                  sub          a1, t5, t5
                  xor          t1, sp, a5
1107:             andi         s11, a2, -38
                  slli         a5, a2, 28
                  srl          s1, s0, s8
                  auipc        s1, 412360
                  bltu         s8, s11, 1118f
                  c.lui        t4, 2
                  c.add        gp, s10
                  divu         t2, s6, s2
                  mulhu        s10, a2, a3
                  c.srai       a4, 7
                  c.sub        s1, a1
1118:             div          a6, zero, s8
                  or           a1, ra, a0
                  bgeu         t0, s7, 1127f
                  blt          a4, zero, 1122f
1122:             c.addi       t3, -1
                  c.slli       t0, 13
                  slli         a1, t3, 5
                  bgeu         s0, s3, 1133f
                  sub          tp, s4, s5
1127:             blt          t4, ra, 1136f
                  c.addi16sp   sp, 496
                  c.addi4spn   a5, sp, 384
                  blt          s3, ra, 1137f
                  c.andi       a0, -1
                  c.addi16sp   sp, -16
1133:             mul          a5, tp, gp
                  auipc        a5, 1027846
                  auipc        s0, 405136
1136:             sub          s10, t4, t6
1137:             blt          s8, sp, 1148f
                  c.sub        a2, s0
                  srli         sp, a7, 19
                  c.add        a0, s5
                  andi         sp, t4, -733
                  lui          a0, 206766
                  c.addi4spn   a1, sp, 320
                  add          zero, s8, a7
                  sub          ra, tp, tp
                  bgeu         t3, s5, 1152f
                  beq          t4, s3, 1149f
1148:             divu         a3, a6, s3
1149:             beq          s5, s10, 1155f
                  lui          s1, 709814
                  c.add        sp, s10
1152:             srai         tp, zero, 26
                  or           sp, a7, s0
                  nop
1155:             nop
                  xor          a3, s1, a7
                  c.addi4spn   s0, sp, 224
                  c.addi16sp   sp, 192
                  slli         a5, t3, 14
                  srl          a6, a6, sp
                  nop
                  blt          zero, s2, 1179f
                  bge          t5, t3, 1183f
                  addi         t0, t4, 975
                  divu         s8, s1, s10
                  c.addi4spn   s1, sp, 688
                  c.sub        a3, a1
                  bltu         s0, a5, 1182f
                  c.addi16sp   sp, 240
                  remu         t6, s11, a5
                  c.srli       s0, 27
                  auipc        gp, 680028
                  auipc        zero, 148334
                  sltu         s3, t6, s5
                  xori         sp, a1, -854
                  sra          a0, a3, t5
                  nop
                  c.srai       a0, 6
1179:             c.addi4spn   a1, sp, 944
                  bge          gp, sp, 1199f
                  sll          t4, t2, a0
1182:             xori         t2, a4, -654
1183:             andi         s8, a2, -1869
                  mulhu        s4, a4, a0
                  xor          t0, a4, a4
                  c.slli       t4, 3
                  c.nop
                  c.sub        s0, a5
                  xor          t1, a7, s11
                  srli         t2, t1, 10
                  c.sub        s1, a2
                  c.sub        a5, s0
                  c.addi4spn   a0, sp, 912
                  remu         sp, s1, zero
                  sra          s10, s4, s7
                  c.sub        a2, a1
                  bgeu         s8, gp, 1214f
                  c.mv         s3, ra
1199:             sub          gp, a7, s0
                  c.or         s0, a0
                  sltiu        s10, a2, -1829
                  bne          t5, s5, 1217f
                  ori          s11, s2, 1188
                  c.srai       a5, 22
                  slli         t3, t0, 16
                  bne          a0, s5, 1223f
                  xor          sp, zero, t6
                  bgeu         t1, zero, 1228f
                  add          s11, s0, a7
                  xori         s1, s10, -1128
                  slt          s3, s9, t6
                  c.bnez       a0, 1227f
                  slli         s9, s5, 31
1214:             auipc        s1, 214355
                  c.bnez       a2, 1220f
                  sra          t5, s11, s4
1217:             c.add        t3, a5
                  sll          tp, a4, s10
                  c.sub        a1, a1
1220:             srl          s9, t1, a7
                  mul          a2, s1, zero
                  rem          t5, a2, s0
1223:             andi         t4, s1, -1756
                  slt          s4, s7, tp
                  c.li         tp, -1
                  rem          t3, s11, s1
1227:             div          ra, sp, a1
1228:             mulh         a0, a7, ra
                  rem          s6, t6, t1
                  ori          s9, t6, 41
                  c.sub        a0, s1
                  c.addi4spn   a3, sp, 896
                  slli         s9, t0, 5
                  andi         t3, sp, 1763
                  c.srai       a2, 31
                  sub          s1, t2, a0
                  or           ra, ra, t0
                  c.addi       ra, 15
                  c.andi       a1, 28
                  andi         tp, s7, 1862
                  and          s0, t1, s11
                  mul          t5, s8, a6
                  ori          t4, t1, -696
                  auipc        a3, 567069
                  add          tp, s8, a6
                  remu         a0, t0, t6
                  add          t3, gp, tp
                  div          s9, s2, zero
                  c.addi       sp, -1
                  c.beqz       a3, 1263f
                  c.addi16sp   sp, 144
                  c.sub        a1, a1
                  c.and        a0, s1
                  blt          s8, zero, 1259f
                  andi         s6, t1, 1618
                  bge          a0, t5, 1266f
                  c.lui        t4, 15
                  bne          s3, s3, 1264f
1259:             srl          a2, a0, s6
                  bne          s1, s1, 1275f
                  c.xor        a4, a2
                  mulh         t0, tp, s1
1263:             mul          t4, s9, s11
1264:             mul          ra, a7, t2
                  ori          t2, t4, 365
1266:             bgeu         s0, zero, 1274f
                  sltu         s1, zero, s4
                  c.add        a3, s0
                  mulhu        a3, a5, t5
                  c.addi16sp   sp, 32
                  mulh         s3, a6, t0
                  c.andi       s0, -1
                  c.beqz       s0, 1277f
1274:             c.lui        s1, 20
1275:             c.mv         a3, a2
                  sub          sp, zero, ra
1277:             rem          a1, t6, s3
                  add          gp, zero, ra
                  bgeu         a7, a2, 1291f
                  blt          s6, s2, 1286f
                  rem          s7, t0, t4
                  c.addi       t5, -1
                  divu         s1, a4, a0
                  c.addi       a6, -1
                  c.lui        s3, 1
1286:             mul          s9, a3, s1
                  c.andi       s0, -1
                  rem          a5, t6, s9
                  divu         s0, s6, a3
                  c.mv         a0, a0
1291:             c.add        a1, a3
                  div          a1, a5, a3
                  c.addi       s3, -1
                  bgeu         a3, t5, 1301f
                  addi         a3, a6, 571
                  nop
                  addi         a1, s3, -1294
                  bge          s7, gp, 1303f
                  c.or         a2, a2
                  div          s1, t3, s11
1301:             sra          t1, t1, t2
                  andi         t0, s0, -409
1303:             c.addi       ra, -1
                  c.beqz       a3, 1308f
                  mulhsu       t5, zero, t5
                  blt          s11, a2, 1321f
                  c.slli       s10, 5
1308:             c.sub        a5, a5
                  bne          a0, t6, 1328f
                  srli         zero, a6, 21
                  mul          s3, s5, t1
                  mulhu        a3, s3, s11
                  c.addi4spn   a2, sp, 480
                  blt          t3, a3, 1316f
                  or           a1, t6, s11
1316:             and          s9, s10, s2
                  mulhu        t2, s2, a1
                  bgeu         s2, a2, 1335f
                  beq          a7, a7, 1324f
                  sub          a6, ra, t5
1321:             c.bnez       s0, 1341f
                  divu         s6, a2, s1
                  c.andi       a2, 26
1324:             c.beqz       s0, 1330f
                  slli         sp, s0, 0
                  mulhsu       s10, t1, tp
                  c.andi       a2, -1
1328:             c.sub        a1, a3
                  beq          t4, a5, 1338f
1330:             c.sub        a4, a3
                  c.and        a2, a2
                  xori         t6, s0, 1772
                  srl          a0, a5, t3
                  and          s1, t3, t1
1335:             lui          gp, 869907
                  c.addi16sp   sp, 400
                  c.li         ra, -1
1338:             srai         s8, a5, 22
                  blt          a0, t0, 1352f
                  auipc        s3, 746251
1341:             c.and        s1, a1
                  c.srai       a3, 21
                  bgeu         a5, s9, 1353f
                  andi         t6, s0, -529
                  divu         s10, s10, s6
                  andi         t3, s6, 847
                  slti         a1, ra, 321
                  sub          s11, t6, a4
                  mul          tp, gp, s8
                  beq          a1, s3, 1357f
                  div          s1, s11, a7
1352:             ori          s1, t5, 1203
1353:             andi         s4, a2, 1713
                  bne          t3, s9, 1371f
                  mulhu        zero, a1, t6
                  slt          s0, a0, zero
1357:             c.li         s4, 16
                  blt          t1, a1, 1372f
                  c.beqz       a1, 1366f
                  slti         a5, a4, 1788
                  divu         tp, t4, s5
                  divu         s6, sp, s6
                  auipc        gp, 517402
                  c.and        a2, a5
                  c.slli       t3, 9
1366:             slti         t4, ra, -175
                  srli         t6, s8, 29
                  divu         t2, a0, a6
                  slti         s3, s0, 1702
                  c.mv         s7, a7
                  la           s0, amo_0+44 #start riscv_lr_sc_instr_stream_6
                  div          s10, s9, t1
                  srl          s9, s1, s1
                  mulhu        t6, t6, s10
                  and          t3, t4, a0
                  lr.w.rl       sp, (s0)
                  c.li         t6, 11
                  c.mv         a0, t3
                  nop
                  lui          s11, 167975
                  c.mv         t5, a1
                  sc.w.rl       s8, a1, (s0) #end riscv_lr_sc_instr_stream_6
1371:             slti         t0, zero, -221
1372:             mulh         s3, s5, a3
                  remu         t0, s1, a3
                  xor          s7, a6, a3
                  sub          s9, gp, t2
                  sltu         a2, a4, gp
                  c.lui        t1, 17
                  c.li         s4, 5
                  mul          t5, s10, a7
                  bgeu         a3, a3, 1388f
                  slti         t4, a2, 133
                  slt          a4, tp, zero
                  bltu         ra, t1, 1403f
                  sll          ra, t0, a0
                  remu         t5, tp, a2
                  c.xor        a1, a5
                  c.li         sp, 1
1388:             c.srai       s1, 19
                  c.srai       s0, 28
                  c.li         a2, -1
                  blt          s6, a3, 1397f
                  and          a6, t3, t0
                  andi         t2, a3, 1524
                  c.slli       a6, 23
                  c.addi16sp   sp, -16
                  bgeu         s1, s2, 1411f
1397:             c.and        s1, a4
                  sltiu        s0, s9, -1632
                  c.nop
                  mulhsu       tp, sp, s6
                  sll          zero, a2, s1
                  or           s9, s0, a4
1403:             divu         t0, t0, s4
                  bne          a3, t2, 1421f
                  mulhu        s6, ra, zero
                  slti         ra, a7, -818
                  bne          s3, a4, 1419f
                  or           zero, a0, t4
                  c.slli       sp, 16
                  xori         s1, s8, 457
1411:             bge          s4, t2, 1418f
                  c.and        s1, a5
                  and          sp, a4, t6
                  c.srai       s0, 11
                  beq          s8, a7, 1421f
                  c.and        a0, a1
                  divu         t1, t6, s11
1418:             ori          tp, s1, -67
1419:             rem          s3, s4, a6
                  srai         t4, a3, 2
1421:             c.lui        t3, 9
                  sltu         s8, t4, s1
                  c.bnez       a1, 1424f
1424:             c.and        a2, s1
                  mulhu        gp, a0, sp
                  c.slli       gp, 25
                  sltiu        s7, t5, -1988
                  slt          a0, t3, t3
                  c.andi       s0, -1
                  ori          a5, s5, -797
                  c.xor        a1, a0
                  and          t6, s0, s3
                  c.srli       s1, 10
                  bgeu         sp, t6, 1445f
                  div          tp, t2, s4
                  bge          s3, gp, 1444f
                  divu         a5, s7, s5
                  lui          a3, 578447
                  andi         t6, t4, 389
                  sub          t4, a6, t0
                  srli         s4, a7, 22
                  slli         tp, t2, 18
                  c.nop
1444:             slti         a0, a1, 1272
1445:             xori         t3, s5, 1042
                  sltiu        t5, t1, -1708
                  ori          a5, s4, 1153
                  c.lui        s8, 17
                  c.nop
                  ori          s0, s1, -884
                  mulhsu       s3, s0, t3
                  sub          s0, a6, t5
                  c.addi16sp   sp, 480
                  ori          a4, t5, 2014
                  bltu         t2, a1, 1470f
                  sra          a6, sp, zero
                  rem          t6, s8, s4
                  bne          a7, t2, 1464f
                  andi         a5, a2, -1882
                  mul          t4, t2, s3
                  c.lui        ra, 4
                  c.srli       a1, 19
                  c.sub        s1, a2
1464:             srai         t6, a5, 4
                  c.li         gp, -1
                  sll          t4, a1, t1
                  slli         tp, t5, 3
                  c.or         a3, a4
                  srai         a4, s2, 2
1470:             c.bnez       a2, 1477f
                  addi         t2, a0, 799
                  c.mv         a5, a4
                  div          a2, t1, s11
                  blt          s6, s7, 1481f
                  srl          s11, s4, t5
                  bne          s10, a2, 1485f
1477:             remu         a1, ra, tp
                  slt          s11, a7, a0
                  divu         a1, tp, t0
                  rem          a2, t1, s0
1481:             c.andi       a2, 8
                  remu         t1, t4, s3
                  remu         s1, t1, sp
                  or           t6, a2, s9
1485:             c.addi4spn   s1, sp, 128
                  beq          s0, s4, 1493f
                  c.and        a2, a5
                  sll          t3, tp, t3
                  c.slli       a3, 21
                  c.srai       a4, 5
                  c.addi16sp   sp, 448
                  rem          s7, tp, a5
1493:             beq          t2, ra, 1499f
                  divu         s8, s7, t4
                  c.mv         t0, a6
                  mulh         s1, t4, s2
                  slli         gp, a7, 18
                  c.add        a3, a5
1499:             bgeu         t6, s6, 1504f
                  c.addi4spn   a5, sp, 192
                  sll          zero, s2, a0
                  c.addi16sp   sp, -16
                  srai         s4, zero, 6
1504:             and          t4, a6, s8
                  c.and        s1, s0
                  sub          t4, s1, sp
                  c.or         a5, a3
                  addi         t0, a5, -1462
                  slti         a1, t0, -2017
                  slli         s7, s3, 18
                  mulhsu       a5, a0, t1
                  add          a0, s5, s4
                  mulh         t4, s1, ra
                  sltiu        t1, s3, -1647
                  c.xor        a4, a1
                  c.addi       s7, -1
                  sub          t5, s3, t1
                  srl          s7, a7, tp
                  bne          a2, s11, 1531f
                  bge          s10, a0, 1540f
                  c.and        a3, s0
                  sll          a0, t0, s1
                  c.beqz       s1, 1538f
                  xori         s1, a0, -859
                  xori         t5, t0, 1603
                  mulhsu       s6, s7, s2
                  sltiu        a4, t1, 274
                  c.addi       s4, -1
                  c.mv         a5, s5
                  slli         a5, a3, 12
1531:             mulh         s3, s2, s8
                  bgeu         a6, s0, 1546f
                  c.srli       a3, 25
                  remu         t4, a0, ra
                  beq          s1, t1, 1552f
                  mulhu        s6, t4, a1
                  c.li         s9, -1
1538:             c.slli       sp, 23
                  and          a0, s9, t5
1540:             c.nop
                  xori         a4, t4, -112
                  srli         a5, gp, 8
                  c.and        a2, s1
                  la           t2, amo_0+56 #start riscv_amo_instr_stream_3
                  la           t4, amo_0+12
                  la           t5, amo_0+20
                  amoswap.w.rl  t3, a3, (t5)
                  amomax.w.aq   s6, s7, (t5)
                  amominu.w.rl  a4, zero, (t5)
                  amomin.w.aq   a4, t6, (t5)
                  amomax.w.rl   sp, a2, (t2)
                  rem          t3, sp, t5
                  amoor.w       gp, zero, (t5)
                  amominu.w.aq  t0, s5, (t2)
                  amomaxu.w.aq  ra, s8, (t5)
                  amomaxu.w.aq  a1, a1, (t4) #end riscv_amo_instr_stream_3
                  c.sub        s0, a2
                  rem          t2, s3, a5
1546:             mulhu        t4, a6, t0
                  and          t0, s0, s6
                  c.li         s11, -1
                  blt          s7, a1, 1551f
                  or           t0, t0, t3
1551:             slli         t0, s6, 10
1552:             c.srai       a4, 3
                  ori          t1, t1, -1279
                  srai         t5, t5, 10
                  addi         t1, s7, 1206
                  divu         s4, zero, s8
                  remu         a0, a1, t0
                  div          sp, t6, s6
                  slli         a0, s2, 7
                  remu         s9, s11, gp
                  c.mv         s10, a6
                  c.lui        s8, 10
                  c.bnez       s0, 1583f
                  bgeu         s6, t3, 1581f
                  addi         t5, a2, 1515
                  bgeu         s3, s11, 1585f
                  slti         s4, a3, -1689
                  add          t3, a3, t2
                  mulhu        a5, a2, s5
                  c.mv         a1, tp
                  c.srai       a2, 7
                  xori         t5, s0, 948
                  xori         s0, t2, -1039
                  add          t6, t1, s8
                  div          s3, s5, ra
                  or           t5, t2, s9
                  remu         t6, t4, s4
                  nop
                  c.addi16sp   sp, -16
                  nop
1581:             c.add        ra, s1
                  beq          s5, t1, 1595f
1583:             bne          t0, s8, 1598f
                  sra          t3, s8, t4
1585:             andi         s1, a3, 64
                  c.li         t1, -1
                  c.lui        s4, 23
                  slt          s10, a7, a5
                  srli         s4, a2, 30
                  c.lui        a3, 12
                  sra          t3, t6, t0
                  bge          t4, s6, 1593f
1593:             andi         s4, s10, 1659
                  xor          ra, a3, s3
1595:             sra          a1, s10, t4
                  bgeu         a1, s6, 1604f
                  c.bnez       s0, 1603f
1598:             c.mv         s0, a3
                  c.bnez       s0, 1606f
                  sra          t2, s7, t2
                  sub          a5, s11, a4
                  rem          s0, s4, s11
1603:             remu         a3, s7, a0
1604:             mul          ra, s5, s7
                  c.bnez       a5, 1622f
1606:             c.addi4spn   s1, sp, 608
                  c.add        sp, t6
                  bgeu         s7, s1, 1613f
                  c.li         a2, 3
                  c.bnez       s1, 1625f
                  srli         a6, s7, 12
                  c.bnez       a1, 1618f
1613:             c.slli       sp, 27
                  slti         gp, a4, 882
                  mulhsu       t0, zero, a7
                  beq          t0, t2, 1626f
                  sra          s4, t2, s9
1618:             mul          a6, s0, a2
                  bltu         a2, s7, 1627f
                  sltiu        a4, s11, -673
                  srli         a3, s6, 0
1622:             mulhu        s10, s1, t5
                  xor          t2, t3, a2
                  rem          s9, a3, t5
1625:             or           s4, s5, tp
1626:             c.li         t3, 15
1627:             sll          zero, s2, gp
                  addi         sp, a5, 1502
                  remu         s8, t5, a5
                  sltu         s10, s11, s3
                  slli         ra, t4, 23
                  srl          s6, s9, zero
                  c.srai       a4, 24
                  c.sub        a3, a0
                  divu         gp, s6, a3
                  xor          sp, s5, sp
                  bltu         t6, s5, 1643f
                  addi         s0, s8, 111
                  div          gp, t5, a6
                  sltu         t6, a5, s2
                  c.slli       s9, 28
                  c.or         s1, s0
1643:             ori          t1, s4, -229
                  c.bnez       a4, 1655f
                  c.slli       s4, 11
                  mulhu        t2, a4, s1
                  blt          tp, s0, 1651f
                  sltu         ra, s9, a2
                  andi         t6, s2, 1813
                  c.addi       s6, 29
1651:             bge          t2, a7, 1658f
                  c.addi4spn   s1, sp, 304
                  sll          t2, t2, t5
                  mulhu        t6, a3, a2
1655:             lui          s4, 769279
                  xori         t1, s7, 805
                  c.srli       a3, 8
1658:             mul          a0, t3, s9
                  srai         s4, ra, 26
                  bge          s3, a5, 1679f
                  sub          sp, t2, a3
                  srli         a4, a0, 7
                  nop
                  sll          s9, a3, ra
                  srl          t0, s1, a5
                  c.beqz       a3, 1679f
                  mul          sp, s2, a3
                  bltu         zero, a5, 1680f
                  mulh         a5, s0, t4
                  xori         sp, t2, 436
                  c.xor        a3, a5
                  bge          a1, a5, 1689f
                  bne          t0, t3, 1675f
                  remu         ra, gp, s11
1675:             c.nop
                  sra          a1, a1, t5
                  c.sub        a0, a2
                  xori         ra, a0, 844
1679:             sll          t3, s8, a0
1680:             slt          t3, s8, zero
                  c.srai       a1, 14
                  div          a2, a6, s11
                  c.beqz       a1, 1698f
                  bge          zero, a7, 1690f
                  or           a2, s5, s0
                  mul          s10, t1, s0
                  beq          a7, t2, 1702f
                  c.and        a1, a2
1689:             remu         sp, t0, s2
1690:             slli         t4, sp, 18
                  c.sub        s0, s0
                  c.add        a4, s10
                  c.andi       a4, -1
                  c.addi4spn   s1, sp, 848
                  blt          t5, s3, 1702f
                  mulhu        sp, s9, t6
                  c.or         a3, a0
1698:             c.beqz       a4, 1703f
                  c.add        s3, s1
                  beq          s4, a0, 1708f
                  lui          s10, 739559
1702:             srai         s4, s1, 14
1703:             sltu         s6, t5, a6
                  c.bnez       a1, 1724f
                  c.and        s1, a1
                  srai         ra, s11, 0
                  sra          gp, s10, a6
1708:             lui          a1, 804142
                  c.and        s1, s1
                  xor          a5, zero, s6
                  c.mv         s6, ra
                  or           t0, zero, t4
                  c.xor        a1, a5
                  c.bnez       a2, 1731f
                  sll          tp, s7, t0
                  slt          t6, s2, s7
                  xor          a3, s6, t1
                  c.and        s1, a0
                  mulhu        a3, s6, tp
                  nop
                  c.and        s0, a5
                  mulhsu       t3, ra, s5
                  bgeu         a4, s0, 1737f
1724:             srl          s7, t1, a3
                  mulhu        s11, a4, zero
                  c.srai       s1, 14
                  auipc        zero, 1011709
                  sub          s4, t2, s10
                  mulhsu       s10, a4, s8
                  bltu         s0, a2, 1737f
1731:             sll          s7, s6, s1
                  c.slli       s4, 28
                  add          sp, a3, a6
                  and          a3, a7, s6
                  sub          gp, s4, s9
                  c.addi4spn   a2, sp, 912
1737:             c.beqz       s0, 1748f
                  or           a6, a3, sp
                  c.srai       s0, 18
                  c.or         a1, a1
                  slt          a5, a1, s3
                  bne          a5, s7, 1750f
                  xor          a3, t2, s7
                  slli         s6, a1, 15
                  mulhsu       a5, s4, a2
                  addi         s1, s2, -151
                  bgeu         t6, gp, 1753f
1748:             c.addi       t3, 17
                  sltiu        ra, t5, 114
1750:             remu         a5, sp, t5
                  slti         t1, t6, -244
                  blt          t1, a5, 1758f
1753:             xor          ra, t1, a7
                  add          s0, s6, s0
                  ori          t3, t0, -1675
                  sub          gp, t3, a6
                  sub          t5, gp, t5
1758:             slti         t6, t2, 817
                  c.andi       a5, 17
                  c.lui        s3, 19
                  slli         s3, a5, 24
                  sra          s4, t1, a6
                  c.slli       t0, 27
                  sub          t6, s11, s8
                  c.sub        s0, a4
                  c.or         a3, a0
                  srli         zero, a0, 25
                  c.addi16sp   sp, 320
                  remu         a6, s8, s7
                  xor          a4, a3, a2
                  c.mv         s8, a3
                  c.mv         gp, a5
                  c.andi       a4, 0
                  c.slli       sp, 17
                  c.mv         t1, s2
                  blt          t2, s7, 1780f
                  bge          a1, s3, 1794f
                  c.beqz       a4, 1784f
                  mul          s4, s9, s0
1780:             andi         t2, a5, 451
                  c.addi4spn   a0, sp, 928
                  sltu         s9, a1, s1
                  addi         a6, t0, -12
1784:             slli         s1, t3, 11
                  and          t3, s8, t0
                  xor          a0, t4, a2
                  slli         t6, s3, 29
                  mulhu        s9, s5, s0
                  auipc        sp, 825956
                  sltiu        t3, s9, 1827
                  c.xor        a4, a0
                  nop
                  rem          ra, s10, s5
1794:             andi         s0, s6, -26
                  srli         s0, a0, 23
                  c.addi16sp   sp, 160
                  sra          a0, a3, a4
                  ori          gp, s11, 566
                  lui          a6, 230840
                  sra          ra, s9, zero
                  slti         zero, a1, 603
                  c.li         t6, -1
                  bltu         zero, a3, 1813f
                  c.addi4spn   s1, sp, 160
                  c.mv         s8, s7
                  ori          a0, a4, -545
                  and          t1, s6, s4
                  bge          a4, s1, 1813f
                  c.add        a3, t2
                  c.sub        a5, a5
                  c.li         t0, -1
                  c.lui        tp, 19
1813:             blt          s8, a3, 1833f
                  lui          sp, 201687
                  mulh         s9, a6, a2
                  add          t2, t1, gp
                  bne          a5, t5, 1824f
                  and          s4, s3, s5
                  mulhu        t1, gp, gp
                  divu         zero, a2, gp
                  mulhsu       s9, s6, t6
                  bne          zero, a7, 1829f
                  c.mv         s9, a0
1824:             divu         t3, a5, t2
                  c.srai       a2, 27
                  remu         gp, a5, s3
                  c.andi       a5, -1
                  c.srai       a0, 13
1829:             slli         a3, zero, 2
                  sra          s9, s8, t5
                  slli         a0, s4, 25
                  sltu         s6, s11, t5
1833:             ori          a3, sp, 1987
                  rem          a6, s8, t6
                  andi         t2, t2, 1871
                  lui          s6, 383380
                  c.slli       t6, 24
                  andi         a6, t4, -334
                  c.addi16sp   sp, -16
                  c.bnez       s1, 1855f
                  nop
                  bne          s10, s8, 1851f
                  c.slli       t5, 13
                  c.srai       a2, 23
                  sll          ra, s4, a3
                  c.andi       a3, -1
                  mulhsu       t5, s5, s7
                  sltu         a3, t1, gp
                  xori         s3, t5, -388
                  mulhsu       a1, zero, s2
1851:             c.andi       a1, 9
                  mulh         s7, s8, sp
                  and          s10, s10, zero
                  c.or         a4, a0
1855:             sra          a3, t1, s10
                  sub          s8, tp, a3
                  bgeu         s0, t4, 1858f
1858:             beq          s8, zero, 1871f
                  bltu         a0, s5, 1876f
                  mulh         s10, s7, s7
                  c.mv         a0, a0
                  sra          a0, t3, t3
                  ori          t1, t6, 1313
                  mulhsu       gp, tp, t6
                  bne          t0, sp, 1882f
                  andi         a4, s11, 1322
                  slt          s0, s6, s4
                  c.sub        a3, a0
                  c.slli       s10, 28
                  lui          t2, 694485
1871:             mulhu        a0, s0, a0
                  remu         t6, a7, s1
                  slti         t2, sp, -57
                  rem          t5, t2, zero
                  c.li         ra, 24
1876:             xor          a6, zero, t0
                  c.addi       a1, 20
                  c.xor        s0, s1
                  srli         s3, a4, 4
                  c.addi4spn   a4, sp, 112
                  mulhsu       ra, t2, s0
1882:             xor          s0, a3, ra
                  sltu         s11, a1, s5
                  rem          s7, a0, s1
                  rem          a5, gp, sp
                  addi         ra, s7, 756
                  and          a0, t1, s4
                  xor          s1, s3, s2
                  c.add        ra, t2
                  srli         s7, s7, 9
                  c.sub        s1, a5
                  c.or         a5, a1
                  c.or         a1, s0
                  sltu         t5, t6, a0
                  nop
                  c.sub        a1, a2
                  c.beqz       a3, 1912f
                  beq          a1, s4, 1904f
                  blt          t6, ra, 1911f
                  c.andi       a0, -1
                  and          a1, s4, tp
                  c.bnez       a3, 1909f
                  c.srli       a5, 1
1904:             xori         t3, s11, 1511
                  srl          s1, zero, t6
                  c.andi       s0, 28
                  c.nop
                  bge          t2, t1, 1916f
1909:             srli         s6, a3, 2
                  or           a1, s10, s6
1911:             blt          zero, t2, 1916f
1912:             auipc        sp, 15557
                  c.add        t4, s2
                  c.xor        a3, a5
                  mulhu        s4, zero, zero
1916:             c.addi       s4, -1
                  c.srai       a2, 26
                  auipc        s10, 384808
                  c.beqz       a5, 1923f
                  ori          a0, s0, 295
                  auipc        s7, 1030109
                  xori         t6, zero, 1091
1923:             mul          sp, s4, sp
                  mulh         t6, a7, s3
                  c.srli       a0, 28
                  add          s3, zero, sp
                  c.li         t3, -1
                  c.xor        a5, s1
                  remu         s9, t0, s6
                  ori          t0, s11, 1578
                  c.slli       a4, 24
                  or           t4, t3, a1
                  bgeu         s11, t0, 1939f
                  c.or         a1, a4
                  c.and        s0, a3
                  sub          s8, a1, t3
                  mul          a6, t6, a4
                  rem          s6, t1, zero
1939:             c.lui        a0, 9
                  srai         t5, t3, 19
                  and          ra, a0, s6
                  c.add        sp, s0
                  lui          t4, 703259
                  srai         s10, a5, 26
                  ori          tp, zero, -299
                  c.srli       a1, 6
                  and          s8, ra, t6
                  c.add        a1, s3
                  c.or         a5, s1
                  andi         a2, zero, 491
                  divu         s0, t0, gp
                  c.andi       a5, -1
                  beq          s5, t0, 1955f
                  c.bnez       a3, 1969f
1955:             divu         zero, ra, s11
                  blt          t2, t3, 1976f
                  sll          t3, a2, ra
                  bne          s5, t3, 1965f
                  c.li         a0, 22
                  c.addi16sp   sp, -16
                  blt          s11, s10, 1976f
                  c.bnez       a0, 1968f
                  c.xor        a3, a5
                  sra          a2, s0, t0
1965:             c.slli       s9, 26
                  andi         gp, s8, 1064
                  slt          t1, ra, s3
1968:             rem          a2, zero, s7
1969:             c.srai       a2, 2
                  c.andi       a2, -1
                  sub          t5, a0, s5
                  nop
sub_4_29:         jal          ra, 13f
0:                c.jal        5f
1:                jal          t1, 4f
2:                c.j          3f
3:                jal          sp, 11f
4:                c.j          10f
5:                c.jal        7f
6:                jal          ra, 1b
7:                c.jal        14f
8:                jal          ra, 12f
9:                c.jal        6b
10:               c.j          8b
11:               c.j          9b
12:               c.jal        0b
13:               jal          ra, 2b
14:               c.andi       a3, -1
                  addi         zero, a3, -1323
                  c.addi4spn   s0, sp, 432
                  srai         tp, sp, 16
1976:             div          zero, sp, t4
                  c.sub        a4, s0
                  c.srli       a4, 19
                  c.addi4spn   a2, sp, 560
                  div          s10, a1, s5
                  c.lui        ra, 11
                  c.and        s1, a1
                  xori         a2, t1, -1455
                  c.xor        a2, a4
                  c.lui        s11, 2
                  sltiu        a5, a1, -168
                  addi         a2, a5, -250
                  c.lui        a0, 6
                  and          s11, s0, t1
                  c.slli       gp, 15
                  blt          s4, s1, 2010f
                  divu         a6, zero, t6
                  mulhu        a4, t3, s1
                  xori         s7, t6, -25
                  div          t2, a5, t0
                  c.srli       s0, 20
                  mul          a1, s5, gp
                  srl          t5, s1, a5
                  c.beqz       s1, 2008f
                  sra          t2, s4, t1
                  auipc        a5, 916136
                  bltu         s8, s7, 2019f
                  div          t5, a0, a5
                  slt          a0, s3, s5
                  c.lui        t6, 28
                  rem          tp, s6, t5
                  bltu         s0, s1, 2014f
2008:             blt          s3, s7, 2009f
2009:             srai         s1, a4, 14
2010:             sltu         ra, s6, s4
                  srli         s9, a7, 3
                  remu         t6, t6, t3
                  bge          s3, a4, 2023f
2014:             c.andi       a4, -1
                  c.add        s0, s3
                  c.addi16sp   sp, -16
                  srai         a1, s0, 11
                  slt          gp, sp, zero
2019:             c.add        a4, s2
                  divu         s1, s6, t1
                  mulh         s1, a7, t3
                  c.xor        a2, a5
2023:             c.lui        s3, 30
                  c.addi       s8, -1
                  xori         a1, s6, -1976
                  beq          s9, a1, 2034f
                  lui          s0, 349996
                  c.add        sp, s0
                  and          s3, t3, ra
                  sub          zero, t2, t4
                  c.srai       s0, 2
                  blt          s10, a3, 2043f
                  rem          sp, a1, a4
2034:             addi         gp, s1, 942
                  sltiu        a1, gp, -1975
                  c.addi16sp   sp, -16
                  beq          s4, t5, 2042f
                  c.addi       t3, -1
                  mul          a5, a4, s7
                  slti         a6, t2, -1983
                  bge          s2, t1, 2055f
2042:             sltiu        s0, s7, 175
2043:             mul          t5, s4, s0
                  blt          s1, sp, 2051f
                  slli         zero, a0, 23
                  auipc        s6, 874991
                  or           t0, t6, s1
                  c.nop
                  c.andi       a0, 20
                  c.xor        a3, a0
2051:             remu         t4, a6, s4
                  sll          s4, a0, s7
                  c.srai       a0, 14
                  slli         s8, s9, 22
2055:             c.andi       a2, 24
                  c.nop
                  andi         s1, t0, -606
                  c.add        s11, s7
                  mulhsu       s11, tp, s5
                  c.addi       s9, -1
                  c.addi16sp   sp, -16
                  sll          s11, a6, s4
                  slti         s10, s1, 1198
                  xori         a2, a7, -1993
                  c.and        a4, a2
                  sltu         a4, t5, a2
                  sltu         t4, a3, a6
                  c.srai       a1, 25
                  add          a1, s7, s2
                  bne          a6, s4, 2076f
                  sub          a2, t2, s1
                  rem          a4, t2, a4
                  c.nop
                  c.mv         t5, s11
                  add          tp, s7, t5
2076:             mul          a4, t3, a1
                  lui          sp, 833420
                  mulhsu       t3, t0, s8
                  slti         s0, s2, -1756
                  c.addi       s9, -1
                  srai         a2, zero, 19
                  andi         s4, a5, -1638
                  sll          s9, t2, t1
                  c.addi       s9, -1
                  c.xor        a0, a4
                  xor          s8, s5, t2
                  xori         a1, t3, -787
                  div          a4, gp, s8
                  mulhsu       s7, a4, tp
                  xor          s10, s3, t1
                  slti         a0, a4, 2031
                  sub          s7, t6, t2
                  ori          sp, zero, 385
                  andi         s4, s5, 575
                  addi         s0, sp, -1538
                  sll          s11, tp, t2
                  div          a2, s9, t5
                  auipc        s9, 121728
                  c.addi4spn   a3, sp, 832
                  slti         ra, s0, -1406
                  lui          s1, 954800
                  rem          t4, t1, s0
                  c.srli       a4, 21
                  mul          s0, s6, s0
                  bltu         t6, t0, 2125f
                  c.addi16sp   sp, -16
                  xori         gp, s9, 1372
                  div          s3, a7, s2
                  c.xor        s0, s1
                  c.mv         sp, t4
                  slli         s0, s8, 24
                  auipc        t2, 64025
                  c.andi       a0, -1
                  addi         ra, t0, 1443
                  c.lui        s4, 3
                  c.beqz       a5, 2125f
                  auipc        a5, 812114
                  bgeu         tp, s5, 2138f
                  c.beqz       a3, 2134f
                  lui          zero, 708824
                  blt          a0, a7, 2138f
                  srli         s0, zero, 1
                  nop
                  div          t1, a3, s2
2125:             c.bnez       s0, 2136f
                  c.slli       t5, 18
                  bltu         tp, sp, 2147f
                  andi         sp, s0, 721
                  or           s8, a1, s0
                  bne          a4, s0, 2135f
                  sltiu        s10, t1, 1589
                  c.nop
                  c.mv         t4, a2
2134:             or           s6, t4, gp
2135:             c.mv         s1, a5
2136:             beq          s0, s10, 2141f
                  sub          s9, t0, t4
2138:             andi         s9, tp, 385
                  bne          a2, s6, 2140f
2140:             remu         s8, ra, t1
2141:             bltu         t4, a2, 2147f
                  div          a6, a6, t2
                  beq          a4, a3, 2147f
                  mulhsu       s7, t4, t1
                  blt          a3, t3, 2155f
                  sub          tp, t3, sp
2147:             xor          sp, sp, a0
                  sltu         t1, s3, s4
                  c.addi16sp   sp, -16
                  xori         s10, zero, 556
                  srai         a0, tp, 7
                  srai         a0, s11, 12
                  c.nop
                  sll          a6, s1, s1
2155:             c.bnez       a4, 2172f
                  c.addi4spn   a2, sp, 96
                  mulhu        s9, t4, ra
                  bne          s9, sp, 2165f
                  beq          t4, s2, 2165f
                  c.srai       s0, 26
                  c.nop
                  ori          a3, ra, 583
                  addi         a3, s6, 1972
                  lui          a4, 780008
2165:             c.xor        a3, s0
                  c.addi16sp   sp, -16
                  mulhu        s4, s0, a7
                  c.nop
                  rem          s3, t6, s9
                  c.xor        a0, a1
                  sub          s8, s9, a1
2172:             mulhu        s10, s4, s0
                  auipc        s7, 46820
                  or           a6, t6, s1
                  remu         a2, a3, s5
                  c.srli       a5, 11
                  sltu         a5, t6, s8
                  slt          t1, sp, a3
                  add          s3, s9, s6
                  mulhsu       s7, s3, s6
                  ori          t5, s9, 888
                  la           s10, amo_0+0 #start riscv_lr_sc_instr_stream_1
                  mulhu        a6, s4, sp
                  lr.w          s1, (s10)
                  lui          t1, 554985
                  c.add        t3, a4
                  mulhsu       a4, a3, t2
                  c.add        s8, a2
                  c.or         s0, a1
                  c.addi4spn   s1, sp, 880
                  sc.w          s3, s2, (s10) #end riscv_lr_sc_instr_stream_1
                  mulh         t0, ra, a2
                  or           s7, t2, gp
                  c.nop
                  div          a5, tp, s4
                  ori          s10, s7, -156
                  c.srai       s1, 21
                  c.nop
                  c.slli       a1, 22
                  c.sub        s1, s1
                  rem          s0, t1, a5
                  mul          a2, a5, s7
                  lui          a3, 197441
                  mulhu        tp, t5, s6
                  c.andi       a5, 8
                  c.or         a3, s0
                  xori         gp, t1, 403
                  c.addi       tp, -1
                  div          t2, ra, a5
                  rem          s1, s3, s3
                  mulhsu       t0, tp, a4
                  xor          s1, s7, a3
                  bne          tp, a6, 2218f
                  c.nop
                  c.srai       s0, 8
                  srl          s10, s9, s1
                  beq          t6, s7, 2215f
                  c.lui        t2, 8
                  bne          zero, s7, 2228f
                  divu         a1, t0, sp
                  bltu         ra, t3, 2217f
                  blt          tp, a6, 2219f
                  xori         a4, s8, -1959
                  bge          s11, s0, 2221f
2215:             c.li         a1, 11
                  beq          ra, t2, 2230f
2217:             c.addi       a1, -1
2218:             and          t6, s4, a5
2219:             c.or         a2, a1
                  sltiu        zero, a7, 1722
2221:             c.addi16sp   sp, 208
                  ori          a4, t1, 1333
                  blt          tp, s0, 2235f
                  ori          a6, s10, -672
                  mulhsu       a6, t1, tp
                  xor          t2, s9, a6
                  c.mv         s8, a1
2228:             xori         ra, s8, 222
                  xor          a5, t5, t2
2230:             c.mv         s10, a0
                  c.add        s9, t1
                  srl          a2, s1, s1
                  beq          s0, t1, 2235f
                  c.srli       s1, 7
2235:             c.addi4spn   s0, sp, 192
                  bne          t0, s3, 2244f
                  c.srli       a3, 26
                  lui          a3, 442879
                  sub          s10, t2, zero
                  sll          a6, t4, a4
                  auipc        a1, 16829
                  c.bnez       a2, 2255f
                  div          ra, s7, gp
2244:             xori         s4, tp, 1072
                  blt          s4, t1, 2251f
                  sll          t1, a0, a7
                  addi         t3, s8, -1878
                  srli         s0, s0, 9
                  bgeu         a4, a4, 2266f
                  c.and        a5, s0
2251:             c.mv         a3, tp
                  c.mv         s7, a6
                  sub          t0, a0, t2
                  xor          t0, a7, s0
2255:             rem          s6, tp, ra
                  c.andi       a2, -1
                  ori          s11, t3, -1642
                  slt          a3, s7, t0
                  mulhu        s11, s11, s4
                  c.srai       a1, 28
                  c.nop
                  remu         zero, s3, s5
                  addi         s10, a7, -1611
                  slti         t2, s5, 451
                  c.mv         s11, t1
2266:             c.andi       a2, -1
                  bne          t4, t0, 2274f
                  c.and        a0, s1
                  sltu         a1, s1, gp
                  addi         s4, s2, 688
                  c.bnez       s1, 2286f
                  srl          s3, s0, a1
                  sra          ra, s4, s3
2274:             add          s0, gp, s3
                  c.sub        a4, a1
                  c.and        a4, a3
                  c.andi       s1, 26
                  xor          a5, s5, t2
                  sltu         tp, s2, ra
                  c.mv         s3, ra
                  or           s7, s4, ra
                  c.li         s3, -1
                  c.bnez       s1, 2303f
                  c.xor        a0, a0
                  slti         t0, zero, -345
2286:             ori          a1, a3, -1097
                  srl          a1, t5, s8
                  c.or         s0, a4
                  sltiu        a5, s0, -502
                  c.and        a3, a5
                  srl          s1, a7, tp
                  or           t3, t0, zero
                  c.add        s10, t5
                  c.bnez       a2, 2301f
                  c.or         a0, a0
                  ori          t5, s1, 110
                  addi         s7, s2, 1692
                  nop
                  lui          s10, 344100
                  mul          s3, a1, gp
2301:             xor          gp, t2, s11
                  lui          s6, 821114
2303:             slt          t2, a4, t0
                  c.xor        a4, s1
                  c.addi       s11, -1
                  divu         a0, sp, s7
                  slt          s9, tp, t3
                  c.lui        s1, 17
                  c.lui        a4, 2
                  ori          s1, s3, 1089
                  c.or         s1, a3
                  c.srli       a4, 30
                  c.slli       a6, 16
                  beq          a6, a0, 2316f
                  remu         s3, s6, zero
2316:             srl          ra, a6, s11
                  mul          sp, t6, t0
                  remu         s0, t5, s7
                  auipc        zero, 581740
                  c.beqz       s0, 2325f
                  slti         s8, s11, -103
                  c.addi16sp   sp, 384
                  divu         s7, t2, s0
                  mulh         a3, t3, s10
2325:             bge          t2, s1, 2331f
                  c.mv         s11, a4
                  c.xor        s1, a5
                  lui          s4, 563669
                  ori          s4, s5, 1788
                  xori         s4, t0, 800
2331:             srli         t0, gp, 8
                  c.xor        a4, a3
                  c.sub        a5, a1
                  c.slli       gp, 20
                  c.li         t0, -1
                  c.bnez       a3, 2343f
                  c.li         t0, -1
                  mulhsu       a6, s3, t0
                  or           s1, sp, t1
                  bne          zero, t1, 2347f
                  srl          t5, t3, s11
                  c.slli       s1, 7
2343:             mulh         a1, t4, zero
                  mulhsu       t1, s3, sp
                  slli         t2, a2, 17
                  bltu         a2, t1, 2351f
2347:             c.nop
                  c.addi       a2, -1
                  mul          s3, s11, s8
                  c.srli       a1, 22
2351:             sll          s11, s6, a7
                  slt          a5, s10, a3
                  sub          a4, s5, gp
                  bltu         t1, s1, 2369f
                  c.srai       a3, 6
                  c.li         t4, -1
                  xor          s7, t3, ra
                  auipc        t4, 44479
                  add          s10, t4, t0
                  c.slli       t1, 9
                  c.li         s1, -1
                  c.or         a5, s1
                  blt          t5, t2, 2369f
                  bgeu         t1, s2, 2374f
                  mulhsu       s1, a4, sp
                  lui          gp, 627255
                  add          s6, a7, s3
                  addi         ra, s4, -1744
2369:             bge          t3, t5, 2375f
                  c.addi4spn   a2, sp, 336
                  bltu         a5, s10, 2372f
2372:             div          t2, ra, s7
                  bltu         a4, t2, 2393f
2374:             c.bnez       s0, 2391f
2375:             c.add        a0, a3
                  ori          a6, s1, 1178
                  c.mv         a5, a4
                  blt          t0, s10, 2393f
                  xori         t3, a7, 1392
                  c.nop
                  c.bnez       a3, 2393f
                  blt          t1, a1, 2386f
                  nop
                  bne          t3, zero, 2397f
                  c.xor        s0, a2
2386:             srai         a1, t0, 23
                  sll          s0, s0, t2
                  mul          t2, s5, s10
                  addi         a2, s6, 1723
                  slt          t2, s0, t2
2391:             mulhsu       s4, a3, t5
                  mulhsu       t5, s4, s8
2393:             c.xor        a5, a2
                  sltu         a3, s5, t0
                  sra          a4, s0, s2
                  bgeu         tp, s2, 2413f
2397:             c.slli       s3, 9
                  c.addi       t6, 29
                  andi         t4, s11, -1702
                  blt          s4, s0, 2406f
                  c.or         s0, a2
                  c.slli       tp, 6
                  rem          zero, s7, t2
                  remu         s0, s7, t6
                  c.slli       a2, 7
2406:             c.li         gp, 6
                  c.beqz       a4, 2426f
                  c.bnez       s1, 2419f
                  mulhu        s4, t2, s2
                  slti         s8, t6, -1894
                  add          a1, sp, t6
                  c.nop
2413:             c.srai       a1, 31
                  xor          t4, a1, s5
                  srai         t3, a4, 20
                  c.nop
                  c.bnez       a5, 2431f
                  c.xor        a0, a1
2419:             sll          a6, t5, s0
                  and          a0, t0, a7
                  c.andi       a2, 22
                  c.beqz       s0, 2439f
                  c.nop
                  add          ra, s7, s6
                  sra          gp, a0, s3
2426:             c.lui        a5, 6
                  c.beqz       s1, 2442f
                  srl          ra, a0, t1
                  c.andi       a1, -1
                  srl          s6, t1, a2
2431:             bge          s0, t1, 2439f
                  sub          s0, s3, s8
                  c.addi       a4, -1
                  xor          a3, ra, a4
                  c.sub        a3, a0
                  c.nop
                  xor          a2, ra, a5
                  c.add        t1, gp
2439:             c.andi       s1, -1
                  c.bnez       a0, 2449f
                  divu         s1, t6, a3
2442:             remu         s1, s3, ra
                  andi         s0, s11, 109
                  rem          tp, a6, a2
                  or           t0, s9, ra
                  sra          sp, a0, s1
                  andi         a2, ra, 1514
                  sra          t2, a3, s8
2449:             mulh         s7, s2, s7
                  srai         sp, a7, 4
                  c.add        t2, t5
                  add          ra, s2, a0
                  sra          s3, a5, s10
                  srli         a6, a6, 1
                  mul          a3, s11, s0
                  c.addi16sp   sp, 176
                  nop
                  mulhu        s7, s7, t1
                  c.nop
                  c.xor        s1, a3
                  or           t0, a7, s9
                  add          s0, s5, t6
                  div          t2, t6, s1
                  and          s8, s11, s1
                  sltu         gp, a4, a4
                  slli         s8, s4, 6
                  c.addi16sp   sp, 432
                  c.xor        a2, a0
                  slti         s8, s6, -1180
                  mulh         s7, gp, a1
                  auipc        s10, 119248
                  mulhsu       a2, s0, s4
                  c.srli       a1, 30
                  sltiu        tp, ra, 2030
                  c.lui        a4, 6
                  c.addi16sp   sp, -16
                  bgeu         s9, s3, 2484f
                  div          t4, sp, s7
                  c.add        s10, t3
                  mulhsu       s11, t0, s4
                  bge          a3, s5, 2489f
                  mulhsu       s6, s2, t6
                  c.addi4spn   a1, sp, 128
2484:             add          t6, zero, a2
                  rem          a4, a5, s11
                  c.addi       s9, -1
                  srai         tp, a1, 26
                  bne          zero, tp, 2508f
2489:             c.addi       t0, -1
                  bge          a0, a3, 2500f
                  c.andi       a3, 11
                  c.xor        a4, a5
                  sltiu        s4, a0, 537
                  c.add        s6, a3
                  mulhsu       sp, s0, s4
                  c.beqz       a2, 2509f
                  c.addi4spn   s0, sp, 112
                  c.lui        s1, 20
                  and          a0, t0, a5
2500:             slli         s7, t1, 30
                  bltu         gp, t0, 2509f
                  add          t0, a2, s9
                  c.bnez       a5, 2511f
                  sll          t5, sp, t3
                  c.addi4spn   a2, sp, 240
                  add          t0, s2, a4
                  mul          zero, a7, s1
2508:             and          s1, s9, t1
2509:             div          s8, s7, a1
                  divu         s4, t0, s7
2511:             slti         zero, t2, -1252
                  xori         a2, zero, 1770
                  lui          s7, 760070
                  c.or         a4, s0
                  xor          a3, s5, a5
                  la           tp, region_0+735 #start riscv_hazard_instr_stream_6
                  rem          s6, t4, a0
                  lb           t1, 3(tp)
                  rem          t1, t1, a6
                  divu         a0, s6, s6
                  rem          s8, a6, s8
                  lui          s6, 432021
                  lb           a6, 10(tp)
                  sb           s6, -2(tp)
                  lbu          t1, 7(tp)
                  c.li         a0, -1
                  divu         t1, a0, s6
                  lh           a0, -15(tp)
                  c.srai       a0, 9
                  mul          s6, s8, t1
                  lw           a0, -11(tp)
                  c.nop
                  c.sub        a0, a0
                  c.or         a0, a0
                  c.xor        a0, a0
                  lhu          a0, -9(tp)
                  mulhu        s8, s8, s8
                  sb           t1, 16(tp)
                  lb           a0, -6(tp)
                  lui          s8, 822110
                  sh           s6, -13(tp)
                  lw           s8, -7(tp)
                  c.lui        t4, 30
                  c.andi       a0, 2
                  sh           t4, -1(tp)
                  lb           t1, 3(tp)
                  c.andi       a0, 12
                  slti         a6, a6, -1040
                  srli         s8, s6, 3
                  addi         a0, a6, -718
                  mulhu        t1, a6, t1
                  c.sub        a0, a0
                  lbu          a0, -14(tp)
                  mulh         t1, a6, a0
                  lb           a0, -8(tp)
                  lbu          s8, -13(tp)
                  sub          a6, s6, t4
                  remu         a0, s6, t4
                  sb           t4, -12(tp)
                  sra          s8, a0, a0
                  sub          a6, t4, a6
                  c.add        t1, s6
                  sb           a6, 4(tp)
                  mulhsu       t4, a6, t1
                  lb           t4, -6(tp) #end riscv_hazard_instr_stream_6
                  sll          t2, s8, t2
                  lui          s0, 938317
                  c.sub        a0, s0
                  srai         a4, t6, 13
                  andi         s0, a2, -27
                  xori         s1, a2, -1511
                  c.addi4spn   a0, sp, 720
                  xor          t2, s7, s11
                  bne          s6, s10, 2541f
                  c.srai       a4, 17
                  c.mv         sp, t5
                  c.sub        a3, a1
                  ori          s9, t5, 1849
                  and          s10, s9, t5
                  c.bnez       s1, 2541f
                  mulhu        a4, a0, a1
                  c.xor        s0, a5
                  c.or         a4, a1
                  xori         a4, s0, 1521
                  xori         t5, s5, -624
                  blt          t4, t2, 2548f
                  blt          gp, t2, 2543f
                  c.andi       s0, -1
                  c.slli       t4, 23
                  sra          s7, t4, s0
2541:             srli         a6, a3, 21
                  c.andi       a2, 23
2543:             slti         a4, t4, -1895
                  or           t1, s5, s11
                  c.srai       a5, 2
                  c.srai       s1, 1
                  c.srli       s1, 2
2548:             slti         ra, t2, -2013
                  c.addi4spn   s1, sp, 992
                  auipc        s10, 853570
                  c.addi       t6, -1
                  remu         s3, s1, t1
                  add          s0, s0, s4
                  c.lui        a2, 23
                  sltiu        s10, zero, -367
                  lui          t1, 326857
                  c.bnez       a2, 2572f
                  slti         sp, a0, 980
                  divu         gp, t3, t6
                  slt          a5, t5, t0
                  c.beqz       s0, 2562f
2562:             nop
                  c.li         gp, -1
                  beq          s9, s7, 2571f
                  bge          s3, s9, 2572f
                  c.sub        s0, a2
                  and          t5, t3, a3
                  srai         s8, a1, 13
                  nop
                  c.lui        gp, 8
2571:             c.srli       a0, 30
2572:             sltu         t6, a4, s9
                  slt          tp, a3, a4
                  xor          a1, ra, s6
                  c.addi       t3, 7
                  srli         ra, ra, 13
                  or           a1, s9, t0
                  c.beqz       a3, 2580f
                  c.srli       a1, 8
2580:             bltu         ra, a4, 2594f
                  c.nop
                  bne          t6, a3, 2589f
                  sra          s7, a5, s1
                  sltu         sp, s4, a5
                  mul          s6, s11, a7
                  c.addi       s4, 4
                  mulhsu       t2, gp, t6
                  c.addi       s7, 6
2589:             c.addi16sp   sp, -16
                  bgeu         a4, a3, 2595f
                  c.mv         a2, s9
                  mulhu        t1, s10, a2
                  blt          ra, t0, 2599f
2594:             nop
2595:             sltu         sp, s1, s3
                  mulhu        s6, s8, t3
                  slti         a1, t5, -742
                  andi         s9, t5, 159
2599:             c.srai       s1, 2
                  beq          a0, t1, 2604f
                  c.and        a2, a1
                  c.bnez       a5, 2607f
                  beq          t2, gp, 2612f
2604:             c.mv         a2, s9
                  sltiu        t4, s10, -357
                  c.andi       a0, -1
2607:             srli         t5, a3, 26
                  beq          zero, s11, 2614f
                  c.mv         a6, a0
                  sltu         a4, s1, zero
                  c.beqz       a0, 2628f
2612:             and          a4, t1, s4
                  c.slli       a4, 16
2614:             c.srai       s0, 16
                  c.addi       s11, 7
                  and          zero, s11, a6
                  bne          tp, t6, 2634f
                  mulh         s6, s3, t4
                  c.srli       a5, 7
                  andi         a2, sp, 154
                  addi         a3, s5, 1654
                  xor          ra, t1, a6
                  remu         t6, gp, t1
                  c.beqz       a5, 2630f
                  mulh         tp, a4, s1
                  divu         sp, t1, t4
                  c.andi       a1, -1
2628:             c.xor        a2, a0
                  c.addi16sp   sp, -16
2630:             or           s4, a2, gp
                  c.sub        a1, s0
                  andi         t0, t3, 1546
                  slli         s10, s3, 27
2634:             sub          sp, tp, s7
                  sltiu        s10, s8, -1816
                  c.srli       s1, 12
                  bltu         s9, a3, 2652f
                  slli         a1, a5, 16
                  c.addi4spn   a2, sp, 560
                  c.addi4spn   a1, sp, 160
                  c.beqz       a3, 2656f
                  c.add        a4, a0
                  sub          a0, t0, s7
                  slt          s8, s8, t2
                  add          sp, a4, s2
                  divu         t3, s0, s4
                  c.srli       a4, 3
                  or           t5, t0, a4
                  sltu         t3, s6, a6
                  bgeu         s3, s9, 2670f
                  sll          ra, s3, a0
2652:             sltu         s0, s2, a5
                  c.sub        a1, a3
                  mulhu        t4, zero, t3
                  beq          t0, a6, 2662f
2656:             add          s3, a2, t1
                  slli         s9, s11, 0
                  c.addi4spn   s1, sp, 544
                  c.mv         s4, ra
                  srl          t6, s6, gp
                  mul          s4, s4, a2
2662:             c.addi4spn   a0, sp, 928
                  sll          a6, s2, zero
                  srl          ra, a6, t5
                  remu         s11, t1, s2
                  slli         s10, t4, 6
                  rem          t1, s7, s9
                  divu         a1, t0, gp
                  divu         a0, tp, a0
2670:             c.beqz       a5, 2689f
                  remu         a1, gp, gp
                  slli         a1, s0, 17
                  rem          t0, t3, s7
                  xori         s1, a5, 63
                  andi         s10, a2, -1669
                  c.add        ra, s7
                  and          a3, s6, t1
                  c.sub        s1, a3
                  bgeu         a0, t6, 2686f
                  ori          a4, a7, -196
                  mul          a3, t1, a3
                  beq          a7, a2, 2687f
                  lui          gp, 459554
                  sub          s0, a2, t3
                  c.addi       a3, -1
2686:             c.slli       sp, 21
2687:             c.slli       gp, 5
                  c.mv         t0, s11
2689:             c.bnez       s1, 2698f
                  bne          s2, s2, 2705f
                  mul          sp, a1, s0
                  c.srli       s1, 12
                  xori         s10, a4, -1445
                  c.beqz       a0, 2702f
                  andi         a5, s11, -1040
                  sltiu        s3, a3, 1542
                  c.addi       s11, -1
2698:             blt          s7, zero, 2704f
                  c.add        s0, a0
                  sll          t5, t5, a6
                  bne          a4, s11, 2707f
2702:             xori         s1, s7, -431
                  or           a5, a4, a3
2704:             remu         a6, zero, s8
2705:             srai         s4, s2, 4
                  c.mv         a1, t1
                  addi         s11, zero, -4 #init loop 1 counter
                  nop
                  addi         sp, zero, -6 #init loop 1 limit
                  mulh         a6, t6, a4
sub_4_55_1_t:     lui          s10, 388700
                  c.srli       a1, 21
                  c.lui        s4, 28
                  addi         ra, s10, 848
                  addi         s11, s11, -9 #update loop 1 counter
                  addi         tp, zero, -2 #init loop 0 counter
                  c.srai       a4, 1
                  c.slli       gp, 26
                  c.add        a5, s1
                  mulh         a2, s2, sp
                  c.srai       a3, 27
                  andi         t5, t3, -722
                  addi         s1, zero, -1 #init loop 0 limit
                  lui          gp, 240364
sub_4_55_0_t:     and          ra, tp, t2
                  addi         tp, tp, 1 #update loop 0 counter
                  c.srli       a4, 7
                  slli         t5, a2, 16
                  ori          s4, s9, 143
                  beq          tp, s1, sub_4_55_0_t #branch for loop 0
                  slt          t6, a0, t1
                  bge          s11, sp, sub_4_55_1_t #branch for loop 1
                  or           a5, s2, sp
2707:             srl          t3, sp, t4
                  c.or         a2, a2
                  c.srai       a3, 27
                  c.or         a1, s0
                  divu         t5, a6, s1
                  sll          s10, s10, t6
                  ori          s11, s7, -1122
                  mulhsu       a0, zero, t3
                  c.srli       s0, 26
                  srli         t5, a1, 1
                  srl          s10, ra, s8
                  c.andi       s0, 31
                  c.lui        s1, 17
                  c.and        a5, a4
                  or           t0, s8, s2
                  sltu         sp, s6, a7
                  c.andi       a4, 18
                  c.andi       s1, -1
                  xor          s11, tp, s5
                  c.srai       a1, 2
                  beq          sp, a2, 2741f
                  c.xor        s0, a2
                  c.add        s11, tp
                  c.andi       s0, 29
                  or           ra, zero, a0
                  c.li         a1, 31
                  bltu         t1, t1, 2746f
                  c.lui        s0, 22
                  xor          a0, s10, t6
                  c.or         a0, a1
                  and          a3, s2, t1
                  blt          t5, s3, 2753f
                  srli         a2, t3, 20
                  xor          a4, s11, s1
2741:             srl          t4, zero, zero
                  c.and        a4, s0
                  c.slli       a6, 7
                  rem          a5, s5, a7
                  mulh         s9, sp, s1
2746:             andi         t2, t0, -1787
                  c.addi16sp   sp, 256
                  slt          t0, s4, s8
                  bgeu         s11, t5, 2755f
                  mul          sp, tp, s2
                  bltu         a7, s0, 2755f
                  bltu         s8, s0, 2767f
2753:             c.or         s0, a3
                  rem          t5, t4, s7
2755:             auipc        s1, 133868
                  slti         s11, gp, 650
                  slti         t0, t4, -1786
                  add          a6, a0, s1
                  c.lui        a4, 6
                  div          ra, s5, s3
                  nop
                  c.srai       s1, 17
                  mulhu        s6, zero, a1
                  mulhsu       s9, s9, ra
                  srli         a0, s9, 25
                  slt          s8, a7, a1
2767:             c.li         s6, -1
                  slt          t5, t2, ra
                  c.srai       s0, 11
                  lui          a5, 443030
                  c.srai       a0, 6
                  c.beqz       a2, 2784f
                  c.beqz       a4, 2790f
                  or           t5, a1, s7
                  xor          t0, s10, s7
                  addi         t6, s8, 1572
                  c.bnez       a4, 2784f
                  add          zero, a6, t6
                  srai         s7, tp, 30
                  c.srai       a5, 1
                  c.mv         s1, s2
                  c.srai       s1, 19
                  or           a4, gp, t0
2784:             sll          t0, s7, a7
                  sub          a5, a7, a3
                  c.xor        s1, a1
                  rem          s0, a0, a0
                  slt          s9, s3, s6
                  mulhsu       s6, s4, a2
2790:             add          sp, t2, s2
                  c.li         s7, -1
                  c.and        a5, a3
                  rem          t6, s3, a1
                  c.sub        a3, a4
                  slli         t5, zero, 0
                  c.mv         gp, s3
                  srai         t0, s3, 29
                  c.addi16sp   sp, 224
                  c.srli       a1, 3
                  xori         a6, sp, 897
                  or           t0, s9, a5
                  blt          s9, s0, 2820f
                  c.srli       s1, 9
                  bgeu         tp, s5, 2806f
                  c.bnez       a4, 2820f
2806:             mulhsu       t5, s0, a2
                  c.nop
                  sltu         t0, t0, s6
                  xor          s4, a6, t5
                  sltiu        a2, t1, -992
                  add          s6, s9, sp
                  addi         tp, t2, -396
                  mulh         s4, s6, gp
                  sub          t6, s9, s8
                  nop
                  sltiu        sp, s3, -894
                  remu         ra, s5, t6
                  bltu         s11, t3, 2820f
                  bgeu         s4, s6, 2820f
2820:             mul          s10, t2, t5
                  addi         t5, t2, 1148
                  c.lui        tp, 11
                  lw           ra, 4(s5)
                  ori          s7, s9, -1134
                  sltu         t2, t6, tp
                  divu         tp, tp, s11
                  ori          a0, s5, -143
                  div          a3, s5, zero
                  addi         s5, s5, 24
                  divu         s4, t2, a7
                  mulhsu       t1, t2, a6
5167:             addi x24, x1, 1
5167:             jalr x24, x24, 0
sub_2:            rem          s1, a6, a0
                  sra          gp, gp, s10
                  ori          a1, ra, 1868
                  bge          t0, s10, sub_2_stack_p
                  lui          a1, 134553
sub_2_stack_p:    addi         s5, s5, -60
                  c.or         s0, s1
                  c.slli       s11, 25
                  mul          a1, s4, a1
                  c.lui        t3, 22
                  sw           ra, 4(s5)
                  c.and        s0, a3
                  or           s11, s5, s5
                  la           t0, amo_0+44 #start riscv_amo_instr_stream_5
                  amoand.w      t4, a5, (t0)
                  xor          t5, a3, t5
                  mul          a2, a0, s5
                  xor          zero, s1, s1
                  amoswap.w     a3, a1, (t0)
                  amoswap.w     a5, gp, (t0)
                  or           s1, a0, zero
                  amomin.w.rl   a4, s10, (t0) #end riscv_amo_instr_stream_5
                  la           sp, region_0+1246 #start riscv_load_store_hazard_instr_stream_11
                  lbu          t4, -105(sp)
                  div          tp, t3, s5
                  c.srli       a2, 22
                  lbu          s3, -105(sp)
                  lb           zero, -105(sp)
                  c.andi       a3, 29
                  lb           t0, -105(sp)
                  lb           s3, -105(sp)
                  lb           s3, -105(sp)
                  sb           t2, -105(sp)
                  lbu          a1, -105(sp)
                  lb           s1, -105(sp)
                  ori          a1, a1, 1837
                  lb           t4, -105(sp)
                  lb           s0, -105(sp)
                  lb           s0, -105(sp)
                  sb           s1, -105(sp)
                  lbu          s1, -105(sp) #end riscv_load_store_hazard_instr_stream_11
                  la           s11, region_1+431 #start riscv_load_store_hazard_instr_stream_17
                  xori         ra, t4, -1911
                  lbu          s10, -38(s11)
                  sb           s9, -52(s11)
                  sb           a7, 64(s11)
                  lh           t0, -17(s11)
                  sh           t0, -17(s11)
                  lbu          s9, -17(s11)
                  lhu          a5, -53(s11)
                  sh           s5, -53(s11)
                  lhu          a2, -53(s11)
                  lh           s3, -53(s11)
                  lh           s10, -53(s11)
                  sh           s9, -41(s11)
                  lh           s10, -41(s11)
                  lhu          a5, -13(s11)
                  sh           s6, 11(s11)
                  lh           s6, 11(s11)
                  lh           a0, 11(s11)
                  lbu          t4, 11(s11)
                  sw           t4, -23(s11)
                  lb           a4, -24(s11) #end riscv_load_store_hazard_instr_stream_17
sub_2_50:         jal          ra, 13f
0:                c.jal        6f
1:                c.jal        5f
2:                c.jal        8f
3:                c.j          14f
4:                jal          ra, 7f
5:                jal          tp, 3b
6:                c.jal        2b
7:                jal          gp, 11f
8:                c.j          15f
9:                jal          ra, 16f
10:               c.jal        17f
11:               jal          ra, 12f
12:               c.jal        10b
13:               c.j          4b
14:               c.j          20f
15:               c.j          19f
16:               c.jal        0b
17:               jal          t1, 18f
18:               c.jal        21f
19:               c.jal        1b
20:               c.jal        22f
21:               c.j          9b
22:               auipc        t5, 951739
                  la           a6, region_0+11 #start load_store_instr_stream_1
                  lb           a1, 1878(a6)
                  la           gp, region_0+1904 #start load_store_instr_stream_0
                  lbu          t2, 550(a6)
                  lhu          t2, -12(gp)
                  lh           t5, 6(gp)
                  sb           t3, -14(gp)
                  lhu          t3, 1741(a6)
                  lh           s11, 10(gp)
                  lb           s0, 1628(a6)
                  lb           a1, 10(gp)
                  lbu          zero, 7(gp)
                  lh           s10, 823(a6)
                  lbu          t0, 8(gp)
                  sb           ra, 5(gp)
                  lh           s4, 1421(a6)
                  lb           s3, -13(gp)
                  sb           s9, 144(a6) #end load_store_instr_stream_1
                  lw           zero, 8(gp) #end load_store_instr_stream_0
                  la           a2, region_0+148 #start riscv_load_store_rand_instr_stream_4
                  lbu          s11, -2(a2)
                  rem          gp, s7, s3
                  c.addi       a4, -1
                  lb           s4, 13(a2)
                  c.slli       s10, 30
                  sra          t6, zero, a3
                  div          s7, s10, s4
                  mulh         a5, gp, s2
                  sb           s6, 15(a2)
                  mulh         t6, s3, a3
                  mulhu        s0, s9, s9
                  c.and        a5, a2
                  mulhu        t2, a0, zero
                  c.add        a5, t0
                  lbu          a3, 7(a2)
                  ori          s7, ra, -1278
                  lb           s3, -7(a2)
                  sltu         gp, sp, zero
                  xori         s9, a2, -257
                  sb           s7, -14(a2)
                  lb           gp, 10(a2)
                  slti         s8, sp, -1447
                  lbu          s7, -12(a2)
                  sb           s0, -11(a2)
                  lbu          sp, -5(a2)
                  lbu          a6, -5(a2)
                  mulhu        t2, s1, a5
                  xori         a4, s11, 1272
                  auipc        zero, 730202
                  sltiu        s3, s1, -2043
                  rem          s1, s3, a7
                  lbu          a4, 9(a2)
                  lb           s11, 15(a2)
                  lb           s7, 5(a2)
                  lb           s11, -11(a2)
                  andi         t1, a4, -1216
                  lb           t4, 10(a2) #end riscv_load_store_rand_instr_stream_4
                  la           s4, amo_0+20 #start riscv_lr_sc_instr_stream_11
                  mul          s1, a2, zero
                  srai         s8, s3, 24
                  lr.w.rl       s7, (s4)
                  c.srai       a2, 3
                  andi         t3, s1, 1906
                  srli         t4, t0, 29
                  c.andi       a3, 12
                  c.srai       a1, 10
                  sc.w.aq       s0, a5, (s4) #end riscv_lr_sc_instr_stream_11
                  la           sp, region_1+1635 #start riscv_load_store_rand_instr_stream_14
                  add          s3, sp, a6
                  lbu          a3, -29(sp)
                  lb           s9, -57(sp)
                  lw           s7, 57(sp)
                  sh           s10, 63(sp)
                  c.slli       s3, 12
                  and          s11, a6, a0
                  div          s9, a5, sp
                  sb           s0, -56(sp)
                  lb           ra, 8(sp)
                  lh           a5, -9(sp)
                  nop
                  c.li         t5, -1
                  c.nop
                  lui          tp, 481907
                  c.and        a3, a3
                  rem          t3, s6, s10
                  lui          s11, 218431
                  lbu          ra, 48(sp)
                  c.addi       a1, 29
                  and          gp, ra, zero
                  lh           t1, 37(sp)
                  lhu          s11, -37(sp)
                  and          a0, t5, a3
                  c.nop
                  sltiu        s6, tp, 1308
                  lbu          s4, 20(sp)
                  rem          t1, a0, t2
                  sb           s9, -12(sp)
                  sb           t5, -10(sp)
                  addi         tp, a7, 1224
                  sb           s6, 27(sp)
                  srli         a4, a3, 30
                  lb           t4, -39(sp)
                  lb           t0, 24(sp)
                  c.lui        a0, 29
                  ori          s1, sp, 652
                  sb           s0, 42(sp)
                  div          s7, a0, t2
                  mul          a4, a6, a1
                  sra          t5, s6, s11
                  srl          t6, t1, a5
                  rem          s10, a4, s2
                  lbu          t4, 28(sp) #end riscv_load_store_rand_instr_stream_14
                  la           s9, region_1+777 #start riscv_hazard_instr_stream_13
                  lbu          a5, 810(s9)
                  lh           t2, 233(s9)
                  lbu          t2, -136(s9)
                  c.and        a1, a5
                  mulh         zero, a6, a1
                  lhu          ra, 953(s9)
                  lb           a6, -234(s9)
                  lh           a1, 261(s9)
                  lbu          a6, 38(s9)
                  c.lui        ra, 6
                  c.srli       a5, 2
                  sltu         a1, a5, ra
                  lbu          a1, 855(s9)
                  c.nop
                  c.srai       a5, 22
                  c.slli       a5, 2
                  slt          zero, t2, a5
                  srli         a1, a6, 16
                  c.lui        a6, 13
                  lb           a5, 1216(s9)
                  sltiu        t2, t2, -439
                  slt          ra, ra, ra
                  lbu          t2, -382(s9)
                  srai         ra, zero, 9
                  divu         zero, a6, zero
                  c.slli       a5, 12
                  lw           zero, 415(s9) #end riscv_hazard_instr_stream_13
                  la           t5, region_0+133 #start load_store_instr_stream_1
                  la           t0, region_1+1757 #start load_store_instr_stream_0
                  sb           s10, 1852(t5)
                  lb           s4, 1304(t5)
                  lb           s7, 9(t0)
                  lb           s0, 202(t5)
                  sh           zero, 995(t5)
                  sb           s5, 796(t5)
                  sb           s8, 581(t5)
                  lb           sp, 31(t0)
                  lhu          s8, 1079(t5)
                  lw           t6, 1539(t5)
                  lh           a2, -39(t0)
                  lbu          a5, 1172(t5) #end load_store_instr_stream_1
                  lw           t6, 59(t0)
                  lb           s1, -22(t0)
                  sb           s4, -53(t0) #end load_store_instr_stream_0
                  la           sp, region_1+907 #start riscv_hazard_instr_stream_6
                  c.and        a1, a1
                  ori          s7, a1, -786
                  lbu          t0, -22(sp)
                  c.sub        a1, a0
                  divu         t0, a1, t3
                  c.nop
                  rem          t0, s7, s7
                  lh           t3, 41(sp)
                  c.nop
                  mulhu        a0, s7, a1
                  div          a0, s7, t1
                  c.srli       a0, 22
                  lh           t3, 27(sp)
                  lb           s7, -24(sp)
                  lb           t3, -46(sp)
                  addi         t0, s7, 104
                  sb           t1, 34(sp)
                  c.mv         t1, a1
                  lbu          a1, -24(sp)
                  andi         t1, a0, 1743
                  lh           a0, -9(sp)
                  c.add        t3, t0
                  c.addi       t3, 3
                  sltiu        s7, t3, -1700
                  mul          t0, t3, a0
                  and          a0, s7, t3
                  nop
                  lbu          a1, 14(sp)
                  srai         a0, a0, 29
                  sb           t3, -49(sp)
                  c.srai       a0, 1
                  sb           a0, 58(sp)
                  c.xor        a1, a1
                  mulh         a1, t3, a1
                  ori          a1, t1, 802
                  c.slli       t3, 2
                  sll          a1, t3, t0
                  c.or         a1, a0
                  lbu          s7, 28(sp)
                  lbu          a0, -20(sp)
                  add          a1, s7, t0
                  lb           t0, -31(sp) #end riscv_hazard_instr_stream_6
                  la           tp, region_1+1107 #start load_store_instr_stream_1
                  sh           t4, -1031(tp)
                  sw           s9, -819(tp)
                  lbu          s6, -288(tp)
                  la           gp, region_0+366 #start load_store_instr_stream_0
                  lh           a6, -977(tp)
                  sb           a1, 189(tp)
                  sb           s4, 694(tp)
                  lb           s3, 31(gp)
                  lbu          a2, 702(tp)
                  lbu          s10, 32(gp)
                  lb           s8, -281(tp)
                  lbu          t5, 48(gp)
                  lbu          sp, -22(gp)
                  lbu          a5, -33(gp)
                  sh           s9, -1083(tp)
                  sb           s8, -960(tp) #end load_store_instr_stream_1
                  lhu          s10, 58(gp) #end load_store_instr_stream_0
                  addi         t3, zero, -8 #init loop 1 counter
                  c.and        a5, a4
                  addi         tp, zero, 7 #init loop 1 limit
                  c.or         a5, a0
sub_2_116_1_t:    c.lui        a3, 17
                  addi         t3, t3, 5 #update loop 1 counter
                  c.nop
                  addi         ra, zero, -10 #init loop 0 counter
                  c.addi4spn   a1, sp, 832
                  c.li         a4, -1
                  addi         t5, zero, -12 #init loop 0 limit
sub_2_116_0_t:    c.addi       s0, -1
                  addi         ra, ra, -10 #update loop 0 counter
                  bge          ra, t5, sub_2_116_0_t #branch for loop 0
                  c.srli       a0, 3
                  beq          t3, tp, sub_2_116_1_t #branch for loop 1
                  c.srli       a4, 27
                  la           a5, amo_0+16 #start riscv_lr_sc_instr_stream_6
                  lr.w.rl       a4, (a5)
                  sc.w.rl       t1, ra, (a5) #end riscv_lr_sc_instr_stream_6
                  la           s11, amo_0+36 #start riscv_lr_sc_instr_stream_14
                  lr.w.aq       tp, (s11)
                  c.lui        t4, 6
                  rem          t1, a2, s1
                  slli         sp, a7, 16
                  sc.w.aq       t5, a2, (s11) #end riscv_lr_sc_instr_stream_14
                  la           sp, region_1+1018 #start load_store_instr_stream_1
                  lw           s10, -634(sp)
                  la           a5, region_0+107 #start load_store_instr_stream_0
                  lbu          s10, 20(a5)
                  lbu          s9, -129(sp)
                  lb           s4, -431(sp)
                  lbu          tp, -440(sp)
                  sb           t0, 487(sp)
                  lh           t5, 3(a5)
                  sb           s7, -972(sp)
                  lb           a6, 436(sp)
                  lhu          a4, 41(a5)
                  lbu          t2, -197(sp)
                  sb           a0, 377(sp)
                  sh           t6, -11(a5)
                  lbu          gp, -828(sp) #end load_store_instr_stream_1
                  sh           sp, -57(a5) #end load_store_instr_stream_0
                  la           s6, region_0+962 #start load_store_instr_stream_1
                  lbu          ra, -489(s6)
                  la           s8, region_0+1027 #start load_store_instr_stream_0
                  sb           zero, -102(s6)
                  sh           t3, 414(s6)
                  sh           gp, 990(s6)
                  sw           s5, 25(s8)
                  sh           s5, -196(s6)
                  lb           a6, 16(s8)
                  lh           s4, -884(s6)
                  sb           s10, -158(s8)
                  sb           a3, -596(s6)
                  lb           s3, -18(s8)
                  lbu          t3, -222(s8)
                  lbu          a0, -433(s6)
                  sb           a0, 57(s6)
                  lhu          s7, 418(s6) #end load_store_instr_stream_1
                  lb           s7, 54(s8) #end load_store_instr_stream_0
                  la           t2, region_0+1486 #start load_store_instr_stream_0
                  la           ra, region_1+673 #start load_store_instr_stream_1
                  lb           t4, 15(t2)
                  sb           a6, 7(t2)
                  lh           a5, -31(ra)
                  lhu          a3, -16(t2)
                  sb           ra, 13(ra)
                  lw           s6, 14(t2)
                  sb           t2, -14(t2)
                  lbu          tp, -48(ra)
                  sb           s7, -6(ra)
                  lb           s1, -1(t2)
                  lbu          t1, -38(ra) #end load_store_instr_stream_1
                  lb           s9, -3(t2)
                  sb           t3, -16(t2) #end load_store_instr_stream_0
                  la           sp, region_0+1591 #start riscv_load_store_hazard_instr_stream_8
                  lb           t3, -23(sp)
                  lbu          a1, -70(sp)
                  c.add        tp, a0
                  lbu          s9, -26(sp)
                  lb           s7, -26(sp)
                  c.nop
                  c.nop
                  sb           s11, -98(sp)
                  lbu          s6, 180(sp)
                  c.addi       gp, 22
                  lbu          a3, 129(sp)
                  lb           a2, 129(sp)
                  sh           t6, 113(sp)
                  lh           s10, -215(sp)
                  lbu          a6, -96(sp)
                  lb           a2, -96(sp) #end riscv_load_store_hazard_instr_stream_8
                  la           tp, amo_0+60 #start riscv_lr_sc_instr_stream_1
                  lr.w.rl       s0, (tp)
                  lui          t4, 860366
                  sc.w.rl       gp, s9, (tp) #end riscv_lr_sc_instr_stream_1
                  la           ra, region_1+402 #start riscv_load_store_rand_instr_stream_5
                  remu         a4, tp, a2
                  xor          s8, a6, t6
                  c.srai       s0, 14
                  lbu          sp, -5(ra)
                  mul          gp, a3, s6
                  lbu          s7, 22(ra)
                  divu         t0, t2, s5
                  sltu         a3, sp, a4
                  c.nop
                  c.nop
                  srai         a2, a3, 20
                  c.nop
                  sltiu        a6, s9, -1583
                  xori         s6, a3, 962
                  sb           a7, 37(ra)
                  sltiu        a6, a1, -286
                  lh           a0, -4(ra)
                  xori         s0, s9, -162
                  lbu          t6, -48(ra)
                  mulhu        s9, s5, s2
                  addi         a4, s9, 148
                  c.sub        a5, a0
                  andi         a0, a2, 780
                  lbu          a4, -27(ra)
                  divu         tp, t6, a7
                  divu         t1, a6, s11
                  c.andi       a2, 1
                  sb           t0, 4(ra)
                  slti         gp, ra, 1435
                  slt          t0, a3, t1
                  lb           a0, 29(ra)
                  lh           t6, -24(ra)
                  sh           a7, -64(ra)
                  and          s9, a4, s11
                  c.sub        a2, a1
                  c.srai       s0, 13
                  sh           s2, 26(ra) #end riscv_load_store_rand_instr_stream_5
                  la           sp, region_0+347 #start riscv_load_store_rand_instr_stream_7
                  lbu          s10, 216(sp)
                  sb           ra, -196(sp)
                  sw           t2, -243(sp)
                  mulhsu       t0, s3, a7
                  lw           a4, -247(sp)
                  lbu          s1, 26(sp)
                  lbu          s6, -208(sp)
                  mulhu        ra, t1, t2
                  sh           a1, -169(sp)
                  c.or         a4, a4
                  sb           s6, 173(sp)
                  lb           s4, -34(sp)
                  lb           t3, 94(sp)
                  lbu          ra, 70(sp)
                  lb           s1, -33(sp)
                  nop
                  lbu          t3, -54(sp)
                  lw           s1, -15(sp)
                  sb           s6, 24(sp)
                  sb           s5, 209(sp)
                  sh           s6, 33(sp)
                  mul          tp, a3, gp
                  lb           s0, -203(sp)
                  c.or         a3, a0
                  lbu          s6, 16(sp)
                  sb           a6, 228(sp)
                  c.add        s8, s1
                  mulh         a1, t3, s5
                  lbu          a6, 252(sp)
                  lb           t5, 211(sp)
                  lbu          s0, 179(sp)
                  sb           a1, -152(sp)
                  lbu          gp, -105(sp)
                  sb           zero, -20(sp)
                  c.sub        s0, a0
                  lb           s11, 54(sp)
                  srai         t2, a6, 22
                  c.andi       a4, 19
                  lb           s10, -168(sp) #end riscv_load_store_rand_instr_stream_7
                  addi         sp, zero, 9 #init loop 0 counter
                  mulh         t3, sp, s9
                  mulhu        a2, s11, t3
                  addi         s8, zero, 3 #init loop 0 limit
                  srli         s1, s0, 1
                  c.or         a0, a0
                  nop
sub_2_118_0_t:    ori          a0, s0, 908
                  c.and        a0, a3
                  nop
                  rem          t5, s2, s3
                  sub          a6, s7, s4
                  mulh         a5, a5, a5
                  addi         sp, sp, -2 #update loop 0 counter
                  sltu         a0, a6, s2
                  slti         t3, s5, 1024
                  nop
                  mulhu        a0, s2, s1
                  xor          t3, s2, s8
                  c.andi       a3, -1
                  srli         ra, s4, 17
                  lui          a4, 93558
                  c.li         a6, -1
                  slli         zero, s9, 9
                  sltu         tp, a4, t3
                  xor          a1, a0, a6
                  mul          t0, a5, sp
                  divu         t1, a5, s11
                  bgeu         sp, s8, sub_2_118_0_t #branch for loop 0
                  mulhu        s11, t0, s6
                  la           sp, region_1+456 #start riscv_load_store_rand_instr_stream_3
                  lui          t2, 865468
                  remu         a1, s7, a3
                  div          gp, t3, t4
                  c.swsp       s10, 4(sp)
                  xor          s0, t0, s7
                  lhu          s4, -50(sp)
                  srai         a5, s1, 8
                  sra          s6, a2, s6
                  lbu          t2, -56(sp)
                  lbu          gp, -5(sp)
                  sub          a3, s8, t4
                  lb           a0, 14(sp)
                  lbu          t4, 13(sp)
                  lbu          s3, -18(sp)
                  lbu          s9, -1(sp)
                  lhu          t6, 54(sp)
                  lb           t3, -31(sp)
                  lbu          t2, -13(sp)
                  auipc        s7, 862311
                  sw           gp, -36(sp)
                  slti         tp, a6, 1935
                  xori         t6, t3, 770
                  c.swsp       a4, 60(sp)
                  c.swsp       a1, 60(sp)
                  c.lwsp       a4, 4(sp)
                  and          a2, a6, s3
                  c.swsp       s3, 40(sp)
                  sltiu        a1, s7, 1928
                  sltu         a2, ra, tp
                  andi         a1, t4, 1353
                  sub          s1, s1, s8
                  andi         a2, s10, -314
                  andi         s10, s1, -1691
                  c.lwsp       t1, 28(sp)
                  xori         a5, s9, -1390
                  c.xor        a5, a2
                  c.nop
                  lhu          s6, -52(sp)
                  c.lwsp       a0, 0(sp)
                  remu         ra, zero, t4
                  c.and        s0, a1
                  sb           s3, 19(sp) #end riscv_load_store_rand_instr_stream_3
                  addi         s0, zero, 10 #init loop 0 counter
                  c.nop
                  addi         zero, zero, 0 #init loop 0 limit
                  mulh         a5, s7, a5
                  c.xor        a5, a2
sub_2_109_0_t:    ori          s9, s8, 1787
                  sltiu        t5, s4, -19
                  lui          t2, 235872
                  addi         s0, s0, -5 #update loop 0 counter
                  c.xor        a2, s1
                  c.beqz       s0, sub_2_109_0_t #branch for loop 0
                  c.nop
                  la           s10, region_0+344 #start load_store_instr_stream_4
                  la           a1, region_0+421 #start load_store_instr_stream_3
                  la           sp, region_0+1020 #start load_store_instr_stream_2
                  la           gp, region_0+650 #start load_store_instr_stream_1
                  la           s9, region_0+390 #start load_store_instr_stream_0
                  lhu          a4, 3(a1)
                  sb           a4, 63(gp)
                  lbu          s6, -49(s10)
                  lhu          s8, -13(a1)
                  sh           zero, 1314(s9)
                  lbu          s11, 2(a1)
                  sb           s4, 40(s10)
                  lb           t0, -196(sp)
                  lhu          t0, 254(sp)
                  lbu          s4, 13(gp)
                  lbu          s0, -296(s9)
                  sb           s7, 3(a1)
                  lh           s8, 54(s10)
                  lbu          ra, -91(sp)
                  sb           s4, 43(gp)
                  lh           s6, -44(s10)
                  lhu          s4, -232(sp)
                  lbu          a4, 105(sp)
                  lbu          s1, 16(a1)
                  lb           s0, 629(s9)
                  sh           tp, 32(s9)
                  sb           s3, 121(s9)
                  lh           t5, -42(gp)
                  sh           s10, 938(s9)
                  lw           a3, 10(gp)
                  sh           a7, 156(sp)
                  lb           t6, -21(gp)
                  lhu          s1, 15(a1)
                  sb           sp, 451(s9)
                  lbu          t6, -39(s10)
                  sh           s9, 14(s10)
                  lbu          s7, 2(a1) #end load_store_instr_stream_3
                  lbu          ra, -47(s10)
                  lhu          t2, -18(s10) #end load_store_instr_stream_4
                  sb           s9, -150(sp)
                  lb           a0, 18(gp) #end load_store_instr_stream_1
                  lhu          s6, -242(sp) #end load_store_instr_stream_2
                  lb           a2, 487(s9) #end load_store_instr_stream_0
                  la           s0, region_0+188 #start riscv_hazard_instr_stream_8
                  sb           a0, -151(s0)
                  lb           s3, 219(s0)
                  c.lui        t5, 18
                  remu         t5, a2, a2
                  lbu          a2, 139(s0)
                  c.slli       a0, 21
                  sltu         a2, s1, a2
                  remu         a0, s3, s3
                  sltiu        s3, t5, -504
                  lh           a2, -174(s0)
                  c.xor        a0, s1
                  lhu          a2, 62(s0)
                  xori         s10, s10, -263
                  sb           s1, 125(s0)
                  sb           t5, -135(s0)
                  lbu          s3, -132(s0)
                  xor          t5, s3, t5
                  sw           a2, 224(s0)
                  lbu          s1, -99(s0)
                  lb           s1, 155(s0)
                  lw           a0, -180(s0)
                  slt          t5, a2, a0
                  lbu          s10, -148(s0)
                  c.xor        s1, a0
                  lbu          a0, 223(s0)
                  lbu          t5, -59(s0)
                  slti         a0, a0, -261
                  c.srli       a2, 10
                  lbu          t5, 162(s0)
                  divu         s1, s10, s3
                  c.and        a0, a0
                  lbu          a2, -128(s0) #end riscv_hazard_instr_stream_8
                  la           t4, region_0+817 #start riscv_hazard_instr_stream_18
                  sb           a2, -40(t4)
                  c.or         a2, a2
                  srai         t5, t6, 29
                  sltiu        t6, t5, 443
                  divu         t5, t6, a4
                  rem          t1, a4, t6
                  slti         t5, t5, 454
                  sb           a0, -6(t4)
                  sub          t6, a0, t1
                  lbu          t5, 38(t4)
                  c.or         a4, a4
                  sh           a2, 61(t4)
                  lb           t1, -46(t4)
                  divu         t5, t1, a0
                  mul          a2, a2, a2
                  auipc        a0, 73351
                  lh           t5, 45(t4)
                  lhu          t1, -29(t4)
                  mulh         t1, t6, a0
                  lbu          t5, -18(t4)
                  lbu          t6, 16(t4)
                  lbu          a4, 46(t4)
                  c.slli       a0, 31
                  lbu          a0, 25(t4)
                  c.andi       a4, 22
                  srai         t5, t5, 13
                  sb           a0, -43(t4)
                  ori          t1, t5, 1576
                  sltiu        a0, a2, -729
                  lb           t1, 45(t4)
                  sb           t5, 56(t4)
                  lhu          t5, 19(t4)
                  lbu          a2, -60(t4)
                  c.sub        a4, a4
                  lbu          a0, 58(t4)
                  srl          t1, a0, t6
                  and          a2, t6, a4
                  lbu          t5, -48(t4)
                  lb           t6, -12(t4)
                  sb           a4, 0(t4) #end riscv_hazard_instr_stream_18
                  addi         s7, zero, 9 #init loop 0 counter
                  mulhsu       t4, s4, s9
                  divu         tp, s5, t5
                  sltiu        zero, s2, -1423
                  lui          a3, 43978
                  div          tp, s10, s11
                  addi         s0, zero, 19 #init loop 0 limit
sub_2_106_0_t:    auipc        zero, 116199
                  c.addi       t6, 23
                  slti         t6, a7, -1266
                  mulhu        a0, s9, s0
                  addi         s7, s7, 5 #update loop 0 counter
                  sltiu        a1, sp, 702
                  mulh         a4, zero, s1
                  slli         s8, s1, 21
                  add          s1, ra, s5
                  slt          a3, a5, t4
                  c.lui        t1, 29
                  sltu         s4, t1, t1
                  c.or         s1, s1
                  c.or         a5, a3
                  slti         s6, t2, 1468
                  xor          s3, t0, t6
                  or           a3, gp, a3
                  beq          s7, s0, sub_2_106_0_t #branch for loop 0
                  c.and        s1, a3
                  la           s10, region_0+1781 #start load_store_instr_stream_0
                  la           sp, region_1+958 #start load_store_instr_stream_1
                  lbu          t1, -160(s10)
                  lb           ra, 1011(sp)
                  sh           a6, -209(s10)
                  sb           s6, 81(sp)
                  lw           t1, -534(sp)
                  lbu          t2, 130(s10)
                  lhu          a0, 474(sp)
                  sb           a0, 176(s10)
                  lb           t5, -115(sp)
                  lbu          a0, -85(s10)
                  sb           s2, -36(sp)
                  lhu          t0, 159(s10)
                  lb           t5, -463(sp)
                  sb           zero, -60(s10)
                  lh           a2, -225(s10)
                  sb           ra, -144(s10)
                  lb           s11, 797(sp)
                  lb           s1, -207(sp) #end load_store_instr_stream_1
                  sb           a7, 56(s10) #end load_store_instr_stream_0
                  la           a1, region_1+1216 #start load_store_instr_stream_1
                  la           a6, region_0+381 #start load_store_instr_stream_0
                  sb           t2, -29(a6)
                  lbu          t3, -41(a6)
                  sb           t1, -1(a1)
                  sb           t1, 8(a6)
                  lb           s3, -43(a1)
                  lhu          t3, -59(a6)
                  lbu          sp, -27(a1)
                  c.sw         a4, 44(a1)
                  sh           a6, 36(a1)
                  lb           s6, 14(a6)
                  lb           s7, -51(a1)
                  lbu          t2, -31(a1)
                  sb           gp, 49(a6)
                  lb           gp, -12(a6)
                  lbu          t3, 32(a1) #end load_store_instr_stream_1
                  sh           ra, -25(a6) #end load_store_instr_stream_0
                  la           sp, region_0+1059 #start riscv_load_store_rand_instr_stream_2
                  c.add        s9, a5
                  sltu         a5, s5, a7
                  c.xor        a3, a0
                  lb           t2, -243(sp)
                  slt          s11, s11, a3
                  sh           s6, 105(sp)
                  sb           s1, 203(sp)
                  sltu         t5, s9, s0
                  c.srli       a2, 2
                  c.slli       s0, 25
                  lw           a4, -39(sp)
                  sra          a1, a2, a4
                  sll          tp, a6, a6
                  mul          t0, a2, a4
                  sb           s4, 220(sp)
                  lbu          s7, -205(sp)
                  sb           t2, 235(sp)
                  sb           ra, -242(sp)
                  lhu          t6, 235(sp)
                  sll          s6, t1, s11
                  slt          t1, s5, s7
                  sb           s9, -39(sp)
                  andi         s8, s11, -1130
                  c.lui        s4, 29
                  srai         t1, t5, 24
                  lb           t6, -202(sp)
                  add          gp, s8, t2
                  sra          tp, s7, s4
                  lh           s9, 25(sp)
                  sh           a3, 123(sp)
                  lbu          t6, 3(sp)
                  mulh         s11, a4, s11
                  sub          t4, tp, s10
                  slti         t0, s10, 425
                  lb           s1, -80(sp)
                  lw           a5, 49(sp)
                  slt          a1, sp, s5
                  sb           zero, -21(sp)
                  lbu          s0, -54(sp)
                  lbu          a6, 130(sp)
                  lhu          a6, -39(sp)
                  c.add        s9, s3
                  c.mv         s10, sp
                  srl          t5, s11, t0
                  sb           a3, 0(sp)
                  lb           gp, 196(sp)
                  lb           t0, -154(sp) #end riscv_load_store_rand_instr_stream_2
                  la           s9, region_1+1182 #start load_store_instr_stream_1
                  lhu          sp, -12(s9)
                  la           s10, region_0+785 #start load_store_instr_stream_0
                  lbu          tp, 11(s9)
                  lbu          gp, 162(s10)
                  lb           a3, -1(s9)
                  lb           a6, 1176(s10)
                  sh           zero, -16(s9)
                  lb           a1, -11(s9)
                  sb           s7, -544(s10)
                  sb           t1, -42(s10)
                  sh           a0, -12(s9)
                  lbu          s4, 280(s10)
                  sb           ra, -13(s9)
                  lh           a4, -12(s9) #end load_store_instr_stream_1
                  lbu          s4, 4(s10) #end load_store_instr_stream_0
                  la           sp, region_1+1036 #start riscv_hazard_instr_stream_7
                  c.srli       a1, 31
                  srl          tp, t6, a2
                  lb           t3, -3(sp)
                  c.swsp       t6, 16(sp)
                  ori          t6, a1, 1464
                  lb           tp, 11(sp)
                  lbu          t6, -9(sp)
                  c.lwsp       tp, 12(sp)
                  auipc        t3, 569562
                  lhu          a2, 6(sp)
                  lh           tp, -6(sp)
                  slt          a0, t6, a0
                  sltu         t3, t6, t6
                  c.addi       a2, -1
                  c.slli       a1, 17
                  and          t3, a1, a2
                  c.sub        a0, a1
                  c.swsp       t6, 8(sp)
                  xori         t3, a2, -15
                  lhu          a1, -14(sp)
                  sb           a1, 7(sp)
                  sb           t3, -11(sp)
                  lhu          t6, 6(sp)
                  c.lwsp       t6, 12(sp)
                  sb           t3, -6(sp)
                  or           tp, a1, tp
                  c.mv         t3, t6
                  lbu          a1, -5(sp)
                  c.addi       a0, 15
                  sb           a1, 15(sp)
                  c.swsp       tp, 12(sp) #end riscv_hazard_instr_stream_7
                  la           a6, region_0+1640 #start load_store_instr_stream_0
                  lbu          s1, 53(a6)
                  sb           a5, 31(a6)
                  la           a1, region_0+1841 #start load_store_instr_stream_1
                  sb           zero, -55(a1)
                  lb           t5, 37(a6)
                  sb           a3, -64(a1)
                  sw           a6, -33(a1)
                  lbu          t0, -18(a6)
                  lbu          s8, 3(a1)
                  lb           s6, 10(a1)
                  lb           s6, 45(a6)
                  lb           t6, -11(a1)
                  lbu          a3, 42(a1)
                  lb           a0, 16(a1)
                  lb           a5, -25(a1)
                  lbu          s9, 53(a1) #end load_store_instr_stream_1
                  sb           t4, 26(a6)
                  sw           a4, 12(a6) #end load_store_instr_stream_0
                  addi         s4, zero, 10 #init loop 0 counter
                  addi         t6, zero, -2 #init loop 0 limit
                  slli         ra, a7, 7
                  xor          a2, gp, s3
sub_2_117_0_t:    sltu         zero, zero, tp
                  xor          s9, s5, s3
                  mul          t2, t3, a7
                  lui          s10, 384688
                  addi         s4, s4, -6 #update loop 0 counter
                  xor          zero, tp, sp
                  divu         s6, s5, a0
                  mulh         s10, gp, gp
                  and          s10, gp, t2
                  c.xor        a1, a3
                  c.xor        a0, a3
                  c.addi       tp, 1
                  mulhsu       s6, t3, a2
                  c.li         s0, 16
                  beq          s4, t6, sub_2_117_0_t #branch for loop 0
                  c.mv         sp, t4
                  la           a5, amo_0+52 #start riscv_amo_instr_stream_6
                  la           s10, amo_0+12
                  la           sp, amo_0+40
                  la           gp, amo_0+48
                  amoadd.w.rl   a3, s1, (gp)
                  amoand.w      s8, a4, (gp)
                  c.srli       a1, 27
                  srai         t5, s6, 31
                  amomax.w      t1, a2, (s10)
                  amoor.w.aq    t2, t6, (s10)
                  amoor.w       t6, a5, (sp)
                  amoxor.w.aq   s0, s8, (gp)
                  amoand.w.aq   t6, a1, (sp)
                  amoswap.w.rl  s1, a0, (gp) #end riscv_amo_instr_stream_6
                  la           s11, region_1+168 #start riscv_load_store_rand_instr_stream_17
                  or           a6, a0, a0
                  mulhu        t3, s7, t4
                  sb           t3, -11(s11)
                  lbu          a2, 40(s11)
                  c.lui        a3, 4
                  auipc        a3, 350933
                  addi         a3, a2, 616
                  sh           a2, 2(s11)
                  remu         a1, s4, a3
                  c.or         a4, a1
                  mulh         tp, a2, a3
                  mul          s6, sp, a5
                  lb           s3, 34(s11)
                  lb           a4, 35(s11)
                  div          a6, tp, a7
                  divu         s6, a2, a7
                  lh           zero, -64(s11)
                  sra          a2, a7, a4
                  lhu          s6, 44(s11)
                  c.nop
                  c.li         tp, 1
                  lb           s9, -32(s11)
                  xori         tp, s4, 497
                  add          s6, a7, s8
                  lb           s6, 49(s11)
                  lb           zero, 0(s11)
                  mul          a5, gp, s1
                  lw           t4, -4(s11)
                  sltiu        s1, t1, -1120
                  c.andi       s1, 13
                  c.lui        s1, 27
                  nop
                  lb           s9, -2(s11)
                  slli         a6, t5, 9
                  nop
                  xori         a5, a1, -1110
                  c.andi       a4, 6
                  sltu         a6, a3, tp
                  lbu          ra, 19(s11)
                  srl          a0, t6, s6
                  slli         s4, s11, 5
                  lbu          a6, 43(s11)
                  sb           s5, 19(s11) #end riscv_load_store_rand_instr_stream_17
                  la           sp, region_1+1172 #start riscv_hazard_instr_stream_11
                  sra          gp, gp, s8
                  c.or         s1, s1
                  lbu          zero, -3(sp)
                  lh           s1, 14(sp)
                  sb           gp, 1(sp)
                  remu         s1, s7, s8
                  xori         zero, s7, 1247
                  ori          t0, s1, 1054
                  sw           zero, -8(sp)
                  c.slli       gp, 1
                  sh           gp, -16(sp)
                  sb           zero, -14(sp)
                  c.srli       s1, 22
                  lw           zero, -4(sp)
                  lb           s7, 15(sp)
                  or           zero, zero, t0
                  nop
                  lb           t0, -3(sp)
                  lb           t0, -2(sp)
                  sb           gp, 3(sp)
                  sb           s1, -5(sp)
                  c.srli       s1, 19
                  lb           zero, -10(sp)
                  lb           s1, -13(sp)
                  ori          zero, s7, 174
                  sb           gp, -13(sp)
                  sh           s7, -8(sp)
                  sb           zero, 2(sp)
                  c.lwsp       gp, 4(sp)
                  lb           gp, 11(sp)
                  lh           s8, 2(sp)
                  lh           t0, -6(sp)
                  c.srli       s1, 24
                  c.or         s1, s1
                  lh           s8, -14(sp)
                  lb           s7, -16(sp) #end riscv_hazard_instr_stream_11
                  la           t0, region_1+756 #start riscv_load_store_rand_instr_stream_9
                  lb           a6, 2(t0)
                  slt          s10, a3, s6
                  lb           a2, -15(t0)
                  lbu          t6, 15(t0)
                  rem          t1, a1, a3
                  sll          s1, s11, t5
                  add          sp, a2, a2
                  lhu          a4, 12(t0)
                  c.lui        s10, 9
                  lbu          a0, -5(t0)
                  lbu          s3, -5(t0)
                  sb           sp, 13(t0)
                  sh           a3, -14(t0)
                  div          t4, zero, s5
                  c.or         a5, a5
                  lui          s1, 889829
                  xori         s3, s8, -1725
                  xor          a2, s4, s6
                  div          ra, s4, s6
                  sb           t6, 14(t0)
                  sh           s2, 10(t0)
                  lh           a4, 6(t0)
                  lb           tp, -15(t0)
                  c.and        a0, a5
                  lb           t3, 1(t0)
                  sh           s1, -6(t0)
                  slli         sp, a0, 2
                  c.addi4spn   s1, sp, 240
                  rem          s11, ra, t5
                  sltiu        a5, a1, -1005
                  srai         a5, a7, 6
                  sltiu        s6, zero, 933
                  lhu          s7, -14(t0)
                  c.andi       s1, -1
                  lb           s6, -3(t0)
                  lh           s1, 8(t0)
                  lhu          s8, 6(t0)
                  lh           s11, 6(t0)
                  c.li         s7, -1
                  divu         a5, a3, zero
                  lh           t5, 6(t0)
                  lb           s11, -3(t0)
                  lbu          s6, 7(t0)
                  sb           a1, -11(t0)
                  c.add        s3, t1
                  xori         s1, a2, -641
                  andi         s3, sp, -1652
                  lb           s4, -13(t0)
                  lw           gp, -8(t0)
                  c.li         t5, 24
                  lb           tp, -5(t0)
                  sub          a1, sp, t3
                  lui          s1, 821793
                  lbu          s3, 14(t0)
                  sb           a5, -15(t0)
                  lbu          s7, -16(t0) #end riscv_load_store_rand_instr_stream_9
                  la           s6, region_1+1572 #start riscv_load_store_hazard_instr_stream_19
                  sb           a0, -48(s6)
                  lbu          s7, -48(s6)
                  sw           s4, -48(s6)
                  lh           zero, 62(s6)
                  lb           s8, 62(s6)
                  lh           t4, -62(s6)
                  lb           tp, 28(s6)
                  lhu          t4, 28(s6)
                  lbu          tp, 27(s6)
                  slti         s0, t6, 1031
                  lb           s7, -29(s6)
                  lbu          s3, 43(s6)
                  lb           s11, 63(s6)
                  sb           t4, -61(s6)
                  lhu          t6, -42(s6)
                  lb           zero, -42(s6)
                  sb           gp, -27(s6)
                  lb           a2, 43(s6)
                  sh           s8, -52(s6)
                  sb           s4, -45(s6) #end riscv_load_store_hazard_instr_stream_19
                  la           gp, region_0+1174 #start load_store_instr_stream_1
                  lw           a1, 542(gp)
                  lbu          a6, 777(gp)
                  la           sp, region_1+1730 #start load_store_instr_stream_0
                  lb           s3, 17(sp)
                  sw           s5, 74(sp)
                  lbu          t5, 119(sp)
                  sb           s4, 32(sp)
                  sb           t4, 667(gp)
                  sb           a2, -8(sp)
                  sh           zero, -142(sp)
                  lbu          s0, -843(gp)
                  sb           a4, 255(gp)
                  lb           a2, 47(sp)
                  lh           a0, -1044(gp)
                  lh           zero, 226(sp)
                  sb           a4, -345(gp) #end load_store_instr_stream_1
                  sh           s6, -162(sp)
                  sb           a7, 140(sp) #end load_store_instr_stream_0
                  la           t0, amo_0+32 #start riscv_lr_sc_instr_stream_4
                  ori          s4, t0, 801
                  sll          ra, a1, s8
                  lr.w.rl       t3, (t0)
                  mulh         t3, a2, t3
                  divu         t5, t6, s7
                  srl          s3, s2, s1
                  c.srli       s0, 13
                  sc.w          s8, ra, (t0) #end riscv_lr_sc_instr_stream_4
                  la           t6, region_1+880 #start load_store_instr_stream_1
                  la           t2, region_1+1056 #start load_store_instr_stream_0
                  la           a3, region_1+689 #start load_store_instr_stream_2
                  lbu          s9, 28(t6)
                  lh           s9, 184(t2)
                  lb           t4, 486(t6)
                  lbu          s4, -667(t6)
                  lbu          zero, -29(t2)
                  lb           s6, 642(a3)
                  lb           t5, -426(a3)
                  lb           s3, 905(t6)
                  lhu          s0, -589(a3)
                  lh           t0, 222(t2)
                  lh           a6, 293(a3)
                  lb           sp, 1170(a3)
                  sb           a5, -125(t2)
                  lb           sp, 998(a3)
                  lhu          s1, 767(a3)
                  sb           a0, 275(t6)
                  sb           s8, -875(t6)
                  lb           a6, 912(a3)
                  lbu          a6, -826(t6)
                  lb           tp, 23(t2)
                  lbu          a0, 200(a3) #end load_store_instr_stream_2
                  lb           s0, 679(t6)
                  lhu          tp, 8(t2)
                  lbu          a4, 387(t6)
                  lb           s8, 109(t2)
                  lb           a6, 189(t6) #end load_store_instr_stream_1
                  lbu          t1, -171(t2) #end load_store_instr_stream_0
                  addi         s11, zero, 8 #init loop 0 counter
                  sub          ra, s4, s7
                  mulhu        s8, s3, s2
                  c.add        s3, t1
                  mul          a2, a7, tp
                  addi         tp, zero, 8 #init loop 0 limit
                  c.srai       s1, 25
sub_2_115_0_t:    divu         a4, s11, s6
                  sltu         zero, s10, t3
                  addi         s11, s11, -7 #update loop 0 counter
                  auipc        a1, 749722
                  c.slli       t4, 20
                  bgeu         s11, tp, sub_2_115_0_t #branch for loop 0
                  c.sub        a2, a2
                  addi         s10, zero, 1 #init loop 0 counter
                  slti         s7, zero, 526
                  addi         a4, zero, 4 #init loop 0 limit
sub_2_119_0_t:    sltiu        t1, s9, -588
                  lui          s3, 658164
                  div          a2, s6, t3
                  addi         s10, s10, 10 #update loop 0 counter
                  bltu         s10, a4, sub_2_119_0_t #branch for loop 0
                  c.add        a3, a5
                  la           sp, region_1+864 #start riscv_load_store_hazard_instr_stream_13
                  sb           t3, -249(sp)
                  lb           a0, -249(sp)
                  sh           zero, -112(sp)
                  c.lwsp       s6, 40(sp)
                  remu         s6, t2, s8
                  sb           s7, 240(sp)
                  c.srai       a3, 21
                  sb           a3, -212(sp)
                  auipc        t5, 693261
                  c.swsp       s9, 56(sp)
                  lb           gp, -222(sp)
                  lb           s11, 206(sp)
                  srl          s10, zero, s10
                  srai         zero, a3, 26
                  lb           a5, -111(sp)
                  sltu         a3, s4, s2
                  sb           t0, 215(sp) #end riscv_load_store_hazard_instr_stream_13
                  la           sp, region_1+1465 #start riscv_hazard_instr_stream_10
                  sub          t2, a2, s11
                  c.lui        t2, 16
                  mulhsu       t2, t2, t3
                  c.slli       s0, 10
                  sb           s11, -1143(sp)
                  divu         t2, a2, s11
                  nop
                  sb           t2, -202(sp)
                  slli         a0, s0, 9
                  lb           s11, -281(sp)
                  sb           t2, -170(sp)
                  c.lui        a2, 15
                  c.lui        a0, 13
                  remu         t3, t2, t3
                  lbu          t2, -408(sp)
                  addi         t3, a0, -1226
                  sb           s11, -152(sp)
                  sub          s11, s0, s11
                  lbu          a0, -198(sp)
                  lb           a0, -809(sp)
                  ori          t2, s0, -1594
                  lb           s11, -1151(sp)
                  mulhu        s0, a2, t3
                  c.or         s0, s0
                  sh           a0, -787(sp)
                  sb           a0, -66(sp)
                  lbu          s11, 156(sp)
                  lbu          t2, -1222(sp)
                  sb           a0, -518(sp)
                  lb           t3, -348(sp)
                  lhu          s0, 481(sp)
                  sb           t3, 224(sp)
                  mulh         s0, a0, t2
                  mulhu        t2, t2, s0
                  c.add        a2, s0
                  c.mv         a2, t3
                  auipc        t3, 816852
                  slti         s0, a0, -1205
                  remu         s0, a0, t2
                  srai         t2, a2, 11
                  slt          t3, a2, a2
                  c.and        a0, s0
                  lbu          t3, 386(sp)
                  mulhsu       t2, s11, t3
                  or           t2, s0, t2
                  sb           a0, -1376(sp) #end riscv_hazard_instr_stream_10
sub_2_57:         jal          ra, 17f
0:                jal          ra, 14f
1:                c.j          23f
2:                c.jal        19f
3:                jal          ra, 18f
4:                c.j          12f
5:                c.jal        6f
6:                c.jal        7f
7:                jal          t0, 21f
8:                jal          ra, 11f
9:                c.jal        0b
10:               jal          ra, 20f
11:               c.j          9b
12:               c.j          15f
13:               c.j          8b
14:               jal          t1, 16f
15:               c.jal        13b
16:               c.jal        1b
17:               c.j          3b
18:               c.j          10b
19:               c.j          24f
20:               c.j          22f
21:               c.jal        2b
22:               jal          t0, 5b
23:               jal          ra, 25f
24:               jal          ra, 4b
25:               c.srli       a4, 19
                  la           t1, region_0+562 #start load_store_instr_stream_1
                  la           t2, region_0+26 #start load_store_instr_stream_0
                  sb           s2, -521(t1)
                  sb           s7, 35(t2)
                  lbu          a5, 96(t1)
                  sb           s7, 135(t2)
                  sb           t5, 593(t1)
                  sb           s4, 233(t2)
                  lhu          t4, -172(t1)
                  lbu          a3, 363(t1)
                  sh           s9, 122(t2)
                  lbu          a2, 48(t1)
                  lhu          s1, 170(t2)
                  lh           s9, 36(t2)
                  lb           s1, 128(t2)
                  lh           sp, -558(t1) #end load_store_instr_stream_1
                  lh           s9, -12(t2) #end load_store_instr_stream_0
                  la           a3, region_0+121 #start load_store_instr_stream_0
                  la           t2, region_1+1891 #start load_store_instr_stream_1
                  lb           ra, -106(a3)
                  lb           s11, -69(t2)
                  lbu          a6, -217(t2)
                  sb           s7, 138(a3)
                  sb           a7, -128(t2)
                  sb           s6, 209(a3)
                  lbu          t0, -73(t2)
                  sb           a1, -122(t2)
                  lb           s1, -246(t2)
                  sh           t3, -99(a3)
                  sh           a6, -63(t2)
                  lb           a6, 58(t2) #end load_store_instr_stream_1
                  lhu          s1, 129(a3) #end load_store_instr_stream_0
                  la           s3, amo_0+4 #start riscv_lr_sc_instr_stream_12
                  sub          a6, t5, s0
                  c.and        a0, a2
                  sltiu        tp, a4, -835
                  div          a1, s10, s6
                  sltiu        s6, tp, -1389
                  remu         s9, a1, s0
                  srai         tp, t5, 27
                  nop
                  lr.w.aq       a0, (s3)
                  srli         t6, ra, 24
                  c.xor        a0, a1
                  remu         ra, a0, s10
                  remu         a6, t2, s8
                  addi         s10, t5, 1106
                  sc.w.rl       a5, ra, (s3) #end riscv_lr_sc_instr_stream_12
sub_2_47:         jal          ra, 14f
0:                jal          ra, 18f
1:                c.jal        11f
2:                c.j          3f
3:                c.j          25f
4:                c.jal        13f
5:                c.jal        19f
6:                c.j          21f
7:                c.jal        4b
8:                c.jal        27f
9:                c.j          15f
10:               c.j          30f
11:               c.jal        6b
12:               c.jal        29f
13:               c.j          16f
14:               c.jal        20f
15:               c.j          1b
16:               jal          t1, 17f
17:               c.jal        23f
18:               c.j          5b
19:               jal          s3, 7b
20:               c.jal        22f
21:               c.j          12b
22:               c.jal        2b
23:               c.j          28f
24:               c.jal        0b
25:               jal          ra, 9b
26:               c.j          10b
27:               jal          ra, 26b
28:               c.jal        8b
29:               c.j          24b
30:               mulhu        s3, sp, s10
                  la           t4, region_0+1660 #start riscv_load_store_hazard_instr_stream_0
                  lbu          sp, 9(t4)
                  sltu         a0, a7, s11
                  sb           t2, 9(t4)
                  or           a3, s5, s4
                  lbu          zero, 13(t4)
                  lbu          t3, 4(t4)
                  sb           t1, 4(t4)
                  lhu          s1, -12(t4)
                  lui          a1, 854128
                  sh           a2, -12(t4)
                  lb           s4, -12(t4)
                  slt          s3, a4, s10
                  lb           s7, -12(t4)
                  divu         s1, s5, sp
                  lb           s8, -12(t4)
                  lhu          s10, -12(t4)
                  lw           t5, -12(t4)
                  lbu          s8, 11(t4)
                  lbu          s8, 11(t4)
                  lbu          a5, 11(t4)
                  sb           a2, 11(t4)
                  lb           t2, -15(t4)
                  addi         a2, a1, 372
                  mul          t1, t5, s8
                  sb           s10, -15(t4) #end riscv_load_store_hazard_instr_stream_0
                  la           s9, amo_0+32 #start riscv_amo_instr_stream_10
                  la           t5, amo_0+36
                  la           a1, amo_0+4
                  la           a5, amo_0+44
                  c.and        a0, a0
                  ori          s7, t2, 255
                  amomaxu.w     t2, t1, (a1)
                  amoand.w      a3, s0, (t5)
                  amoadd.w      a4, s5, (a1)
                  amoand.w.rl   t2, a3, (a1)
                  amoswap.w     a0, a0, (s9)
                  c.addi       a0, 17
                  sra          s7, s8, a7
                  srl          t1, a2, sp
                  c.or         a0, a3
                  amomax.w.rl   t1, a0, (a1) #end riscv_amo_instr_stream_10
                  la           s11, region_1+1540 #start riscv_load_store_hazard_instr_stream_14
                  sb           t6, -66(s11)
                  mulhu        a3, a4, s6
                  lb           a3, 163(s11)
                  lbu          t4, -57(s11)
                  lhu          t5, -240(s11)
                  lbu          s1, -238(s11)
                  sb           t0, -65(s11)
                  lh           zero, 150(s11)
                  sh           s1, 150(s11)
                  lh           t6, 150(s11)
                  srl          s0, t5, s7
                  lbu          s3, -43(s11)
                  divu         a4, a6, s7
                  lb           s6, -43(s11)
                  lbu          t0, -43(s11)
                  lb           t2, -192(s11)
                  lb           t4, -192(s11)
                  lh           sp, -214(s11)
                  sh           a0, -214(s11)
                  sh           t0, -214(s11)
                  sh           t4, -214(s11)
                  sw           s9, 184(s11)
                  c.slli       a1, 28
                  lw           s10, 184(s11) #end riscv_load_store_hazard_instr_stream_14
                  addi         s6, zero, 5 #init loop 0 counter
                  sltiu        s4, a0, 922
                  slti         t0, a3, -1607
                  add          t0, t4, s1
                  addi         a6, zero, 14 #init loop 0 limit
                  mulh         sp, a3, s2
sub_2_114_0_t:    mulh         s4, s5, a5
                  or           a0, tp, sp
                  addi         s6, s6, 9 #update loop 0 counter
                  or           t0, t0, t6
                  mulhsu       gp, t1, s7
                  c.sub        a5, a3
                  mulhu        s10, s9, a5
                  beq          s6, a6, sub_2_114_0_t #branch for loop 0
                  div          s3, s8, s2
                  addi         t5, zero, -8 #init loop 1 counter
                  addi         t0, zero, 16 #init loop 1 limit
sub_2_104_1_t:    or           t1, sp, t3
                  addi         t5, t5, 8 #update loop 1 counter
                  sub          a6, a6, gp
                  c.addi16sp   sp, -16
                  c.addi       s9, 5
                  addi         a4, zero, 5 #init loop 0 counter
                  slt          s0, t0, t3
                  c.addi       tp, 3
                  addi         s8, zero, -15 #init loop 0 limit
sub_2_104_0_t:    slti         t4, tp, 1151
                  c.addi16sp   sp, 48
                  addi         a4, a4, -1 #update loop 0 counter
                  c.slli       a1, 23
                  bge          a4, s8, sub_2_104_0_t #branch for loop 0
                  bltu         t5, t0, sub_2_104_1_t #branch for loop 1
                  c.add        a1, gp
sub_2_40:         jal          ra, 20f
0:                c.jal        9f
1:                jal          t1, 19f
2:                jal          gp, 16f
3:                c.j          15f
4:                c.jal        0b
5:                c.jal        4b
6:                c.jal        8f
7:                c.j          6b
8:                c.j          18f
9:                jal          gp, 12f
10:               c.jal        3b
11:               c.jal        7b
12:               c.j          14f
13:               c.jal        24f
14:               c.j          21f
15:               jal          ra, 11b
16:               jal          t1, 13b
17:               c.j          10b
18:               c.j          5b
19:               c.jal        23f
20:               c.jal        1b
21:               c.j          22f
22:               c.jal        2b
23:               c.j          17b
24:               c.mv         s11, tp
                  la           sp, region_0+1081 #start riscv_load_store_rand_instr_stream_19
                  lbu          t2, 12(sp)
                  c.srli       s0, 11
                  sltu         gp, s8, t5
                  c.srli       s1, 31
                  lbu          s0, 11(sp)
                  lb           t6, 14(sp)
                  add          s9, t0, a0
                  sb           a2, 11(sp)
                  sw           a2, -9(sp)
                  lbu          s9, 10(sp)
                  sw           s4, -9(sp)
                  andi         t2, s11, -645
                  sb           s4, -8(sp)
                  lb           s9, 16(sp)
                  c.sub        a1, s1
                  lh           t3, -9(sp)
                  c.lui        a5, 2
                  c.or         a1, a0
                  c.srai       s0, 31
                  lb           s0, 0(sp)
                  lw           gp, -1(sp)
                  add          t3, a6, a2
                  lbu          s1, -9(sp)
                  andi         s9, t6, 2027
                  lb           t2, 14(sp)
                  mulh         t2, a7, t4
                  lhu          gp, 7(sp)
                  lb           t6, 12(sp)
                  lh           s9, -13(sp)
                  lb           s10, 0(sp)
                  c.andi       a2, -1
                  lh           s1, -7(sp)
                  sb           s1, -1(sp)
                  lb           t0, 16(sp)
                  lbu          a0, 2(sp)
                  slli         s0, t5, 17
                  nop
                  lbu          a4, 1(sp)
                  lbu          t3, 2(sp)
                  or           a0, t2, gp
                  lbu          s8, -12(sp)
                  slt          s9, s0, t0
                  lw           tp, 15(sp)
                  div          a1, s5, a7
                  mulhu        s6, a1, a7
                  sltu         t3, s6, a3
                  c.addi       a6, 14
                  lw           s11, -5(sp) #end riscv_load_store_rand_instr_stream_19
                  la           t2, amo_0+12 #start riscv_amo_instr_stream_2
                  la           a3, amo_0+16
                  auipc        a0, 271227
                  mul          s11, s10, a1
                  lui          t3, 257232
                  amominu.w.rl  s0, a6, (t2)
                  amoand.w      a4, t0, (a3)
                  or           s9, a3, t5
                  amoor.w.aq    t6, s4, (t2)
                  amoand.w.aq   a1, a5, (a3) #end riscv_amo_instr_stream_2
                  la           t6, amo_0+44 #start riscv_amo_instr_stream_9
                  la           a6, amo_0+36
                  amoxor.w      s8, zero, (a6)
                  amomin.w.rl   tp, a6, (a6)
                  amoand.w.aq   t2, s4, (a6)
                  amoxor.w.aq   s9, a1, (a6) #end riscv_amo_instr_stream_9
                  la           t1, amo_0+48 #start riscv_amo_instr_stream_8
                  amoswap.w.rl  sp, s0, (t1)
                  sra          a0, s2, s10
                  amomax.w.aq   sp, t6, (t1)
                  amoswap.w.rl  s7, t3, (t1)
                  amomin.w.rl   a4, gp, (t1)
                  mul          t4, a0, a6
                  xori         s7, s6, -174
                  divu         zero, s3, a7
                  c.slli       s9, 11
                  amoor.w.aq    a6, t4, (t1)
                  divu         s0, s6, t5
                  amominu.w.rl  t0, t4, (t1)
                  amoadd.w      a0, s11, (t1)
                  add          a2, s3, s6
                  xor          s0, s11, gp
                  amoadd.w.rl   a3, tp, (t1) #end riscv_amo_instr_stream_8
                  la           t3, region_1+832 #start riscv_load_store_hazard_instr_stream_1
                  sb           a0, -23(t3)
                  sb           a4, 9(t3)
                  lhu          t0, -64(t3)
                  lhu          s9, -64(t3)
                  lw           t6, -64(t3)
                  lw           zero, -64(t3)
                  sb           t2, 60(t3)
                  sb           s9, 60(t3)
                  c.srli       s1, 28
                  sh           a0, -62(t3)
                  lhu          t0, -62(t3)
                  lh           s3, -62(t3)
                  sb           a4, 15(t3)
                  lbu          a5, 15(t3)
                  sw           tp, 28(t3)
                  c.li         t0, -1
                  lbu          t5, 28(t3)
                  lw           t6, -44(t3) #end riscv_load_store_hazard_instr_stream_1
                  la           tp, amo_0+36 #start riscv_amo_instr_stream_15
                  la           t2, amo_0+44
                  la           gp, amo_0+32
                  amoswap.w     a1, t3, (tp)
                  amoand.w      t1, s8, (tp)
                  amomin.w      a4, a1, (gp)
                  amomaxu.w     sp, t5, (t2) #end riscv_amo_instr_stream_15
sub_2_48:         jal          ra, 17f
0:                c.jal        12f
1:                jal          ra, 3f
2:                jal          s0, 15f
3:                c.jal        9f
4:                c.jal        24f
5:                c.j          14f
6:                jal          ra, 2b
7:                c.jal        0b
8:                c.j          1b
9:                jal          ra, 18f
10:               c.jal        23f
11:               c.jal        28f
12:               c.j          22f
13:               c.j          26f
14:               jal          ra, 30f
15:               c.jal        8b
16:               jal          ra, 13b
17:               jal          s6, 7b
18:               c.jal        21f
19:               c.jal        16b
20:               jal          t1, 27f
21:               jal          a3, 4b
22:               jal          sp, 25f
23:               jal          ra, 6b
24:               c.jal        20b
25:               jal          ra, 11b
26:               c.j          10b
27:               c.j          29f
28:               c.jal        19b
29:               c.j          5b
30:               c.sub        a5, a2
                  la           ra, region_0+615 #start riscv_hazard_instr_stream_4
                  c.li         a0, 7
                  auipc        a1, 660177
                  slti         a0, s0, -321
                  sb           s0, 2(ra)
                  add          a0, tp, tp
                  lh           a0, -33(ra)
                  lbu          s0, 22(ra)
                  c.nop
                  slti         gp, gp, 129
                  sb           s0, 35(ra)
                  lbu          gp, -30(ra)
                  mulhu        tp, t4, tp
                  c.and        a0, a0
                  c.add        gp, s0
                  mulh         gp, t4, a0
                  lb           a0, 32(ra)
                  sltu         a0, s0, gp
                  lb           gp, -42(ra)
                  xor          gp, a1, gp
                  sb           a0, -45(ra)
                  and          gp, s0, tp
                  mulhu        tp, a0, gp
                  mulhsu       tp, tp, a1
                  auipc        s0, 598335
                  mulhu        t4, tp, t4
                  lb           s0, -48(ra)
                  lbu          s0, -5(ra)
                  lh           t4, -51(ra)
                  sll          a0, a1, gp
                  lbu          a1, -32(ra)
                  srai         s0, s0, 9
                  lbu          gp, 37(ra)
                  xori         a0, a0, -1626
                  lb           a1, -6(ra)
                  lbu          a1, -16(ra)
                  srl          tp, gp, t4
                  lb           gp, -8(ra)
                  srli         a1, tp, 20
                  c.li         tp, 14
                  c.andi       a1, -1
                  sb           tp, -62(ra)
                  c.lui        s0, 21
                  sb           a1, -23(ra)
                  mul          tp, gp, a1
                  lb           gp, -50(ra)
                  lh           gp, 43(ra) #end riscv_hazard_instr_stream_4
                  la           a0, amo_0+52 #start riscv_amo_instr_stream_7
                  c.srai       a2, 21
                  mulhsu       t2, a1, t0
                  mul          a6, sp, gp
                  c.addi16sp   sp, 208
                  amoand.w      a6, a4, (a0)
                  amomin.w.rl   s0, t4, (a0)
                  amomin.w.aq   s9, s3, (a0)
                  amominu.w     s7, t6, (a0)
                  rem          a1, s11, sp
                  amoxor.w.rl   s9, gp, (a0)
                  divu         t5, ra, t5
                  amoadd.w.rl   zero, t2, (a0)
                  amoadd.w.aq   s4, s2, (a0)
                  amoxor.w.rl   t2, a1, (a0)
                  amoadd.w.aq   s9, a3, (a0) #end riscv_amo_instr_stream_7
                  la           a4, region_0+682 #start riscv_hazard_instr_stream_5
                  lb           a3, -29(a4)
                  lb           s6, -13(a4)
                  lb           a3, -21(a4)
                  c.srai       a3, 5
                  c.srli       a3, 5
                  c.srli       a3, 10
                  lb           s7, 13(a4)
                  andi         s6, s9, -1783
                  lbu          t4, 61(a4)
                  divu         sp, t4, t4
                  rem          sp, a3, sp
                  sh           s7, -38(a4)
                  lh           sp, 8(a4)
                  srai         s6, t4, 9
                  sub          s9, a3, s6
                  or           s9, t4, a3
                  sb           s9, -17(a4)
                  lh           s6, -56(a4)
                  lbu          s9, -12(a4)
                  lbu          a3, -49(a4)
                  mulhu        s6, s7, s9
                  mul          a3, s9, s9
                  lb           sp, -31(a4)
                  lb           s7, 53(a4)
                  lh           s6, 18(a4)
                  lbu          t4, -60(a4)
                  c.add        t4, s9
                  lw           s7, 38(a4)
                  c.addi4spn   a3, sp, 160
                  lhu          sp, -38(a4)
                  sb           s7, 31(a4)
                  lb           a3, -3(a4)
                  auipc        s7, 656874
                  sra          t4, s9, s9
                  lw           s7, -30(a4)
                  divu         sp, s7, s7
                  lw           s6, 42(a4)
                  lbu          t4, 4(a4)
                  sb           s7, -52(a4) #end riscv_hazard_instr_stream_5
                  addi         s11, zero, 5 #init loop 0 counter
                  andi         a5, s3, -141
                  rem          sp, sp, s7
                  mulhu        s0, t6, s6
                  c.addi16sp   sp, -16
                  c.nop
                  c.xor        a5, a5
                  auipc        s1, 19860
                  remu         s0, a5, a6
                  sub          a4, s11, t0
                  slli         s3, s0, 31
                  andi         t3, tp, 1757
                  addi         s7, zero, 18 #init loop 0 limit
                  c.or         s0, a2
                  srli         s6, s7, 13
sub_2_105_0_t:    c.or         s0, a3
                  addi         s11, s11, 9 #update loop 0 counter
                  sub          s1, s7, a1
                  xori         a1, a4, -1830
                  c.sub        s0, a1
                  c.li         s9, -1
                  srli         s6, sp, 5
                  slti         a2, t5, 1233
                  c.slli       ra, 24
                  auipc        tp, 910182
                  ori          a0, s0, -389
                  bltu         s11, s7, sub_2_105_0_t #branch for loop 0
                  c.mv         t4, a4
                  la           s10, region_1+1427 #start load_store_instr_stream_1
                  la           t5, region_1+545 #start load_store_instr_stream_0
                  lbu          tp, -2(s10)
                  lb           t6, 807(t5)
                  lb           s3, 2(s10)
                  sh           s0, 1237(t5)
                  sw           a0, 219(t5)
                  lbu          s1, -516(t5)
                  lb           s1, 980(t5)
                  lb           t2, 6(s10)
                  sw           sp, 1347(t5)
                  sb           a4, 10(s10)
                  lbu          s7, -12(s10)
                  lb           s4, 674(t5)
                  sb           s9, 8(s10)
                  lhu          s6, -1(s10)
                  lh           a5, -107(t5)
                  sb           a1, -15(s10) #end load_store_instr_stream_1
                  sh           s4, 69(t5) #end load_store_instr_stream_0
                  la           gp, amo_0+20 #start riscv_amo_instr_stream_14
                  la           s0, amo_0+4
                  amoxor.w.aq   a2, t3, (s0)
                  amoadd.w.aq   t4, s11, (gp) #end riscv_amo_instr_stream_14
                  la           gp, region_1+700 #start load_store_instr_stream_1
                  lbu          a4, -61(gp)
                  la           s4, region_1+1730 #start load_store_instr_stream_0
                  sb           s6, -59(gp)
                  sw           a6, -58(s4)
                  sh           a3, 62(gp)
                  sb           a5, 59(gp)
                  sb           tp, -41(gp)
                  sb           s8, 61(s4)
                  lh           a5, 56(s4)
                  sh           a0, -26(gp)
                  sb           t6, 47(gp)
                  lbu          t4, 20(s4)
                  lhu          s8, -42(s4)
                  sh           t4, 52(gp)
                  sb           s10, 34(gp) #end load_store_instr_stream_1
                  lb           a1, 45(s4) #end load_store_instr_stream_0
                  la           sp, region_1+751 #start riscv_hazard_instr_stream_21
                  mulhsu       s11, s6, s11
                  c.srai       a0, 1
                  lbu          a0, 8(sp)
                  sb           s6, 14(sp)
                  lb           s6, 16(sp)
                  sb           ra, -8(sp)
                  sb           t6, -6(sp)
                  addi         t6, s11, 754
                  lbu          ra, -14(sp)
                  sw           a0, 5(sp)
                  lh           s6, 7(sp)
                  lbu          a0, -11(sp)
                  c.srai       a0, 14
                  lhu          s1, 5(sp)
                  ori          s11, s1, 1752
                  ori          s11, a0, 574
                  lbu          s11, -9(sp)
                  lb           s6, 0(sp)
                  lbu          ra, 14(sp)
                  lb           t6, -7(sp)
                  mulhu        s11, s6, t6
                  or           ra, s1, ra
                  lb           s11, -6(sp)
                  c.mv         t6, a0
                  lb           s6, 7(sp)
                  lbu          t6, -6(sp)
                  sb           ra, 3(sp)
                  mulhu        s1, s6, s11
                  lbu          s6, 2(sp)
                  lhu          s6, -11(sp)
                  lb           ra, 6(sp)
                  lb           a0, 2(sp)
                  lh           s1, -3(sp)
                  lb           t6, -8(sp) #end riscv_hazard_instr_stream_21
                  la           a0, region_0+804 #start riscv_hazard_instr_stream_3
                  lb           a3, 27(a0)
                  c.addi       a2, 24
                  sltiu        s9, a3, -1279
                  lbu          a2, 35(a0)
                  c.slli       s9, 5
                  sb           t5, -41(a0)
                  sb           a2, -40(a0)
                  div          s9, a3, t2
                  rem          t5, a3, a3
                  ori          t2, a3, -307
                  slt          a2, a3, t2
                  c.mv         a3, t2
                  slt          t2, a2, s10
                  lbu          a3, 44(a0)
                  slti         s10, s9, 1915
                  c.sub        a3, a2
                  lbu          s9, -24(a0)
                  slli         a2, t2, 0
                  sh           a3, -2(a0)
                  sltiu        a2, a3, -162
                  lb           t5, 4(a0)
                  c.srli       a3, 4
                  lb           s9, 35(a0)
                  c.slli       t5, 4
                  slli         t5, s10, 11
                  lb           s9, 55(a0)
                  auipc        s9, 315846
                  and          t2, a3, t5
                  sra          a2, a3, s9
                  sb           t5, 33(a0)
                  div          t2, a3, t5
                  lb           a2, 20(a0)
                  lui          s10, 286560
                  lb           s9, -29(a0)
                  c.mv         s9, s9
                  lb           a2, 59(a0) #end riscv_hazard_instr_stream_3
                  la           s4, region_0+578 #start riscv_load_store_rand_instr_stream_16
                  sll          s10, a4, tp
                  sh           gp, 736(s4)
                  c.or         a5, s1
                  mulhsu       a3, tp, a2
                  sb           t1, 1132(s4)
                  and          s3, t1, s9
                  and          ra, t2, t3
                  lbu          t1, 1293(s4)
                  mulhsu       a1, gp, s2
                  c.srli       s0, 8
                  c.nop
                  srl          s0, s2, t2
                  c.sub        a5, a4
                  c.nop
                  c.add        t1, a6
                  xor          t1, tp, a3
                  sltiu        t4, s7, 1120
                  c.lui        s6, 21
                  sb           t1, 825(s4)
                  sb           t1, 555(s4)
                  srai         t6, a2, 18
                  xor          s7, s7, a6
                  lb           sp, 509(s4)
                  srai         t6, t0, 3
                  lhu          tp, 996(s4)
                  c.srli       a4, 19
                  lb           t4, 1136(s4)
                  div          t6, a6, s11
                  lhu          t4, -336(s4)
                  lbu          s7, 731(s4)
                  divu         a1, t0, a1
                  sltu         gp, s4, t0
                  sb           s0, 1187(s4)
                  sb           sp, 263(s4)
                  lb           a3, -196(s4)
                  sb           a1, 825(s4)
                  c.addi       t5, -1
                  c.addi       a0, 21
                  c.lui        s0, 11
                  lb           s3, -249(s4)
                  srli         a4, zero, 30
                  lbu          a4, -519(s4) #end riscv_load_store_rand_instr_stream_16
                  la           a1, region_1+1172 #start load_store_instr_stream_2
                  la           s9, region_1+39 #start load_store_instr_stream_0
                  lbu          tp, -461(a1)
                  la           a2, region_1+292 #start load_store_instr_stream_1
                  sh           a3, -436(a1)
                  sb           sp, 12(s9)
                  lh           s3, -646(a1)
                  lbu          t2, -1139(a1)
                  lbu          s7, 30(a2)
                  sh           t3, -850(a1)
                  lbu          t5, 8(s9)
                  lb           t4, -1(a2)
                  lb           s6, 513(a1)
                  lh           s6, -54(a2)
                  lb           sp, -45(a2)
                  lb           gp, 10(s9)
                  lb           a3, -51(a2)
                  lhu          t0, -296(a1)
                  lbu          s11, -342(a1)
                  lw           s7, -372(a1)
                  lh           t0, -1(s9)
                  sw           t2, 336(a1) #end load_store_instr_stream_2
                  lb           s4, -19(a2) #end load_store_instr_stream_1
                  sb           t6, -13(s9) #end load_store_instr_stream_0
                  la           s11, region_1+1858 #start load_store_instr_stream_0
                  la           a5, region_0+1592 #start load_store_instr_stream_1
                  sb           a2, 75(s11)
                  lh           s7, 36(s11)
                  sb           s3, -55(a5)
                  lbu          ra, 52(a5)
                  sb           s7, 5(s11)
                  sh           t0, 246(a5)
                  sb           a7, -35(a5)
                  lbu          a0, -81(s11)
                  lhu          a0, -146(a5)
                  sb           s9, -163(s11)
                  lbu          s10, 255(a5)
                  lbu          sp, -227(s11)
                  lb           a4, -155(a5)
                  sb           a1, -102(a5) #end load_store_instr_stream_1
                  lhu          s9, -144(s11) #end load_store_instr_stream_0
                  la           a5, region_1+996 #start load_store_instr_stream_1
                  lb           ra, 139(a5)
                  la           s4, region_1+1885 #start load_store_instr_stream_0
                  lbu          t1, -100(a5)
                  lb           a4, -184(a5)
                  lb           a4, 46(s4)
                  lbu          ra, 203(a5)
                  lbu          s8, -216(s4)
                  lb           a0, -170(s4)
                  lbu          s7, 64(s4)
                  sb           tp, 27(a5)
                  lb           s3, 251(a5)
                  sw           s11, -221(s4)
                  lhu          s0, -98(a5) #end load_store_instr_stream_1
                  sb           gp, 55(s4) #end load_store_instr_stream_0
sub_2_55:         jal          ra, 25f
0:                jal          t0, 1f
1:                jal          a2, 24f
2:                c.jal        7f
3:                c.j          2b
4:                jal          t1, 5f
5:                jal          ra, 14f
6:                jal          ra, 26f
7:                c.jal        16f
8:                jal          t1, 20f
9:                jal          ra, 19f
10:               jal          ra, 21f
11:               c.jal        28f
12:               c.jal        8b
13:               jal          ra, 27f
14:               c.j          6b
15:               jal          ra, 29f
16:               jal          ra, 17f
17:               c.j          22f
18:               c.j          11b
19:               jal          a1, 15b
20:               jal          t0, 4b
21:               jal          s7, 9b
22:               c.jal        13b
23:               c.jal        12b
24:               c.j          18b
25:               c.jal        23b
26:               c.j          0b
27:               c.j          10b
28:               c.jal        3b
29:               c.mv         a1, t3
                  addi         a6, zero, 6 #init loop 1 counter
                  and          s1, gp, s11
                  ori          t1, t4, 1399
                  xor          s7, t6, gp
                  div          s4, t3, t1
                  addi         s6, zero, 6 #init loop 1 limit
                  mulhsu       s1, s6, s7
                  srli         s8, a0, 25
sub_2_110_1_t:    or           ra, s8, t0
                  c.nop
                  c.srai       a1, 30
                  lui          s9, 517096
                  addi         a6, a6, -5 #update loop 1 counter
                  addi         t5, zero, 2 #init loop 0 counter
                  srai         gp, sp, 11
                  sub          s1, s2, a0
                  mulh         t0, t2, sp
                  ori          t3, t3, 1852
                  addi         t0, a4, -208
                  addi         a3, zero, 17 #init loop 0 limit
                  sltu         sp, zero, zero
                  sltu         s0, t3, s8
                  c.sub        a1, a1
sub_2_110_0_t:    c.add        a4, a7
                  c.add        gp, t1
                  c.addi16sp   sp, -16
                  sltu         t1, t1, zero
                  addi         t5, t5, 2 #update loop 0 counter
                  andi         tp, a3, -1338
                  nop
                  andi         t0, t5, -1424
                  bltu         t5, a3, sub_2_110_0_t #branch for loop 0
                  divu         gp, s10, a7
                  bgeu         a6, s6, sub_2_110_1_t #branch for loop 1
                  c.mv         s4, s0
                  la           t3, amo_0+40 #start riscv_amo_instr_stream_13
                  amoadd.w.aq   a0, s8, (t3) #end riscv_amo_instr_stream_13
                  la           tp, region_1+421 #start load_store_instr_stream_1
                  la           t4, region_0+88 #start load_store_instr_stream_0
                  lb           s8, 4(tp)
                  lb           a0, -10(tp)
                  lhu          a3, -46(t4)
                  lh           s8, -11(tp)
                  sb           s3, 124(t4)
                  lb           zero, 13(tp)
                  lbu          a2, -4(tp)
                  lh           a2, 3(tp)
                  sh           t0, 70(t4)
                  lhu          a4, 16(t4)
                  sb           zero, 4(tp)
                  lbu          t2, 23(t4)
                  lb           t2, 194(t4)
                  lb           s11, 3(tp) #end load_store_instr_stream_1
                  sb           zero, -10(t4) #end load_store_instr_stream_0
                  la           s10, region_1+1729 #start riscv_load_store_rand_instr_stream_10
                  xor          t0, tp, s11
                  lh           s3, -147(s10)
                  mul          s1, s4, s2
                  lb           t0, -162(s10)
                  c.andi       s1, -1
                  rem          zero, s3, s6
                  lw           s7, -101(s10)
                  and          a4, a6, a2
                  c.or         s0, a4
                  c.srai       a2, 26
                  lb           a0, 213(s10)
                  lh           ra, -63(s10)
                  lb           a4, -237(s10)
                  srl          t6, s0, s4
                  addi         t2, s0, 1548
                  sb           t6, -38(s10)
                  c.li         t5, 8
                  auipc        tp, 759955
                  lw           s11, -57(s10)
                  lhu          a4, -197(s10)
                  sb           ra, -112(s10)
                  sh           s5, -193(s10)
                  lbu          tp, -199(s10)
                  mul          t3, a6, a0
                  srli         a6, a6, 1
                  sb           a7, 7(s10)
                  srai         a5, s3, 3
                  sub          t1, a2, a2
                  c.addi       s8, 6
                  lh           s8, 19(s10) #end riscv_load_store_rand_instr_stream_10
                  la           a3, region_1+1047 #start load_store_instr_stream_1
                  la           s9, region_0+375 #start load_store_instr_stream_0
                  lw           s3, 61(s9)
                  sb           s9, 4(a3)
                  sb           s11, 159(s9)
                  lb           ra, 48(s9)
                  lb           s6, -2(a3)
                  sb           a5, 61(s9)
                  lbu          s0, 2(a3)
                  lhu          t1, -123(s9)
                  lbu          s1, -8(a3)
                  sb           a5, 141(s9)
                  lbu          ra, 26(s9)
                  sh           s4, 13(a3)
                  lb           s6, -193(s9)
                  lh           s8, 11(a3)
                  lbu          gp, 254(s9)
                  lbu          a0, -4(a3)
                  sb           ra, -2(a3) #end load_store_instr_stream_1
                  lbu          s3, 231(s9) #end load_store_instr_stream_0
                  la           a3, amo_0+36 #start riscv_amo_instr_stream_0
                  la           a1, amo_0+8
                  la           ra, amo_0+28
                  amominu.w.rl  s4, s8, (a3)
                  amoadd.w      s0, t6, (a1)
                  amoswap.w     tp, a2, (ra)
                  amomaxu.w.aq  s11, a3, (a3)
                  amoor.w.aq    s1, s11, (a1)
                  amoor.w       s11, s4, (ra)
                  c.xor        a2, s1
                  c.slli       a0, 8
                  amomax.w.rl   a2, s6, (a1)
                  c.li         t0, -1
                  c.srai       a5, 15
                  xor          a6, s4, zero
                  amoor.w.rl    a0, a5, (a1)
                  nop
                  amoadd.w.rl   s8, s7, (ra)
                  amominu.w     t2, a5, (a1) #end riscv_amo_instr_stream_0
                  la           t6, region_1+1100 #start riscv_load_store_hazard_instr_stream_10
                  lb           a1, -17(t6)
                  lbu          t4, -43(t6)
                  lb           s1, -43(t6)
                  lbu          zero, -23(t6)
                  sb           s9, -23(t6)
                  sb           t6, -23(t6)
                  srai         a3, s4, 26
                  lb           a1, -16(t6)
                  sb           gp, -16(t6)
                  sh           a2, -16(t6)
                  lh           t2, -16(t6)
                  lhu          t3, -16(t6)
                  lh           s6, -16(t6)
                  lbu          t5, -35(t6) #end riscv_load_store_hazard_instr_stream_10
sub_2_39:         jal          ra, 23f
0:                c.jal        3f
1:                jal          ra, 13f
2:                c.jal        5f
3:                jal          t0, 9f
4:                c.j          11f
5:                c.jal        15f
6:                c.jal        16f
7:                jal          ra, 24f
8:                c.j          10f
9:                c.jal        18f
10:               c.j          22f
11:               c.jal        17f
12:               c.j          25f
13:               c.jal        14f
14:               c.jal        12b
15:               c.jal        8b
16:               jal          t1, 1b
17:               c.j          19f
18:               jal          t1, 7b
19:               c.jal        6b
20:               jal          ra, 4b
21:               c.jal        20b
22:               c.j          21b
23:               c.j          0b
24:               jal          t1, 2b
25:               c.addi4spn   a2, sp, 160
                  la           t6, region_0+272 #start riscv_load_store_rand_instr_stream_8
                  xor          s3, s2, t1
                  srli         s7, s1, 12
                  slli         zero, s9, 19
                  xor          t2, t2, t6
                  sll          s7, tp, sp
                  c.mv         s9, ra
                  rem          a3, s5, t6
                  c.and        s1, a4
                  slli         a6, s7, 28
                  andi         s3, tp, 621
                  c.li         s9, 9
                  ori          s9, a5, -1939
                  srli         a1, sp, 5
                  mulhsu       a3, t1, s6
                  lb           sp, -123(t6)
                  c.and        a4, s0
                  slti         s9, a7, -871
                  lbu          gp, 114(t6)
                  c.srai       s1, 13
                  lbu          t5, -119(t6)
                  sb           ra, -201(t6)
                  lb           sp, -237(t6)
                  c.slli       s4, 16
                  c.addi16sp   sp, -16
                  c.addi       s6, -1
                  sb           s8, 150(t6)
                  lb           s8, 61(t6)
                  c.mv         tp, t1
                  lb           s10, 83(t6)
                  lb           s8, -148(t6)
                  slli         a6, zero, 9
                  lbu          s8, -49(t6)
                  auipc        s11, 160296
                  c.slli       s3, 26
                  nop
                  sh           s2, 126(t6)
                  auipc        zero, 831404
                  lbu          s6, -253(t6)
                  c.nop
                  slli         t3, s4, 11
                  lb           a1, -33(t6) #end riscv_load_store_rand_instr_stream_8
                  la           s8, amo_0+36 #start riscv_amo_instr_stream_3
                  la           a4, amo_0+52
                  amoand.w.rl   a0, t3, (a4)
                  amoxor.w.rl   s7, s5, (s8)
                  and          s9, s1, s10
                  mul          s9, a2, s7
                  amoswap.w     s9, t3, (s8)
                  amoswap.w.aq  s10, tp, (s8)
                  and          t1, s6, s11
                  amomin.w.rl   t6, sp, (a4)
                  amoand.w      s1, t4, (s8)
                  amoswap.w     ra, t0, (a4)
                  c.addi       t5, -1
                  amoxor.w      t1, s2, (a4) #end riscv_amo_instr_stream_3
                  la           s7, amo_0+36 #start riscv_lr_sc_instr_stream_0
                  c.addi16sp   sp, 128
                  sra          s10, s3, s5
                  add          s9, s3, s1
                  xori         a5, t5, 628
                  lr.w          a5, (s7)
                  auipc        ra, 955132
                  nop
                  c.andi       a2, 19
                  divu         a2, t4, s8
                  sltiu        s6, sp, -969
                  sltu         s0, s10, s3
                  slt          t5, t5, a0
                  sc.w.rl       s9, a2, (s7) #end riscv_lr_sc_instr_stream_0
                  la           s9, region_0+508 #start load_store_instr_stream_1
                  la           a6, region_1+494 #start load_store_instr_stream_0
                  lb           a5, 218(s9)
                  sb           t5, 519(a6)
                  lbu          a2, -10(s9)
                  sb           t2, -190(a6)
                  lbu          s1, -81(s9)
                  lbu          t6, 1432(a6)
                  lbu          ra, 269(a6)
                  lb           s11, 55(s9)
                  lhu          a3, 104(a6)
                  lh           s4, -246(s9)
                  lhu          t4, -78(a6)
                  sh           t2, -44(s9)
                  lbu          s8, 231(s9)
                  lhu          t5, 1160(a6)
                  lb           s11, -149(s9) #end load_store_instr_stream_1
                  lb           s0, 47(a6)
                  lbu          s0, 1088(a6)
                  lb           tp, 897(a6) #end load_store_instr_stream_0
                  la           sp, region_1+358 #start load_store_instr_stream_1
                  la           gp, region_0+84 #start load_store_instr_stream_0
                  lbu          ra, 53(sp)
                  lh           t2, -24(sp)
                  sb           s0, 5(gp)
                  lbu          t1, 36(gp)
                  lbu          s1, 43(gp)
                  lbu          ra, -62(gp)
                  lb           ra, -31(sp)
                  lb           a6, -40(gp)
                  sh           gp, -56(sp)
                  lhu          a3, -58(gp)
                  lh           a3, 36(sp)
                  lb           a2, 50(gp)
                  sb           a4, 15(gp)
                  lbu          t2, -9(sp)
                  lbu          s3, 63(sp) #end load_store_instr_stream_1
                  lb           s10, 5(gp) #end load_store_instr_stream_0
                  la           a1, region_0+1482 #start load_store_instr_stream_1
                  sb           t0, -425(a1)
                  sb           s6, -665(a1)
                  lbu          s3, -1403(a1)
                  la           s7, region_1+1042 #start load_store_instr_stream_0
                  lb           t0, 209(a1)
                  lbu          gp, 151(a1)
                  sb           s5, -1095(a1)
                  lb           s4, 15(s7)
                  sb           a0, 103(a1)
                  sb           t6, 59(s7)
                  lbu          s1, -39(s7)
                  sb           s9, 59(s7)
                  lb           a0, 2(a1)
                  lb           tp, -1423(a1) #end load_store_instr_stream_1
                  lb           t2, -33(s7) #end load_store_instr_stream_0
                  la           s9, region_1+1847 #start load_store_instr_stream_0
                  la           gp, region_0+1815 #start load_store_instr_stream_1
                  lbu          s3, -25(gp)
                  lbu          s3, 14(gp)
                  sb           s11, -32(s9)
                  lbu          t6, 108(s9)
                  lbu          a3, -108(s9)
                  lb           s0, -58(gp)
                  sw           a1, 69(s9)
                  lhu          s10, -207(s9)
                  sb           tp, -18(gp)
                  lb           a1, 36(s9)
                  sb           a6, 30(gp) #end load_store_instr_stream_1
                  lbu          t1, -166(s9) #end load_store_instr_stream_0
                  la           s1, region_0+250 #start load_store_instr_stream_1
                  lbu          a5, 0(s1)
                  lh           a2, -8(s1)
                  la           t4, region_1+21 #start load_store_instr_stream_0
                  sb           a7, 1594(t4)
                  lh           a5, 6(s1)
                  lb           ra, 1937(t4)
                  lbu          t0, 17(t4)
                  sb           a6, 9(s1)
                  lbu          sp, 984(t4)
                  sb           a1, 13(s1)
                  lbu          sp, 9(s1)
                  lb           t2, 920(t4)
                  sh           sp, 319(t4)
                  sb           t4, 11(s1)
                  lbu          s3, 1257(t4)
                  lb           a3, 10(s1)
                  sw           gp, 14(s1)
                  lh           tp, -2(s1) #end load_store_instr_stream_1
                  sb           t2, 1824(t4) #end load_store_instr_stream_0
                  la           a3, amo_0+44 #start riscv_lr_sc_instr_stream_8
                  sltiu        t5, s8, -1112
                  lr.w.aq       zero, (a3)
                  c.slli       a4, 25
                  addi         a5, zero, 901
                  sc.w.rl       a4, s8, (a3) #end riscv_lr_sc_instr_stream_8
sub_2_46:         jal          ra, 9f
0:                c.jal        7f
1:                jal          ra, 10f
2:                c.jal        14f
3:                c.jal        1b
4:                c.jal        6f
5:                jal          ra, 2b
6:                jal          ra, 0b
7:                jal          ra, 16f
8:                jal          ra, 4b
9:                c.jal        5b
10:               c.jal        15f
11:               jal          t1, 3b
12:               jal          t1, 17f
13:               c.j          8b
14:               jal          ra, 13b
15:               c.j          12b
16:               c.j          11b
17:               c.slli       t2, 7
                  la           t4, amo_0+48 #start riscv_amo_instr_stream_11
                  la           s9, amo_0+56
                  la           s11, amo_0+44
                  la           t5, amo_0+8
                  add          a0, t6, s8
                  amoadd.w.rl   tp, a2, (s11)
                  amoswap.w     s0, a1, (t4)
                  amoor.w.aq    a6, sp, (t5)
                  amominu.w.rl  s8, s10, (t5)
                  c.andi       s1, 7
                  amoand.w.rl   ra, t2, (s11) #end riscv_amo_instr_stream_11
                  la           sp, region_1+1241 #start riscv_hazard_instr_stream_1
                  sb           t1, -10(sp)
                  mulhsu       s10, a1, s7
                  c.li         t1, 13
                  lbu          s7, 11(sp)
                  lbu          s7, 12(sp)
                  lb           s10, 6(sp)
                  lb           s7, 13(sp)
                  lb           s7, -3(sp)
                  lbu          s10, -14(sp)
                  sb           s7, -2(sp)
                  srli         t1, s7, 30
                  slti         a4, s6, 1732
                  lh           a1, -1(sp)
                  mulhsu       s6, a4, t1
                  c.srai       a1, 7
                  andi         s10, s10, -121
                  sh           a4, -7(sp)
                  sw           a1, 11(sp)
                  c.nop
                  sb           s10, 6(sp)
                  sltiu        a1, s10, -405
                  lb           a4, 4(sp)
                  divu         s7, s7, s10
                  lhu          s7, -1(sp)
                  sb           t1, 16(sp)
                  div          a4, s6, a1
                  lhu          t1, -7(sp)
                  and          s6, s7, s6
                  lb           s7, -10(sp)
                  mulh         a4, s6, a1
                  sh           s10, -15(sp)
                  c.xor        a1, a1
                  sltiu        a4, a4, -94
                  lbu          s10, -4(sp)
                  lb           s10, 11(sp) #end riscv_hazard_instr_stream_1
                  la           gp, region_1+9 #start riscv_load_store_rand_instr_stream_1
                  c.slli       s11, 17
                  sh           s1, 9(gp)
                  c.and        a3, a0
                  lb           ra, 52(gp)
                  lb           tp, 30(gp)
                  c.srli       a3, 14
                  sb           s4, 16(gp)
                  lbu          s10, 43(gp)
                  sltiu        a3, s7, 648
                  lh           s8, 13(gp)
                  lb           t1, 28(gp)
                  sra          a1, t3, t6
                  srli         s10, a6, 6
                  mulh         a2, tp, t2
                  c.addi16sp   sp, 240
                  lbu          sp, 28(gp)
                  addi         zero, sp, 281
                  slli         s10, s5, 27
                  lh           t5, -5(gp)
                  div          t3, s11, t0
                  lui          s1, 535671
                  lhu          zero, 33(gp)
                  addi         s8, tp, -1703
                  lb           s4, 49(gp)
                  divu         a5, zero, s10
                  c.xor        s0, a0
                  lw           s9, 23(gp)
                  sub          a2, s0, a5
                  c.li         a2, 9
                  sh           tp, 39(gp)
                  sra          a5, t6, s11
                  sb           ra, 41(gp)
                  sb           ra, 24(gp)
                  sra          s10, s5, s11
                  lbu          s0, -6(gp)
                  div          zero, s0, s11
                  lh           t4, 7(gp) #end riscv_load_store_rand_instr_stream_1
                  la           sp, amo_0+28 #start riscv_lr_sc_instr_stream_13
                  slli         t4, a4, 30
                  auipc        s11, 741055
                  c.li         s4, -1
                  slt          t6, t3, s10
                  c.add        a6, a6
                  c.srai       a3, 20
                  and          a3, a2, s6
                  c.addi       a0, 4
                  c.add        s9, t4
                  lr.w.rl       t6, (sp)
                  c.addi       s4, -1
                  andi         s1, t1, -1348
                  and          s11, zero, s11
                  sc.w          s3, tp, (sp) #end riscv_lr_sc_instr_stream_13
                  la           tp, region_0+767 #start riscv_hazard_instr_stream_15
                  addi         a6, t4, 1370
                  sh           t2, -141(tp)
                  lb           t2, -204(tp)
                  lb           a6, 38(tp)
                  lbu          gp, -198(tp)
                  mulhu        gp, a4, t2
                  lw           a4, 221(tp)
                  lb           a6, 127(tp)
                  sb           a4, -172(tp)
                  c.srai       a4, 25
                  lbu          t4, 45(tp)
                  sb           s7, 256(tp)
                  lb           s7, 210(tp)
                  andi         a4, t4, -438
                  lb           gp, -56(tp)
                  lb           gp, -118(tp)
                  c.and        a4, a4
                  lbu          t2, 160(tp)
                  lbu          t4, -136(tp)
                  lb           t2, 48(tp)
                  lbu          s7, -10(tp)
                  xori         t2, a4, 1228
                  sw           a4, 213(tp)
                  div          s7, a6, a4
                  slli         t2, a6, 15
                  lbu          a4, -115(tp)
                  sh           t4, -149(tp)
                  addi         a4, t4, 921
                  xor          a6, s7, s7
                  add          t2, a6, gp
                  sb           t4, 160(tp)
                  lb           a4, 18(tp)
                  sb           a4, 56(tp)
                  lbu          a6, 58(tp)
                  lbu          t4, 128(tp)
                  div          t4, t2, t2
                  mul          t2, s7, a6
                  c.addi       a4, -1
                  c.li         t2, 19
                  slti         a4, t4, 1333
                  sh           t2, -1(tp)
                  lhu          a4, 189(tp)
                  c.slli       gp, 24
                  lb           t2, 159(tp)
                  lb           a4, 187(tp) #end riscv_hazard_instr_stream_15
                  addi         s3, zero, 0 #init loop 1 counter
                  srl          a2, a6, s9
                  addi         sp, zero, 19 #init loop 1 limit
                  sltu         tp, t0, t6
                  sltiu        s9, s8, -234
sub_2_108_1_t:    sltiu        a0, s1, 1253
                  slt          t5, t2, s9
                  xori         s1, s11, 1705
                  addi         s3, s3, 1 #update loop 1 counter
                  addi         s0, zero, -7 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
                  ori          t2, t1, 751
                  mulh         a1, t3, a3
                  div          a1, s6, t3
sub_2_108_0_t:    c.add        s6, s7
                  addi         s0, s0, 7 #update loop 0 counter
                  sltu         a5, a3, s10
                  c.or         a4, a4
                  c.beqz       s0, sub_2_108_0_t #branch for loop 0
                  bltu         s3, sp, sub_2_108_1_t #branch for loop 1
                  c.lui        s1, 8
                  la           gp, amo_0+48 #start riscv_amo_instr_stream_1
                  la           s11, amo_0+36
                  la           t2, amo_0+0
                  amoxor.w.aq   t3, sp, (gp)
                  amoand.w      zero, t3, (t2)
                  remu         s10, zero, t3
                  sra          ra, s3, t3
                  amomaxu.w.aq  a2, zero, (s11)
                  c.slli       a1, 30
                  slti         sp, a2, -1970
                  amoor.w.aq    a0, s1, (s11)
                  div          t0, tp, s2
                  amomaxu.w     s8, s5, (t2)
                  amomin.w      t6, ra, (t2)
                  amomaxu.w     t4, s5, (t2)
                  amoxor.w.rl   s6, a7, (gp)
                  amoadd.w.aq   s7, a2, (gp)
                  amomin.w.rl   a2, t0, (gp) #end riscv_amo_instr_stream_1
                  la           a5, amo_0+8 #start riscv_lr_sc_instr_stream_10
                  div          zero, t1, a2
                  lr.w          t1, (a5)
                  mulhsu       a3, a4, tp
                  sc.w          s8, t2, (a5) #end riscv_lr_sc_instr_stream_10
                  la           a6, region_0+1552 #start load_store_instr_stream_0
                  lb           gp, -234(a6)
                  la           sp, region_1+1847 #start load_store_instr_stream_1
                  lh           s9, 164(a6)
                  lw           ra, -1007(sp)
                  lbu          t5, 9(a6)
                  sw           gp, -579(sp)
                  sb           s11, 221(a6)
                  lbu          a4, -1584(sp)
                  lb           s0, 88(sp)
                  sb           t6, 175(a6)
                  lb           a1, -258(sp)
                  lw           a5, -248(a6)
                  lb           s8, -1272(sp) #end load_store_instr_stream_1
                  sb           a3, 87(a6)
                  lhu          t4, -134(a6) #end load_store_instr_stream_0
                  la           a6, amo_0+44 #start riscv_lr_sc_instr_stream_15
                  sub          t4, s8, t2
                  lr.w.aq       t3, (a6)
                  sc.w.aq       s1, a5, (a6) #end riscv_lr_sc_instr_stream_15
sub_2_58:         jal          ra, 11f
0:                c.jal        9f
1:                jal          ra, 8f
2:                c.j          6f
3:                c.j          4f
4:                c.jal        10f
5:                jal          a0, 3b
6:                c.j          1b
7:                c.j          12f
8:                jal          ra, 0b
9:                c.j          5b
10:               jal          t1, 7b
11:               jal          s11, 2b
12:               c.li         s1, 20
                  la           sp, region_0+1879 #start riscv_load_store_hazard_instr_stream_18
                  sb           s9, -29(sp)
                  lhu          s6, -29(sp)
                  c.srai       s0, 10
                  lbu          a4, -20(sp)
                  sb           t3, -20(sp)
                  lbu          t0, -20(sp)
                  lb           s3, -20(sp)
                  lb           t3, -20(sp)
                  lbu          ra, -20(sp)
                  lb           s1, -20(sp)
                  c.sub        s0, a0
                  lb           s7, -20(sp)
                  sb           gp, -20(sp)
                  lb           t1, -20(sp)
                  sb           s9, -20(sp)
                  sb           s4, -20(sp)
                  lh           a6, 49(sp)
                  lbu          s0, 49(sp)
                  sb           a6, 49(sp)
                  sb           gp, 60(sp)
                  sb           a3, -12(sp)
                  lbu          t4, -12(sp) #end riscv_load_store_hazard_instr_stream_18
                  la           t3, amo_0+48 #start riscv_amo_instr_stream_12
                  la           s7, amo_0+4
                  la           sp, amo_0+28
                  amomax.w.rl   s8, s11, (s7)
                  sra          t6, gp, s4
                  c.sub        a1, a2
                  amoadd.w.aq   s11, s0, (s7)
                  amoswap.w.rl  a1, s0, (s7)
                  amomin.w.aq   t0, s4, (sp) #end riscv_amo_instr_stream_12
                  la           t0, region_1+1327 #start riscv_load_store_hazard_instr_stream_15
                  sw           zero, -11(t0)
                  srl          a5, ra, a0
                  sltiu        t2, t5, 1477
                  sw           t1, -11(t0)
                  sb           a1, -11(t0)
                  sltu         a5, sp, ra
                  addi         s7, s10, 1295
                  lb           t4, -11(t0)
                  sh           s9, -11(t0)
                  c.slli       s3, 19
                  sw           s6, -11(t0)
                  sw           s2, -11(t0)
                  lb           sp, -11(t0)
                  lw           a2, -11(t0)
                  c.add        t3, s11
                  sh           a7, -11(t0) #end riscv_load_store_hazard_instr_stream_15
                  la           s3, region_1+1081 #start load_store_instr_stream_2
                  la           a0, region_1+1213 #start load_store_instr_stream_1
                  la           a2, region_1+1171 #start load_store_instr_stream_0
                  lbu          t6, -578(s3)
                  lbu          t4, -30(a0)
                  sb           a7, -57(a2)
                  sb           a4, 588(s3)
                  lhu          t6, -43(a2)
                  sh           s7, 29(a2)
                  lb           tp, 785(s3)
                  sb           s7, -140(s3)
                  lbu          s4, 13(a0)
                  lh           s4, -35(a2)
                  sh           s7, 11(a2)
                  lb           s0, 246(s3)
                  lw           t1, 51(a0)
                  sh           s9, -47(a2)
                  sh           s1, 53(a0)
                  lb           zero, -40(a0) #end load_store_instr_stream_1
                  lhu          s10, 623(s3)
                  sb           a0, 167(s3)
                  lbu          a3, -40(a2)
                  sb           tp, -16(a2)
                  lb           a6, 676(s3)
                  lbu          s10, 306(s3) #end load_store_instr_stream_2
                  lbu          s4, 38(a2) #end load_store_instr_stream_0
                  la           t0, region_0+1342 #start riscv_load_store_hazard_instr_stream_16
                  lb           a1, 80(t0)
                  lh           ra, 80(t0)
                  sh           s10, 80(t0)
                  sb           s7, 80(t0)
                  lb           a2, 80(t0)
                  lhu          ra, 80(t0)
                  lw           t4, -22(t0)
                  lhu          tp, -22(t0)
                  c.nop
                  c.andi       a5, -1
                  ori          t6, a7, 1330
                  lh           a2, -22(t0)
                  lhu          a4, -22(t0)
                  sw           s2, -22(t0)
                  lhu          t5, -22(t0)
                  sh           t6, -22(t0)
                  sw           s4, -22(t0)
                  lh           s8, -22(t0)
                  lw           ra, -22(t0)
                  lb           s0, -22(t0)
                  lhu          t6, -22(t0) #end riscv_load_store_hazard_instr_stream_16
                  la           a6, region_0+1438 #start riscv_load_store_hazard_instr_stream_3
                  sh           a3, -2(a6)
                  lb           t6, -2(a6)
                  lw           a2, -2(a6)
                  lbu          a5, 3(a6)
                  sb           zero, 3(a6)
                  sb           s11, 3(a6)
                  lbu          s1, 3(a6)
                  lb           s8, 3(a6)
                  lb           a0, 3(a6)
                  lbu          s10, 3(a6)
                  sb           sp, 3(a6)
                  lbu          a5, 3(a6)
                  c.li         t4, -1
                  sb           zero, 3(a6)
                  lh           gp, -6(a6)
                  lbu          a1, 15(a6)
                  sb           a1, -16(a6)
                  sltu         s6, a5, s1
                  lbu          t4, -16(a6) #end riscv_load_store_hazard_instr_stream_3
                  la           a5, region_1+380 #start load_store_instr_stream_1
                  lbu          t2, 1(a5)
                  la           a6, region_0+1601 #start load_store_instr_stream_0
                  lbu          tp, 16(a5)
                  lw           s6, 159(a6)
                  lhu          a2, -175(a6)
                  sb           sp, -9(a5)
                  c.sw         a3, 0(a5)
                  lbu          s11, -228(a6)
                  lb           a3, -3(a5)
                  lhu          a3, 0(a5)
                  lbu          s11, -102(a6)
                  sb           s11, -5(a5)
                  lh           tp, 0(a5)
                  lbu          t1, -3(a5)
                  lbu          zero, -157(a6)
                  lhu          s7, -14(a5) #end load_store_instr_stream_1
                  sb           a5, -2(a6) #end load_store_instr_stream_0
                  la           a6, region_0+1837 #start riscv_load_store_rand_instr_stream_20
                  lb           t0, 117(a6)
                  c.sub        a3, s0
                  sw           s6, -145(a6)
                  rem          tp, t4, a1
                  lbu          ra, 68(a6)
                  sb           gp, 95(a6)
                  c.srai       a0, 4
                  and          gp, t1, a5
                  c.addi       t6, 1
                  c.srli       s1, 18
                  sw           t1, 135(a6)
                  lb           sp, 132(a6)
                  c.xor        s1, a4
                  sh           s5, 161(a6)
                  c.xor        a4, s0
                  sh           s10, -231(a6)
                  mulhu        sp, s3, a1
                  sw           a7, -53(a6)
                  sra          s4, s7, s7
                  sb           a0, -34(a6)
                  rem          a5, s1, t6
                  lbu          s3, 109(a6)
                  lh           s8, -155(a6)
                  c.add        s8, a5
                  lb           a3, -27(a6)
                  lb           t5, 120(a6)
                  c.or         a2, a2
                  c.addi       a5, -1
                  c.or         a0, s0
                  lbu          s3, -109(a6)
                  lb           s1, -162(a6)
                  lw           t5, -93(a6)
                  c.mv         t1, t3
                  c.srai       a3, 2
                  lb           gp, -222(a6)
                  sb           s2, -246(a6)
                  lbu          t2, 152(a6)
                  lb           s9, -246(a6)
                  lbu          s4, -115(a6)
                  lbu          a2, -78(a6)
                  srli         t3, t1, 20
                  lhu          t6, 77(a6)
                  c.xor        s1, a2
                  mul          s8, s5, a0
                  xori         t4, ra, 1260
                  mulh         s11, t5, t2
                  lb           a1, -76(a6)
                  xor          tp, s1, sp
                  sb           a5, 101(a6) #end riscv_load_store_rand_instr_stream_20
sub_2_51:         jal          ra, 17f
0:                c.jal        4f
1:                c.jal        9f
2:                c.j          22f
3:                jal          ra, 21f
4:                jal          ra, 8f
5:                jal          ra, 7f
6:                jal          ra, 23f
7:                jal          s4, 1b
8:                c.j          6b
9:                jal          t1, 15f
10:               jal          ra, 5b
11:               c.jal        20f
12:               c.j          14f
13:               jal          ra, 2b
14:               c.j          18f
15:               c.j          3b
16:               c.jal        10b
17:               jal          t1, 19f
18:               jal          ra, 24f
19:               c.jal        0b
20:               c.j          16b
21:               jal          ra, 13b
22:               c.jal        12b
23:               c.j          11b
24:               remu         s0, s9, s7
                  la           a2, amo_0+40 #start riscv_lr_sc_instr_stream_3
                  xori         zero, sp, -1061
                  nop
                  c.mv         a3, t6
                  div          t6, s5, t4
                  sra          s11, t5, s9
                  mulhu        t2, s8, tp
                  c.li         ra, -1
                  lr.w          t0, (a2)
                  c.addi4spn   a3, sp, 288
                  or           gp, t1, a1
                  sub          a0, a7, a1
                  srli         s8, t6, 18
                  xori         t5, tp, 611
                  auipc        sp, 633678
                  c.mv         t5, s2
                  sc.w.rl       zero, s2, (a2) #end riscv_lr_sc_instr_stream_3
sub_2_53:         jal          ra, 20f
0:                c.j          19f
1:                c.jal        2f
2:                jal          t5, 23f
3:                c.jal        0b
4:                jal          ra, 9f
5:                c.jal        1b
6:                c.jal        15f
7:                c.jal        5b
8:                c.jal        4b
9:                jal          ra, 17f
10:               jal          ra, 18f
11:               c.jal        22f
12:               c.j          13f
13:               c.jal        8b
14:               c.j          6b
15:               c.j          24f
16:               c.jal        11b
17:               c.jal        10b
18:               c.j          16b
19:               c.jal        21f
20:               c.j          7b
21:               c.j          12b
22:               c.jal        14b
23:               c.jal        3b
24:               sub          sp, a4, a0
sub_2_38:         jal          ra, 4f
0:                jal          t1, 11f
1:                c.jal        7f
2:                jal          ra, 1b
3:                c.j          6f
4:                jal          ra, 3b
5:                jal          s11, 8f
6:                jal          ra, 2b
7:                jal          ra, 9f
8:                jal          ra, 0b
9:                jal          a5, 10f
10:               c.jal        5b
11:               c.mv         s9, t6
                  la           a6, region_1+681 #start riscv_load_store_hazard_instr_stream_6
                  lbu          s9, -112(a6)
                  lh           t3, 475(a6)
                  sb           s4, 475(a6)
                  mulhsu       s6, a4, t3
                  slt          s1, s10, s10
                  lw           s4, 475(a6)
                  sb           t1, 1185(a6)
                  lbu          t6, 1185(a6)
                  lh           s3, 1185(a6)
                  sll          a1, s9, s9
                  sw           s0, -369(a6)
                  divu         t5, s10, t5
                  sltu         t5, a5, a4
                  c.lui        a5, 26
                  sh           a4, -117(a6)
                  or           ra, ra, t2
                  lb           t3, -574(a6) #end riscv_load_store_hazard_instr_stream_6
                  la           s1, region_1+1434 #start load_store_instr_stream_3
                  la           a2, region_1+894 #start load_store_instr_stream_0
                  lb           a0, 43(s1)
                  la           s9, region_1+664 #start load_store_instr_stream_1
                  lbu          a6, -15(a2)
                  la           t5, region_1+694 #start load_store_instr_stream_4
                  la           s0, region_1+1694 #start load_store_instr_stream_2
                  sw           a4, 4(s9)
                  lw           a3, -10(a2)
                  lhu          gp, 12(t5)
                  lw           t3, 12(s9)
                  lh           ra, -28(s1)
                  lbu          a6, 7(t5)
                  lb           s6, -13(a2)
                  lw           s4, -12(s9)
                  lhu          a5, -62(s0)
                  lbu          zero, -11(t5)
                  lb           ra, -29(s1)
                  lb           sp, -13(t5)
                  sb           ra, 15(a2)
                  lh           t4, -20(s1)
                  lbu          t3, 12(a2)
                  lb           t0, -1(s9)
                  lb           t4, -35(s0)
                  lbu          s3, -7(a2)
                  lb           t3, 9(s9)
                  lb           t3, -40(s0)
                  sb           sp, -3(s9)
                  lhu          gp, -46(s0)
                  sb           a3, 7(t5)
                  sb           s9, -13(s1)
                  lb           t6, 16(t5) #end load_store_instr_stream_4
                  sb           a2, -15(a2)
                  lb           a4, 8(s9) #end load_store_instr_stream_1
                  lbu          s4, -7(a2)
                  lbu          ra, -25(s1)
                  lb           t2, 53(s1)
                  lbu          a6, 8(s0) #end load_store_instr_stream_2
                  lbu          s11, -48(s1)
                  sb           a1, 7(a2)
                  lb           t0, -62(s1)
                  lb           t0, -40(s1) #end load_store_instr_stream_3
                  lb           s11, 8(a2) #end load_store_instr_stream_0
                  la           sp, region_1+1403 #start riscv_load_store_rand_instr_stream_11
                  srl          s0, zero, s8
                  addi         s11, t2, -656
                  c.nop
                  lbu          a2, 542(sp)
                  lbu          ra, 516(sp)
                  sb           tp, -856(sp)
                  lhu          s10, 527(sp)
                  add          a6, s6, a7
                  lw           s9, -239(sp)
                  remu         t6, sp, a7
                  lb           a3, -777(sp)
                  c.slli       a3, 9
                  lb           a4, 26(sp)
                  sh           a0, -547(sp)
                  c.or         s1, a4
                  mulhu        a5, s2, t0
                  and          tp, a5, a3
                  srli         t1, a3, 15
                  lbu          ra, -1074(sp)
                  sra          a4, s9, s6
                  c.sub        a5, s0
                  remu         a5, sp, t1
                  c.addi       s6, -1
                  lb           a0, 1(sp)
                  c.sub        a3, a2
                  lhu          tp, -1205(sp)
                  lbu          a0, 430(sp)
                  lbu          a0, -60(sp)
                  sltiu        ra, s7, -1748
                  slt          a1, s10, a3
                  lb           t2, 28(sp)
                  c.sub        a3, s0
                  lbu          a0, 19(sp)
                  lb           s7, -404(sp)
                  and          s8, t3, gp
                  lb           t5, -1336(sp)
                  c.lui        s6, 25
                  auipc        tp, 60734
                  sw           a6, 153(sp) #end riscv_load_store_rand_instr_stream_11
sub_2_56:         jal          ra, 1f
0:                c.jal        16f
1:                jal          ra, 19f
2:                c.j          13f
3:                c.j          7f
4:                c.j          18f
5:                c.j          23f
6:                c.j          12f
7:                c.j          2b
8:                jal          gp, 15f
9:                jal          t1, 6b
10:               jal          t1, 14f
11:               c.jal        0b
12:               c.j          3b
13:               c.j          24f
14:               c.j          5b
15:               c.j          9b
16:               c.j          17f
17:               c.jal        4b
18:               jal          ra, 10b
19:               c.j          8b
20:               c.j          25f
21:               c.j          22f
22:               c.j          11b
23:               jal          ra, 20b
24:               c.jal        21b
25:               andi         a2, s5, 899
                  la           ra, amo_0+56 #start riscv_lr_sc_instr_stream_5
                  or           t3, a1, s2
                  lr.w.rl       a3, (ra)
                  sc.w          s0, s5, (ra) #end riscv_lr_sc_instr_stream_5
                  la           sp, amo_0+48 #start riscv_lr_sc_instr_stream_9
                  c.xor        a1, a3
                  lr.w.rl       s1, (sp)
                  sra          s7, a0, t1
                  srl          s6, s6, a0
                  sc.w          s7, s9, (sp) #end riscv_lr_sc_instr_stream_9
                  la           s6, region_0+1535 #start load_store_instr_stream_1
                  la           t1, region_0+1960 #start load_store_instr_stream_0
                  lb           s9, -21(t1)
                  lb           s4, 0(s6)
                  lh           s3, -26(t1)
                  lb           t3, -1(t1)
                  sb           t1, 23(t1)
                  sb           a0, 11(s6)
                  sw           a2, 13(s6)
                  lb           ra, -47(t1)
                  lb           a5, -15(s6)
                  lh           t2, 1(s6)
                  lb           a6, -35(t1)
                  lbu          a2, -15(t1)
                  lbu          s7, -14(s6)
                  lhu          t2, -54(t1)
                  sh           gp, 32(t1)
                  sh           a2, -13(s6) #end load_store_instr_stream_1
                  lb           t3, -4(t1) #end load_store_instr_stream_0
sub_2_44:         jal          ra, 6f
0:                c.jal        10f
1:                jal          ra, 2f
2:                c.j          9f
3:                c.jal        7f
4:                jal          ra, 16f
5:                jal          tp, 13f
6:                c.jal        12f
7:                c.jal        5b
8:                c.jal        0b
9:                jal          t5, 15f
10:               c.j          1b
11:               jal          ra, 3b
12:               c.j          14f
13:               jal          t0, 8b
14:               c.j          11b
15:               c.j          4b
16:               srai         s8, s11, 31
                  la           s6, region_0+783 #start riscv_hazard_instr_stream_0
                  remu         s7, a3, s1
                  c.or         a4, s1
                  c.andi       s1, 20
                  mulhu        s0, gp, s1
                  c.and        a3, a3
                  lhu          a3, 7(s6)
                  nop
                  slt          s1, a4, s7
                  srai         a4, gp, 26
                  c.sub        a4, a3
                  srli         gp, a4, 17
                  lui          gp, 1009035
                  remu         a4, a3, a4
                  lb           s0, 47(s6)
                  ori          gp, a3, 705
                  sb           a4, 30(s6)
                  lb           s7, 22(s6)
                  lbu          s0, -34(s6)
                  mul          a4, s0, s7
                  slt          a3, gp, s0
                  nop
                  lui          gp, 388682
                  sh           s7, -37(s6)
                  sb           a3, 53(s6)
                  mulh         gp, s0, gp
                  remu         a4, gp, s1
                  mulh         gp, gp, s1
                  c.slli       a4, 22
                  ori          s0, a3, -1928
                  lb           a4, 52(s6)
                  c.or         a4, s0
                  c.slli       gp, 31
                  mul          gp, gp, a4
                  lb           a4, -45(s6)
                  c.li         a4, -1
                  lb           gp, 1(s6)
                  lb           a4, -42(s6)
                  lh           a4, -57(s6) #end riscv_hazard_instr_stream_0
sub_2_45:         jal          ra, 0f
0:                c.j          6f
1:                c.j          9f
2:                c.j          8f
3:                c.j          4f
4:                c.j          14f
5:                c.j          3b
6:                jal          a0, 1b
7:                c.jal        12f
8:                c.jal        7b
9:                c.j          2b
10:               c.jal        11f
11:               jal          ra, 15f
12:               c.jal        13f
13:               c.j          5b
14:               c.jal        10b
15:               srli         a6, s2, 11
                  la           t6, region_0+1433 #start riscv_load_store_hazard_instr_stream_5
                  lb           a2, -1194(t6)
                  mulhsu       a6, s0, s3
                  lbu          s4, -1147(t6)
                  sub          s1, t4, tp
                  div          t4, s6, t1
                  sb           a1, -359(t6)
                  srli         a1, t0, 19
                  sb           t0, 126(t6)
                  lbu          sp, 126(t6)
                  lbu          gp, -112(t6)
                  c.srai       a2, 30
                  sb           a1, 432(t6)
                  sb           t5, 312(t6)
                  lb           s1, -1034(t6)
                  lb           a3, -345(t6)
                  lbu          s0, -484(t6)
                  lb           ra, -140(t6) #end riscv_load_store_hazard_instr_stream_5
sub_2_43:         jal          ra, 9f
0:                c.jal        6f
1:                c.jal        15f
2:                c.j          11f
3:                c.jal        7f
4:                jal          t1, 17f
5:                jal          t4, 2b
6:                c.j          20f
7:                c.jal        12f
8:                c.j          19f
9:                c.jal        5b
10:               c.j          18f
11:               jal          tp, 10b
12:               c.jal        4b
13:               c.jal        1b
14:               c.j          13b
15:               c.j          0b
16:               jal          t1, 14b
17:               c.jal        8b
18:               c.j          3b
19:               jal          t0, 16b
20:               c.addi       t4, -1
                  la           t1, region_1+1259 #start riscv_load_store_hazard_instr_stream_21
                  lb           s6, 12(t1)
                  sb           s4, 12(t1)
                  sb           a7, 12(t1)
                  sb           t4, 12(t1)
                  sb           s2, 12(t1)
                  c.srai       a2, 3
                  sb           a5, 12(t1)
                  lbu          t2, -2(t1)
                  lb           a1, -2(t1)
                  lb           a5, -2(t1)
                  lb           t0, -2(t1)
                  sb           s8, 16(t1)
                  lbu          s11, 16(t1)
                  sb           s11, 16(t1)
                  lbu          t3, 4(t1)
                  lbu          a3, 4(t1)
                  sll          zero, s11, gp
                  lbu          a2, 4(t1)
                  sb           s8, 4(t1)
                  sb           s8, 9(t1) #end riscv_load_store_hazard_instr_stream_21
                  la           ra, amo_0+48 #start riscv_lr_sc_instr_stream_2
                  rem          t5, s3, a1
                  lr.w.rl       t5, (ra)
                  or           s0, s6, a4
                  srl          t5, tp, s0
                  c.mv         a1, s0
                  div          s8, s0, tp
                  mul          s9, s9, t6
                  sc.w.rl       s8, a2, (ra) #end riscv_lr_sc_instr_stream_2
                  la           t5, region_1+1896 #start riscv_load_store_rand_instr_stream_0
                  lbu          zero, 98(t5)
                  sb           t6, -95(t5)
                  c.srli       s1, 30
                  lb           a1, -127(t5)
                  sll          s11, s3, a1
                  lhu          s8, 102(t5)
                  lbu          ra, -197(t5)
                  xori         s11, a3, 931
                  lbu          s1, -215(t5)
                  lbu          a0, -121(t5)
                  lh           s0, -22(t5)
                  c.addi       s3, -1
                  c.srli       a0, 4
                  sb           t3, 3(t5)
                  addi         a2, s9, 1778
                  lb           a1, -109(t5)
                  sw           s2, -112(t5)
                  slt          t1, ra, a4
                  lbu          s3, -127(t5)
                  slt          s8, gp, a6
                  mulhu        s1, t3, t3
                  lb           a1, 81(t5)
                  sh           zero, -4(t5)
                  lb           s0, 10(t5)
                  sb           a2, 16(t5)
                  sltiu        s1, s4, 1533
                  c.lui        t4, 15
                  lb           a3, -13(t5)
                  lhu          t1, -76(t5)
                  c.xor        s0, a2
                  c.addi4spn   s0, sp, 480
                  sb           tp, -101(t5) #end riscv_load_store_rand_instr_stream_0
                  la           a5, region_0+308 #start riscv_load_store_rand_instr_stream_18
                  lbu          a3, 21(a5)
                  lbu          a6, -169(a5)
                  slti         s6, t2, -440
                  sltiu        s3, a7, -1849
                  sh           a2, -246(a5)
                  xori         t6, tp, 343
                  c.add        s1, s11
                  c.mv         s9, sp
                  sh           s3, -62(a5)
                  sb           s1, 543(a5)
                  lbu          t4, -255(a5)
                  srai         a6, a0, 7
                  lw           sp, -88(a5)
                  or           gp, s4, t5
                  c.andi       a3, 3
                  sltiu        a6, s6, -848
                  sh           s6, 1588(a5)
                  srai         t5, a3, 31
                  c.nop
                  c.xor        a0, s0
                  lbu          t5, 1187(a5)
                  lbu          a0, 1061(a5)
                  lbu          s6, -210(a5)
                  lbu          s4, -67(a5)
                  slti         s10, t2, 636
                  c.li         a0, -1
                  c.slli       gp, 22
                  lb           s1, 842(a5)
                  c.andi       a3, 7
                  sb           t3, 1499(a5)
                  c.slli       t2, 6
                  sw           a4, 256(a5)
                  and          tp, t6, a1
                  sb           s3, 1179(a5)
                  sb           s10, 110(a5)
                  lh           gp, 796(a5)
                  lhu          a1, 1668(a5)
                  lbu          s0, -139(a5)
                  lh           s8, 928(a5)
                  c.srai       a2, 19
                  c.mv         s9, gp
                  mulhu        t2, s8, s10
                  lb           s9, 1176(a5)
                  lui          t6, 402665
                  lbu          t0, 1294(a5)
                  sb           t2, 766(a5)
                  sra          a2, s0, t2
                  addi         a0, t2, -1374
                  sra          t6, s7, s2
                  or           t0, s5, s0
                  slt          s0, ra, t0
                  lbu          s7, -216(a5)
                  lui          zero, 75143
                  lbu          s4, 1375(a5) #end riscv_load_store_rand_instr_stream_18
                  la           sp, region_0+1791 #start riscv_load_store_rand_instr_stream_13
                  lhu          a0, -1325(sp)
                  lhu          s6, 187(sp)
                  lb           a6, -796(sp)
                  sb           a1, -1485(sp)
                  sb           a2, -112(sp)
                  lui          s7, 744075
                  or           tp, tp, s1
                  lhu          s7, -261(sp)
                  mulh         s1, a0, a5
                  lbu          s3, -1115(sp)
                  mulh         zero, s6, a5
                  lhu          s10, 81(sp)
                  lhu          ra, -1361(sp)
                  mul          a5, s9, a3
                  lb           a5, 53(sp)
                  xor          t6, a0, a3
                  sll          s6, s10, t2
                  sb           s5, -1386(sp)
                  slt          tp, tp, t1
                  srl          t4, s10, s0
                  sb           a2, -598(sp)
                  sltu         s7, a4, s5
                  sb           t5, -1656(sp)
                  mulhu        t2, t2, t4
                  sh           a5, -1575(sp)
                  lb           s1, -1172(sp)
                  and          s9, s5, t2
                  lw           a3, -131(sp)
                  divu         s3, a3, gp
                  sh           t0, -431(sp) #end riscv_load_store_rand_instr_stream_13
                  la           sp, region_1+703 #start riscv_hazard_instr_stream_2
                  slt          s3, s3, a4
                  lbu          a4, 0(sp)
                  sltu         a1, s0, s3
                  rem          a5, a1, a5
                  c.xor        a5, s1
                  lw           s0, 1(sp)
                  sb           s0, -5(sp)
                  lb           a1, 10(sp)
                  lh           s1, 13(sp)
                  andi         s0, a5, 1483
                  and          s1, a5, a4
                  lb           s1, 5(sp)
                  div          s1, a4, a5
                  c.or         s1, s0
                  c.li         s0, -1
                  sh           a1, -3(sp)
                  srl          s3, s1, a1
                  lhu          s0, -15(sp)
                  c.or         a4, s0
                  slt          s3, s1, a4
                  sll          s1, a4, s3
                  and          s3, s1, s0
                  sra          a1, s3, s0
                  sb           a5, -5(sp)
                  lbu          a5, 4(sp)
                  lbu          s1, -4(sp)
                  c.srai       a5, 6
                  lw           s3, 13(sp)
                  sb           a4, 10(sp) #end riscv_hazard_instr_stream_2
sub_2_42:         jal          ra, 7f
0:                jal          s8, 8f
1:                jal          t1, 16f
2:                jal          ra, 1b
3:                c.jal        14f
4:                jal          t1, 25f
5:                c.jal        9f
6:                jal          t1, 19f
7:                c.j          3b
8:                c.j          2b
9:                jal          ra, 10f
10:               jal          ra, 11f
11:               c.j          24f
12:               c.jal        21f
13:               jal          t5, 17f
14:               c.jal        28f
15:               c.j          29f
16:               jal          ra, 27f
17:               jal          t1, 18f
18:               c.j          12b
19:               c.j          13b
20:               c.jal        6b
21:               c.jal        4b
22:               jal          ra, 26f
23:               c.j          22b
24:               c.jal        20b
25:               jal          ra, 23b
26:               jal          t1, 15b
27:               c.j          5b
28:               jal          t1, 0b
29:               c.or         a1, a0
                  la           t4, region_0+1723 #start load_store_instr_stream_2
                  la           a5, region_0+332 #start load_store_instr_stream_1
                  la           a6, region_0+1789 #start load_store_instr_stream_3
                  la           s3, region_0+1327 #start load_store_instr_stream_0
                  lb           t3, -26(t4)
                  lb           a0, 23(a5)
                  sb           ra, 231(a5)
                  sh           s9, -399(s3)
                  sb           t5, -1095(a6)
                  lh           sp, -31(t4)
                  lbu          t0, -138(a5)
                  lbu          s9, 46(t4)
                  lh           s0, -13(s3)
                  lhu          s0, -665(s3)
                  lbu          a2, -696(a6)
                  lb           t1, -932(a6)
                  lb           s4, 135(a5)
                  lbu          s7, -814(s3)
                  sb           s11, -359(a6)
                  lhu          t2, -51(a6)
                  lb           a4, 99(a5)
                  sb           s9, -169(s3)
                  lbu          a0, -50(t4)
                  lbu          ra, -17(t4)
                  lb           ra, -27(t4)
                  lbu          t2, -551(a6)
                  lb           t6, -762(s3)
                  lb           a3, -221(a5)
                  lbu          s10, -852(a6)
                  lbu          ra, -62(t4)
                  lhu          s8, 193(s3)
                  lbu          s10, -1151(s3)
                  lbu          tp, -50(t4) #end load_store_instr_stream_2
                  sh           s1, -164(a5)
                  lb           t3, 250(a5)
                  lbu          a1, -214(a6)
                  lb           t3, 40(a6)
                  sb           a2, -474(a6) #end load_store_instr_stream_3
                  sb           a7, -791(s3)
                  lbu          t2, 115(a5) #end load_store_instr_stream_1
                  sh           t0, -317(s3) #end load_store_instr_stream_0
                  la           s1, region_0+1922 #start riscv_hazard_instr_stream_16
                  lh           s11, -62(s1)
                  lbu          s11, 15(s1)
                  lbu          s11, -48(s1)
                  addi         s4, gp, -98
                  sb           sp, 57(s1)
                  lb           gp, -33(s1)
                  lhu          sp, 54(s1)
                  sw           a3, -30(s1)
                  sh           s11, -8(s1)
                  ori          s4, s4, 625
                  sh           gp, 44(s1)
                  lbu          sp, 50(s1)
                  lbu          a3, -57(s1)
                  c.nop
                  srai         ra, gp, 13
                  lh           ra, 4(s1)
                  lbu          s4, -55(s1)
                  c.lui        s4, 9
                  add          sp, ra, sp
                  lb           s4, -52(s1)
                  lbu          s4, 38(s1)
                  lb           s4, 41(s1)
                  slt          a3, gp, s4
                  sw           a3, -14(s1)
                  lh           sp, -46(s1)
                  sb           s11, 13(s1)
                  c.andi       a3, 17
                  andi         s11, sp, 1457
                  lh           gp, 32(s1)
                  c.li         s4, -1
                  c.slli       s11, 11
                  lh           gp, -62(s1)
                  mul          sp, a3, a3
                  sub          s4, sp, s11
                  c.mv         sp, s11
                  c.add        s11, ra
                  ori          a3, gp, -743
                  sh           gp, 16(s1)
                  lb           s11, -21(s1)
                  c.andi       a3, -1
                  sb           gp, 41(s1)
                  sb           a3, -33(s1)
                  sltu         s11, s11, ra
                  rem          s4, gp, a3
                  addi         s4, ra, 516
                  lbu          sp, -13(s1)
                  sh           sp, 64(s1)
                  sb           gp, 59(s1) #end riscv_hazard_instr_stream_16
                  la           s4, region_1+841 #start riscv_hazard_instr_stream_20
                  sb           ra, 517(s4)
                  lb           s10, -300(s4)
                  mul          t3, t3, t3
                  auipc        t4, 21776
                  lbu          t3, 1108(s4)
                  xor          t3, ra, s10
                  lbu          t6, 198(s4)
                  c.xor        a1, a1
                  c.andi       a1, -1
                  or           ra, t6, t6
                  lbu          a1, -280(s4)
                  sltiu        s10, ra, -1680
                  sltu         a1, ra, t4
                  ori          t4, a1, -209
                  sb           ra, -680(s4)
                  c.sub        a1, a1
                  lh           t3, 1051(s4)
                  lbu          ra, 487(s4)
                  sub          t4, s10, s10
                  sh           t3, -209(s4)
                  lbu          t6, -446(s4)
                  sltu         t3, t6, t3
                  sub          s10, t6, t4
                  c.add        s10, t4
                  c.or         a1, a1
                  c.sub        a1, a1
                  rem          t4, t3, ra
                  c.mv         a1, t3
                  auipc        ra, 262463
                  lb           a1, 182(s4)
                  lb           s10, 469(s4) #end riscv_hazard_instr_stream_20
                  la           s9, region_0+519 #start load_store_instr_stream_1
                  la           sp, region_0+1120 #start load_store_instr_stream_0
                  sb           s2, 146(s9)
                  lh           a4, 77(s9)
                  sb           a5, 23(sp)
                  lb           t1, 114(s9)
                  sh           s11, -149(s9)
                  lbu          zero, -16(sp)
                  lbu          t6, -186(s9)
                  lbu          t5, 249(s9)
                  sh           a0, -52(sp)
                  sh           gp, 155(s9)
                  lbu          a2, -1(sp)
                  lbu          tp, -35(s9)
                  sb           tp, 144(s9)
                  lbu          s3, -51(sp)
                  lbu          s4, -214(s9) #end load_store_instr_stream_1
                  lh           t1, -18(sp) #end load_store_instr_stream_0
                  la           s0, region_0+497 #start load_store_instr_stream_1
                  la           s7, region_1+1683 #start load_store_instr_stream_0
                  lb           t4, 63(s0)
                  sb           zero, 36(s0)
                  lbu          ra, 59(s0)
                  lhu          a1, 63(s7)
                  lh           ra, 63(s0)
                  sb           s9, -14(s7)
                  lbu          a6, -6(s0)
                  lb           s4, -64(s0)
                  lb           s8, 40(s7)
                  lb           zero, 63(s7)
                  sb           sp, -64(s7)
                  lh           a2, 43(s7)
                  sb           a6, -2(s0)
                  lb           a2, 14(s0)
                  sb           s5, -45(s0) #end load_store_instr_stream_1
                  sw           s0, 33(s7) #end load_store_instr_stream_0
                  la           sp, region_0+1061 #start riscv_hazard_instr_stream_19
                  lb           gp, 97(sp)
                  div          s1, a4, a6
                  ori          s1, gp, 1527
                  srli         t4, gp, 20
                  c.andi       s1, 21
                  lb           a6, 137(sp)
                  lbu          s1, -106(sp)
                  srli         s11, gp, 16
                  lbu          s1, -187(sp)
                  c.nop
                  lbu          s11, 19(sp)
                  sll          t4, a6, s11
                  sh           s11, -123(sp)
                  xori         gp, gp, 1949
                  lb           s1, -239(sp)
                  sb           s11, 82(sp)
                  lbu          t4, -73(sp)
                  lbu          a6, 141(sp)
                  sh           a6, -17(sp)
                  lb           s1, 150(sp)
                  sb           a4, -242(sp)
                  ori          s1, a4, -505
                  lb           gp, -42(sp)
                  srai         a6, a6, 30
                  add          t4, a6, s1
                  lb           s1, 228(sp)
                  c.andi       a4, -1
                  mulhsu       a6, a6, a6
                  sw           gp, -169(sp)
                  lh           a6, 191(sp)
                  sb           a6, 246(sp)
                  sh           t4, 245(sp)
                  sw           s1, -97(sp)
                  lb           t4, 118(sp)
                  sb           t4, -167(sp)
                  lh           a4, 131(sp)
                  slt          a6, a4, a6
                  c.sub        s1, a4
                  sltu         a6, s1, a6
                  sb           s1, -254(sp) #end riscv_hazard_instr_stream_19
                  la           s1, region_1+554 #start load_store_instr_stream_1
                  la           t6, region_0+728 #start load_store_instr_stream_0
                  lbu          s4, 157(t6)
                  lbu          a4, 58(t6)
                  lb           a1, 61(s1)
                  lh           t5, -100(s1)
                  lh           s9, 40(t6)
                  sb           zero, 165(t6)
                  lb           t3, -173(s1)
                  sb           a2, 241(s1)
                  lh           t3, -216(t6)
                  lbu          ra, 33(s1)
                  lh           t5, -254(s1)
                  lb           s0, -22(t6)
                  lb           t2, -249(s1) #end load_store_instr_stream_1
                  sb           s10, -214(t6) #end load_store_instr_stream_0
sub_2_49:         jal          ra, 3f
0:                jal          ra, 1f
1:                jal          ra, 20f
2:                c.j          11f
3:                c.jal        13f
4:                c.j          2b
5:                c.j          29f
6:                c.jal        24f
7:                c.jal        5b
8:                jal          t1, 7b
9:                c.jal        16f
10:               jal          s8, 22f
11:               c.jal        27f
12:               c.jal        9b
13:               c.jal        23f
14:               c.j          10b
15:               c.jal        18f
16:               jal          ra, 4b
17:               c.jal        28f
18:               jal          ra, 25f
19:               c.jal        21f
20:               c.jal        26f
21:               jal          s8, 6b
22:               jal          s0, 30f
23:               jal          sp, 17b
24:               jal          ra, 0b
25:               c.j          8b
26:               c.j          12b
27:               c.jal        14b
28:               c.j          15b
29:               c.j          19b
30:               mulhsu       sp, a0, ra
                  la           sp, region_1+351 #start riscv_hazard_instr_stream_12
                  srli         a3, s10, 0
                  mulhu        a3, a4, a4
                  lb           a4, 22(sp)
                  mulhu        t4, a1, a1
                  slli         t4, a6, 5
                  c.addi       a4, -1
                  sb           a3, -144(sp)
                  div          a3, s10, a4
                  sltiu        t4, a6, -1392
                  and          t4, a6, a6
                  nop
                  lbu          a1, -186(sp)
                  addi         t4, a1, -562
                  c.sub        a1, a4
                  c.addi       a4, 4
                  srli         a4, t4, 31
                  lbu          a3, 8(sp)
                  ori          a3, a6, 1015
                  xori         a1, s10, 177
                  mulh         a4, a3, a6
                  c.sub        a1, a1
                  lw           a1, -27(sp)
                  lui          a4, 241789
                  c.or         a3, a1
                  srai         a6, s10, 22
                  mulh         a1, a3, a3
                  sb           s10, 141(sp)
                  lb           a3, 218(sp)
                  lbu          a1, 47(sp)
                  slti         a4, a1, -37
                  c.addi       a4, 21
                  divu         a4, a3, a1
                  sb           t4, 194(sp)
                  c.lui        a1, 4
                  c.andi       a4, 10
                  slt          a1, t4, a3
                  sb           a1, -117(sp)
                  and          a3, s10, s10
                  lb           a4, 73(sp) #end riscv_hazard_instr_stream_12
                  la           s10, region_0+632 #start load_store_instr_stream_1
                  la           s6, region_0+394 #start load_store_instr_stream_0
                  lb           s11, 1551(s6)
                  sb           a3, -8(s10)
                  sb           s11, 262(s6)
                  lbu          a3, -77(s6)
                  lb           s1, -245(s10)
                  sb           a7, 699(s6)
                  sb           s2, -174(s10)
                  sb           s2, -192(s10)
                  sb           ra, 442(s6)
                  lh           s3, 214(s10) #end load_store_instr_stream_1
                  lb           a0, 813(s6) #end load_store_instr_stream_0
                  addi         a2, zero, -6 #init loop 0 counter
                  rem          s11, t0, s2
                  slt          t6, s0, zero
                  xor          s0, t3, s0
                  c.addi       a0, -1
                  c.xor        a3, a5
                  addi         zero, zero, 0 #init loop 0 limit
                  c.li         t1, -1
                  nop
                  xor          sp, s7, tp
                  sltiu        gp, s3, 1865
sub_2_112_0_t:    c.xor        a3, a5
                  addi         a2, a2, 6 #update loop 0 counter
                  divu         s7, s9, t3
                  c.andi       a0, 29
                  c.addi16sp   sp, -16
                  and          s0, t5, a5
                  div          s3, s10, s3
                  c.add        ra, s6
                  c.xor        a4, a1
                  and          a5, zero, a7
                  c.or         a0, a5
                  slt          s3, s7, a2
                  c.bnez       a2, sub_2_112_0_t #branch for loop 0
                  srl          t6, a0, t0
                  la           a3, region_0+1154 #start riscv_hazard_instr_stream_17
                  mulhsu       s0, a5, t0
                  lb           a6, 152(a3)
                  lui          t0, 444095
                  c.and        a5, a5
                  lb           s0, 104(a3)
                  sb           s7, -28(a3)
                  c.lui        s0, 25
                  lbu          a6, 85(a3)
                  xor          t0, s7, a2
                  sh           a6, -208(a3)
                  lb           t0, 54(a3)
                  c.nop
                  lbu          a5, -243(a3)
                  auipc        s0, 454866
                  div          t0, s0, a6
                  lb           s7, 240(a3)
                  sra          t0, s7, s7
                  lbu          t0, 219(a3)
                  divu         s7, a2, s0
                  c.or         s0, a2
                  rem          a6, a2, a6
                  lb           s0, 45(a3)
                  sw           a6, 222(a3) #end riscv_hazard_instr_stream_17
                  la           sp, region_1+1971 #start riscv_load_store_hazard_instr_stream_9
                  lb           t2, 1(sp)
                  lw           t5, 1(sp)
                  lhu          s3, 1(sp)
                  slti         s1, s4, 748
                  srl          t4, t2, s0
                  sb           a5, 1(sp)
                  lw           t5, 1(sp)
                  c.mv         a0, s2
                  divu         s1, s3, t5
                  lh           a0, 1(sp)
                  sw           a1, 1(sp)
                  sb           a4, 1(sp)
                  lh           t0, 1(sp)
                  lhu          a5, 1(sp)
                  sh           t0, -15(sp)
                  srli         a0, a3, 24
                  lh           t6, -15(sp) #end riscv_load_store_hazard_instr_stream_9
                  la           t6, region_0+67 #start load_store_instr_stream_1
                  la           t1, region_1+700 #start load_store_instr_stream_0
                  sb           s1, -67(t1)
                  sh           s1, 27(t6)
                  lhu          s8, -31(t6)
                  sb           s5, 717(t1)
                  lb           s7, -20(t6)
                  lb           a5, 28(t6)
                  sb           t1, -32(t1)
                  lbu          zero, -10(t6)
                  lhu          s9, 121(t6)
                  lb           s10, 775(t1)
                  lb           a6, 179(t6)
                  lb           s1, 156(t6)
                  lh           t3, -142(t1)
                  sw           a4, -47(t6) #end load_store_instr_stream_1
                  sw           s5, 948(t1) #end load_store_instr_stream_0
                  la           a3, region_1+1349 #start load_store_instr_stream_1
                  la           t6, region_1+55 #start load_store_instr_stream_2
                  la           s1, region_1+528 #start load_store_instr_stream_0
                  lbu          s4, 7(a3)
                  lb           a5, 10(a3)
                  c.lw         a0, 116(s1)
                  sb           a2, -1(a3)
                  lbu          s3, 514(t6)
                  lh           s8, 1385(t6)
                  sb           sp, -207(s1)
                  sb           a2, -14(a3)
                  lb           sp, 2(s1)
                  sh           s6, -134(s1)
                  lb           t1, 147(s1)
                  sh           s1, 365(t6)
                  lb           s10, 310(t6)
                  lhu          a4, -48(s1)
                  lb           s11, -209(s1)
                  lbu          s10, -16(a3) #end load_store_instr_stream_1
                  lbu          gp, 230(s1)
                  lbu          tp, 1938(t6) #end load_store_instr_stream_2
                  sb           t2, 98(s1) #end load_store_instr_stream_0
                  bne          s6, ra, 7f
                  divu         s8, sp, a4
                  c.mv         t0, ra
                  sltu         a6, sp, zero
                  or           a0, s9, a5
                  c.addi16sp   sp, 176
                  auipc        gp, 272574
7:                bltu         t2, sp, 11f
                  c.bnez       s0, 10f
                  rem          s3, s3, s2
10:               rem          s3, s6, zero
11:               sub          a3, a7, tp
                  slti         a5, t6, 403
                  c.mv         s3, s4
                  div          s9, t1, s4
                  c.addi16sp   sp, -16
                  c.mv         t2, s8
                  c.srai       a5, 29
                  c.and        s1, a4
                  lui          s10, 107716
                  slt          t0, s11, a1
                  sltiu        t0, ra, 710
                  c.srai       a0, 28
                  c.andi       a1, -1
                  divu         s3, s11, s0
                  c.addi4spn   a0, sp, 16
                  mulhsu       a0, a0, s3
                  xori         s6, s1, 1429
                  bne          t4, s10, 48f
                  c.xor        a0, s0
                  xor          a2, t2, s2
                  mulhu        s0, t6, ra
                  c.and        a2, a5
                  mulhsu       s6, a7, t0
                  c.xor        a3, a2
                  or           s4, s8, a2
                  c.or         a5, s0
                  slli         a6, t1, 2
                  c.nop
                  c.srli       s1, 23
                  c.addi16sp   sp, 304
                  bne          s4, a4, 55f
                  bgeu         s0, s0, 54f
                  c.lui        s3, 23
                  slti         a6, s10, 1646
                  bge          a5, s9, 58f
                  slti         t2, a4, -49
                  beq          a5, s1, 65f
48:               mulhu        t1, t4, t4
                  addi         a3, a2, -582
                  c.beqz       a0, 59f
                  c.nop
                  c.addi       s0, 30
                  sltiu        a4, s9, 1713
54:               slti         sp, sp, -1400
55:               slt          a2, t2, s1
                  mulhsu       s9, s2, t0
                  c.xor        a0, a4
58:               c.li         t1, 18
59:               slli         t6, a1, 24
                  c.mv         a6, s1
                  or           a4, s1, a5
                  c.xor        a2, s0
                  srl          sp, s6, a3
                  c.xor        a1, a2
65:               div          s7, a1, s3
                  sltu         s3, t1, a6
                  xori         s3, t3, -809
                  mulh         t0, t5, s5
                  addi         s11, s1, 295
                  c.lui        tp, 6
                  sra          t5, a3, t1
                  c.andi       a0, -1
                  rem          a0, t0, s5
                  bgeu         a3, t4, 85f
                  c.bnez       a1, 82f
                  sltiu        t4, t3, -135
                  div          gp, zero, s11
                  srai         t3, tp, 24
                  blt          s9, a3, 94f
                  divu         a2, t4, t3
                  slli         t4, t6, 25
82:               remu         gp, a3, t2
                  c.sub        a2, a5
                  slt          s6, sp, a6
85:               c.srai       a5, 2
                  srl          a3, s11, a3
                  c.nop
                  ori          t3, gp, -1509
                  and          s9, sp, s9
                  addi         a0, zero, 1109
                  lui          t6, 352093
                  c.add        s4, s8
                  divu         t1, t4, a1
94:               sll          t0, t6, tp
                  remu         zero, t3, s5
                  remu         t5, s4, ra
                  bge          t2, a7, 115f
                  beq          s11, sp, 110f
                  lui          t6, 943814
                  sub          a0, s6, s0
                  c.nop
                  srl          s0, ra, a3
                  sltiu        zero, a6, -1421
                  mulhsu       s4, t6, s8
                  sub          t0, tp, s10
                  remu         t1, t5, t0
                  c.andi       a5, 31
                  c.sub        a2, a5
                  mulhu        t1, zero, s10
110:              or           t5, a7, t3
                  sub          s11, s11, t4
                  mulhsu       a4, a0, tp
                  slti         s4, sp, 1959
                  andi         s10, t1, -1791
115:              add          s9, a1, s6
                  div          zero, a0, s0
                  c.add        s1, s6
                  c.srli       a1, 28
                  c.andi       a2, -1
                  c.xor        s1, a3
                  nop
                  auipc        s7, 657332
                  bne          zero, s7, 139f
                  bge          a7, s0, 142f
                  mulhsu       sp, t6, a6
                  addi         a0, s8, -1217
                  srai         t5, a1, 24
                  c.nop
                  bgeu         sp, s5, 148f
                  xor          a5, t5, sp
                  c.and        a0, s0
                  bge          a1, s1, 143f
                  bge          t6, s11, 134f
134:              c.addi16sp   sp, 144
                  sltu         a3, t2, s5
                  c.andi       a4, 28
                  beq          a5, s3, 139f
                  c.andi       a3, -1
139:              c.xor        a3, a1
                  mulh         a0, a5, gp
                  bne          a7, s1, 146f
142:              mulhu        a4, t6, a4
143:              srli         a5, s11, 13
                  slti         s1, t4, -446
                  auipc        s9, 217429
146:              xor          a3, a5, sp
                  bge          sp, s1, 163f
148:              c.xor        s1, s0
                  or           t6, s2, a5
                  c.beqz       s1, 152f
                  c.add        ra, t3
152:              slli         t6, s0, 10
                  c.beqz       a3, 162f
                  add          zero, a7, a6
                  sra          gp, s1, a5
                  c.add        s7, gp
                  c.li         t2, -1
                  add          s8, a2, s10
                  divu         a3, a7, t3
                  mulhu        s0, a7, tp
                  rem          t2, s10, a4
162:              slt          a3, a7, a4
163:              c.mv         s0, a4
                  remu         t0, a5, t4
                  divu         s7, zero, t2
                  c.addi4spn   a4, sp, 144
                  c.lui        t5, 3
                  slli         t6, t0, 17
                  c.beqz       a3, 172f
                  xori         s4, s6, -59
                  or           s9, a1, a2
172:              xor          gp, a0, tp
                  sltu         a6, gp, a5
                  sub          t5, s3, s10
                  bge          a2, a7, 195f
                  sltiu        s4, a3, 1253
                  bge          gp, gp, 179f
                  sub          s1, a4, s6
179:              or           tp, t4, s5
                  slli         gp, a2, 10
                  slt          a0, s11, s6
                  bltu         s1, a5, 188f
                  c.add        t5, t6
                  c.srli       a2, 14
                  mulhsu       a2, a0, sp
                  or           s9, s2, s5
                  c.addi4spn   a0, sp, 496
188:              c.slli       a1, 1
                  c.slli       t4, 3
                  c.lui        s8, 20
                  c.mv         t6, s2
                  bne          s0, a1, 211f
                  mulhu        t3, s2, s2
                  slti         s0, s9, 199
195:              sll          s10, s4, s8
                  ori          a5, gp, 109
                  sub          a3, t5, t0
                  c.and        s1, a2
                  c.slli       a4, 29
                  beq          tp, zero, 208f
                  c.mv         s4, s10
                  mulh         a1, a4, s10
                  c.and        a3, a2
                  c.or         a1, a5
                  bne          s0, a6, 224f
                  xor          a3, s7, s8
                  nop
208:              xori         s4, a1, 1594
                  slti         t0, a3, -1315
                  c.xor        a4, a3
211:              c.addi4spn   a2, sp, 592
                  c.xor        a5, a1
                  xori         s8, s6, -54
                  c.lui        ra, 31
                  srl          tp, s1, s11
                  xori         sp, a5, -1696
                  c.srai       a0, 6
                  c.lui        s4, 24
                  sltiu        a6, gp, 141
                  slt          s6, s6, s7
                  xor          t3, s5, t0
                  c.andi       a5, -1
                  srai         tp, tp, 9
224:              div          a5, a5, t0
                  or           a4, a1, a7
                  bne          s5, s3, 238f
                  c.nop
                  bltu         t4, s5, 240f
                  c.add        a3, t3
                  c.addi16sp   sp, 176
                  div          s9, a3, s10
                  sltu         t3, t0, s6
                  bltu         a2, gp, 240f
                  srai         a5, t2, 25
                  c.xor        s1, a2
                  c.or         a1, a0
                  add          a4, a7, a1
238:              mul          t0, s11, a0
                  srai         tp, a3, 10
240:              mulhsu       a0, t4, a2
                  rem          s6, t6, a5
                  bltu         s4, s2, 260f
                  mul          t6, zero, s5
                  addi         s6, s7, -1254
                  sub          s9, s5, t2
                  remu         a0, t2, sp
                  and          t3, s1, t5
                  c.add        t3, a3
                  remu         a1, s6, tp
                  slti         t0, gp, -372
                  c.srai       a4, 4
                  add          ra, tp, s3
                  bltu         a7, t6, 257f
                  xor          s11, s3, gp
                  div          a4, t4, sp
                  c.addi16sp   sp, 272
257:              bgeu         t2, sp, 275f
                  c.and        s1, s1
                  c.and        a5, a3
260:              c.andi       s1, 25
                  or           t6, s6, a0
                  c.andi       a2, 2
                  bgeu         s7, a2, 270f
                  c.srli       a3, 27
                  bge          a2, a0, 283f
                  c.addi       ra, -1
                  c.or         a2, a0
                  c.slli       s9, 5
                  c.or         s0, a2
270:              rem          ra, s11, s9
                  srl          t6, zero, sp
                  c.mv         a2, t6
                  sub          a5, gp, a6
                  ori          t4, a1, -448
275:              xori         s8, a1, 1236
                  mulh         a0, t5, s10
                  srai         s4, a3, 6
                  sll          a4, sp, t2
                  c.andi       s0, -1
                  sltiu        a5, a7, -1824
                  sltiu        a4, s0, -242
                  c.or         s1, a2
283:              beq          s8, a2, 292f
                  bne          s9, tp, 297f
                  c.nop
                  c.slli       t3, 8
                  c.addi4spn   a0, sp, 336
                  srli         sp, ra, 17
                  blt          a0, tp, 295f
                  and          a6, s7, s1
                  addi         a3, s3, 1293
292:              c.or         a3, a0
                  sra          ra, s4, zero
                  mulh         t4, s11, s10
295:              c.srli       a4, 5
                  mulhsu       s8, tp, s3
297:              c.li         t3, -1
                  c.sub        a0, a2
                  c.add        s7, a0
                  blt          s8, a3, 315f
                  c.addi       t6, 19
                  c.addi4spn   a3, sp, 240
                  xori         ra, t2, -188
                  c.add        s0, ra
                  c.andi       a5, -1
                  srli         a6, t5, 5
                  c.addi4spn   a4, sp, 560
                  mulh         s9, t5, tp
                  slli         a6, zero, 30
                  xori         a0, s10, 378
                  or           s9, a2, t0
                  c.nop
                  nop
                  c.and        a1, a2
315:              srli         t3, a5, 8
                  or           tp, s2, s6
                  rem          t3, a1, a2
                  bge          s1, gp, 321f
                  c.add        s4, t6
                  sub          s9, a3, s4
321:              sltiu        s4, a7, -1774
                  auipc        tp, 25705
                  beq          t1, a3, 328f
                  divu         t2, s7, zero
                  c.add        s7, s6
                  c.lui        s7, 25
                  c.srli       a5, 28
328:              c.sub        s1, s0
                  sltu         t1, t4, s2
                  and          s8, s2, a1
                  xor          a0, s6, a4
                  remu         a4, a3, s4
                  mul          s6, t2, t4
                  srli         t2, s10, 11
                  sltu         s6, s6, t1
                  slli         t1, s7, 17
                  addi         ra, s3, 591
                  c.li         gp, -1
                  c.srai       a2, 18
                  c.or         a0, a0
                  slti         t2, s3, 18
                  c.slli       a3, 12
                  auipc        a5, 683062
                  xor          a2, s1, sp
                  xor          t6, s4, gp
                  c.addi16sp   sp, -16
                  bne          s7, s0, 349f
                  sltu         tp, a0, ra
349:              and          tp, a4, s2
                  mulhsu       gp, sp, t4
                  sub          t6, s0, t0
                  mul          a3, s10, t5
                  srai         a0, gp, 30
                  slli         a2, zero, 0
                  auipc        s4, 884977
                  bgeu         zero, s8, 364f
                  sll          s10, s0, a3
                  auipc        a4, 589463
                  c.li         a1, 7
                  mulhu        s11, t2, a5
                  slli         t6, t6, 8
                  xori         t3, s6, 1691
                  ori          s9, sp, 30
364:              c.addi       a0, 31
                  mulhsu       t2, s9, gp
                  bltu         a6, s8, 368f
                  andi         s9, t2, 1203
368:              c.xor        s0, a4
                  mulh         t1, gp, s11
                  auipc        tp, 187698
                  or           t4, s6, s4
                  c.sub        a3, s1
                  blt          gp, s7, 393f
                  div          a3, a5, a5
                  c.addi       s1, 19
                  c.addi4spn   a0, sp, 800
                  bltu         tp, a3, 379f
                  xor          t0, ra, s9
379:              xori         t5, t4, 516
                  c.and        a5, a0
                  c.andi       a5, -1
                  c.li         a1, -1
                  c.srli       s1, 3
                  c.addi4spn   a3, sp, 416
                  remu         ra, t6, s11
                  c.mv         t1, s7
                  bne          ra, s0, 403f
                  c.addi       sp, 11
                  c.addi       a1, 4
                  sub          t4, tp, a3
                  c.xor        a0, a5
                  c.addi       s3, -1
393:              srli         a0, a2, 18
                  sub          s8, a3, t5
                  and          t1, s6, s6
                  c.and        s1, a4
                  c.or         a0, a1
                  c.nop
                  c.or         a2, a4
                  mulhsu       a1, s5, t5
                  mulh         s0, a2, s2
                  c.addi16sp   sp, -16
403:              beq          s3, t0, 405f
                  c.or         a4, s0
405:              ori          zero, s2, 1222
                  sll          ra, a7, ra
                  bne          gp, a1, 418f
                  divu         a5, s9, t3
                  c.li         t1, 28
                  divu         s11, a0, tp
                  c.li         s3, 30
                  or           s7, s6, t3
                  andi         s10, t5, 1171
                  remu         s9, s11, s0
                  c.slli       s4, 5
                  remu         a4, gp, t3
                  la           a5, region_0+1705 #start riscv_load_store_hazard_instr_stream_12
                  lhu          s11, -15(a5)
                  lui          s1, 681158
                  sh           a1, 1(a5)
                  c.andi       a3, 14
                  sb           a5, 9(a5)
                  lb           t5, 2(a5)
                  lbu          t5, 12(a5)
                  lhu          s7, 13(a5)
                  sw           a4, 3(a5)
                  lb           a3, 14(a5)
                  c.andi       a3, 13
                  lb           s0, 14(a5)
                  sb           s11, 16(a5)
                  lbu          gp, 16(a5) #end riscv_load_store_hazard_instr_stream_12
                  divu         s6, a4, ra
418:              c.li         a1, 16
                  sra          t2, tp, t2
                  c.nop
                  c.slli       ra, 10
                  c.andi       a3, -1
                  c.and        a5, a2
                  add          a4, s3, s4
                  mulh         t6, a6, s9
                  andi         t6, s1, 1253
                  c.addi16sp   sp, 384
                  add          s3, t4, s3
                  xori         t6, t3, 841
                  c.slli       a4, 6
                  sll          s4, a4, a6
                  c.srli       a5, 14
                  srai         s1, s1, 3
                  nop
                  c.srli       a2, 11
                  andi         t3, tp, -93
                  c.bnez       a5, 448f
                  c.mv         s0, s7
                  c.lui        t3, 24
                  c.addi4spn   a3, sp, 480
                  beq          t1, t3, 455f
                  sra          a1, t1, s10
                  slli         s3, t2, 11
                  divu         s7, s11, t3
                  c.add        t2, s9
                  c.and        a0, a3
                  beq          s10, s8, 466f
448:              mulh         t0, s3, ra
                  c.andi       a4, 18
                  xori         a0, zero, 1867
                  sltiu        s10, s6, 860
                  c.addi4spn   a4, sp, 400
                  c.slli       t3, 25
                  sltiu        t0, a3, -1247
455:              c.mv         s9, t1
                  rem          t6, s1, t6
                  ori          a3, a5, -1377
                  c.addi16sp   sp, 208
                  ori          s4, t1, 323
                  andi         s3, s8, -1229
                  bgeu         tp, a6, 481f
                  xor          a5, gp, s3
                  c.srli       a3, 7
                  auipc        s4, 923119
                  c.add        t2, t4
466:              add          t2, s5, t1
                  c.addi4spn   a5, sp, 544
                  bltu         a5, s1, 484f
                  sra          t0, s10, s8
                  slli         s4, a4, 1
                  or           a6, t3, a3
                  addi         gp, a1, -1062
                  divu         t0, s11, s10
                  c.nop
                  blt          t5, s6, 484f
                  addi         t3, t4, -1417
                  mul          ra, a0, s8
                  xori         s0, a2, 377
                  c.add        a4, s6
                  c.srli       a2, 5
481:              sltu         s7, a0, ra
                  bne          a3, tp, 483f
483:              c.nop
484:              c.slli       s0, 18
                  remu         zero, s7, t5
                  bne          a2, s6, 497f
                  sra          s3, s7, zero
                  c.add        s0, s5
                  nop
                  divu         a5, s8, s8
                  bgeu         a0, s0, 500f
                  mul          a5, sp, a7
                  rem          s4, tp, s1
                  div          t3, s8, s0
                  nop
                  and          s9, s7, t1
497:              sll          a3, t3, s8
                  bltu         t5, t0, 510f
                  c.or         a0, a3
500:              sltiu        ra, s11, 283
                  srl          s4, s3, t4
                  c.andi       a1, 24
                  srai         a5, s4, 7
                  mulhu        s10, s8, s10
                  c.or         s1, a2
                  c.and        a0, a1
                  slt          a1, s11, s1
                  bgeu         t3, s3, 528f
                  sltu         ra, s9, sp
510:              srli         s3, a0, 15
                  sub          t6, t5, s11
                  add          t1, a2, gp
                  c.mv         t6, t1
                  mulhu        t5, s2, t4
                  srl          a2, s7, zero
                  addi         zero, s3, -687
                  slt          s7, s2, a7
                  bge          t4, a5, 522f
                  or           s6, a1, a6
                  mulhu        s11, t4, a4
                  c.addi       s7, 9
522:              slt          s3, ra, a7
                  nop
                  c.add        s6, s1
                  sra          t5, a0, t2
                  c.addi16sp   sp, -16
                  auipc        a4, 389519
528:              c.addi       s8, 31
                  mul          s4, a3, t0
                  slt          s9, a6, a0
                  or           t5, t1, a3
                  slt          a0, s11, s2
                  ori          t4, gp, 1958
                  add          s7, a2, a3
                  c.xor        a0, a5
                  sltu         gp, t0, s0
                  c.xor        a3, a1
                  c.sub        s0, a1
                  c.andi       s0, -1
                  mulhsu       s9, t1, gp
                  c.srai       s1, 14
                  auipc        a3, 407339
                  bltu         a1, gp, 545f
                  c.sub        a2, s0
545:              c.xor        a2, a0
                  mulhsu       ra, a7, a5
                  c.addi4spn   a2, sp, 704
                  srli         t3, s9, 20
                  mul          s6, a2, t0
                  c.sub        a4, a3
                  sra          t3, t5, s7
                  mulhsu       t0, a6, a0
                  c.xor        a2, a1
                  c.addi4spn   a5, sp, 928
                  sll          a2, ra, a6
                  blt          s7, t3, 568f
                  c.and        a2, a1
                  or           sp, t2, s10
                  beq          gp, t3, 565f
                  c.addi4spn   a5, sp, 480
                  c.and        a5, a4
                  ori          t2, a6, 1438
                  div          s3, ra, a0
                  c.slli       s3, 4
565:              or           s10, tp, a1
                  srai         t4, t5, 17
                  la           t2, region_1+1253 #start load_store_instr_stream_4
                  la           tp, region_1+253 #start load_store_instr_stream_2
                  la           t0, region_1+254 #start load_store_instr_stream_1
                  la           t1, region_1+776 #start load_store_instr_stream_0
                  sb           s4, -48(t0)
                  lb           s9, 376(t1)
                  sb           a3, -16(t0)
                  lb           s1, 19(t0)
                  lb           t4, 10(t0)
                  lhu          s9, 1096(t1)
                  sw           tp, -352(t1)
                  lbu          s11, -16(tp)
                  lbu          s7, 56(t2)
                  lb           a6, 41(t0)
                  la           a4, region_1+1110 #start load_store_instr_stream_3
                  lbu          s4, -4(tp)
                  sw           a7, -990(a4)
                  lb           a3, 894(t1)
                  sb           t0, 101(a4)
                  lh           ra, -50(t0)
                  lbu          gp, -38(t2)
                  lhu          gp, -62(t0)
                  sh           s6, 48(a4)
                  sb           s2, -38(t0)
                  sw           s6, 47(t2)
                  lb           s4, 7(tp)
                  lb           s7, 41(t1)
                  lbu          t6, -51(tp)
                  lw           s9, -140(t1)
                  lh           s3, 368(a4)
                  sb           a7, 309(a4)
                  lb           zero, -39(tp) #end load_store_instr_stream_2
                  sb           zero, -738(a4)
                  lbu          s4, 53(t0)
                  sb           a3, -662(a4) #end load_store_instr_stream_3
                  lw           gp, -20(t1)
                  lhu          s6, 55(t2)
                  lb           t3, -61(t0) #end load_store_instr_stream_1
                  sw           a2, -9(t2) #end load_store_instr_stream_4
                  lbu          s9, -351(t1) #end load_store_instr_stream_0
                  and          t4, s10, s2
568:              c.addi4spn   a2, sp, 656
                  or           s6, gp, s4
                  and          s11, s1, s7
                  xori         a2, tp, 218
                  bne          s1, s0, 588f
                  slli         gp, s5, 2
                  c.li         s4, 7
                  or           sp, a2, gp
                  c.or         s0, a1
                  c.andi       a5, 5
                  bne          t1, s3, 596f
                  andi         a4, a7, 1868
sub_2_41:         jal          ra, 3f
0:                c.jal        1f
1:                c.jal        10f
2:                c.j          0b
3:                jal          tp, 2b
4:                c.j          13f
5:                c.j          6f
6:                c.j          12f
7:                c.j          14f
8:                c.j          4b
9:                jal          s11, 7b
10:               c.jal        11f
11:               c.jal        5b
12:               c.j          8b
13:               c.jal        9b
14:               srli         s6, t6, 12
                  c.and        a0, a1
                  addi         a0, s11, 1976
                  c.xor        s1, a4
                  ori          s0, gp, 977
                  c.sub        s0, a5
                  sll          sp, t2, a7
                  c.beqz       a2, 602f
                  mul          s0, t0, a3
588:              nop
                  srli         a1, s3, 27
                  bne          s5, t5, 592f
                  bgeu         t3, s0, 611f
592:              c.and        a0, a5
                  or           t6, tp, s8
                  sltiu        s1, zero, 763
                  mulhsu       s0, s9, a7
596:              c.sub        a1, a1
                  div          t2, s1, a3
                  mulhsu       a5, a7, a7
                  xori         tp, a6, 1788
                  srai         s8, s10, 4
                  c.addi16sp   sp, -16
602:              srl          s4, s6, t2
                  and          s7, s9, ra
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 224
                  c.srai       a3, 26
                  c.sub        s1, a3
                  addi         t2, a0, 1494
                  lui          t3, 584263
                  sltu         s10, s9, a7
611:              c.xor        a3, a0
                  xori         s9, t6, -554
                  c.xor        s1, s1
                  mulh         a3, gp, a2
                  c.addi4spn   s1, sp, 16
                  c.mv         t1, a2
                  andi         a3, t2, 1638
                  slti         tp, a6, 1666
                  or           t5, a7, a6
                  c.and        a3, s0
                  or           a5, t4, gp
                  mulh         a5, s3, a3
                  addi         s4, a5, -390
                  mulhu        s0, t2, tp
                  nop
                  bltu         t2, s1, 633f
                  lui          s0, 399380
                  nop
                  sltiu        t4, gp, -1221
                  c.li         a6, 6
                  blt          t5, s10, 650f
                  and          zero, s0, s8
633:              blt          s0, a3, 651f
                  c.lui        a6, 1
                  c.lui        s7, 23
                  c.srai       a4, 11
                  divu         t3, zero, s7
                  sltu         a6, s2, a4
                  slt          s3, t3, t5
                  lui          t0, 746997
                  div          t2, s11, s7
                  c.and        a5, a2
                  c.sub        a1, a1
                  c.addi16sp   sp, -16
                  lui          s1, 185725
                  slli         s0, s9, 27
                  slti         s1, zero, -1209
                  or           ra, sp, s10
                  srai         a3, s1, 21
650:              beq          a5, t6, 668f
651:              div          s10, s2, zero
                  c.mv         s6, a6
                  c.lui        a3, 29
                  slt          s3, a4, t2
                  remu         t4, s2, a5
                  slli         s1, s11, 31
                  c.addi16sp   sp, -16
                  c.and        a3, a0
                  blt          a6, s1, 666f
                  bge          s8, t4, 674f
                  c.mv         s8, gp
                  sra          tp, gp, s8
                  mulh         t3, a6, a5
                  sll          s10, s10, ra
                  slli         s3, a2, 21
666:              xori         a2, s7, -145
                  add          t0, s6, a0
668:              c.srli       a1, 7
                  c.or         s1, a5
                  c.li         s4, -1
                  beq          a2, t6, 676f
                  c.mv         s11, t4
                  c.xor        a3, a5
674:              bltu         a3, a6, 677f
                  and          a2, a5, s7
676:              c.slli       t0, 2
677:              c.li         s3, -1
                  bgeu         s7, ra, 686f
                  beq          tp, zero, 692f
                  slti         t3, s10, 347
                  sub          ra, s10, a0
                  blt          s1, s10, 691f
                  c.addi       a1, 25
                  rem          t1, s0, s5
                  div          a2, a5, a0
686:              c.li         sp, 6
                  c.sub        a1, a1
                  c.bnez       s1, 689f
689:              srl          t0, gp, t0
                  c.addi       sp, 8
691:              auipc        a4, 563224
692:              c.addi       s0, 25
                  slti         s9, s1, -1845
                  xor          s3, s0, s2
                  c.mv         sp, a0
                  rem          s4, s0, s1
                  c.or         a3, s1
                  bge          s9, t1, 713f
                  beq          t3, s5, 718f
                  nop
                  c.andi       a2, 4
                  sltiu        s0, zero, -1078
                  nop
                  c.add        a4, s7
                  slti         s7, t5, 504
                  sltiu        t6, zero, 1743
                  andi         t2, s7, -840
                  bge          gp, s2, 710f
                  ori          t6, s5, -107
710:              c.srai       a3, 30
                  bge          a5, a3, 722f
                  mulhu        ra, t5, s9
713:              or           sp, t6, a7
                  c.slli       t0, 2
                  xor          a0, t0, a2
                  c.nop
                  bgeu         s2, s9, 719f
718:              c.mv         s7, a4
719:              mulhu        t2, a4, zero
                  ori          s0, a0, 1743
                  mulhsu       s11, s6, s8
722:              bge          ra, s4, 741f
                  or           s8, s4, tp
                  ori          t2, s10, 1074
                  sltiu        s1, a0, 1614
                  ori          t3, s6, 614
                  c.beqz       a4, 729f
                  add          a6, a1, tp
729:              c.lui        t4, 11
                  bge          a7, a3, 746f
                  c.and        a4, a5
                  c.sub        a2, a5
                  sltu         a4, a5, zero
                  slti         s7, gp, 783
                  sltu         s7, t5, t5
                  c.andi       a4, 26
                  lui          s4, 968186
                  mulhsu       t3, s4, t4
                  div          s4, ra, s2
                  c.mv         t0, t4
741:              mul          t2, s5, a6
                  srl          a1, s8, t2
                  sltu         s11, s0, s6
                  auipc        s9, 793383
                  bne          t4, a3, 763f
746:              srl          s7, s8, s10
                  c.add        t4, gp
                  nop
                  mulhu        a6, a2, zero
                  divu         t5, t0, t5
                  c.slli       t1, 5
                  sub          a2, t0, a7
                  remu         a6, a2, s2
                  and          a1, s0, a4
                  c.or         a0, a0
                  xor          a4, t5, s9
                  blt          a5, s4, 760f
                  sll          t3, t5, s10
                  c.or         a5, a0
760:              c.andi       s0, -1
                  c.addi4spn   a4, sp, 448
                  sub          t6, sp, t0
763:              mulhu        s4, a2, s8
                  remu         sp, s2, s6
                  lui          s3, 722065
                  beq          s2, s4, 771f
                  bgeu         t2, t5, 774f
                  c.lui        gp, 3
                  sub          s10, s0, s1
                  srl          a0, zero, a7
771:              auipc        t2, 491705
                  remu         t1, t0, a0
                  or           a6, s9, a4
774:              bgeu         s5, a3, 783f
                  bge          a5, t2, 781f
                  sll          t0, gp, t2
                  sltiu        t5, a2, 1590
                  sll          t0, t2, t0
                  c.sub        a1, a0
                  auipc        t3, 224257
781:              bne          a6, s6, 788f
                  c.nop
783:              bne          s3, s0, 799f
                  c.sub        a5, a0
                  c.srai       a4, 17
                  lui          t6, 746199
                  addi         ra, s3, 115
788:              slli         a2, a1, 14
                  remu         s4, t0, gp
                  c.nop
                  sub          t5, tp, t4
                  srli         s4, s4, 5
                  xori         s8, s5, -462
                  c.lui        a0, 8
                  bltu         s3, a6, 808f
                  srli         t5, t6, 30
                  sltu         a0, s6, s9
                  c.mv         t5, s2
799:              c.add        s0, s2
                  c.addi4spn   s1, sp, 368
                  c.li         s10, -1
                  nop
                  bgeu         zero, t2, 823f
                  lui          s10, 860589
                  sltiu        s1, a1, 1141
                  xor          gp, a4, t3
                  slti         t1, a3, 1157
808:              c.li         s4, 17
                  rem          t0, t2, a2
                  sub          sp, a3, t0
                  c.bnez       s0, 825f
                  c.andi       a3, 27
                  sll          s10, t4, s3
                  beq          s6, ra, 822f
                  sra          a2, s7, t3
                  addi         s4, t4, -857
                  c.srli       s0, 26
                  c.add        s4, s3
                  nop
                  slt          t1, zero, s3
                  bgeu         t6, s5, 822f
822:              c.sub        a1, a3
823:              sub          s3, t5, a2
                  mulhsu       t6, s5, s0
825:              sub          s4, s1, a6
                  c.beqz       a3, 845f
                  andi         a2, s0, -1248
                  ori          ra, t1, -1771
                  sub          t3, a2, tp
                  sltiu        a3, s11, -50
                  c.or         a1, a0
                  srli         gp, t5, 14
                  nop
                  srli         a6, s2, 5
                  slli         t1, s4, 23
                  srai         a5, a3, 14
                  xori         t5, s6, -188
                  slli         t2, t2, 17
                  divu         t1, s2, s1
                  remu         a5, s3, t4
                  or           a0, s2, s10
                  mulhu        t1, a5, a6
                  slt          zero, t5, tp
                  sub          t0, s7, a4
845:              sltiu        t2, sp, -2030
                  auipc        a3, 174421
                  nop
                  slli         t0, s1, 12
                  c.beqz       a5, 858f
                  bne          s8, zero, 868f
                  andi         t1, s7, -1663
                  c.li         s11, -1
                  mul          s3, a1, s7
                  c.srai       a3, 5
                  srai         s3, a6, 20
                  nop
                  c.slli       sp, 2
858:              xor          s7, a3, s3
                  c.addi16sp   sp, -16
                  remu         t0, s4, tp
                  c.xor        s0, a2
                  auipc        a1, 641220
                  blt          s6, s3, 875f
                  remu         a1, s3, a7
                  rem          a4, a4, s5
                  andi         t2, s9, 258
                  bltu         t1, s1, 885f
868:              c.srli       a5, 2
                  bne          zero, a2, 871f
                  c.slli       t1, 1
871:              srai         a1, t5, 5
                  c.nop
                  mulh         tp, s11, s10
                  rem          t6, a4, ra
875:              sltiu        s6, s10, -936
                  bltu         t4, a6, 891f
                  mul          t6, s3, a1
                  c.nop
                  c.xor        s0, a5
                  c.beqz       a0, 882f
                  srai         s10, zero, 16
882:              sltiu        t2, a3, -308
                  and          a1, tp, s10
                  mulhsu       t4, t3, t5
885:              rem          a2, gp, t0
                  sub          s8, s5, t2
                  c.addi       t4, -1
                  c.addi16sp   sp, -16
                  add          t3, a1, s5
                  c.sub        a4, s1
891:              bltu         s0, s11, 902f
                  auipc        t1, 608335
                  c.and        s0, a5
                  slli         s3, sp, 19
                  c.and        a0, a2
                  ori          t6, a1, -1073
                  c.nop
                  c.lui        tp, 4
                  c.addi4spn   a4, sp, 96
                  mul          t1, s5, t0
                  srai         a5, s7, 25
902:              c.srai       a0, 9
                  srl          a1, zero, s4
                  c.add        ra, tp
                  mulhu        gp, s1, s1
                  xor          a0, s2, t6
                  c.addi16sp   sp, -16
                  c.srli       a2, 11
                  c.beqz       a4, 920f
                  c.slli       s10, 5
                  sub          gp, s9, t5
                  c.lui        a0, 10
                  bltu         s5, t3, 933f
                  srli         t3, a3, 5
                  c.nop
                  auipc        t4, 676334
                  c.addi4spn   a0, sp, 816
                  c.nop
                  bgeu         s10, s6, 923f
920:              c.add        a4, a0
                  slt          sp, s0, a4
                  mulhsu       t3, s0, a3
923:              lui          s11, 25826
                  c.srai       a4, 7
                  mul          s6, gp, a3
                  srai         a2, a3, 31
                  c.bnez       s0, 939f
                  or           a2, a4, a1
                  srai         gp, s2, 11
                  andi         a3, a7, 746
                  c.xor        a4, a2
                  c.xor        a0, s1
933:              mulh         a1, a3, a7
                  beq          a0, s3, 936f
                  lui          s11, 236739
936:              c.addi16sp   sp, 32
                  c.addi       s6, -1
                  add          ra, s5, t3
939:              c.or         a0, a0
                  c.lui        a2, 3
                  beq          s10, s6, 950f
                  c.addi4spn   s0, sp, 272
                  ori          t6, t5, -194
                  xori         zero, a1, -574
                  mulhsu       a3, t5, s2
                  c.addi16sp   sp, -16
                  bge          gp, s5, 963f
                  c.addi16sp   sp, -16
                  bgeu         s7, a1, 969f
950:              c.nop
                  bgeu         a0, a0, 953f
                  sra          s11, a3, zero
953:              sltu         t4, a0, t2
                  sltiu        a6, sp, 1305
                  c.or         a0, a5
                  sll          s7, s4, a0
                  div          sp, a4, t0
                  c.addi16sp   sp, -16
                  divu         t0, t1, a0
                  mulhu        a2, a7, s5
                  lui          s1, 731325
                  bge          a2, s2, 980f
963:              bge          s7, t2, 966f
                  divu         a5, t1, a6
                  remu         gp, s5, s9
966:              c.addi16sp   sp, -16
                  bne          a5, s7, 973f
                  srli         s8, a5, 12
969:              div          t5, a7, t4
                  mulh         a1, s9, s2
                  xori         s8, t0, -547
                  add          s0, s6, a3
973:              lui          s7, 65
                  srli         s6, t1, 0
                  slt          s10, s2, t6
                  srl          a3, a0, s7
                  c.add        t4, a5
                  c.nop
                  rem          ra, s2, s9
980:              mulhu        t6, t6, t3
                  srai         ra, s4, 10
                  slti         ra, tp, -1685
                  c.andi       a1, 9
                  c.or         a4, a3
                  sll          a5, t4, s3
                  sltiu        a1, a6, -637
                  c.slli       gp, 20
                  xori         t2, zero, -1942
                  sltiu        s1, a2, -1824
                  ori          s0, s2, -1003
                  mulhu        s7, a4, a1
                  nop
                  c.and        s0, a5
                  c.addi16sp   sp, -16
                  div          a2, s10, s7
                  c.slli       a0, 18
                  mulh         t2, t2, s11
                  c.or         a5, s1
                  bltu         s2, a2, 1001f
                  c.addi16sp   sp, -16
1001:             and          ra, s10, t3
                  mulh         s10, sp, tp
                  auipc        t1, 310245
                  slt          s0, a1, s8
                  c.andi       a2, 3
                  bltu         tp, s9, 1014f
                  c.mv         s6, s11
                  beq          tp, s1, 1012f
                  c.srli       a3, 12
                  c.slli       t5, 7
                  c.lui        a5, 27
1012:             sltiu        t0, s1, -1074
                  mulhu        tp, s2, a6
1014:             xori         t0, t0, -999
                  sltu         sp, zero, a1
                  divu         s7, a4, s5
                  c.addi4spn   s0, sp, 304
                  c.mv         a0, a6
                  c.and        s1, a0
                  c.mv         s1, t1
                  sub          a6, s10, tp
                  srli         a1, s6, 19
                  xor          s7, t3, s0
                  c.sub        a5, a1
                  c.bnez       a1, 1044f
                  c.sub        s0, s0
                  remu         t3, t6, a2
                  blt          a7, t2, 1035f
                  or           t4, a6, t0
                  c.addi16sp   sp, -16
                  sub          gp, t4, s0
                  bge          t4, a6, 1050f
                  srl          sp, s9, t4
                  remu         ra, t6, a3
1035:             c.add        t5, s6
                  bne          s10, s1, 1043f
                  c.xor        a2, a2
                  c.addi       s7, -1
                  c.beqz       s1, 1050f
                  slli         t1, a7, 15
                  sltiu        a0, a1, 456
                  c.addi       a5, -1
1043:             c.nop
1044:             bne          a6, s7, 1057f
                  sltiu        a3, a3, -1854
                  addi         a5, s2, 1213
                  sltu         gp, a7, s4
                  srl          a3, sp, s5
                  sra          s10, t3, s0
1050:             auipc        t4, 817697
                  blt          s2, a5, 1063f
                  c.and        a5, a5
                  sltiu        a0, ra, 1511
                  c.slli       s0, 12
                  remu         t5, a7, a7
                  blt          s7, s4, 1076f
1057:             div          gp, t5, t5
                  and          s1, t2, a1
                  c.xor        a0, a1
                  bgeu         s11, s0, 1062f
                  and          a1, s4, t4
1062:             and          s0, s9, a7
1063:             rem          s9, ra, s11
                  mulhu        t3, s0, t1
                  c.beqz       a0, 1067f
                  div          zero, tp, s5
1067:             divu         s3, s0, s5
                  srl          s1, a0, a7
                  remu         t1, zero, t3
                  la           s7, region_1+1697 #start riscv_load_store_hazard_instr_stream_7
                  lb           tp, -38(s7)
                  lui          a5, 351050
                  lb           ra, -38(s7)
                  lb           t1, -38(s7)
                  sb           s3, -38(s7)
                  sb           s11, -38(s7)
                  slt          s1, a5, gp
                  lb           ra, -15(s7)
                  sb           sp, -15(s7)
                  lh           gp, -15(s7)
                  and          s0, s3, a1
                  div          t3, a7, sp
                  lhu          s6, -15(s7)
                  lbu          s0, 4(s7)
                  mulhu        s1, a2, tp
                  sb           a7, 4(s7)
                  lb           a1, 4(s7)
                  lbu          s1, 4(s7)
                  lb           a2, 4(s7)
                  lbu          t1, -13(s7)
                  sb           t0, 34(s7)
                  lb           t6, 34(s7)
                  lbu          s9, 57(s7)
                  lh           a3, 57(s7) #end riscv_load_store_hazard_instr_stream_7
                  sltu         t0, s5, s0
                  c.mv         sp, a3
                  beq          a2, s10, 1077f
                  sll          s1, sp, a2
                  c.addi4spn   a5, sp, 128
                  sll          s4, s11, t6
1076:             mulhsu       s6, s9, s10
1077:             sltu         gp, tp, tp
                  c.addi16sp   sp, -16
                  srl          t6, a5, s11
                  c.srli       s1, 14
                  div          a3, s2, t0
                  c.nop
                  c.nop
                  srli         s9, a4, 27
                  c.beqz       a2, 1100f
                  auipc        a2, 243703
                  xor          gp, gp, s7
                  c.mv         a5, a5
                  sltiu        s3, a6, 345
                  slti         t3, a0, 2013
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 416
                  c.bnez       a4, 1104f
                  c.bnez       a4, 1110f
                  c.xor        a3, a1
                  c.nop
                  c.andi       a5, 28
                  mulh         s6, a3, a3
                  c.li         s1, 30
1100:             lui          s6, 741824
                  bgeu         s0, a2, 1119f
                  xor          s10, s0, t5
                  c.lui        gp, 24
1104:             c.lui        s1, 27
                  sub          t4, s3, ra
                  mul          t6, s11, t3
                  c.or         a0, a1
                  sra          s3, s10, s6
                  c.lui        gp, 16
1110:             slti         gp, t0, -1378
                  c.mv         s4, gp
                  c.addi       t1, 5
                  and          a5, s8, t4
                  mul          s7, s8, a2
                  sub          s11, a5, s7
                  c.add        s11, s3
                  c.srli       s1, 23
                  mulh         ra, t5, s5
1119:             c.nop
                  c.addi       gp, -1
                  sub          s8, a1, s0
                  bge          a5, sp, 1131f
                  sltiu        a3, a0, -1712
                  slti         t2, ra, -1361
                  c.addi4spn   a5, sp, 224
                  auipc        a4, 217934
                  c.mv         t3, t4
                  c.srli       a2, 9
                  c.and        a5, s1
                  blt          a2, tp, 1149f
1131:             c.nop
                  c.xor        a2, a0
                  sltu         ra, t1, gp
                  slti         t1, t2, -1000
                  nop
                  slt          gp, s10, s7
                  c.bnez       s0, 1138f
1138:             mulh         t3, a7, s0
                  auipc        a3, 507667
                  divu         a3, s9, s3
                  slli         a0, s4, 21
                  sll          a4, a6, a6
                  c.and        s0, a1
                  slti         a0, s3, 179
                  c.sub        a3, a0
                  bgeu         sp, s9, 1160f
                  slli         a1, s3, 3
                  c.xor        s1, a2
1149:             xor          a3, tp, a6
                  c.or         a3, a1
                  c.mv         t2, t1
                  c.nop
                  sltiu        s0, a2, -1126
                  addi         gp, s8, -151
                  divu         t2, a5, a6
                  srl          gp, t4, gp
                  addi         tp, s6, -564
                  c.addi4spn   a5, sp, 608
                  c.srli       s1, 6
1160:             c.lui        s8, 3
                  remu         a5, t2, t1
                  xor          s9, a0, a3
                  bgeu         s2, s5, 1175f
                  c.andi       s1, 27
                  c.addi       a3, -1
                  lui          s7, 709171
                  c.li         t0, 2
                  divu         s11, ra, s5
                  c.bnez       a3, 1174f
                  slt          s7, t6, t0
                  ori          sp, t3, -1517
                  mulhsu       ra, a5, t0
                  addi         t0, t1, -1365
1174:             bne          s5, s9, 1194f
1175:             slt          tp, gp, a4
                  lui          t5, 879812
                  sra          a6, s9, s6
                  mul          s10, s2, s4
                  andi         gp, s9, 652
                  divu         a6, t0, s7
                  c.nop
                  sll          s0, gp, s10
                  c.lui        s6, 24
                  divu         s9, zero, s8
                  c.addi4spn   a2, sp, 928
                  xor          t4, tp, s2
                  c.sub        a3, a2
                  mul          a2, a2, s10
                  c.addi16sp   sp, -16
                  c.addi4spn   a5, sp, 608
                  xori         sp, a5, -95
                  sll          t3, a4, t4
                  mul          a4, gp, t3
1194:             nop
                  c.bnez       a0, 1203f
                  mulh         s3, s1, a6
                  c.bnez       a0, 1199f
                  srl          a6, s7, a3
1199:             slti         a4, a6, -2041
                  c.addi       s6, 12
                  c.mv         a2, t0
                  srai         s9, t0, 18
1203:             lui          t3, 465039
                  c.beqz       a0, 1220f
                  ori          a6, t5, -819
                  bge          t3, t0, 1217f
                  mulhu        a6, s10, sp
                  add          s10, t0, a0
                  c.addi       t4, -1
                  c.andi       a4, 11
                  addi         t6, s7, 1449
                  c.add        t3, s9
                  srli         t2, t3, 6
                  add          t4, t4, t1
                  blt          s6, a4, 1234f
                  blt          zero, s4, 1225f
1217:             bltu         s7, a1, 1236f
                  srl          s4, s10, t0
                  srli         a6, s1, 31
1220:             c.add        a0, s4
                  c.add        t5, s11
                  c.andi       a1, 27
                  c.slli       t1, 3
                  c.addi4spn   a5, sp, 272
1225:             bgeu         t2, s0, 1226f
1226:             slt          t3, s4, sp
                  c.beqz       a0, 1229f
                  xor          t2, tp, t3
1229:             bge          a3, t2, 1247f
                  sltu         s9, ra, a4
                  addi         t3, s2, 1456
                  c.beqz       a4, 1239f
                  c.addi4spn   a1, sp, 816
1234:             xori         s11, a2, 685
                  c.li         t5, 18
1236:             c.nop
                  c.or         a3, s0
                  c.srli       a3, 7
1239:             slt          ra, t3, sp
                  mul          t4, a7, s7
                  bge          s7, a7, 1261f
                  bgeu         s11, t3, 1254f
                  srai         s6, s4, 19
                  c.beqz       s0, 1246f
                  srai         s0, s0, 7
1246:             c.xor        a2, a0
1247:             slli         t1, t4, 27
                  c.or         a0, a1
                  c.or         s0, a3
                  and          ra, s11, s6
                  slt          t4, s8, ra
                  andi         s7, zero, -1053
                  beq          s10, s1, 1265f
1254:             remu         s6, s10, ra
                  beq          t1, s5, 1270f
                  slti         a2, sp, 1573
                  rem          sp, s7, s2
                  c.addi       t0, -1
                  rem          gp, a1, a3
                  div          a5, t2, s3
1261:             mulhu        s10, s1, s11
                  slt          t6, a4, s10
                  div          sp, a1, a4
                  mulhsu       a2, s10, sp
1265:             andi         t4, s6, -71
                  nop
                  lui          t3, 890218
                  bge          s8, s7, 1286f
                  and          t3, s2, t3
1270:             c.sub        a4, a3
                  sll          ra, s2, s3
                  c.li         s11, 17
                  xori         a5, a5, -1579
                  auipc        s0, 317441
                  c.nop
                  addi         s4, t3, 504
                  sra          a3, t0, a1
                  xori         a6, a6, -1905
                  c.addi16sp   sp, -16
                  rem          s8, t6, s4
                  slli         ra, s9, 16
                  sltiu        a0, s0, 552
                  lui          t4, 515721
                  remu         t2, t1, a0
                  rem          t6, zero, tp
1286:             auipc        s7, 191241
                  nop
                  sll          s4, a0, a3
                  c.li         ra, -1
                  c.beqz       a4, 1308f
                  mulh         s11, sp, a7
                  sll          t6, a1, s8
                  c.sub        a4, a3
                  c.li         t3, 2
                  c.slli       tp, 11
                  div          s3, s9, a3
                  rem          s10, a7, t4
                  mulhu        s3, sp, s9
                  sra          a2, gp, a1
                  sra          t1, tp, tp
                  c.slli       a0, 28
                  auipc        tp, 742073
                  lui          ra, 400387
                  bge          zero, s8, 1308f
                  mulhsu       t2, t0, s4
                  remu         sp, a4, t6
                  lui          t1, 860096
1308:             sltu         s3, sp, t2
                  c.beqz       s1, 1318f
                  srai         a0, s11, 28
                  c.addi       t1, -1
                  sub          s7, s8, t1
                  bge          a2, zero, 1319f
                  slti         a5, t6, -375
                  sra          a2, a3, a1
                  la           sp, region_0+1564 #start riscv_load_store_hazard_instr_stream_4
                  lbu          s0, -12(sp)
                  sh           s3, -12(sp)
                  mul          s0, s1, s0
                  lhu          t0, -12(sp)
                  lb           a0, -12(sp)
                  lh           t2, -12(sp)
                  lh           t0, -12(sp)
                  sb           a0, -12(sp)
                  lbu          s10, 11(sp)
                  lbu          s9, 11(sp)
                  lb           a2, 11(sp)
                  sltu         s0, a2, a3
                  lbu          t1, 11(sp) #end riscv_load_store_hazard_instr_stream_4
                  bge          s3, t5, 1323f
                  c.andi       a0, -1
1318:             c.sub        a0, a4
1319:             sub          t1, a5, gp
                  beq          t1, t4, 1331f
                  sll          s3, t1, s7
                  c.or         s0, a5
1323:             andi         s3, s0, -274
                  sub          a1, s8, s5
                  sra          a1, ra, t3
                  c.addi4spn   a4, sp, 752
                  c.addi16sp   sp, -16
                  remu         t4, t0, s1
                  nop
                  mulhsu       s6, tp, a7
1331:             xor          t3, s9, ra
                  xor          sp, a0, a2
                  bge          ra, a6, 1349f
                  sll          t1, t3, s11
                  auipc        s9, 88220
                  c.nop
                  ori          s1, s3, -1196
                  bltu         a2, s3, 1351f
                  c.andi       a0, 25
                  sltu         s6, s10, t6
                  c.slli       a6, 21
                  addi         s1, a6, 750
                  c.slli       t4, 23
                  slt          gp, a5, ra
                  lui          t0, 667226
                  c.andi       s0, -1
                  c.lui        t5, 10
                  mulhsu       tp, zero, s10
1349:             sltiu        t2, a1, -980
                  xori         s11, s2, -940
1351:             c.lui        s10, 10
                  srli         s0, t3, 7
                  blt          s8, tp, 1367f
                  bltu         t6, s3, 1356f
                  blt          s10, s1, 1358f
1356:             add          t5, t6, s6
                  rem          ra, s5, tp
1358:             sll          s3, t4, s5
                  div          t5, s0, t1
                  c.slli       sp, 14
                  bltu         a2, a0, 1380f
                  c.add        ra, t4
                  xori         a2, a1, 281
                  rem          zero, t2, s8
                  rem          zero, s9, s4
                  c.mv         t3, a2
1367:             beq          s7, s7, 1378f
                  sra          s10, s5, s11
                  rem          s0, t2, a1
                  xor          s1, ra, a5
                  c.xor        a3, a1
                  c.andi       a2, -1
                  bgeu         a4, tp, 1375f
                  or           a0, s7, s4
1375:             c.lui        s6, 21
                  remu         a6, s9, t1
                  xori         a1, a1, -2002
1378:             c.addi       a5, 10
                  c.beqz       s0, 1397f
1380:             ori          s11, t3, -1932
                  auipc        a0, 817759
                  c.and        a3, a3
                  nop
                  sra          s0, s8, a7
                  auipc        s0, 415516
                  c.addi       ra, 5
                  c.mv         gp, a4
                  c.nop
                  c.add        t6, s10
                  xor          a5, s1, s9
                  c.addi4spn   a2, sp, 192
                  xor          a2, gp, a5
                  xori         a3, s0, 689
                  srl          t6, s7, a6
                  srli         tp, t5, 8
                  bge          s11, s0, 1401f
1397:             add          s11, zero, t4
                  blt          s6, s8, 1399f
1399:             divu         t6, t1, a4
                  c.addi4spn   a5, sp, 464
1401:             sll          t3, a6, a6
                  remu         a0, a4, s3
                  bltu         t0, t3, 1405f
                  slli         t2, t1, 11
1405:             c.lui        tp, 18
                  c.bnez       a2, 1421f
                  srai         a6, a5, 11
                  remu         s0, s10, t5
                  bltu         s2, zero, 1411f
                  srai         a5, t6, 6
1411:             bne          a7, tp, 1429f
                  bltu         zero, a7, 1428f
                  mulhu        gp, a0, gp
                  c.andi       a4, 12
                  ori          t2, a6, -1241
                  bge          t2, zero, 1423f
                  c.and        s0, a3
                  mulh         t2, s3, s9
                  c.add        s10, a7
                  c.or         s0, a1
1421:             slli         ra, s5, 8
                  c.addi4spn   a3, sp, 992
1423:             rem          s0, s2, t3
                  slt          a1, a6, s6
                  c.and        a3, a4
                  c.addi       s10, -1
                  rem          a3, a5, s4
1428:             c.sub        s0, a4
1429:             sltiu        zero, s8, 682
                  c.addi       a6, 21
                  add          gp, t0, t2
                  div          t0, a2, s0
                  add          ra, zero, a6
                  rem          s7, s1, s5
                  srl          a1, s11, s3
                  c.beqz       a1, 1439f
                  c.addi       s8, 21
                  xori         a2, a7, 512
1439:             bge          s9, a2, 1447f
                  remu         t6, s0, sp
                  mulh         tp, s7, t2
                  slt          t3, s8, a2
                  c.bnez       s1, 1455f
                  c.mv         s7, t5
                  bge          a6, gp, 1459f
                  mulh         t4, a5, a1
1447:             add          t1, a6, a1
                  c.addi4spn   a4, sp, 816
                  or           a6, s2, ra
                  c.and        s0, a3
                  remu         a6, s3, a4
                  sra          tp, t4, s8
                  bltu         t4, s0, 1455f
                  mulhsu       ra, s10, s1
1455:             remu         s11, s6, t1
                  mulhsu       s6, t5, ra
                  sll          s8, s11, zero
                  and          s4, a1, s3
1459:             c.sub        a3, a5
                  remu         ra, a3, gp
                  xori         s1, a2, 554
                  slt          t6, s3, s9
                  sll          a6, a5, t5
                  srli         s10, t4, 24
                  andi         t1, t6, -1446
                  rem          t2, tp, s0
                  c.xor        a2, a0
                  slti         a3, s3, -749
                  bge          zero, t1, 1473f
                  c.srai       a1, 1
                  c.addi16sp   sp, 384
                  and          zero, t5, ra
1473:             c.sub        a0, a5
                  c.srli       a1, 11
                  c.addi16sp   sp, -16
                  c.or         a1, a1
                  andi         zero, sp, 115
                  rem          s6, t2, s5
                  nop
                  remu         t6, tp, s7
                  sub          s3, tp, s4
                  srai         a4, s2, 13
                  mulhsu       s0, t0, s7
                  slli         t5, t6, 15
                  addi         a5, s4, -160
                  c.bnez       a0, 1498f
                  c.addi       t1, -1
                  mulh         s6, a1, a0
                  c.li         s8, 30
                  sra          zero, s7, s6
                  rem          s3, t0, s9
                  c.or         a5, s0
                  c.lui        a2, 24
                  sra          s8, s0, s9
                  divu         a6, a7, t4
                  rem          zero, s2, s2
                  srl          s7, gp, t3
1498:             addi         t1, t0, -834
                  c.slli       t1, 19
                  slli         s6, s8, 9
                  c.nop
                  and          zero, t4, a2
                  rem          a3, s10, a2
                  c.andi       s1, -1
                  andi         zero, tp, -1018
                  mul          zero, t2, zero
                  srli         s9, s2, 28
                  sra          t1, s4, s9
                  rem          tp, a2, s2
                  la           t1, region_1+1511 #start load_store_instr_stream_1
                  la           s0, region_1+184 #start load_store_instr_stream_0
                  sh           s3, 27(t1)
                  lb           a3, -256(t1)
                  la           tp, region_1+1197 #start load_store_instr_stream_2
                  sb           s9, 64(t1)
                  la           a0, region_1+1138 #start load_store_instr_stream_3
                  lh           a2, -64(a0)
                  sh           s11, 28(a0)
                  lbu          a4, 1448(s0)
                  lb           a6, -3(tp)
                  lbu          s10, -16(tp)
                  lhu          a3, -128(a0)
                  lb           a6, 117(s0)
                  sb           a1, 203(a0)
                  lb           t4, -29(a0)
                  lhu          s9, 100(s0)
                  lbu          a4, 204(t1)
                  sw           s2, 230(a0)
                  sb           gp, -41(a0)
                  lbu          a3, -248(a0)
                  lbu          s1, -148(a0)
                  lb           a3, -16(tp)
                  sb           s1, 150(a0) #end load_store_instr_stream_3
                  sw           a0, 1244(s0)
                  lbu          sp, -5(tp)
                  lbu          s8, 796(s0)
                  lbu          s1, 1607(s0)
                  lhu          a2, 900(s0)
                  sh           ra, 1110(s0)
                  lb           t6, 10(tp) #end load_store_instr_stream_2
                  lhu          s9, -139(t1) #end load_store_instr_stream_1
                  lbu          t6, 837(s0) #end load_store_instr_stream_0
                  or           t3, a4, t2
                  sub          a5, s7, s10
                  c.li         t5, -1
                  sltiu        s6, s9, 513
                  srl          s4, s10, ra
                  bne          s9, t2, 1524f
                  sltiu        tp, t4, -1068
                  mulh         s4, gp, gp
                  c.srai       a5, 7
                  c.srai       a1, 8
                  mulhu        s11, zero, t1
                  slti         s9, s5, -159
                  c.li         s8, -1
                  sltiu        s8, s3, -1185
1524:             and          zero, t0, a6
                  mulhsu       s6, a0, t5
                  mulh         tp, s11, s4
                  slt          t3, s4, s2
                  div          s9, s11, t1
                  remu         t1, t3, t5
                  slti         sp, ra, 1565
                  or           gp, s2, s3
                  sra          s1, a4, t2
                  c.and        a3, s0
                  c.nop
                  ori          t1, a5, -1302
                  addi         a0, a4, -1745
                  nop
                  c.addi16sp   sp, -16
                  sltiu        t1, tp, 57
                  or           t6, s6, t2
                  c.sub        a3, a5
                  c.slli       a3, 17
                  and          t6, t3, s0
                  ori          s8, zero, -512
                  c.addi4spn   a1, sp, 992
                  mulh         a6, t2, s2
                  sra          s11, s11, a5
                  divu         a2, a7, gp
                  xori         s9, t2, -1236
                  ori          gp, t6, -260
                  beq          a3, zero, 1564f
                  c.lui        a6, 21
                  c.mv         t4, t4
                  lui          t0, 256393
                  mulhu        s8, s3, t5
                  remu         t4, s2, s9
                  sltu         s0, a7, s8
                  c.bnez       a3, 1577f
                  divu         s0, s4, s5
                  c.andi       a3, 5
                  lui          s11, 492656
                  andi         a2, zero, -1575
                  mulh         t4, t1, t6
1564:             c.addi4spn   s1, sp, 320
                  ori          t3, t4, 1947
                  sltiu        zero, a0, -2013
                  andi         a1, s3, -2047
                  c.addi16sp   sp, -16
                  slti         zero, s0, -1064
                  srli         t6, s7, 13
                  divu         a2, t5, a2
                  c.bnez       s1, 1581f
                  srl          a0, zero, tp
                  srl          t4, s11, s3
                  bge          s6, a0, 1586f
                  divu         a4, t0, s3
1577:             remu         tp, a1, a5
                  divu         t4, s0, tp
                  c.addi       s7, -1
                  mulh         s10, s6, a3
1581:             c.addi16sp   sp, 48
                  auipc        a3, 958199
                  bge          a2, t1, 1601f
                  bgeu         a7, a5, 1590f
                  slt          s6, t0, a5
1586:             and          s11, s9, t4
                  and          a5, s7, a0
                  c.srai       a4, 19
                  mulh         s11, s0, s9
1590:             rem          sp, t3, s4
                  c.srai       s0, 30
                  c.srai       s0, 11
                  xor          t4, s4, s10
                  bltu         a7, a7, 1601f
                  c.xor        s0, a3
                  sll          a4, s4, s3
                  sltiu        zero, t6, -1196
                  xor          t4, t6, t1
                  slli         t1, s9, 14
                  c.slli       s1, 16
1601:             auipc        s6, 388575
                  c.xor        a4, a0
                  bgeu         gp, s0, 1619f
                  divu         a3, zero, zero
                  c.xor        a4, a2
                  c.xor        s0, a3
                  sra          ra, t2, s0
                  div          gp, s10, s5
                  c.xor        s0, a0
                  mulhu        s6, s10, zero
                  c.xor        s0, a4
                  c.bnez       a0, 1632f
                  c.srai       s0, 26
                  auipc        t4, 635113
                  c.nop
                  rem          s0, a6, s5
                  c.lui        s6, 29
                  c.add        s0, ra
1619:             c.srli       s0, 25
                  add          s0, s4, a5
                  sra          s1, t4, t3
                  c.nop
                  c.sub        a5, s1
                  sltiu        a4, a1, 1755
                  c.mv         t2, a7
                  c.li         t3, -1
                  slt          a3, t6, s6
                  bgeu         t5, s7, 1648f
                  bge          s7, a0, 1631f
                  mul          s0, a4, s6
1631:             c.addi16sp   sp, -16
1632:             c.slli       t2, 21
                  mulh         a1, t0, s6
                  c.srai       a3, 7
                  mulh         s8, a7, t1
                  or           a2, s2, tp
                  c.add        s7, t1
                  c.lui        s7, 19
                  add          s9, a0, a0
                  c.bnez       a0, 1642f
                  c.srai       s0, 7
1642:             mulhsu       sp, s10, a4
                  xori         a4, a0, 846
                  div          sp, a2, t0
                  slli         t0, a2, 24
                  c.nop
                  c.lui        a4, 1
1648:             auipc        s6, 60973
                  add          t4, a5, a4
                  rem          t4, s9, s10
                  sub          a1, s4, ra
                  lui          tp, 1044842
                  sll          s9, a5, t3
                  c.addi       s7, 4
                  ori          s6, zero, 1215
                  slli         a0, s9, 8
                  divu         s8, a1, zero
                  bne          s6, s7, 1661f
                  c.mv         gp, t0
                  xori         a5, t2, 42
1661:             slli         s3, s3, 29
                  slt          s9, a4, a6
                  c.li         a4, -1
                  slti         t3, s9, -551
                  xori         t0, s3, -740
                  remu         tp, t5, t0
                  div          s10, sp, t1
                  ori          s1, tp, -652
                  and          zero, a6, s7
                  c.mv         s10, tp
                  or           s7, s11, sp
                  slti         a4, t5, -1559
                  c.addi4spn   a3, sp, 608
                  c.nop
                  xor          s6, a4, s9
                  sltiu        t4, s9, -1468
                  c.srli       a2, 5
                  mul          t1, t3, a0
                  sltu         s4, gp, gp
                  sra          s9, s7, a6
                  c.bnez       a2, 1700f
                  srli         a3, s2, 2
                  mulhu        t6, s5, t1
                  c.andi       a3, -1
                  c.slli       s8, 7
                  divu         s6, s11, a6
                  or           s10, s0, a3
                  slli         s0, s11, 15
                  sltiu        s3, s6, 1364
                  c.xor        a5, a5
                  c.addi16sp   sp, 288
                  mulhu        s10, a7, t2
                  srl          a2, s7, a7
                  c.andi       a3, 0
                  sltiu        t4, tp, 908
                  and          a6, s5, s3
                  ori          s3, s8, -1637
                  c.addi4spn   a1, sp, 128
                  addi         a0, t5, 946
1700:             ori          s4, t3, -1788
                  c.add        a4, s11
                  sll          a0, gp, s0
                  lui          t2, 704236
                  nop
                  rem          t1, s4, s8
                  xor          s10, a4, a1
                  srli         t1, a6, 1
                  ori          a2, a1, -1179
                  slti         a4, a5, 1257
                  sll          s6, t3, s8
                  c.mv         s6, s0
                  and          s6, gp, gp
                  sll          s10, s4, a7
                  c.addi       s0, -1
                  andi         zero, a4, -836
                  slti         tp, t5, -170
                  c.li         s0, -1
                  sll          t0, t3, s1
                  c.beqz       a0, 1720f
1720:             srl          s11, s9, s7
                  c.srli       a2, 9
sub_2_59:         jal          ra, 10f
0:                jal          s8, 7f
1:                jal          s7, 24f
2:                c.j          28f
3:                c.jal        18f
4:                jal          ra, 0b
5:                jal          t1, 29f
6:                jal          t1, 2b
7:                c.jal        26f
8:                c.jal        27f
9:                c.jal        22f
10:               jal          ra, 23f
11:               jal          a3, 6b
12:               c.jal        5b
13:               c.jal        3b
14:               c.j          11b
15:               c.j          1b
16:               jal          ra, 14b
17:               c.jal        9b
18:               jal          ra, 16b
19:               c.jal        8b
20:               jal          ra, 4b
21:               c.j          19b
22:               c.j          30f
23:               c.jal        21b
24:               c.j          12b
25:               c.j          20b
26:               c.j          15b
27:               c.j          13b
28:               jal          gp, 25b
29:               jal          ra, 17b
30:               c.mv         s0, a2
                  remu         a4, s5, a5
                  nop
                  sll          a6, s1, s4
                  c.or         a0, a5
                  c.addi       t2, -1
                  mul          s6, zero, a6
                  sltiu        a4, a3, -614
                  bge          zero, s11, 1748f
                  auipc        s0, 448878
                  beq          s7, ra, 1746f
                  and          ra, s11, a2
                  sub          t4, a3, s7
                  or           s7, zero, s4
                  lui          t3, 890759
                  bgeu         ra, a0, 1743f
                  nop
                  c.beqz       a4, 1754f
                  sra          s6, s0, a2
                  xor          t4, t3, s3
                  c.sub        a1, s1
                  c.mv         s3, t0
1743:             add          s0, gp, tp
                  mulhsu       t4, a6, t6
                  andi         s3, a1, -1424
1746:             mul          s1, tp, s3
                  c.addi4spn   a0, sp, 592
1748:             mulhsu       tp, s9, t3
                  slt          t5, s0, ra
                  divu         s0, t1, s10
                  auipc        s10, 118775
                  sltu         t2, a5, ra
                  mulhsu       a6, ra, t0
1754:             c.li         s6, -1
                  lui          ra, 281922
                  xor          s1, zero, tp
                  c.sub        a4, s1
                  beq          s5, a3, 1774f
                  or           t3, a6, sp
                  sltu         a3, s5, a0
                  bge          s0, tp, 1781f
                  c.srli       a5, 29
                  andi         s6, s4, 45
                  c.srli       s1, 23
                  div          s4, a1, t6
                  c.addi4spn   s0, sp, 544
                  beq          s8, t4, 1772f
                  bge          t5, s10, 1779f
                  c.addi       gp, 18
                  sll          a4, t1, sp
                  mulhu        a5, sp, s3
1772:             c.slli       tp, 4
                  la           a1, region_1+382 #start riscv_load_store_rand_instr_stream_12
                  slt          a5, a3, t2
                  c.addi       s9, -1
                  or           t6, t3, s10
                  sb           a5, 828(a1)
                  add          zero, s3, t3
                  sh           t0, 142(a1)
                  lhu          s10, 240(a1)
                  lh           s7, 992(a1)
                  sb           t6, 180(a1)
                  ori          a3, a6, 1296
                  sb           t2, -18(a1)
                  c.srai       s0, 10
                  c.addi16sp   sp, -16
                  lb           ra, 1600(a1)
                  xor          s9, s9, tp
                  c.li         sp, -1
                  divu         s0, a6, t5
                  sra          s11, a6, zero
                  srli         t4, s2, 24
                  sb           s7, 1149(a1)
                  sra          t4, t5, sp
                  xori         tp, gp, 1974
                  and          a4, t1, a4
                  lw           a3, -262(a1)
                  c.nop
                  mulh         s8, a5, s1
                  remu         s9, s4, s8
                  c.xor        a4, s0
                  c.andi       a2, -1
                  c.mv         a2, s11
                  c.add        s7, t2
                  sb           t3, -145(a1)
                  sltiu        a5, t4, 359
                  mul          a2, tp, t2
                  c.li         t3, 24
                  lhu          t6, 364(a1) #end riscv_load_store_rand_instr_stream_12
                  sltu         a1, a1, a7
1774:             sra          a6, s7, s9
                  auipc        t4, 642789
                  srl          a6, s0, s3
                  c.xor        a4, a5
                  mulh         tp, a3, a0
1779:             rem          t6, s0, t3
                  sub          s3, t4, s7
1781:             mulhsu       s9, t6, t2
                  and          s3, sp, a2
                  c.xor        a1, s0
                  c.srai       a5, 4
                  c.addi       s10, 22
                  add          gp, s8, sp
                  sltu         t6, t1, s8
                  c.li         s10, 23
                  c.srli       a0, 17
                  mulhu        t5, s1, t6
                  c.nop
                  blt          zero, s2, 1806f
                  c.andi       a4, -1
                  c.or         a2, s1
                  sub          a0, ra, s6
                  c.nop
                  slti         s4, s3, 1382
                  c.srai       a4, 6
                  mulhsu       a6, t4, zero
                  c.sub        a0, a2
                  c.slli       t3, 25
                  divu         a5, sp, s7
                  c.srli       a0, 1
                  remu         gp, s9, sp
                  or           a1, a4, t6
1806:             slti         s9, a5, -438
                  slti         gp, t3, -1512
                  c.or         s0, a0
                  div          tp, tp, t1
                  addi         s0, t0, -1071
                  bltu         t0, s10, 1823f
                  c.addi       a6, -1
                  sra          s10, a2, t1
                  sltiu        gp, s2, 756
                  c.bnez       a2, 1819f
                  or           a0, t2, t0
                  srli         t2, a1, 5
                  c.sub        a0, a5
1819:             c.srai       a0, 28
                  mulhsu       t2, gp, a7
                  c.srai       a4, 15
                  slli         a0, t4, 11
1823:             remu         s3, tp, gp
                  sra          t5, sp, t2
                  remu         s11, t3, t2
                  nop
                  sra          t2, a7, s1
                  blt          t4, tp, 1830f
                  c.srli       s1, 29
1830:             mulh         a0, a2, a3
                  sltu         a6, a0, t5
                  c.mv         a4, s3
                  c.andi       a3, -1
                  slli         t5, t1, 9
                  c.add        a6, s2
                  slli         a6, t1, 18
                  c.mv         s0, a5
                  sra          gp, s8, sp
                  remu         t2, s7, s1
                  sltu         t1, sp, t5
                  auipc        s10, 324391
                  sltu         s6, s9, s10
                  c.srli       a1, 5
                  sll          a6, s8, t5
                  add          gp, a3, t3
                  div          s1, t0, t5
                  c.mv         s8, t1
                  xor          a2, s3, zero
                  c.srai       a2, 25
                  sltu         a4, a2, a2
                  bgeu         t3, a4, 1860f
                  c.addi       s4, 13
                  xori         s4, t0, 1918
                  c.lui        t0, 24
                  c.addi4spn   a2, sp, 96
                  slli         s1, zero, 17
                  srl          a3, zero, a2
                  mulh         t5, t6, s1
                  slti         s8, s10, 1095
1860:             c.addi4spn   s0, sp, 112
                  blt          tp, s2, 1874f
                  slti         s6, s6, -714
                  c.and        a0, a4
                  c.beqz       a4, 1872f
                  sltu         a6, t2, s4
                  remu         t4, s2, a0
                  divu         t0, s5, a7
                  or           s7, s7, t3
                  and          t4, a4, t0
                  c.lui        s8, 2
                  sltiu        a1, s1, 377
1872:             addi         s6, s2, 1735
                  xori         t4, t3, 733
1874:             mulhu        tp, a3, t0
                  c.addi       s6, -1
                  srli         s9, s5, 29
                  c.nop
                  mul          s7, s10, t1
                  c.addi4spn   a5, sp, 848
                  c.bnez       a5, 1900f
                  xori         s9, t1, -1221
                  c.mv         s6, a0
                  c.slli       ra, 12
                  ori          s8, t3, -1943
                  c.nop
                  sub          t3, a3, s11
                  slt          s9, s1, s8
                  c.sub        s1, a1
                  ori          t6, t4, -1200
                  addi         zero, t0, 2038
                  xor          s11, t3, a3
                  slti         a1, a5, 2003
                  auipc        t5, 286809
                  srl          s0, s3, t2
                  c.and        a1, s1
                  slli         t3, a0, 4
                  auipc        a1, 110160
                  sra          a0, a2, a0
                  c.addi       t2, 6
1900:             mulhu        a3, t4, s9
                  and          s1, s6, s7
                  beq          a0, t2, 1909f
                  slti         a1, t5, 1352
                  slt          t1, t0, a1
                  c.addi16sp   sp, 16
                  sll          s0, a3, ra
                  mulh         s6, a1, s6
                  c.srli       a3, 4
1909:             ori          t5, a5, -1607
                  srai         s7, s9, 27
                  c.sub        a0, s1
                  c.slli       t4, 5
                  add          t6, a0, t1
                  slti         tp, a0, -2038
                  lui          gp, 255912
                  mul          s0, s10, sp
                  add          s6, s0, zero
                  c.addi16sp   sp, 96
                  mul          ra, a5, t6
                  c.or         a3, a4
                  c.li         s1, 15
                  remu         s9, s2, a1
                  div          s4, s5, t2
                  c.add        a5, s1
                  add          s4, s0, s7
                  slt          a5, s1, a7
                  sll          ra, s8, ra
                  addi         a1, a4, -736
                  blt          t3, s8, 1940f
                  sll          ra, s1, t4
                  srl          a6, t1, s3
                  c.lui        s4, 3
                  sra          a1, s4, s0
                  slli         t4, t5, 20
                  c.andi       a1, -1
                  auipc        a3, 1002787
                  divu         gp, tp, s4
                  c.addi4spn   s0, sp, 928
                  c.beqz       a4, 1945f
1940:             bge          a7, s2, 1958f
                  or           s0, a3, a1
                  c.or         a3, a0
                  blt          zero, a7, 1952f
                  c.li         ra, 12
1945:             and          s7, sp, a2
                  or           tp, s5, a3
                  c.srli       a3, 18
                  c.lui        a6, 25
                  sra          t1, s2, s7
                  beq          t1, a7, 1968f
                  c.nop
1952:             ori          s3, a6, -940
                  c.srli       a1, 25
                  c.nop
                  c.mv         s3, s6
                  c.xor        a1, s1
                  c.slli       s1, 25
1958:             ori          a0, tp, 571
                  slli         t6, t5, 23
                  bltu         tp, s1, 1978f
                  c.li         t5, -1
                  bgeu         s2, s7, 1974f
                  c.nop
                  nop
                  c.add        s9, a6
                  sra          a6, sp, gp
                  slti         a5, t4, 1022
1968:             c.sub        a3, a3
                  c.mv         t3, s3
                  slti         a2, s0, 1662
                  sub          t0, t2, t2
                  sltu         a2, s9, s0
                  c.slli       a6, 25
1974:             srl          sp, s3, a5
                  c.mv         sp, s11
                  bltu         a1, a5, 1978f
                  rem          t4, a1, a4
1978:             ori          s4, s5, 105
                  c.addi4spn   a1, sp, 912
                  slli         s4, a0, 20
                  sra          zero, a1, a6
                  add          t6, s4, sp
                  add          tp, a5, a0
                  beq          a3, s9, 1986f
                  or           zero, s10, a6
1986:             bge          t0, a5, 1988f
                  add          s1, a6, s1
1988:             and          t4, t2, s2
                  mulhsu       s0, t6, zero
                  addi         a4, t1, -1169
                  mulhu        tp, s5, zero
                  c.beqz       a4, 1995f
                  andi         s10, a6, 1858
                  xor          a0, t6, s7
1995:             bne          t3, s5, 2013f
                  ori          t6, s1, -581
                  sub          t2, t2, s10
                  rem          a0, t6, t5
                  c.slli       t2, 19
                  beq          a2, s7, 2006f
                  divu         s9, s9, a0
                  slti         s10, s10, 1566
                  c.addi16sp   sp, 496
                  sltiu        s11, s4, 397
                  c.xor        a3, a1
2006:             c.srai       a2, 31
                  slli         s10, s6, 16
                  or           t4, zero, a7
                  mul          a6, s3, s10
                  c.li         s0, -1
                  remu         t6, sp, t3
                  bltu         a2, s8, 2019f
2013:             c.xor        a5, a4
                  mulh         a0, s6, s0
                  slti         t4, sp, 1358
                  slt          s3, t4, t5
                  c.srli       a5, 2
                  divu         gp, a2, s0
2019:             c.li         s3, 15
                  c.srli       a3, 20
                  c.and        a5, a4
                  c.lui        t0, 15
                  c.srai       a2, 23
                  add          t3, tp, s10
                  c.addi4spn   a3, sp, 288
                  c.srli       a5, 14
                  nop
                  ori          s4, a6, -1274
                  nop
                  srai         s3, t2, 5
                  bne          s0, s4, 2043f
                  beq          t2, t0, 2037f
                  c.addi       a4, 8
                  slt          s0, t3, t6
                  sltu         zero, zero, t1
                  beq          t4, s8, 2055f
2037:             srai         a3, ra, 0
                  xor          s7, t0, a2
                  sltiu        ra, t2, -1783
                  c.srai       a4, 5
                  andi         s3, a7, 1469
                  nop
2043:             xori         a3, s4, -1133
                  ori          s7, t5, -1153
                  or           s3, s2, s3
                  ori          a0, a1, -1605
                  c.nop
                  sltu         t6, t3, s1
                  c.addi       t3, 30
                  add          tp, s3, zero
                  c.srai       a1, 15
                  add          zero, a5, ra
                  c.and        a4, a4
                  slt          zero, a0, s10
2055:             bgeu         t2, s5, 2073f
                  remu         a4, a0, a6
                  auipc        t1, 712124
                  slt          a2, s3, a4
                  c.xor        a2, a0
                  mulhu        sp, ra, t0
                  slti         s4, s10, 844
                  srli         a1, gp, 18
                  beq          s8, a2, 2081f
                  srl          s9, s0, s1
                  c.or         a0, a4
                  lui          a0, 51145
                  c.lui        ra, 14
                  c.and        s1, s1
                  c.andi       s0, -1
                  rem          s8, s1, t6
                  bgeu         t4, ra, 2087f
                  rem          s8, s0, t4
2073:             c.lui        s4, 18
                  divu         a2, s8, tp
                  srai         tp, ra, 21
                  c.addi       s0, 27
                  c.lui        t5, 24
                  bge          t2, a2, 2098f
                  remu         t1, s6, ra
                  sltu         a4, gp, a5
2081:             mulhu        s9, s7, t1
                  mulhu        a1, a5, a5
                  slt          a6, t4, tp
                  nop
                  c.add        s10, ra
                  sra          a4, t6, t1
2087:             c.addi16sp   sp, 368
                  ori          s11, gp, 2012
                  addi         t4, t3, -955
                  mulhsu       a3, a7, s11
                  xor          s11, a7, t4
                  sltu         t0, s6, ra
                  c.and        s1, a3
                  bltu         zero, t6, 2096f
                  divu         a6, a2, sp
2096:             divu         t1, s0, t2
                  xori         zero, s9, 1120
2098:             bgeu         s6, s6, 2102f
                  c.nop
                  mulhsu       t2, s3, t1
                  or           ra, s4, t6
2102:             c.andi       s1, 14
                  c.addi       s3, 12
                  and          a2, tp, a1
                  andi         a0, sp, 1888
                  ori          a3, a4, -1816
                  srai         a6, s6, 31
                  slti         s1, a2, -1211
                  sll          a4, s2, t6
                  sub          s11, t6, a0
                  srai         a5, s5, 10
                  mulhu        s4, ra, t0
                  c.mv         s9, t4
                  srli         t3, s1, 14
                  c.lui        ra, 22
                  c.sub        s0, a4
                  sltiu        t3, s4, 1120
                  add          s1, s2, s4
                  slti         s6, a1, 27
                  srai         t2, s4, 14
                  c.bnez       s1, 2133f
                  c.sub        a4, a1
                  sra          sp, t3, t5
                  srl          s6, t1, a3
                  srai         t3, s11, 11
                  xor          sp, s0, s11
                  blt          s10, a7, 2136f
                  beq          t2, t2, 2137f
                  c.addi       t2, 16
                  sltu         a2, t6, gp
                  add          t3, a5, t1
                  blt          s4, a3, 2143f
2133:             c.beqz       a5, 2134f
2134:             c.or         a5, a4
                  c.srli       a0, 27
2136:             sub          t4, a6, a5
2137:             c.addi       a4, -1
                  mul          s6, a6, a4
                  srl          s6, tp, t2
                  slli         gp, s10, 9
                  sltiu        s4, s8, -925
                  lui          a0, 805936
2143:             c.nop
                  sll          ra, s7, s8
                  c.xor        a4, a1
                  bltu         gp, s8, 2154f
                  c.bnez       a1, 2154f
                  srl          s1, zero, gp
                  c.slli       ra, 10
                  beq          gp, t6, 2163f
                  bge          t0, t1, 2167f
                  c.lui        a4, 15
                  div          s10, s8, a6
2154:             c.and        a2, a3
                  c.and        a4, a2
                  srl          t3, s2, s11
                  c.or         a1, a3
                  srl          t3, t2, s5
                  c.and        a4, a0
                  beq          t5, s7, 2174f
                  andi         zero, s7, 9
                  mulh         gp, t2, s11
2163:             mulhsu       s10, t2, t3
                  c.addi4spn   a0, sp, 496
                  sltiu        s1, s2, -1930
                  lui          t3, 945490
2167:             sll          s6, s9, a0
                  mulh         t6, a7, a4
                  c.srli       a5, 15
                  div          a6, zero, a3
                  mul          ra, t6, s5
                  auipc        t3, 621412
                  bgeu         a7, t3, 2192f
2174:             c.and        s0, a2
                  sra          t2, t6, t3
                  rem          ra, zero, s0
                  mul          t3, t3, t0
                  beq          s1, a5, 2189f
                  remu         s11, t2, sp
                  addi         t3, s2, -1434
                  c.addi16sp   sp, -16
                  c.beqz       a5, 2197f
                  c.nop
                  srli         a1, t5, 3
                  add          a2, s1, t4
                  c.addi       s0, -1
                  c.andi       a4, -1
                  c.lui        t5, 5
2189:             add          t6, s4, t3
                  slli         s10, a6, 4
                  slti         a5, t6, -392
2192:             c.li         a2, -1
                  mulhu        zero, s2, a7
                  xor          a6, s0, s0
                  ori          s10, gp, 1670
                  c.sub        a4, s1
2197:             beq          ra, sp, 2199f
                  c.slli       t2, 26
2199:             c.andi       s0, -1
                  add          t1, t2, s7
                  lui          t2, 424717
                  c.addi16sp   sp, -16
                  srai         t6, s1, 30
                  sra          s0, s1, zero
                  c.sub        a4, s0
                  andi         t6, t3, -419
                  c.xor        a2, a1
                  srl          zero, a7, s9
                  c.srai       s1, 12
                  c.li         ra, -1
                  rem          s11, a1, s4
                  bgeu         zero, s10, 2232f
                  la           sp, region_1+1756 #start riscv_load_store_rand_instr_stream_15
                  lb           a4, 15(sp)
                  lb           s1, 11(sp)
                  lh           s0, 10(sp)
                  c.swsp       ra, 12(sp)
                  lhu          t4, -12(sp)
                  lui          t1, 72190
                  sb           zero, 39(sp)
                  lui          t5, 742018
                  c.and        a2, a2
                  c.and        a0, a0
                  lbu          tp, -55(sp)
                  sb           a5, 27(sp)
                  slli         s6, a4, 10
                  c.lwsp       t4, 0(sp)
                  lh           t0, 38(sp)
                  sh           s5, -40(sp)
                  lhu          a2, -6(sp)
                  lbu          t3, 63(sp)
                  xor          ra, s10, t4
                  c.slli       s11, 21
                  lh           s7, -28(sp)
                  sb           s11, -7(sp)
                  mulhsu       s10, s0, zero
                  div          s4, t3, a2
                  c.addi       a5, -1
                  remu         a3, t0, s6
                  sll          t4, s7, s11
                  lb           s11, 15(sp)
                  lb           t6, 17(sp)
                  remu         a5, s9, s8
                  lbu          t4, -55(sp)
                  lbu          t3, -5(sp)
                  c.swsp       s10, 56(sp)
                  sw           s7, -24(sp)
                  sb           a4, 55(sp)
                  add          s7, s9, a0
                  lbu          s10, -16(sp)
                  lbu          a6, -63(sp) #end riscv_load_store_rand_instr_stream_15
                  c.andi       a2, 29
                  c.li         a5, -1
                  c.bnez       s0, 2217f
                  c.addi       a4, -1
2217:             mulhu        t4, s7, t6
                  c.addi       s3, -1
                  srli         s4, a0, 26
                  rem          a4, a7, t2
                  and          a1, s3, s7
                  and          s3, t3, t5
                  slli         t1, a4, 11
                  sll          t6, t4, a1
                  srl          t6, a0, zero
                  c.sub        a5, a4
                  c.li         t6, -1
                  c.srli       s1, 18
                  xori         a1, a2, 665
                  remu         a3, t0, s5
                  c.bnez       s0, 2238f
2232:             c.addi16sp   sp, -16
                  c.andi       a1, -1
                  c.li         s6, -1
                  srl          s8, a2, a4
                  c.sub        a4, a1
                  and          a5, gp, t5
2238:             c.or         s0, a5
                  lui          a1, 349118
                  sltu         t2, ra, s1
                  andi         tp, sp, 762
                  slli         ra, t1, 11
                  c.sub        a2, a3
                  sra          t0, s5, t4
                  bne          t6, s8, 2263f
                  bne          s9, gp, 2250f
                  bge          s10, a6, 2259f
                  rem          s9, a4, a1
                  c.srli       s0, 24
2250:             c.addi       t4, 2
                  c.or         s1, a4
                  c.sub        a4, a3
                  xori         tp, a3, 1121
                  mulh         t3, t4, s10
                  c.srai       s1, 8
                  sltiu        t1, s5, 55
                  ori          s7, a6, 893
                  slti         s10, s8, -387
2259:             addi         gp, sp, 528
                  xori         gp, t0, 911
                  mulhsu       t3, s1, a7
                  and          a4, gp, s7
2263:             c.slli       ra, 26
                  slti         s6, a4, 100
                  bne          s2, a4, 2271f
                  sub          s9, s1, a3
                  andi         a6, t0, 1135
                  sltiu        s6, s8, 1854
                  ori          s1, s0, -1519
                  sltiu        a4, gp, -874
2271:             c.xor        a5, a3
                  nop
                  c.srai       a5, 25
                  srli         a3, t0, 18
                  c.nop
                  remu         s7, t0, t4
                  mulhsu       s7, sp, s8
                  remu         s0, sp, a7
                  slli         s9, s1, 8
                  bltu         s1, s4, 2283f
                  ori          t6, t2, 947
                  auipc        s7, 345738
2283:             andi         s1, s4, -1602
                  c.bnez       a2, 2302f
                  xor          t0, tp, s5
                  c.mv         a6, a1
                  srl          t4, tp, t3
                  c.xor        a2, s1
                  sll          s7, t2, s4
                  c.mv         t1, s5
                  srai         t0, s3, 22
                  nop
                  bgeu         a5, a7, 2295f
                  mulhsu       ra, s9, s6
2295:             c.srai       s1, 27
                  sra          a0, s3, a5
                  srli         a1, tp, 26
                  c.srai       a3, 9
                  c.mv         s1, a0
                  mulh         s4, t5, a6
                  mulhu        t0, s8, t0
2302:             xor          zero, s2, s5
                  mul          s7, s5, a2
                  sltiu        t1, a0, -1147
                  mulhsu       a1, a2, a1
                  c.slli       s11, 22
                  sltu         s11, s7, a2
                  bne          s8, a6, 2310f
                  srli         t4, s0, 3
2310:             c.xor        s1, s0
                  sra          s10, s5, s5
                  rem          s0, s4, a1
                  c.addi4spn   s1, sp, 64
                  xor          a4, a3, s2
                  beq          s6, t5, 2335f
                  sra          t5, s4, t1
                  sra          ra, tp, s4
                  c.sub        s1, a1
                  xor          gp, gp, s3
                  mulh         tp, t4, s8
                  divu         a1, a0, gp
                  bgeu         s1, s6, 2338f
                  c.beqz       s0, 2324f
2324:             lui          a0, 285785
                  c.bnez       a3, 2340f
                  c.li         gp, -1
                  bne          s3, s5, 2346f
                  c.addi       s11, -1
                  c.addi16sp   sp, 176
                  c.or         a5, s1
                  c.addi4spn   a2, sp, 720
                  c.addi4spn   a2, sp, 48
                  c.addi       t3, -1
                  c.nop
2335:             c.lui        t5, 20
                  lui          tp, 17932
                  sll          t4, s8, s1
2338:             remu         s10, tp, a2
                  remu         sp, s7, a1
2340:             divu         s1, t0, a0
                  andi         t1, t1, -877
                  sltu         s7, a0, tp
                  remu         a4, t2, t0
                  xor          s9, a0, s11
                  add          sp, s3, zero
2346:             add          s9, a4, s0
                  srai         a2, s5, 3
                  c.addi4spn   a0, sp, 592
                  c.slli       sp, 4
                  slt          t3, a1, s0
                  sltu         s7, a3, t6
                  addi         s11, s1, 1060
                  bne          t6, s4, 2367f
                  ori          zero, a2, 358
                  bgeu         s11, s4, 2368f
                  nop
                  xori         gp, s6, -653
                  bne          a5, s9, 2369f
                  bne          t2, s4, 2378f
                  mul          s9, s8, s9
                  c.andi       s1, -1
                  andi         s11, t4, 175
                  c.sub        a5, a5
                  c.sub        s0, s1
                  and          s3, a1, s5
                  c.addi4spn   a1, sp, 672
2367:             c.andi       a1, -1
2368:             mulhu        t0, a3, a3
2369:             blt          ra, s9, 2380f
                  slti         s0, s7, 884
                  bge          s2, s5, 2379f
                  xor          t5, a2, s11
                  add          s3, s6, a4
                  andi         t5, t0, 526
                  c.srli       a1, 14
                  auipc        zero, 895084
                  c.sub        a2, a4
2378:             c.mv         s0, gp
2379:             mul          ra, t1, s9
2380:             auipc        s8, 1030194
                  c.bnez       a1, 2393f
                  mulhu        s4, gp, s11
                  sll          zero, s4, a5
                  c.addi       t3, -1
                  c.or         a3, a5
                  c.sub        s1, s0
                  srli         a6, s10, 23
                  c.mv         s3, tp
                  xor          a1, sp, a7
                  sll          a6, a7, t0
                  lui          s10, 476847
                  bltu         t6, t5, 2397f
2393:             blt          s2, s2, 2409f
                  nop
                  c.add        t4, a1
                  blt          s5, t1, 2405f
2397:             bne          s4, a4, 2417f
                  c.and        a4, a1
                  c.sub        a5, a2
                  c.lui        s8, 20
                  mulh         s1, s10, s1
                  srli         s8, t3, 6
                  lui          s0, 329552
                  slli         t4, s10, 19
2405:             c.xor        a4, s0
                  srl          s10, s11, s1
                  slli         a4, t4, 11
                  sra          a3, s9, t1
2409:             bne          s4, s0, 2427f
                  c.li         s11, -1
                  sltu         a2, s2, t5
                  c.srli       a3, 11
                  bge          a0, t0, 2422f
                  c.srli       a0, 21
                  xor          t5, s0, t1
                  c.beqz       s0, 2418f
2417:             auipc        s8, 413902
2418:             sub          t0, sp, s9
                  bne          s10, t3, 2426f
                  ori          s1, t2, -1046
                  c.bnez       s1, 2439f
2422:             xori         t4, s10, -164
                  sra          t1, t1, a0
                  bne          a3, a4, 2440f
                  andi         tp, s3, -1368
2426:             c.srli       s1, 4
2427:             divu         a4, a6, t5
                  slti         t1, t1, 1775
                  sll          s11, s6, a6
                  srai         gp, a5, 24
                  sub          t3, s11, a4
                  sra          ra, s0, a5
                  nop
                  slti         a0, t3, 901
                  bge          t0, t1, 2447f
                  auipc        s9, 456421
                  divu         t1, s11, zero
                  bne          t0, t5, 2450f
2439:             mulhu        ra, t6, s6
2440:             c.slli       s9, 29
                  addi         t1, gp, 1133
                  sltu         s11, t3, a0
                  mulhsu       t1, tp, s8
                  beq          s0, s5, 2445f
2445:             add          zero, t1, a5
                  bgeu         t4, s3, 2448f
2447:             c.xor        a2, a2
2448:             c.sub        a5, s0
                  sll          s9, s5, t4
2450:             c.addi       s11, 31
                  ori          sp, a4, 619
                  mulhsu       a6, s4, a7
                  mulhu        tp, a0, s8
                  c.xor        a5, a3
                  add          tp, s4, t1
                  mul          tp, t1, t4
                  add          t3, s2, t1
                  rem          t4, a1, s7
                  ori          tp, t0, 1188
                  srli         s0, s3, 29
                  c.andi       a0, 24
                  ori          sp, s1, 1537
                  remu         s4, s4, a3
                  sll          t4, s4, ra
                  c.srli       a0, 5
                  c.slli       a3, 31
                  c.nop
                  and          t3, a3, a5
                  bltu         gp, s5, 2488f
                  andi         a3, s9, 1064
                  auipc        t4, 491059
                  c.srai       s1, 22
                  c.add        t2, s7
                  slli         t3, s5, 5
                  add          s0, a0, t2
                  mul          a0, sp, gp
                  beq          s8, gp, 2484f
                  div          s6, tp, sp
                  sltiu        tp, t2, 1763
                  srl          s4, a6, tp
                  beq          s4, a5, 2487f
                  rem          s1, a0, s7
                  c.addi16sp   sp, -16
2484:             xori         s8, a0, -1113
                  xori         s6, a4, 710
                  c.mv         a5, a4
2487:             xori         t1, ra, -1887
2488:             sra          s7, sp, t1
                  srai         a3, s8, 17
                  sra          tp, a3, s3
                  c.nop
                  sra          a2, a1, t4
                  andi         ra, s1, 1114
                  mul          s3, s8, zero
                  c.addi       s9, -1
                  sra          a1, t5, a7
                  c.slli       a0, 3
                  nop
                  c.srli       a3, 10
                  div          s10, a6, a3
                  c.and        s1, a0
                  bgeu         zero, s9, 2504f
                  c.slli       ra, 5
2504:             slti         s3, t6, -526
                  c.andi       a0, -1
                  nop
                  srl          zero, a2, t1
                  c.srli       a2, 24
                  sra          a4, tp, s1
                  c.slli       tp, 4
                  c.add        a5, a3
                  slt          t4, s6, a5
                  xor          t4, t1, s11
                  divu         tp, s1, t4
                  beq          sp, a7, 2517f
                  div          s6, a5, s1
2517:             div          a0, s2, a4
                  c.lui        a6, 9
                  div          sp, t3, a1
                  auipc        a0, 532540
                  lui          a0, 63991
                  bne          t4, sp, 2542f
                  c.srai       a2, 22
                  c.add        sp, t6
                  xor          t2, s7, t4
                  c.or         s1, a0
                  mulh         s3, t0, t0
                  auipc        tp, 871214
                  c.beqz       a5, 2549f
                  sltu         s10, sp, zero
                  sub          t0, s4, a1
                  sub          s1, a3, ra
                  c.beqz       a3, 2544f
                  mulh         a1, a6, gp
                  srl          t2, ra, s4
                  sra          t4, s9, t4
                  c.nop
                  mul          t6, ra, a3
                  slli         t2, tp, 6
                  c.nop
                  c.add        gp, t5
2542:             lui          t4, 6646
                  c.lui        t2, 28
2544:             beq          ra, a1, 2552f
                  ori          s10, s9, 1702
                  sltu         gp, s7, a1
                  slli         a5, s9, 14
                  bne          tp, t0, 2551f
2549:             c.addi16sp   sp, -16
                  sll          s8, s11, a0
2551:             slti         s10, a7, -39
2552:             c.bnez       s1, 2559f
                  mulhsu       a5, sp, s6
                  c.srai       a2, 21
                  ori          sp, gp, -1996
                  sub          s3, gp, s7
                  div          t0, a5, s11
                  andi         s10, s0, 1510
2559:             bltu         t1, a4, 2577f
                  c.xor        a0, s0
                  ori          s9, s7, 382
                  slt          a2, s4, a5
                  andi         a0, s4, 1572
                  c.addi       t4, 7
                  c.lui        s11, 15
                  srl          s8, t3, a1
                  c.or         a3, a4
                  sra          s0, t6, t3
                  sub          s7, a7, a5
                  ori          s3, a0, 1248
                  mul          s6, s1, t2
                  divu         t4, t0, t0
                  c.add        a5, t4
                  beq          s2, s2, 2590f
                  ori          gp, t2, -1902
                  and          s0, t2, s5
2577:             c.add        a2, s9
                  mulhu        s7, gp, a6
                  div          s10, zero, zero
                  mulh         a5, s5, a0
                  c.sub        s0, a3
                  slli         ra, t4, 24
                  bge          a5, a2, 2597f
                  c.mv         s6, s1
                  mul          s3, t0, a1
                  mulhu        a0, t6, zero
                  addi         a5, zero, 6 #init loop 1 counter
                  xor          a4, a5, s2
                  c.srai       a4, 12
                  addi         zero, zero, 0 #init loop 1 limit
                  srai         a0, a5, 9
                  slt          a0, s1, s11
                  xori         t3, s9, -602
                  c.mv         t0, a0
sub_2_111_1_t:    c.add        s11, tp
                  addi         s10, s11, 1002
                  c.srli       s1, 14
                  addi         a5, a5, -6 #update loop 1 counter
                  addi         sp, zero, -5 #init loop 0 counter
                  addi         a6, zero, 19 #init loop 0 limit
                  xor          s4, s6, s9
sub_2_111_0_t:    and          gp, a7, s0
                  xor          s7, a3, s1
                  auipc        t5, 527574
                  mul          gp, s0, s1
                  mul          t1, a7, t2
                  addi         sp, sp, 9 #update loop 0 counter
                  bltu         sp, a6, sub_2_111_0_t #branch for loop 0
                  c.andi       a1, -1
                  srl          tp, s10, s0
                  c.beqz       a5, sub_2_111_1_t #branch for loop 1
                  rem          s11, a6, s11
                  mul          s1, s11, a5
                  blt          a1, s6, 2597f
                  rem          a6, t5, a1
2590:             c.beqz       s1, 2601f
                  mul          ra, a5, a6
                  xori         ra, s3, -255
                  divu         a5, zero, s9
                  c.lui        ra, 25
                  xori         s8, s5, -502
                  or           gp, t1, a6
2597:             xori         gp, ra, 1220
                  c.srli       s0, 24
                  c.beqz       a0, 2618f
                  auipc        s8, 935211
2601:             auipc        s7, 247898
                  la           sp, region_1+1508 #start riscv_load_store_hazard_instr_stream_2
                  lbu          s11, -54(sp)
                  sb           a7, -611(sp)
                  c.srai       a5, 19
                  add          s4, gp, a0
                  lb           a6, -611(sp)
                  mulhsu       s11, a5, s2
                  lb           gp, -611(sp)
                  addi         s6, s8, -184
                  and          t0, t4, tp
                  mulhu        s3, a2, a1
                  lb           a3, -611(sp)
                  lb           t0, -901(sp)
                  lbu          s3, -901(sp)
                  sh           t2, 370(sp)
                  c.xor        a4, a5
                  lb           s9, 315(sp)
                  lbu          t0, -815(sp) #end riscv_load_store_hazard_instr_stream_2
                  srl          gp, a6, s11
                  c.addi4spn   a5, sp, 240
                  c.beqz       s1, 2608f
                  xor          s6, sp, s9
                  beq          s4, s11, 2608f
                  bltu         zero, t5, 2612f
2608:             and          t0, a2, s0
                  addi         s8, s0, 937
                  c.bnez       a4, 2623f
                  beq          s4, a0, 2620f
2612:             mul          ra, s7, a7
                  c.sub        a4, a0
                  c.srai       s0, 19
                  c.srai       a4, 6
                  sltiu        tp, t4, -267
                  slli         a5, a7, 12
2618:             mulhsu       t3, a2, t6
                  c.slli       a1, 5
2620:             c.and        a1, a4
                  bltu         gp, t6, 2639f
                  c.bnez       s0, 2637f
2623:             remu         t0, s4, s1
                  mulh         gp, a1, tp
                  c.nop
                  sltiu        a0, s11, -252
                  srl          t4, s8, ra
                  c.addi4spn   s0, sp, 352
                  c.srli       a1, 23
                  sub          zero, a2, s10
                  mulh         s11, a4, a5
                  or           ra, a7, t6
                  xor          s1, s8, t6
                  sub          s6, s3, t3
                  sll          s1, t5, ra
                  add          s9, a7, a3
2637:             mulhu        t3, s8, t3
                  bltu         tp, t2, 2647f
2639:             mul          sp, a7, s3
                  xori         t0, s0, 628
                  c.lui        t3, 29
                  srai         a1, ra, 10
                  c.sub        a3, s1
                  c.add        s3, s5
                  c.beqz       a2, 2664f
                  c.andi       a2, -1
2647:             mul          s7, s2, s2
                  auipc        zero, 163399
                  c.mv         s11, s9
                  rem          t2, s10, s10
                  and          s0, t3, s7
                  c.li         a0, -1
                  nop
                  c.addi4spn   a1, sp, 960
                  rem          a2, a7, t3
                  c.andi       a0, -1
                  blt          t1, t4, 2677f
                  c.srli       s1, 11
                  srai         a5, a3, 13
                  mul          a2, a7, s6
                  andi         ra, s9, -223
                  remu         s10, a3, s7
                  bne          s8, sp, 2670f
2664:             srai         ra, a6, 12
                  c.sub        s0, a5
                  c.andi       s0, -1
                  slli         a5, s7, 2
                  sub          t5, a7, a7
                  and          tp, a7, sp
2670:             mulhu        s9, s6, s3
                  c.or         a4, a4
                  rem          a6, zero, a2
                  andi         t3, s11, 1505
                  sra          t4, t2, a1
                  c.srai       a2, 11
                  c.mv         a6, a1
2677:             sub          s8, a2, t5
                  bge          gp, t0, 2697f
                  addi         s8, s7, -1616
                  bgeu         s1, s5, 2696f
                  blt          s1, s11, 2682f
2682:             lui          a6, 488687
                  c.andi       a0, -1
                  c.addi4spn   a3, sp, 1008
                  c.andi       a1, 15
                  sra          t1, t1, s1
                  andi         a5, a6, -634
                  c.srai       a5, 22
                  c.beqz       a1, 2705f
                  andi         s8, s7, 1171
                  and          t6, t6, gp
                  remu         a6, s6, t0
                  c.addi4spn   s1, sp, 16
                  srl          t5, gp, s2
                  srli         s9, s4, 11
2696:             c.addi       s0, -1
2697:             mulh         s9, t5, a2
                  sltiu        a2, gp, -57
                  srl          s8, a4, a6
                  ori          t1, s8, -103
                  c.addi4spn   a1, sp, 1008
                  bne          t1, s2, 2713f
                  srai         t4, t2, 17
                  and          s6, s11, s0
2705:             srl          a3, s3, t1
                  c.bnez       a2, 2718f
                  srli         zero, a2, 23
                  srli         ra, zero, 26
                  c.sub        a1, a4
                  c.lui        a0, 16
                  sltiu        a6, t5, 538
                  srli         gp, s4, 20
2713:             c.addi16sp   sp, -16
                  c.slli       s8, 25
                  c.srli       a4, 31
                  c.srai       s0, 3
                  c.and        s1, a0
2718:             mulhsu       s4, a0, s6
                  c.or         a3, a5
                  c.bnez       a4, 2734f
                  mulh         a6, a1, t4
                  rem          a1, tp, a2
                  sltiu        s8, a6, 773
                  c.addi4spn   a0, sp, 704
                  c.add        s7, t0
                  sltu         gp, s5, tp
                  remu         t2, t3, s4
                  andi         t2, tp, 1368
                  bltu         s7, a2, 2747f
                  c.lui        t2, 26
                  slt          t3, a0, s8
                  xor          t1, a5, s0
                  c.and        a4, a4
2734:             sub          tp, a4, ra
                  divu         t5, t0, s9
                  mulhu        s3, a0, s5
                  sra          a5, tp, t2
                  add          t4, s5, t5
                  div          s0, t2, a1
                  srli         gp, a5, 23
                  srl          gp, ra, t1
                  add          s9, a2, t6
                  remu         t2, a2, a7
                  slt          a3, zero, s1
                  or           t5, tp, zero
                  sll          tp, ra, a5
2747:             srl          a3, s0, a7
                  auipc        t1, 736228
                  c.sub        a2, s0
                  c.li         gp, -1
                  slt          t3, a0, s5
                  c.lui        t3, 9
                  mulh         a6, t4, s8
                  ori          s7, s9, 1623
                  bgeu         t1, s1, 2759f
                  c.sub        a3, a1
                  sltu         t6, t4, s9
                  mulhu        s3, s1, s0
2759:             rem          a6, t3, t6
                  rem          ra, ra, zero
                  c.addi4spn   a5, sp, 176
                  divu         a6, s9, s6
                  rem          sp, tp, s7
                  c.srli       a0, 7
                  slt          s9, s8, s4
                  c.slli       tp, 6
                  xori         a1, t3, 493
                  srai         ra, s10, 0
                  mulh         a4, s0, gp
                  slti         zero, a1, 797
                  c.srai       a0, 12
                  and          tp, t1, t5
                  divu         t0, sp, a3
                  c.slli       s4, 2
                  c.and        a0, a1
                  auipc        t4, 986806
                  bne          t5, s3, 2788f
                  slti         t0, s8, -49
                  sll          s11, a7, tp
                  slt          gp, t3, s4
                  c.or         a4, a4
                  nop
                  and          a1, tp, s3
                  sll          s4, a5, s8
                  and          a2, s3, gp
                  nop
                  sub          s1, s5, a3
2788:             srl          t4, t3, a6
                  c.andi       a0, 6
                  bne          ra, t0, 2792f
                  c.slli       a3, 17
2792:             c.bnez       a1, 2801f
                  blt          s9, t6, 2800f
                  bltu         s0, sp, 2814f
                  bgeu         a5, tp, 2797f
                  c.srli       s1, 3
2797:             c.addi4spn   s1, sp, 560
                  ori          sp, a2, 2042
                  c.mv         a1, a0
2800:             andi         a0, gp, 1729
2801:             slli         t6, a5, 12
                  mulh         t4, sp, s1
                  c.addi       a5, 29
                  c.mv         s7, a0
                  srai         s1, s3, 3
                  bne          s11, a1, 2818f
                  c.and        a4, a2
                  add          s3, a3, sp
                  c.bnez       a4, 2815f
                  sra          s8, gp, a2
                  sra          a3, a4, gp
                  beq          s9, t2, 2817f
                  c.srai       s0, 23
2814:             rem          s0, s6, s5
2815:             andi         a5, s5, -779
                  divu         t4, ra, s4
2817:             andi         t1, a0, -1026
2818:             ori          t2, t6, -1487
                  mulhu        ra, a2, t2
                  auipc        sp, 330515
                  c.andi       a5, -1
                  remu         a4, s9, a7
                  slti         t4, ra, 1609
                  c.lui        s7, 20
                  andi         t1, gp, -1483
                  c.mv         s6, t0
                  slli         t5, t0, 5
                  c.add        a6, a4
                  bge          a5, a3, 2847f
                  c.mv         s10, t6
                  srl          s3, t4, tp
                  add          a5, t1, ra
                  bne          a5, t1, 2841f
                  or           t5, a7, a7
                  sll          gp, tp, s2
                  andi         s0, s8, 838
                  xori         s4, ra, 493
                  c.slli       t2, 9
                  rem          s1, t4, ra
                  remu         s4, t1, t6
2841:             and          t2, ra, a5
                  or           tp, s9, a1
                  or           ra, tp, s1
                  c.beqz       a5, 2846f
                  c.xor        a4, a3
2846:             nop
2847:             c.andi       a5, -1
                  c.srai       a5, 18
                  c.slli       s8, 8
                  slli         t3, a3, 31
                  xori         t0, s11, 1944
                  beq          t5, t2, 2870f
                  c.lui        t1, 2
                  add          t3, s4, s8
                  c.add        s9, t2
                  andi         a1, t0, -884
                  div          a3, sp, t1
                  rem          t6, s11, t6
                  slti         sp, t0, 730
                  slt          a1, s8, a1
                  srli         t2, gp, 31
                  sltu         s4, t0, t3
                  slti         tp, s3, 502
                  c.mv         gp, s2
                  and          t5, a7, s6
                  add          s6, sp, t5
                  c.sub        s0, s0
                  srl          s10, s11, s6
                  lui          a2, 761721
2870:             c.srli       s1, 29
                  c.addi4spn   s1, sp, 496
                  divu         s8, s11, s11
                  sltu         tp, s3, ra
                  c.add        a6, a6
                  xor          s3, a1, s0
                  c.sub        a5, a5
                  bne          a3, s1, 2890f
                  c.or         a1, s0
                  srli         a4, t0, 19
                  srli         a1, t4, 2
                  beq          s4, t6, 2883f
                  c.add        tp, t6
2883:             srai         t5, a5, 10
                  andi         ra, t4, 856
                  auipc        t1, 147159
                  c.sub        s1, s0
                  slti         t4, s5, 1245
                  sltiu        ra, s11, -1371
                  c.nop
2890:             c.srai       a0, 13
                  nop
                  xori         zero, a7, 1193
                  sra          t2, a0, t6
                  c.add        t5, s11
                  c.andi       a0, 9
                  xor          t2, a7, s11
                  srl          a1, a5, t2
                  or           gp, s1, t4
                  mulhsu       s11, s11, s9
                  slti         a6, s4, 296
                  mulhu        t4, a5, s6
                  xor          t6, sp, s11
                  sltiu        t3, gp, 1648
                  auipc        a0, 154719
                  sll          t3, s5, a3
                  c.and        a1, a0
                  c.lui        t4, 31
                  c.addi       a1, 24
                  mulhsu       s11, t6, tp
                  bltu         s7, sp, 2925f
                  sltu         t3, a6, s4
                  addi         a6, a1, -1737
                  c.slli       s1, 6
                  slti         a2, s8, -1740
                  sltu         t1, a7, s3
                  or           s7, t4, a2
                  srl          s8, s11, s8
                  lui          a4, 700824
                  xor          a4, ra, a2
                  c.addi       s1, 4
                  mulhsu       s1, ra, sp
                  c.addi       s6, -1
                  c.lui        t5, 8
                  bgeu         s9, s7, 2927f
2925:             slt          a0, s0, a5
                  mulhsu       a1, s10, t3
2927:             bge          zero, t3, 2945f
                  slti         t1, ra, -885
                  slti         a4, t6, -154
                  mul          s0, t0, s7
                  c.bnez       a5, 2932f
2932:             bne          tp, a4, 2936f
                  srli         tp, t5, 3
                  mul          a2, s9, s6
                  c.mv         sp, s5
2936:             c.bnez       a3, 2942f
                  c.bnez       a3, 2939f
                  xor          s7, t0, s8
2939:             c.beqz       a5, 2950f
                  c.nop
                  mulhu        a6, t5, s11
2942:             c.add        a5, t2
                  or           s1, t6, s6
                  c.addi4spn   a5, sp, 880
2945:             c.nop
                  andi         t0, zero, -1677
                  c.nop
                  xor          gp, a7, a1
                  c.li         t1, 3
2950:             rem          t3, a7, t3
                  xor          s3, s6, s11
                  srai         s6, t5, 3
                  c.sub        a2, a2
                  bne          s0, s10, 2956f
                  c.srli       s0, 23
2956:             c.bnez       a1, 2959f
                  auipc        a3, 941888
                  bne          s7, tp, 2967f
2959:             bge          t3, a1, 2979f
                  srli         s4, s11, 10
                  srai         s1, s6, 4
                  c.nop
                  sub          sp, sp, a2
                  c.srai       a5, 19
                  c.slli       t3, 17
                  or           s4, a0, t1
2967:             andi         a6, zero, 577
                  c.addi       s1, 20
                  or           tp, a7, s9
                  c.addi4spn   a1, sp, 240
                  c.srai       a3, 2
                  slli         s1, a2, 26
                  or           t4, gp, t2
                  xor          tp, s11, s1
                  c.addi       t5, 8
                  or           a0, a6, a5
                  beq          a4, t5, 2985f
                  bltu         ra, t1, 2998f
2979:             mulh         a2, a4, s10
                  add          s0, a3, t2
                  and          s10, a6, a6
                  c.mv         s9, a7
                  c.andi       a5, 5
                  mulhu        s6, t6, s8
2985:             mulhsu       ra, a2, a2
                  bltu         s1, s5, 2998f
                  srl          t5, t2, s11
                  sll          t0, a6, a5
                  sub          gp, s11, s6
                  nop
                  c.addi4spn   a4, sp, 320
                  sltiu        t2, a1, -684
                  c.nop
                  slti         s1, s0, 635
                  lui          a6, 409930
                  mulhu        t5, t3, t1
                  c.sub        a5, a0
2998:             srai         a6, sp, 8
                  mulhsu       s11, s5, t1
                  xor          s6, t2, s6
                  slli         a2, tp, 0
                  c.addi4spn   a4, sp, 336
                  c.srai       s0, 26
                  mulh         a3, s6, s6
                  bge          s0, s0, 3021f
                  c.srai       a3, 16
                  c.nop
                  srai         sp, gp, 22
                  srli         t4, t0, 22
                  slli         a2, s1, 11
                  div          a1, s6, s3
                  sra          s11, s9, zero
                  addi         a4, s10, 377
                  c.mv         s3, s1
                  c.or         a4, a3
                  c.addi16sp   sp, -16
                  and          s3, s11, a1
                  slti         s1, tp, -1128
                  nop
                  andi         s7, t0, -677
3021:             c.beqz       s0, 3026f
                  c.srai       a2, 2
                  or           t2, s0, gp
                  mulhsu       s3, s0, t6
                  mul          s3, a7, s11
3026:             c.xor        a4, a5
                  c.beqz       a5, 3046f
                  c.srli       a1, 24
                  bltu         t4, t2, 3042f
                  sra          a3, s11, t3
                  mul          t0, s6, t0
                  lui          gp, 497135
                  slti         t5, a3, 506
                  sub          t5, a7, s9
                  or           s9, gp, a2
                  c.srli       a4, 27
                  slli         t0, s8, 14
                  blt          zero, a7, 3049f
                  c.andi       a3, -1
                  bltu         t2, t2, 3042f
                  c.lui        s7, 4
3042:             c.srli       a4, 19
                  blt          s8, s7, 3062f
                  rem          s4, tp, t1
                  sll          s7, s1, s11
3046:             mulh         s4, a7, s9
                  c.sub        a0, a1
                  or           s10, s5, t0
3049:             bne          a2, s2, 3063f
                  mul          sp, s10, s8
                  slt          a6, a4, s6
                  blt          s11, t4, 3059f
                  c.xor        s1, a5
                  slt          s6, s7, a6
                  c.li         t0, 26
                  and          t6, t3, s9
                  c.slli       a4, 7
                  c.xor        a1, a4
3059:             c.li         s9, -1
                  c.beqz       s0, 3078f
                  ori          s8, a7, 1052
3062:             sll          a0, a0, t3
3063:             c.srli       a2, 24
                  la           s0, amo_0+12 #start riscv_amo_instr_stream_4
                  sra          s9, t3, s11
                  amominu.w.rl  a2, tp, (s0)
                  amomax.w      tp, t3, (s0)
                  or           t3, s8, a4
                  c.sub        a3, a3
                  amoadd.w      sp, t4, (s0)
                  amoor.w       s6, a2, (s0) #end riscv_amo_instr_stream_4
                  bltu         s10, t0, 3071f
                  srai         t3, t4, 27
                  c.sub        a1, a4
                  c.srai       a1, 14
                  sltiu        t6, ra, 1141
                  c.slli       ra, 2
                  or           s9, s9, t5
3071:             ori          s8, a2, -594
                  mulhu        gp, t6, a2
                  mul          s4, ra, a1
                  slli         a5, s1, 12
                  rem          a1, s10, sp
                  c.andi       a2, 28
                  c.srai       s1, 5
3078:             rem          s6, s7, s1
                  c.or         s0, s0
                  c.slli       sp, 29
                  lui          zero, 824879
                  c.addi4spn   a3, sp, 688
                  sra          a4, a2, ra
                  div          ra, s7, a1
                  c.beqz       a0, 3087f
                  div          s7, t4, s7
3087:             div          a3, a2, a0
                  c.srli       a4, 15
                  slt          t6, tp, t2
                  divu         a0, s8, a1
                  bltu         s10, a7, 3100f
                  remu         a3, t1, a0
                  slt          tp, a4, sp
                  c.bnez       a5, 3106f
                  bgeu         a4, gp, 3110f
                  c.bnez       s1, 3112f
                  sub          a2, tp, a1
                  c.addi       s6, -1
                  and          a6, t5, ra
3100:             blt          s6, a0, 3118f
                  bgeu         t5, a4, 3110f
                  andi         s4, ra, -761
                  and          a6, sp, sp
                  mulhsu       a0, zero, t2
                  c.or         s1, a1
3106:             sra          t5, t2, a0
                  div          s9, a3, t2
                  c.xor        a5, s1
                  srli         s4, a6, 2
3110:             c.li         t1, 3
                  srai         a0, s10, 31
3112:             c.mv         tp, s9
                  remu         a3, a6, a1
                  c.li         s6, -1
                  add          t0, s9, sp
                  bge          a3, s2, 3135f
                  mulhu        t0, t4, t5
3118:             c.and        a5, a4
                  xor          a6, s4, s3
                  c.beqz       a4, 3128f
                  c.or         s0, a1
                  c.beqz       a1, 3136f
                  beq          tp, s5, 3134f
                  c.add        sp, ra
                  bge          a1, a5, 3127f
                  or           tp, a1, a4
3127:             bne          a1, a4, 3132f
3128:             xori         a1, s5, 413
                  c.andi       s0, 14
                  nop
                  sltu         a6, a2, s3
3132:             sll          s8, a0, a0
                  ori          t0, t5, 1085
3134:             xor          s8, s5, a0
3135:             c.mv         gp, t4
3136:             c.beqz       a2, 3143f
                  c.slli       t6, 4
                  sub          t6, t1, t6
                  remu         t2, ra, tp
                  c.addi       a2, 25
                  div          t3, s11, a0
                  mulhsu       t5, a1, a0
3143:             addi         a0, tp, -1487
                  c.li         a1, 14
                  c.slli       a4, 14
                  c.addi       a5, 29
                  c.bnez       a1, 3166f
                  c.beqz       a2, 3152f
                  bne          s2, t1, 3158f
                  nop
                  andi         s7, a5, 1927
3152:             slli         tp, s2, 13
                  c.li         s9, -1
                  mulh         s10, a7, s0
                  bgeu         ra, s5, 3171f
                  slti         a2, s8, 1074
                  c.mv         t5, ra
3158:             bne          s10, tp, 3160f
                  xori         s8, a1, 544
3160:             blt          s11, t0, 3167f
                  bltu         s0, s0, 3176f
                  mul          s1, a2, t0
                  sll          t3, sp, a7
                  beq          a6, a1, 3180f
                  c.srli       a1, 9
3166:             bge          s7, s6, 3184f
3167:             c.srli       a3, 31
                  bgeu         t5, a5, 3171f
                  c.bnez       a2, 3171f
                  or           s3, a2, ra
3171:             mulhsu       ra, s6, t2
                  bge          t4, t3, 3173f
3173:             sll          s4, t0, t1
                  c.bnez       a5, 3194f
                  blt          s2, t0, 3193f
3176:             slti         t4, s9, 1779
                  c.sub        a4, s0
                  mulhu        a5, s10, t6
                  mulhu        t0, a5, s3
3180:             sltu         s1, a5, t2
                  sltiu        t2, t6, -353
                  c.or         s1, a5
                  sltiu        t1, ra, 1279
3184:             add          t6, s11, sp
                  slti         t4, a7, -777
                  c.xor        a0, a0
                  c.slli       t0, 4
                  slt          sp, s3, a4
                  c.li         a3, 10
                  c.slli       t1, 15
                  mulh         s9, t5, t4
                  ori          t5, t5, -1749
3193:             mulhu        a6, t1, s3
3194:             c.srli       a5, 12
                  c.slli       t6, 26
                  xori         a1, t1, -384
                  slti         s1, s4, -785
                  c.sub        s0, a5
                  c.addi16sp   sp, -16
                  sltiu        t2, s3, -1647
                  bne          t3, a3, 3207f
                  c.nop
                  blt          a4, s5, 3215f
                  bge          a2, a5, 3224f
                  nop
                  or           s7, a2, t4
3207:             c.mv         a5, s0
                  slli         s6, sp, 16
                  bltu         t4, s4, 3227f
                  slti         t2, t4, 1753
                  nop
                  rem          t1, a7, a6
                  c.xor        a2, s1
                  andi         t6, s10, -1717
3215:             c.mv         s6, s10
                  c.or         a3, a4
                  remu         s3, s10, a0
                  c.or         a4, a4
                  c.nop
                  bgeu         s6, a1, 3232f
                  slt          a0, s5, t4
                  bne          t0, s7, 3233f
                  blt          a7, s3, 3236f
3224:             c.addi4spn   a4, sp, 816
                  slt          s10, a1, zero
                  c.lui        s0, 4
3227:             andi         t4, sp, 1573
                  sub          s6, s11, s8
                  blt          t4, a2, 3231f
                  srl          s6, s4, t3
3231:             auipc        s8, 110160
3232:             c.addi4spn   a3, sp, 800
3233:             mulh         t0, t2, t4
                  nop
                  c.add        t2, a7
3236:             mulh         s11, a2, s4
                  mulhu        a0, s6, s4
                  slti         a0, ra, 219
                  c.or         s0, a3
                  bltu         s2, tp, 3255f
                  c.srli       a5, 6
                  xor          a4, a4, a5
                  rem          sp, t1, gp
                  xori         ra, t6, -2003
                  c.li         t5, 20
                  slli         t0, sp, 16
                  c.and        a5, a5
                  c.xor        s1, a1
                  div          t2, s7, a3
                  mulhu        t2, t2, tp
                  c.nop
                  c.xor        a2, a1
                  remu         a4, s5, tp
                  c.srli       a0, 7
3255:             xori         t3, s11, 186
                  mulhsu       s10, a6, s5
                  and          t2, a7, s10
                  blt          s6, a4, 3260f
                  bge          s0, t6, 3266f
3260:             c.mv         t2, tp
                  divu         a4, s4, s4
                  c.xor        a3, a2
                  and          t6, t0, s1
                  c.slli       s8, 21
                  c.slli       a1, 14
3266:             or           s6, tp, s2
                  c.or         a1, a0
                  c.beqz       a2, 3280f
                  c.and        a0, s0
                  c.srai       a1, 4
                  mulhu        t2, s4, sp
                  c.nop
                  xor          ra, t6, s3
                  divu         t6, a4, s7
                  c.xor        a3, a3
                  sra          s10, ra, a7
                  mulh         t4, s4, t6
                  c.srai       s1, 27
                  c.srai       a0, 6
3280:             srli         zero, a2, 11
                  and          s8, a2, s11
                  c.srli       a1, 29
                  c.srli       s0, 10
                  rem          a3, t3, a0
                  xori         a2, t3, 1927
                  mulhsu       a2, t3, s2
                  bne          a2, a1, 3305f
                  bge          sp, s5, 3304f
                  nop
                  and          zero, s5, s6
                  slli         s9, a2, 12
                  c.or         s1, a3
                  xor          a2, t5, gp
                  c.and        a3, a5
                  beq          a2, t5, 3315f
                  srli         t5, ra, 14
                  nop
                  bne          a6, t2, 3307f
                  sub          s10, tp, t3
                  c.mv         s8, s8
                  lui          s1, 472389
                  beq          a4, s0, 3305f
                  xori         t4, a0, -118
3304:             beq          a6, s6, 3315f
3305:             c.lui        s1, 27
                  slt          gp, s6, sp
3307:             srli         a5, t6, 18
                  c.nop
                  c.bnez       a0, 3318f
                  rem          a2, zero, a4
                  srai         s0, a5, 29
                  xor          t0, s1, s3
                  addi         zero, s4, 898
                  rem          gp, s2, a3
3315:             c.or         a1, s0
                  srli         s9, a0, 20
                  c.sub        a2, a3
3318:             beq          s9, a4, 3337f
                  mulh         s7, s6, s4
                  c.lui        s7, 2
                  addi         tp, tp, -1634
                  bgeu         ra, s4, 3324f
                  c.lui        s7, 18
3324:             addi         t5, s8, -1199
                  c.beqz       s0, 3333f
                  c.andi       a1, -1
                  bne          s2, tp, 3333f
                  sltiu        t5, gp, 1190
                  blt          sp, s11, 3331f
                  ori          a0, tp, -552
3331:             c.li         s3, 10
                  c.srli       s1, 15
3333:             c.srai       s0, 21
                  c.beqz       a1, 3338f
                  c.addi       s1, -1
                  bge          s5, a1, 3354f
3337:             sltiu        s11, t1, -373
3338:             slti         zero, s4, -1346
                  rem          a5, s10, t3
                  andi         a3, s5, -16
                  sra          s10, zero, t0
                  mulhsu       a1, s9, tp
                  sra          t6, a0, s5
                  bltu         a1, a1, 3349f
                  c.sub        a0, s1
                  c.addi       s4, 24
                  add          a4, t5, s3
                  c.sub        a4, a1
3349:             c.xor        a5, a2
                  c.addi4spn   a1, sp, 624
                  mul          sp, ra, t3
                  add          tp, a1, t1
                  sll          s10, s10, a6
3354:             c.beqz       a1, 3373f
                  c.mv         ra, s1
                  mul          tp, s10, t0
                  or           ra, a6, sp
                  mulh         ra, zero, sp
                  c.addi4spn   a3, sp, 96
                  slti         t4, t2, 227
                  bne          a0, s10, 3372f
                  and          s7, s4, s7
                  c.sub        a0, a2
                  addi         a6, t6, -1437
                  slti         a6, s0, -1548
                  slti         a6, a6, -881
                  c.sub        a5, a3
                  divu         s4, gp, s1
                  rem          t3, s7, a7
                  divu         t5, a5, s5
                  c.bnez       a4, 3373f
3372:             bne          tp, t0, 3386f
3373:             addi         t6, s3, 210
                  slt          t3, t6, a5
                  or           sp, t2, s11
                  slt          s11, s9, s3
                  c.and        a3, a5
                  rem          tp, s9, a6
                  c.addi16sp   sp, -16
                  mul          s1, s4, s3
                  sub          s1, s2, a2
                  sub          ra, a4, s11
                  c.or         a3, a5
                  mulhsu       s1, a6, a7
                  c.bnez       a0, 3392f
3386:             addi         a1, tp, -1375
                  c.addi16sp   sp, -16
                  bge          a0, ra, 3406f
                  sltiu        s4, s2, 14
                  addi         a2, ra, -205
                  c.li         t4, 1
3392:             addi         s11, tp, -79
                  srai         a5, a4, 28
                  c.beqz       a5, 3410f
                  c.srli       a3, 24
                  la           s3, region_1+359 #start riscv_load_store_rand_instr_stream_21
                  c.srai       s0, 22
                  c.li         s1, 28
                  lbu          s10, 83(s3)
                  sra          s0, t0, a1
                  lbu          t4, -104(s3)
                  lb           t3, 90(s3)
                  lbu          a5, -152(s3)
                  srl          a6, zero, tp
                  divu         a3, s9, t3
                  lbu          a0, 233(s3)
                  lb           t5, 198(s3)
                  c.addi4spn   a1, sp, 832
                  mulhsu       s1, a2, s9
                  lhu          a1, -145(s3)
                  sltu         t1, gp, a5
                  sb           a7, 235(s3)
                  c.srli       a0, 28
                  srli         a4, t5, 5
                  c.xor        a5, a2
                  sra          ra, t2, t1
                  lbu          sp, 248(s3)
                  mulhu        t1, s11, t4
                  c.srai       a4, 17
                  xori         t6, a2, 833
                  lb           t6, 112(s3)
                  c.xor        s0, a1
                  xor          s6, s2, a1
                  lb           s1, -202(s3)
                  sb           s1, -18(s3)
                  xori         s1, ra, 674
                  divu         a4, s7, a7
                  mulhsu       s10, s3, s3
                  lh           t5, 111(s3)
                  sra          ra, a2, s10
                  c.slli       s0, 26
                  lb           t4, -215(s3)
                  sll          s6, t1, s9
                  c.or         a3, s0
                  lhu          a0, 81(s3)
                  sh           s1, -55(s3)
                  sltiu        t3, t4, -1814
                  lhu          a1, 209(s3)
                  divu         s10, t2, t4
                  lb           a1, 212(s3)
                  c.xor        a5, a5
                  xori         a1, s3, -1763
                  sh           t4, -69(s3) #end riscv_load_store_rand_instr_stream_21
                  c.addi16sp   sp, 368
                  addi         sp, zero, 1224
                  mulh         t3, tp, s2
                  c.bnez       a4, 3419f
                  c.lui        s10, 20
                  mulhu        t2, a5, s0
                  sub          t4, t3, zero
                  slli         a0, s0, 24
                  bltu         s4, ra, 3416f
                  sub          t2, a0, s1
3406:             beq          t4, a3, 3419f
                  c.add        s10, t5
                  c.slli       s11, 26
                  slt          a4, t5, a0
3410:             divu         a0, s9, a0
                  bne          a2, a4, 3412f
3412:             blt          t3, s6, 3414f
                  blt          s11, sp, 3425f
3414:             xor          t3, sp, s6
                  ori          a1, t4, -1773
3416:             xor          t0, t0, s1
                  add          a5, a0, s7
                  c.lui        s4, 6
3419:             rem          a4, t2, t3
                  bne          s9, tp, 3426f
                  c.slli       s8, 16
                  xor          s11, s0, s11
                  c.addi16sp   sp, 384
                  and          s0, t3, a2
3425:             slli         s11, t3, 8
3426:             bltu         a5, s2, 3431f
                  auipc        tp, 924956
                  mul          s1, tp, a3
                  auipc        t4, 301871
                  bge          t0, sp, 3448f
3431:             sll          s7, a3, s0
                  mulhu        s11, s10, a1
                  srai         a6, s4, 20
                  c.bnez       s1, 3452f
                  blt          a7, a3, 3437f
                  srli         a3, t3, 7
3437:             and          s8, s1, a2
                  sra          s1, a2, t3
                  div          s6, t1, s9
                  add          a2, t0, s6
                  addi         s7, a5, 633
                  sll          t1, s6, s10
                  c.slli       a3, 20
                  slt          t6, t1, a1
                  sra          a1, t1, t4
                  c.sub        s0, a4
                  xori         s1, t4, -188
3448:             add          t6, t5, t3
                  c.sub        a5, a5
                  c.addi4spn   a3, sp, 80
                  auipc        t4, 514821
3452:             c.nop
                  bltu         s6, s4, 3455f
                  c.srli       s0, 31
3455:             c.addi16sp   sp, 272
                  ori          s3, s2, -1689
                  c.slli       t2, 2
                  c.nop
                  beq          t2, a5, 3463f
                  slti         t1, a3, 1462
                  bne          t3, zero, 3468f
                  xori         s7, a0, -1752
3463:             srli         s8, t0, 20
                  xor          s11, s4, gp
                  slli         t6, t6, 20
                  mul          t5, zero, s3
                  c.nop
3468:             lui          t0, 203667
                  srai         t4, zero, 0
                  remu         s0, a4, s0
                  ori          s8, t2, 351
                  sll          t2, a3, a1
                  blt          t2, s7, 3492f
                  c.addi4spn   s0, sp, 864
                  bne          s7, t0, 3483f
                  auipc        t0, 353573
                  beq          t3, zero, 3480f
                  rem          a2, t1, a2
                  bgeu         s6, s4, 3499f
3480:             sll          zero, a0, t2
                  blt          s6, t6, 3483f
                  bltu         a5, ra, 3496f
3483:             bltu         zero, s10, 3496f
                  add          s8, a2, gp
                  slli         t5, s1, 27
                  sltiu        a6, s2, 1349
                  lui          zero, 516947
                  bgeu         sp, t3, 3506f
                  lui          s7, 1042737
                  c.li         s8, -1
                  srai         gp, sp, 21
3492:             srli         t6, a6, 30
                  c.mv         s1, s8
                  srl          tp, s4, t1
                  c.srli       s1, 19
3496:             or           a4, sp, s4
                  c.li         gp, 7
                  xor          a5, t4, zero
3499:             c.add        sp, s2
                  sltiu        s7, t4, -258
                  lui          a2, 99395
                  c.sub        a3, a5
                  sra          zero, a5, zero
                  rem          s8, s5, s9
                  mulhu        t0, a3, s3
3506:             andi         s1, a3, 1262
                  lui          t3, 314504
                  xori         s8, s2, 163
                  add          s4, s6, a0
                  blt          a5, s6, 3529f
                  sltu         s4, s5, s0
                  c.beqz       a5, 3513f
3513:             and          s0, t1, a1
                  slti         s8, s1, -1489
                  mulhu        zero, a2, sp
                  c.addi16sp   sp, 128
                  srl          tp, a1, t0
                  remu         a4, s4, t5
                  nop
                  auipc        gp, 65990
                  c.andi       s0, 25
                  sltu         gp, a7, a1
                  xori         t1, a7, 1949
                  rem          s11, s1, a1
                  c.or         a3, a2
                  div          s7, s10, s1
                  mul          s1, t3, t3
                  c.beqz       a3, 3544f
3529:             c.and        a1, a3
                  divu         s1, a6, s0
                  mulhu        zero, s0, t2
                  xori         zero, s0, 1761
                  slli         sp, ra, 7
                  c.andi       a0, 10
                  slti         s0, t1, -704
                  mulh         a2, t1, t4
                  slti         s6, t3, -1035
                  bge          a7, a5, 3553f
                  lui          gp, 418662
                  mulh         s7, a1, a1
                  xori         s7, s6, -780
                  addi         s3, s3, 1478
                  sltiu        t5, s10, -362
3544:             sub          s9, s0, t3
                  xori         tp, s7, 527
                  c.mv         gp, s7
                  c.srli       s0, 20
                  c.add        s7, ra
                  bne          a6, s10, 3565f
                  blt          t6, zero, 3561f
                  nop
                  lui          a1, 856042
3553:             ori          s8, t4, -904
                  c.mv         t4, s2
                  sltiu        a2, sp, -1615
                  c.bnez       a3, 3568f
                  c.xor        a1, a1
                  c.bnez       a3, 3565f
                  c.srai       a3, 20
                  div          t2, t1, s6
3561:             bne          t2, s3, 3572f
                  rem          a3, t5, s8
                  c.li         a0, 31
                  slti         a0, ra, 1279
3565:             or           s3, a1, a5
                  c.mv         s6, s8
                  nop
3568:             blt          ra, s6, 3577f
                  slli         s9, sp, 12
                  div          a3, a2, s10
                  c.lui        t3, 9
3572:             c.addi       t0, -1
                  mul          a4, s3, zero
                  mul          a3, s10, zero
                  c.lui        a4, 21
                  sub          ra, t2, s0
3577:             rem          t2, a4, zero
                  c.addi16sp   sp, -16
                  mulhsu       s7, t6, s5
                  and          t4, a4, sp
                  xori         sp, t6, -1637
                  srai         s3, s0, 6
                  c.nop
                  c.add        a1, a5
                  bne          a2, a7, 3594f
                  or           s1, s2, a6
                  c.or         a3, a2
                  c.or         a4, s0
                  andi         s6, t2, 95
                  sra          s9, s9, t6
                  bltu         a2, s5, 3611f
                  c.nop
                  c.addi       t0, 7
3594:             bltu         s8, s4, 3599f
                  auipc        s7, 957095
                  c.add        s7, a6
                  sltu         s3, s8, a0
                  c.sub        s1, s0
3599:             bgeu         a2, a7, 3601f
                  bltu         t0, s7, 3620f
3601:             c.nop
                  c.srai       a2, 24
                  lui          s11, 840912
                  c.srai       a3, 8
                  sll          a6, s9, gp
                  bne          t5, sp, 3613f
                  mul          a4, t4, a1
                  c.mv         s11, a6
                  xori         ra, sp, -192
                  auipc        s11, 610594
3611:             auipc        s4, 551299
                  bne          s0, t5, 3621f
3613:             and          s0, t2, a7
                  c.addi16sp   sp, -16
                  slli         t6, gp, 23
                  and          s11, a7, a0
                  andi         a4, t0, 536
                  c.xor        a1, s1
                  ori          a1, sp, -1295
3620:             sltu         a3, a4, t4
3621:             srl          a4, ra, a5
                  bgeu         t0, s5, 3637f
                  c.add        gp, t0
                  xor          s3, t2, t1
                  c.sub        s0, a5
                  c.lui        gp, 2
                  c.beqz       a2, 3629f
                  c.addi16sp   sp, -16
3629:             c.addi4spn   a2, sp, 688
                  remu         sp, ra, t0
                  c.or         a0, a2
                  sltiu        t3, t1, 1951
                  sll          a0, a3, t6
                  mul          ra, s2, a5
                  mulh         a2, s4, s6
                  auipc        s7, 591892
3637:             c.and        a5, a2
                  c.or         a4, a3
                  mul          s4, a5, tp
                  sra          s11, s5, a1
                  rem          sp, t6, t6
                  addi         a1, s10, 684
                  divu         t6, s0, s1
                  ori          t5, s1, 1999
                  addi         a5, a6, -710
                  auipc        a5, 301018
                  srli         tp, a0, 9
                  add          a5, gp, t2
                  bne          s8, a2, 3651f
                  mulh         s6, s11, t1
3651:             srl          t5, s1, a0
                  or           a5, t5, sp
                  rem          a5, s3, ra
                  and          t1, t1, sp
                  c.and        a2, a3
                  xor          s11, t5, a2
                  c.mv         s3, s6
                  blt          a1, a6, 3666f
                  bgeu         t6, t3, 3677f
                  lui          a5, 788746
                  or           zero, a2, t5
                  c.add        t6, a3
                  mulh         s6, s2, t1
                  remu         t3, s3, a4
                  sltiu        s4, sp, -413
3666:             slli         ra, a0, 14
                  sltiu        a0, s9, 965
                  c.and        a2, a2
                  c.lui        a2, 20
                  andi         a5, zero, -592
                  sltiu        s10, s3, 402
                  or           s0, a7, gp
                  bltu         a1, t6, 3684f
                  rem          a4, s9, s8
                  srl          s3, tp, zero
                  srai         t3, a0, 5
3677:             c.addi       s8, -1
                  slli         s4, a6, 0
                  c.li         a3, -1
                  sltu         a6, s2, s8
                  or           tp, a6, ra
                  divu         a5, a0, t2
                  c.add        sp, a1
3684:             nop
                  bne          s9, t3, 3701f
                  c.andi       a1, -1
                  c.srai       a0, 22
                  andi         t2, s2, 849
                  srli         t1, a1, 10
                  rem          tp, t2, sp
                  div          s6, s2, tp
                  bgeu         t4, t4, 3701f
                  xori         s7, a2, -375
                  bne          gp, t5, 3698f
                  lui          a5, 592789
                  and          t5, a0, t5
                  nop
3698:             div          a5, zero, s0
                  c.or         a0, s1
                  c.beqz       a5, 3718f
3701:             bne          s1, a6, 3717f
                  la           t5, region_1+334 #start load_store_instr_stream_1
                  la           a6, region_1+1155 #start load_store_instr_stream_2
                  lb           a3, -169(t5)
                  lbu          t0, 345(a6)
                  la           s8, region_1+1198 #start load_store_instr_stream_0
                  sh           a1, -10(t5)
                  lb           s7, 107(s8)
                  sw           s11, -943(a6)
                  lbu          a0, -126(s8)
                  sb           s3, 123(t5)
                  sw           s4, 605(a6)
                  lh           zero, 789(a6)
                  sb           s8, -980(a6)
                  lh           tp, 40(s8)
                  lb           s4, -49(a6)
                  lw           a4, -222(s8)
                  sw           a3, 37(a6)
                  lbu          s3, 115(t5)
                  sh           a6, -1109(a6)
                  lbu          s4, -13(t5) #end load_store_instr_stream_1
                  sh           gp, 711(a6) #end load_store_instr_stream_2
                  sh           s6, 4(s8)
                  lbu          s0, -61(s8) #end load_store_instr_stream_0
                  xori         s7, a6, 85
                  c.li         s7, 19
                  bltu         t2, s9, 3707f
                  c.li         a5, -1
                  or           s11, s6, s4
3707:             slti         ra, s2, -308
                  auipc        s10, 595244
                  xori         tp, a2, -310
                  divu         a6, s4, tp
                  slt          gp, t0, s10
                  c.sub        a4, s1
                  la           sp, region_0+520 #start riscv_hazard_instr_stream_9
                  or           t2, s0, t2
                  add          t6, s4, s11
                  add          s0, s4, t6
                  slt          s4, s0, s0
                  slt          s0, zero, t6
                  c.lui        s4, 2
                  c.add        s4, t2
                  srli         s11, t6, 22
                  lbu          t2, 5(sp)
                  lbu          s11, 11(sp)
                  lhu          zero, 14(sp)
                  add          s0, s4, t6
                  sb           t6, 13(sp)
                  c.srli       s0, 20
                  c.li         s11, -1
                  srai         s4, s0, 1
                  add          zero, zero, s0
                  sltu         zero, zero, s4
                  c.swsp       s0, 4(sp)
                  lw           t2, -8(sp)
                  rem          s0, t2, t2
                  c.and        s0, s0
                  lbu          s11, -9(sp)
                  lb           s11, 1(sp)
                  addi         s11, s11, 1032
                  lb           s11, 11(sp)
                  c.xor        s0, s0
                  xor          s11, s4, s4
                  ori          s11, s0, -1465
                  c.add        s4, s11
                  c.sub        s0, s0
                  c.lui        s4, 16
                  lbu          s0, 13(sp)
                  sb           zero, 7(sp) #end riscv_hazard_instr_stream_9
                  c.addi16sp   sp, 256
                  remu         s11, sp, t4
                  rem          a4, a5, s11
                  c.or         a2, a1
3717:             c.add        t5, t2
3718:             c.slli       a3, 19
                  sll          a0, a2, a2
                  xor          s6, sp, s9
                  c.li         a6, -1
                  beq          a1, sp, 3723f
3723:             bge          s9, t2, 3730f
                  divu         a4, s9, s10
                  beq          s1, a1, 3727f
                  c.sub        a4, a1
3727:             bgeu         a7, s2, 3746f
                  sub          t6, tp, t1
                  c.addi16sp   sp, -16
3730:             slli         a3, sp, 26
                  srl          s0, t3, s3
                  sll          a6, a7, a3
                  c.slli       t0, 21
                  mulhsu       a5, t6, a2
                  srai         a2, a4, 20
                  c.nop
                  blt          gp, a0, 3750f
                  add          a6, a7, s2
                  and          t1, t3, gp
                  mulhu        t6, a4, a1
                  mulhsu       s6, t0, a1
                  mul          ra, s8, sp
                  c.addi       a1, 11
                  xori         sp, t6, 9
                  c.bnez       a0, 3756f
3746:             c.li         t1, 7
                  c.li         gp, -1
                  slli         t1, sp, 0
                  c.addi       a0, 15
3750:             sub          a3, s6, a2
                  andi         s9, s8, 1260
                  xor          s0, s8, t6
                  bgeu         sp, a2, 3765f
                  slti         t3, s6, 222
                  sra          s8, s5, t3
3756:             c.beqz       s0, 3768f
                  mul          a2, a0, ra
                  add          sp, s4, s8
                  c.xor        a1, a2
                  bgeu         s10, s1, 3779f
                  c.lui        s7, 6
                  addi         t0, s4, 1781
                  mulhu        s0, s5, a0
                  c.addi       a1, 18
3765:             xori         s9, s8, 402
                  c.sub        s0, a3
                  rem          tp, ra, tp
3768:             sltu         s7, s9, s7
                  c.add        t0, s7
                  bne          gp, tp, 3790f
                  c.xor        a5, a3
                  slli         t5, s8, 0
                  c.or         a0, a4
                  c.bnez       a4, 3788f
                  c.srai       a1, 31
                  srli         s1, a0, 30
                  sll          t3, s6, t1
                  addi         s6, a0, -1840
3779:             sltiu        t2, t1, -1270
                  xori         t5, s0, -1300
                  bne          tp, zero, 3787f
                  remu         zero, a7, tp
                  bge          s4, s5, 3801f
                  ori          s4, s7, -1281
                  c.slli       t5, 13
                  sltu         t6, a0, a0
3787:             bne          s9, s2, 3796f
3788:             sltu         a1, a6, t2
                  c.bnez       s1, 3793f
3790:             mulh         a0, gp, a3
                  add          t4, s5, zero
                  bltu         gp, s0, 3808f
3793:             c.srai       s1, 1
                  slli         s8, tp, 1
                  c.andi       s1, 7
3796:             mulhu        s11, s4, a2
                  sltiu        a5, zero, 1738
                  sll          sp, a0, a6
                  c.add        s7, gp
                  bgeu         a3, ra, 3814f
3801:             c.and        a1, s1
                  c.sub        s1, s0
                  slti         s6, tp, 503
                  slti         a5, a2, 886
                  mulhu        sp, s4, s0
                  auipc        t0, 814389
                  c.and        a4, a3
3808:             mulhu        s1, s10, zero
                  lui          s1, 910822
                  srli         a0, t4, 20
                  slt          ra, s5, t0
                  or           a1, s6, s7
                  add          t0, s2, gp
3814:             xor          s0, s2, sp
                  sub          ra, t4, a5
                  bgeu         a6, s0, 3831f
                  bgeu         s0, t1, 3835f
                  rem          a0, a0, s4
                  rem          tp, tp, s6
                  c.li         s6, -1
                  c.beqz       a3, 3841f
                  div          ra, s1, tp
                  c.slli       a2, 15
                  c.nop
                  c.lui        a4, 19
                  c.or         a2, s1
                  c.add        s4, t4
                  rem          t1, tp, s0
                  c.mv         a4, s11
                  c.li         t5, 26
3831:             mulh         t1, s9, t2
                  or           t2, s7, t1
                  c.srai       a4, 25
                  sltiu        t1, t6, 595
3835:             c.srai       a5, 24
                  c.srai       a1, 14
                  lui          t0, 1044086
                  c.xor        a2, a5
                  sub          t4, s1, s3
                  c.and        a1, a5
3841:             c.srai       a5, 2
                  remu         s11, s6, a4
                  c.addi16sp   sp, 64
                  srl          t5, t4, t2
                  xor          a5, a3, zero
                  c.beqz       a1, 3859f
                  add          tp, t5, s6
                  c.add        sp, a2
                  auipc        a3, 113132
                  c.addi16sp   sp, 80
                  srli         s4, t0, 25
                  c.add        s4, t4
                  srl          sp, a1, s8
                  c.addi4spn   a5, sp, 880
                  lui          ra, 668984
                  c.sub        a5, a3
                  divu         s8, s2, a3
                  c.beqz       a4, 3860f
3859:             srl          a5, sp, a4
3860:             c.mv         t1, s0
                  andi         a4, s2, -411
                  auipc        a5, 237169
                  c.and        a3, a3
                  xori         gp, s11, 1949
                  c.li         s10, -1
                  c.sub        s1, a1
                  bgeu         a2, a4, 3868f
3868:             sra          s10, a6, s6
                  c.addi       a5, 13
                  c.add        s10, a4
                  c.addi4spn   s0, sp, 864
                  add          a0, s4, t6
                  sub          a2, t4, zero
                  divu         t6, zero, s3
                  c.or         s1, a2
                  lui          t5, 315357
                  sltiu        s8, s5, 1856
                  sra          s1, s3, ra
                  c.li         t3, -1
                  c.and        a5, a3
                  c.lui        s6, 9
                  slt          t2, a5, a0
                  c.sub        a4, a3
                  addi         s3, s1, 1614
                  c.add        a4, a5
                  sra          a1, a1, zero
                  c.and        a4, a3
                  mul          sp, t6, t6
                  div          s4, s11, s0
                  add          t6, t4, s2
                  nop
                  rem          s3, a2, t3
                  mul          t2, s9, t3
                  divu         s8, s9, gp
                  c.and        a2, s1
                  c.bnez       a1, 3912f
                  c.lui        a4, 24
                  c.bnez       a1, 3910f
                  nop
                  remu         zero, t0, s7
                  xor          t1, s11, a7
                  div          tp, s7, s3
                  c.nop
                  c.or         a0, s1
                  c.or         s0, s0
                  c.addi       t3, -1
                  div          s1, ra, t2
                  xori         s9, tp, 1236
                  c.andi       a1, -1
3910:             c.xor        s0, a1
                  slli         t2, s2, 14
3912:             auipc        s4, 838274
                  c.li         s10, -1
                  c.xor        a1, a4
                  div          sp, sp, s9
                  sub          s6, zero, s0
                  slli         s6, tp, 10
                  c.sub        a5, a1
                  bltu         s2, t3, 3927f
                  c.srli       a0, 7
                  c.mv         tp, t6
                  bgeu         t5, s4, 3933f
                  c.xor        a0, a5
                  divu         t5, a4, a1
                  c.add        t2, t4
                  slti         t1, t2, 339
3927:             c.mv         a5, s9
                  bne          gp, sp, 3947f
                  xori         t3, s1, -1456
                  c.add        a5, sp
                  c.srai       a3, 6
                  ori          t1, t4, -1502
3933:             bltu         s8, s2, 3935f
                  or           a5, t4, t6
3935:             beq          s4, a3, 3937f
                  c.bnez       a4, 3939f
3937:             c.addi       t6, 27
                  c.li         s8, 2
3939:             c.addi4spn   a5, sp, 96
                  auipc        a6, 155252
                  andi         t6, a7, -53
                  c.beqz       a1, 3962f
                  nop
                  mulhsu       ra, a7, a1
                  c.andi       a3, 18
                  c.addi16sp   sp, 320
3947:             c.add        s10, a0
                  c.nop
                  srai         t4, tp, 3
                  la           t0, region_0+1657 #start load_store_instr_stream_1
                  sb           tp, -87(t0)
                  lw           s11, 87(t0)
                  la           a2, region_0+1247 #start load_store_instr_stream_0
                  sb           a1, -92(t0)
                  lbu          t3, -32(a2)
                  sb           s3, -10(t0)
                  sb           s3, -134(t0)
                  lh           a6, 61(a2)
                  lhu          s6, 183(t0)
                  sb           s1, -27(a2)
                  sb           s7, 50(a2)
                  lb           a0, -228(t0)
                  lb           gp, -36(a2)
                  lbu          a4, 238(t0)
                  sh           a0, -41(a2)
                  lb           s6, 43(a2)
                  lh           sp, -61(a2)
                  sb           s0, 240(t0)
                  sb           s3, -79(t0) #end load_store_instr_stream_1
                  lhu          s9, 5(a2) #end load_store_instr_stream_0
                  c.addi4spn   s0, sp, 128
                  nop
                  remu         s4, t2, t3
                  c.srli       a4, 11
                  c.add        a4, s10
                  c.addi4spn   s1, sp, 32
                  remu         zero, zero, s1
                  c.slli       s10, 30
                  xori         t6, t2, 214
                  c.srai       a0, 15
                  bltu         s10, a5, 3978f
                  sltiu        a3, a5, -558
3962:             xor          a2, a3, s11
                  c.bnez       a4, 3982f
                  xori         s8, s3, -521
                  c.add        t2, t5
                  bgeu         a6, s6, 3975f
                  c.addi       ra, -1
                  divu         s1, s3, a5
                  beq          ra, a2, 3976f
                  srli         t0, s11, 2
                  rem          t5, a4, tp
                  c.li         a3, -1
                  add          t1, s5, t2
                  c.xor        a4, a5
3975:             slt          t1, a6, s4
3976:             andi         t4, a2, 51
                  ori          s9, t5, -361
3978:             xori         a2, a5, -689
                  slt          s8, a4, s3
                  remu         a6, s10, s1
                  srli         a1, s3, 18
3982:             slli         s6, a1, 31
                  mulh         a6, tp, zero
                  srli         tp, s0, 28
                  c.andi       s1, 1
                  srai         s11, t1, 28
                  sltu         s7, t0, a5
                  srli         t6, a1, 19
                  c.xor        a5, a2
                  c.bnez       a1, 4001f
                  srl          a6, s5, t1
                  xori         tp, a1, -1846
                  c.andi       a2, 13
                  c.add        a3, a6
                  c.beqz       a3, 4007f
                  c.slli       a4, 16
                  srai         s10, t5, 5
                  slt          gp, a4, s5
                  slti         tp, s1, 839
                  c.andi       a4, 18
4001:             c.li         a6, 6
                  srli         s10, gp, 18
                  c.lui        a6, 1
                  srai         s4, s7, 26
                  c.li         s10, -1
                  slt          t2, gp, s10
4007:             add          t3, a7, s2
                  sltiu        t1, a6, 2023
                  mulhu        s0, sp, t4
                  c.sub        a4, a4
                  slli         a4, a6, 2
                  rem          t4, a2, zero
                  mulh         t0, s9, t1
                  bne          a0, sp, 4021f
                  sltu         s8, s7, sp
                  slli         a5, a4, 12
                  mulh         a5, s4, t2
                  addi         a6, ra, 2009
                  ori          gp, t4, 2045
                  sll          s11, t6, a2
4021:             c.srli       s0, 25
                  srai         s7, t4, 7
                  sltu         a2, ra, t0
                  c.add        ra, t0
                  slli         s8, tp, 9
                  slt          ra, tp, s8
                  c.srai       a0, 27
                  c.li         t2, 17
                  c.addi4spn   a4, sp, 1008
                  mulhu        s7, a0, t2
                  sltiu        s6, s5, -2015
                  c.and        s1, a4
                  ori          t3, s8, 1961
                  c.li         s8, 26
                  and          s7, a6, a1
                  c.and        a5, s1
                  srl          t6, a6, gp
                  srli         s7, s3, 20
                  srai         s9, tp, 19
                  c.xor        a3, s0
                  sll          a5, a1, sp
                  mulhsu       a1, t1, s8
                  c.mv         gp, s8
                  c.sub        s1, a5
                  beq          s10, a6, 4047f
                  srli         s11, ra, 8
4047:             addi         a2, t1, 1187
                  c.xor        a2, a0
                  c.nop
                  auipc        a2, 718862
                  c.and        a3, a2
                  c.addi4spn   a5, sp, 80
                  c.srai       s1, 2
                  c.slli       t5, 18
                  c.addi4spn   a5, sp, 976
                  sra          t5, a0, t4
                  sub          t1, a7, zero
                  bne          tp, t0, 4076f
                  c.andi       a1, 23
                  c.bnez       a0, 4066f
                  andi         a4, sp, -189
                  bge          s3, t4, 4067f
                  c.li         t2, 1
                  c.and        a5, s1
                  bge          s11, s9, 4080f
4066:             ori          t0, a3, 306
4067:             remu         a6, s10, s9
                  sltu         a2, a4, s6
                  c.srli       a5, 5
                  mul          sp, s4, s10
                  mulhsu       sp, s9, s0
                  ori          s9, a2, 1307
                  add          a2, s4, s1
                  mul          sp, zero, s8
                  c.addi       a6, 19
4076:             andi         t6, a4, 1292
                  nop
                  c.addi4spn   a4, sp, 832
                  or           t3, t0, ra
4080:             sll          t6, ra, t5
                  slli         a0, s4, 24
                  remu         a2, a6, s0
                  srli         t0, t2, 27
                  mulhu        a6, s3, s5
                  xori         s8, s4, -1461
                  sltiu        a1, a3, -79
                  slti         a6, t4, -774
                  mulh         a4, a6, a3
                  slli         zero, ra, 23
                  sll          s8, s5, s6
                  or           gp, s1, t0
                  c.li         a2, -1
                  c.andi       a1, 28
                  sll          t6, ra, gp
                  c.addi       t5, 2
                  c.sub        a4, a1
                  remu         a0, t5, s10
                  c.mv         s1, a1
                  c.andi       a1, -1
                  c.addi       tp, -1
                  add          s1, s1, a5
                  blt          s0, a5, 4110f
                  bne          s4, sp, 4105f
                  srai         s4, t1, 0
4105:             bge          t4, s0, 4114f
                  sra          a4, s9, s6
                  c.li         s9, 29
                  c.beqz       a2, 4110f
                  andi         t3, s4, -533
4110:             nop
                  mulhu        t1, s4, s3
                  sra          t4, t0, t4
                  sra          a2, a2, t1
4114:             c.bnez       a2, 4127f
                  mulh         a6, a2, s9
                  ori          gp, t3, 629
                  ori          a6, t6, -1173
                  or           s4, ra, tp
                  c.srli       a4, 22
                  srli         t5, a5, 0
                  c.lui        s6, 28
                  c.or         a1, a2
                  sltu         t6, s6, t3
                  slli         gp, sp, 23
                  div          a6, t1, a1
                  nop
4127:             sra          a3, t3, s7
                  c.mv         s4, a6
                  c.xor        a0, a4
                  mul          s7, t5, a7
                  divu         t5, sp, a6
                  srl          ra, s0, t0
                  rem          s1, s6, sp
                  c.addi4spn   a4, sp, 448
                  c.beqz       a5, 4149f
                  slli         t3, t1, 25
                  slt          t2, s3, a5
                  c.sub        a5, a2
                  xor          a3, s4, t2
                  div          zero, t0, tp
                  c.li         a1, -1
                  c.addi       a0, -1
                  mulhsu       a2, s4, t3
                  c.nop
                  and          s8, a3, tp
                  beq          ra, s11, 4150f
                  and          a3, s9, s8
                  c.addi16sp   sp, 16
4149:             c.srai       a0, 2
4150:             bgeu         t5, t3, 4157f
                  c.mv         a1, ra
                  slli         a4, a4, 4
                  c.addi4spn   a1, sp, 1008
                  c.srli       a4, 13
                  sltu         t6, gp, gp
                  beq          gp, a7, 4175f
4157:             c.addi4spn   a5, sp, 448
                  c.beqz       a3, 4178f
                  sltu         ra, t1, s2
                  c.sub        s1, s0
                  add          a5, s3, a5
                  c.sub        a2, a1
                  slli         a1, a2, 9
                  divu         a4, a4, gp
                  bne          s10, s11, 4176f
                  slti         t2, tp, -900
                  c.or         a5, s0
                  c.lui        s1, 17
                  slt          s3, s4, sp
                  srli         t0, t1, 19
                  xor          a2, gp, a2
                  div          a1, t3, a7
                  c.srai       a0, 9
                  mul          sp, t0, s2
4175:             c.srli       a2, 26
4176:             srl          t0, a2, s9
                  slti         gp, s2, -1717
4178:             mulhsu       s7, tp, gp
                  and          t0, t0, s7
                  and          zero, sp, t4
                  c.nop
                  rem          s10, t3, t0
                  mulh         s4, t1, a1
                  slti         s9, s8, -1877
                  c.srli       a4, 21
                  c.bnez       a5, 4198f
                  c.or         a3, a1
                  remu         gp, a5, s6
                  remu         a4, s4, gp
                  c.addi16sp   sp, 240
                  c.mv         ra, s11
                  xor          gp, s2, a1
                  rem          t5, s4, s0
                  slt          a4, s2, t0
                  c.addi16sp   sp, 400
                  c.srli       a1, 8
                  add          a6, a4, a4
4198:             divu         t1, a5, s10
                  sltu         a6, s9, a5
                  c.srli       s0, 25
                  c.xor        a5, a3
                  sll          ra, a1, t1
                  slti         a0, ra, 470
                  sltiu        s11, s10, -1381
                  mulhu        s11, s1, t1
                  c.addi16sp   sp, -16
                  addi         sp, a3, -1696
                  slli         t6, s7, 17
                  and          s4, s3, t5
                  andi         a3, a3, -2002
                  c.xor        a3, s0
                  c.srai       a5, 22
                  c.addi4spn   a1, sp, 16
                  c.add        a1, tp
                  auipc        a2, 676256
                  lui          s3, 45401
                  xori         s8, sp, -849
                  and          t3, a4, s11
                  srli         s0, s10, 22
                  sltiu        t5, s6, 823
                  nop
                  add          a1, zero, a0
                  rem          a2, s9, s0
                  mul          a1, t5, s9
                  c.add        t2, a7
                  srl          tp, s5, a5
                  beq          s0, t0, 4243f
                  c.li         s6, 14
                  bltu         s11, t2, 4247f
                  beq          a5, t2, 4250f
                  c.sub        a2, s1
                  remu         s1, s11, a0
                  c.addi       t6, -1
                  sra          gp, a5, a0
                  slti         t3, t5, 230
                  blt          s9, s11, 4239f
                  auipc        t5, 204532
                  c.srai       s0, 29
4239:             mul          t6, s3, s7
                  div          a5, a0, a1
                  c.mv         t4, gp
                  srli         s7, a1, 7
4243:             sltu         t3, sp, s9
                  addi         t6, a1, -1909
                  c.and        a1, a4
                  c.addi16sp   sp, -16
4247:             c.andi       a5, -1
                  sltu         s1, t5, t5
                  c.srai       s1, 9
4250:             rem          t1, s3, zero
                  c.bnez       s1, 4267f
                  mulhu        s7, t3, s1
                  sltiu        gp, a4, 1769
                  mulhsu       s0, a6, s9
                  c.lui        s8, 14
                  bge          s8, zero, 4268f
                  slli         tp, a6, 26
                  c.slli       a5, 19
                  sub          t6, a0, s9
                  addi         t1, sp, -968
                  sll          tp, a7, s6
                  c.mv         a5, s6
                  srai         s10, sp, 27
                  c.addi4spn   a1, sp, 304
                  c.lui        t0, 28
                  c.lui        s6, 30
4267:             ori          t6, s6, 483
4268:             bne          a1, s0, 4270f
                  mulh         s6, t2, s11
4270:             remu         a3, zero, ra
                  bge          a5, t5, 4273f
                  bge          t1, a1, 4279f
4273:             c.bnez       a1, 4282f
                  mul          t4, a3, a6
                  bge          t3, t4, 4286f
                  c.bnez       a5, 4281f
                  srai         s8, s1, 11
                  c.beqz       a3, 4279f
4279:             srli         s4, a7, 27
                  slt          zero, tp, t3
4281:             beq          sp, s1, 4299f
4282:             bgeu         s11, t1, 4300f
                  bge          t0, a2, 4289f
                  c.add        t4, a0
                  and          s1, a4, s1
4286:             c.addi4spn   s0, sp, 688
                  c.slli       a2, 28
                  c.sub        a5, a0
4289:             mulhu        s10, t2, sp
                  srl          a2, t2, a4
                  c.bnez       a3, 4310f
                  srli         sp, s9, 1
                  c.addi       s0, 7
                  c.beqz       a2, 4295f
4295:             ori          gp, tp, -1292
                  mulh         t4, s5, a6
                  c.addi16sp   sp, 48
                  c.addi4spn   s0, sp, 864
4299:             sltiu        s3, s9, -456
4300:             c.and        a1, a5
                  nop
                  xor          s9, ra, t5
                  c.srai       a2, 20
                  c.srai       a1, 14
                  c.addi4spn   a4, sp, 784
                  auipc        ra, 660131
                  c.add        t2, t5
                  mulh         tp, ra, s2
                  slti         t3, a3, 566
4310:             c.sub        s1, a5
                  auipc        s3, 86330
                  andi         gp, s0, -1553
                  divu         s7, s3, s6
                  c.slli       t2, 30
                  slt          t0, s2, sp
                  slli         t1, t5, 7
                  mul          a6, ra, a7
                  c.or         s0, a5
                  srl          s11, sp, s4
                  div          t6, s2, s4
                  c.lui        a5, 31
                  srai         a0, gp, 5
                  srl          s0, s4, a1
                  remu         s3, a3, s3
                  or           zero, s4, s10
                  ori          t2, a6, 1598
                  slti         a4, s3, -1611
                  div          a2, a0, s4
                  or           s4, s5, s7
                  srl          t5, s6, a5
                  mulh         a5, s4, s1
                  c.sub        a1, a3
                  slti         t1, ra, -783
                  c.slli       a1, 24
                  rem          a0, a5, a5
                  c.sub        a1, s0
                  xor          t4, s1, s3
                  bgeu         sp, t2, 4340f
                  blt          a1, s5, 4346f
4340:             add          a4, s2, s1
                  beq          ra, s2, 4343f
                  srl          a0, a0, a7
4343:             c.addi4spn   a5, sp, 656
                  c.lui        a1, 8
                  bge          t3, sp, 4356f
sub_2_54:         jal          ra, 14f
0:                jal          ra, 8f
1:                c.j          13f
2:                jal          t3, 11f
3:                c.jal        15f
4:                c.j          5f
5:                jal          ra, 7f
6:                c.jal        12f
7:                jal          ra, 6b
8:                c.jal        10f
9:                c.j          4b
10:               c.jal        2b
11:               c.jal        9b
12:               c.jal        3b
13:               jal          ra, 0b
14:               c.j          1b
15:               c.add        s3, t4
4346:             sltu         a3, a6, s4
                  addi         a4, a4, 1115
                  c.li         s8, -1
                  c.bnez       a5, 4358f
                  c.slli       ra, 2
                  bltu         s4, s5, 4354f
                  mulhsu       s4, a0, t4
                  xori         tp, s1, 361
4354:             c.slli       gp, 22
                  addi         s6, t6, -1555
4356:             c.add        t0, a7
                  sltiu        t4, t6, -622
4358:             bne          s3, s8, 4364f
                  c.addi16sp   sp, 208
                  c.add        s3, a2
                  sltu         tp, tp, a2
                  c.li         a4, -1
                  slli         gp, a4, 11
4364:             and          t1, ra, s6
                  xor          t6, s9, s2
                  c.sub        a1, a2
                  and          a4, s2, s6
                  beq          s1, zero, 4377f
                  c.andi       a1, -1
                  mulhu        s8, a5, t6
                  c.xor        s1, a3
                  xor          s4, a5, a5
                  c.mv         a2, t0
                  slt          a2, a4, ra
                  c.sub        a5, a4
                  or           s9, a3, a6
4377:             c.and        a4, s0
                  c.xor        a5, a0
                  mul          s1, t3, t3
                  xor          s1, a5, s9
                  beq          ra, s3, 4400f
                  c.beqz       s1, 4400f
                  c.bnez       s1, 4395f
                  c.addi16sp   sp, 464
                  bltu         gp, s5, 4393f
                  c.andi       a2, -1
                  andi         t3, s2, 805
                  c.bnez       a3, 4407f
                  slti         s1, s10, 1196
                  mulhsu       a5, s6, s3
                  c.lui        s7, 18
                  c.lui        s4, 5
4393:             c.xor        s1, s1
                  andi         zero, s5, -1038
4395:             auipc        t1, 171266
                  ori          a6, s3, 675
                  rem          s9, s4, s8
                  add          s11, t5, a4
                  auipc        s1, 325165
4400:             bge          t3, zero, 4414f
                  sltu         t6, a6, a0
                  c.srli       a1, 29
                  c.xor        a2, s1
                  c.beqz       a1, 4419f
                  c.add        t1, s9
                  c.srli       a4, 29
4407:             srli         a3, s4, 10
                  c.or         s1, a4
                  c.addi4spn   a1, sp, 608
                  beq          zero, a5, 4422f
                  sll          t5, s4, a1
                  c.srli       s0, 29
                  c.mv         ra, a2
4414:             c.lui        a0, 27
                  c.bnez       a5, 4433f
                  beq          sp, t6, 4423f
                  blt          a3, s4, 4421f
                  c.or         a4, s0
4419:             c.addi4spn   a5, sp, 640
                  andi         a6, s2, 1647
4421:             xor          a1, t2, s10
4422:             sra          s1, s8, s8
4423:             addi         a6, a5, -1227
                  c.slli       s3, 21
                  mulhsu       t3, t0, t2
                  c.addi       a4, -1
                  slti         ra, t3, -107
                  xori         a3, a6, -1454
                  sll          t0, a4, s9
                  addi         s0, t6, 794
                  c.xor        a0, a3
                  c.srai       s1, 7
4433:             sltiu        t0, a5, -88
                  or           s8, a6, t6
                  and          t0, a1, sp
                  lui          s8, 390112
                  c.andi       s1, -1
                  bge          a7, a1, 4449f
                  slti         tp, a1, 1119
                  bne          a1, t6, 4460f
                  rem          t1, a1, a2
                  slli         t2, s11, 13
                  c.and        s0, s1
                  mulh         s8, s2, s5
                  sltiu        ra, s4, -1745
                  or           t3, a2, s9
                  xori         s1, t2, -929
                  blt          s1, s9, 4464f
4449:             sll          ra, s11, s6
                  mulhu        t4, a5, a1
                  xori         t6, s0, -1143
                  c.and        a1, a4
                  c.lui        t0, 29
                  c.and        a5, a1
                  slli         t3, sp, 18
                  c.addi       s6, -1
                  addi         tp, a1, -2047
                  bgeu         ra, a6, 4474f
                  c.addi4spn   a1, sp, 672
4460:             c.add        t4, t2
                  c.slli       a1, 27
                  c.bnez       a3, 4475f
                  bltu         s11, s4, 4468f
4464:             c.addi       a5, 4
                  srl          a2, gp, a7
                  c.bnez       a1, 4484f
                  or           s0, s1, sp
4468:             beq          a1, t1, 4470f
                  or           a6, a2, a1
4470:             mulhsu       s1, a2, a1
                  or           s9, tp, s8
                  c.srli       a0, 25
                  mulhsu       sp, a2, zero
4474:             addi         gp, s7, -418
4475:             and          t4, t6, s4
                  c.li         s8, 3
                  rem          s4, a3, t3
                  mulhsu       ra, ra, s3
                  mulhsu       t3, a6, a2
                  sll          t0, s10, s7
                  c.xor        a1, a0
                  c.mv         a0, s5
                  c.addi4spn   s1, sp, 176
4484:             c.nop
                  c.and        a1, a5
                  and          s6, s7, a0
                  div          a0, s11, s2
                  slt          a1, t2, s8
                  sltu         t3, s6, gp
                  mulh         a3, a0, s1
                  c.andi       s0, -1
                  c.slli       t6, 6
                  mulhu        s10, gp, s6
                  sub          t6, gp, t3
                  xor          s0, ra, gp
                  addi         tp, s2, 1940
                  lui          a0, 906175
                  xor          t2, t6, s8
                  or           a1, s5, sp
                  or           s8, a4, a7
                  sll          s1, tp, a6
                  srli         a0, t2, 2
                  auipc        sp, 107046
                  c.mv         s7, a3
                  c.addi4spn   a0, sp, 240
                  and          zero, ra, tp
                  slti         s0, s10, 813
                  c.srai       a5, 5
                  auipc        s10, 829019
                  lui          a5, 719562
                  c.or         a4, a1
                  slli         s4, t4, 24
                  div          t1, s3, zero
                  mulhsu       a3, zero, tp
                  bgeu         a0, s0, 4517f
                  div          s0, a2, t6
4517:             c.or         s0, s0
                  c.bnez       a5, 4538f
                  remu         s1, t4, t2
                  auipc        zero, 707505
                  mulh         s10, gp, t0
                  srai         s6, sp, 18
                  c.or         a5, a3
                  c.srli       a1, 24
                  c.addi4spn   s1, sp, 336
                  xori         s11, s2, -1207
                  andi         a3, a5, -1143
                  beq          t1, s10, 4536f
                  or           s1, s2, a1
                  c.mv         a2, s0
                  c.sub        s1, a1
                  c.bnez       s1, 4541f
                  mul          a1, s2, t3
                  lui          t0, 162519
                  srl          s1, s5, a7
4536:             srai         s8, s11, 25
                  rem          s9, s2, s4
4538:             srai         ra, s9, 10
                  c.li         s10, 10
                  beq          t5, t4, 4546f
4541:             c.beqz       a3, 4543f
                  rem          s7, t3, zero
4543:             addi         t0, a2, 382
                  remu         s0, a2, t6
                  sltiu        s7, t2, 627
                  addi         a0, zero, 3 #init loop 1 counter
                  addi         sp, zero, 2 #init loop 1 limit
sub_2_107_1_t:    c.add        a2, t1
                  addi         a0, a0, -1 #update loop 1 counter
                  andi         ra, a2, -1540
                  addi         a4, zero, -4 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
                  c.lui        s9, 3
sub_2_107_0_t:    or           a3, a4, a6
                  addi         a4, a4, 4 #update loop 0 counter
                  c.beqz       a4, sub_2_107_0_t #branch for loop 0
                  bgeu         a0, sp, sub_2_107_1_t #branch for loop 1
                  xori         tp, s0, 709
4546:             mulhsu       a1, s6, s5
                  c.slli       t0, 3
                  c.li         s3, 9
                  ori          t6, t3, 1960
                  mulhsu       a4, s0, s2
                  add          t2, a7, t5
                  slt          a2, s0, gp
                  bge          t2, t1, 4564f
                  mulhsu       s1, ra, s1
                  sltiu        a3, s5, 1710
                  c.slli       t3, 17
                  c.sub        s1, a3
                  c.srli       a1, 10
                  bne          t3, s4, 4574f
                  divu         a4, s8, a6
                  c.xor        a0, s0
                  xor          t1, sp, a0
                  or           s11, a4, s4
4564:             blt          s1, a7, 4567f
                  sub          a1, s4, a3
                  sltu         s3, s5, a7
4567:             c.bnez       a0, 4569f
                  srli         a2, t4, 9
4569:             mulhsu       t1, s2, a1
                  c.mv         a4, s9
                  mulh         sp, a7, s7
                  xor          a1, s2, s9
                  and          a6, a2, a1
4574:             xori         gp, gp, -706
                  c.or         a5, s1
                  slt          t5, a3, s10
                  lui          t4, 159554
                  c.andi       a0, -1
                  c.sub        a0, a1
                  c.sub        s1, a3
                  c.addi       s11, -1
                  rem          t0, ra, a5
                  beq          s1, s6, 4599f
                  c.add        s4, t3
                  or           gp, s8, a3
                  andi         a2, gp, 561
                  mulhu        t2, a1, a1
                  lui          s3, 642183
                  c.lui        a5, 17
                  sltu         a4, s3, s8
                  auipc        s4, 1017982
                  c.slli       s10, 12
                  addi         s4, s0, 1631
                  slt          a3, ra, a3
                  or           s11, a0, s1
                  sub          s0, s9, a6
                  srai         tp, s10, 26
                  bge          s9, sp, 4618f
4599:             c.addi16sp   sp, -16
                  rem          s8, t4, s3
                  slli         a2, t0, 24
                  sltu         s10, s11, sp
                  div          t3, ra, s10
                  ori          t5, t5, 1959
                  andi         t5, a7, 1163
                  c.xor        s1, s0
                  c.mv         ra, t1
                  nop
                  c.srai       a2, 1
                  div          zero, a0, a6
                  bltu         s7, t4, 4625f
                  c.mv         s1, s4
                  bge          ra, s6, 4620f
                  slti         s1, s4, -1497
                  srli         t2, t0, 31
                  mulhu        tp, s10, a3
                  slli         s11, s11, 6
4618:             c.and        a5, a4
                  mulhu        s4, a6, ra
4620:             nop
                  or           s10, a6, s1
                  c.addi       t0, -1
                  and          a4, s10, ra
                  la           s1, region_1+1456 #start load_store_instr_stream_2
                  la           tp, region_1+208 #start load_store_instr_stream_1
                  la           a6, region_1+772 #start load_store_instr_stream_3
                  sb           s2, -643(s1)
                  lb           sp, -15(tp)
                  lbu          t4, 326(a6)
                  la           a2, region_1+1036 #start load_store_instr_stream_0
                  sb           sp, -1172(s1)
                  lb           t1, -13(tp)
                  sb           a1, -29(s1)
                  sb           s4, -156(a6)
                  lb           zero, 33(a2)
                  lb           t5, -3(tp)
                  lbu          a4, 15(a2)
                  lbu          s7, -34(a2)
                  lbu          s6, 49(a6)
                  lb           t6, 14(tp)
                  lhu          s11, 188(a6)
                  lhu          t2, 54(a2)
                  lbu          s7, -614(s1)
                  sb           t1, 26(a2)
                  lb           t3, -1101(s1)
                  sw           s3, 16(tp)
                  lb           t2, 1(tp) #end load_store_instr_stream_1
                  lbu          sp, 33(a2)
                  sb           a6, -451(a6)
                  lb           s8, 137(s1)
                  sb           a1, 789(a6) #end load_store_instr_stream_3
                  sb           tp, 23(a2)
                  sb           a5, 395(s1)
                  lb           s4, 393(s1) #end load_store_instr_stream_2
                  lhu          s10, -26(a2) #end load_store_instr_stream_0
                  c.sub        a3, a4
4625:             c.bnez       a2, 4643f
                  bne          a3, s9, 4639f
                  beq          t6, s10, 4629f
                  auipc        zero, 954859
4629:             sra          s10, a6, s8
                  slli         a3, t2, 3
                  srli         a0, a4, 31
                  mul          s4, s1, t2
                  andi         t6, t6, 1687
                  sltiu        s4, a1, 99
                  bltu         a4, t2, 4655f
                  nop
                  srai         s4, t4, 17
                  sra          s8, s11, s9
4639:             slt          t4, ra, ra
                  divu         s1, t5, a7
                  div          t2, s4, tp
                  slt          s8, t6, zero
4643:             c.addi       gp, -1
                  lui          t0, 1039110
                  ori          sp, s6, 610
                  c.sub        a2, a4
                  c.nop
                  divu         a3, a1, s3
                  c.li         s11, -1
                  blt          s1, s3, 4661f
                  c.addi       s9, 6
                  c.srai       a0, 10
                  mulhsu       s8, ra, a3
                  mul          s1, a0, t0
4655:             sltu         s4, s7, a1
                  xor          sp, t0, sp
                  slti         a2, zero, 5
                  divu         s9, s8, gp
                  ori          t2, a5, -946
                  slti         a3, t0, 1538
4661:             c.beqz       s1, 4662f
4662:             auipc        a0, 672668
                  c.nop
                  srli         a1, s1, 19
                  c.slli       t3, 29
                  c.beqz       a4, 4671f
                  c.beqz       a1, 4685f
                  c.bnez       a4, 4677f
                  c.bnez       a5, 4688f
                  c.nop
4671:             c.xor        s1, a2
                  slti         s7, s4, 36
                  c.addi4spn   a4, sp, 784
                  beq          s5, s9, 4686f
                  add          s4, t1, zero
                  srai         s1, a4, 20
4677:             div          tp, s6, s1
                  srli         s3, a0, 16
                  remu         a5, t4, zero
                  rem          s8, zero, tp
                  srl          s6, a6, a5
                  andi         t4, ra, -1970
                  c.srai       a4, 14
                  c.andi       a5, 27
4685:             div          a4, t1, s9
4686:             c.addi4spn   s0, sp, 928
                  bltu         t3, s5, 4699f
4688:             mulhu        sp, gp, t4
                  c.srli       a2, 8
                  blt          t4, a7, 4694f
                  c.sub        a0, a1
                  c.nop
                  c.bnez       s0, 4709f
4694:             sltiu        a6, a6, -1371
                  srli         t0, a0, 30
                  xor          t4, a6, t4
                  mulhsu       zero, sp, a5
                  c.li         s11, -1
sub_2_52:         jal          ra, 12f
0:                c.j          29f
1:                jal          s0, 21f
2:                c.jal        7f
3:                jal          t1, 15f
4:                jal          ra, 28f
5:                c.j          23f
6:                c.jal        1b
7:                jal          sp, 3b
8:                c.j          18f
9:                c.jal        0b
10:               c.jal        26f
11:               jal          s8, 19f
12:               c.jal        20f
13:               jal          t1, 16f
14:               jal          t1, 27f
15:               jal          ra, 6b
16:               c.j          9b
17:               c.j          10b
18:               jal          ra, 14b
19:               c.jal        13b
20:               c.jal        2b
21:               c.jal        17b
22:               c.jal        11b
23:               jal          t1, 4b
24:               c.jal        5b
25:               c.jal        24b
26:               c.j          25b
27:               c.jal        22b
28:               jal          a5, 8b
29:               sra          s10, s5, s9
4699:             c.sub        a1, a2
                  lui          a4, 769852
                  add          ra, s8, s1
                  xori         gp, s7, -1105
                  div          a2, t4, t3
                  c.slli       s4, 14
                  c.li         t2, -1
                  c.addi16sp   sp, 160
                  slli         s3, t5, 24
                  mulhsu       t0, s6, s4
4709:             mul          t1, s4, a3
                  sub          s1, s1, a6
                  c.addi       ra, 6
                  c.xor        a0, s0
                  auipc        s6, 864955
                  srl          t6, s3, t2
                  divu         t2, sp, s3
                  srl          s7, a3, gp
                  blt          t1, a3, 4735f
                  lui          s6, 516640
                  c.nop
                  beq          a5, t4, 4727f
                  c.mv         s4, t6
                  c.srai       a0, 19
                  c.addi4spn   a3, sp, 928
                  auipc        t3, 68094
                  add          t0, s10, zero
                  c.li         s7, 18
4727:             c.mv         a2, a3
                  and          s9, s9, tp
                  lui          a4, 229886
                  sll          a4, s10, t2
                  c.andi       a0, 1
                  srai         t2, a3, 15
                  c.slli       gp, 13
                  beq          t3, t3, 4736f
4735:             c.srli       s1, 21
4736:             xori         s9, s4, 334
                  slt          a4, s10, a6
                  c.nop
                  and          zero, t3, sp
                  c.lui        t3, 25
                  c.srai       a1, 14
                  bge          t4, a4, 4761f
                  c.mv         s9, s3
                  mulhu        a4, a6, tp
                  div          s3, a7, a5
                  sra          s6, gp, a6
                  c.beqz       a3, 4749f
                  slli         s7, gp, 15
4749:             sub          s8, s7, a0
                  andi         s6, gp, -1710
                  nop
                  c.beqz       a5, 4766f
                  mulhu        s0, a4, a4
                  sll          s8, t2, s9
                  and          s7, a0, a5
                  xori         a2, t2, 1054
                  nop
                  c.sub        s0, a5
                  bne          t2, s11, 4761f
                  remu         s7, s2, t5
4761:             sltiu        s9, a0, -79
                  c.srai       s0, 30
                  xori         tp, t5, 1493
                  c.andi       a0, 7
                  c.or         a2, a3
4766:             c.or         s1, a4
                  sub          s8, s2, t6
                  c.andi       s1, -1
                  c.srli       a5, 1
                  mulhsu       s3, t2, t1
                  srli         t5, t3, 1
                  slt          s0, a1, s1
                  ori          sp, gp, 786
                  bgeu         t0, t4, 4779f
                  blt          s1, s7, 4784f
                  slti         s9, s6, 1093
                  divu         a2, s10, a6
                  xor          ra, a2, a3
4779:             c.srli       s0, 18
                  lui          s1, 1014680
                  beq          sp, s3, 4796f
                  c.beqz       a3, 4789f
                  xor          s1, s0, a5
4784:             lui          s4, 798478
                  c.slli       a2, 31
                  remu         tp, t6, s2
                  c.lui        s10, 6
                  or           sp, a1, t3
4789:             divu         s0, gp, sp
                  srli         a6, a6, 18
                  c.bnez       a3, 4797f
                  c.nop
                  c.addi4spn   a2, sp, 352
                  c.beqz       a0, 4802f
                  bltu         a4, tp, 4804f
4796:             c.slli       a3, 13
4797:             divu         s9, t5, ra
                  sra          zero, a2, a0
                  c.sub        a2, a0
                  ori          sp, a3, -1679
                  c.add        a5, t3
4802:             sra          a6, t1, s11
                  srl          t5, t3, a7
4804:             c.add        s11, t0
                  c.mv         ra, t0
                  beq          s5, a5, 4810f
                  c.and        a2, s0
                  addi         s7, zero, -1773
                  xor          t1, zero, t0
4810:             mulhsu       t0, t0, s6
                  srli         t2, s7, 2
                  remu         a3, sp, a1
                  mulh         t3, tp, s1
                  c.bnez       a1, 4816f
                  srai         t6, a2, 19
4816:             srl          tp, sp, a1
                  rem          s9, s3, a2
                  c.bnez       s1, 4831f
                  add          a0, s1, t6
                  mulh         a0, s7, tp
                  addi         tp, s7, 754
                  sub          a3, a3, s2
                  sub          s1, s4, s5
                  c.bnez       s0, 4842f
                  c.add        a0, ra
                  sll          t1, s2, s8
                  c.andi       a5, -1
                  c.lui        t2, 3
                  rem          t4, t2, ra
                  c.bnez       s0, 4842f
4831:             bltu         t3, zero, 4850f
                  bge          a2, s1, 4843f
                  srl          gp, s5, gp
                  andi         t6, a6, -437
                  nop
                  slli         s0, t2, 15
                  c.or         s1, s0
                  xor          t1, sp, t2
                  and          zero, s6, t6
                  bgeu         s7, s4, 4851f
                  sra          a6, s7, t6
4842:             beq          a2, a0, 4862f
4843:             c.addi4spn   a2, sp, 160
                  c.li         s0, 3
                  auipc        tp, 357399
                  and          t0, s4, a1
                  sltiu        a5, a2, 601
                  c.xor        a3, a4
                  c.bnez       a5, 4852f
4850:             bltu         t5, a3, 4870f
4851:             div          s7, t6, s9
4852:             rem          s10, a7, s1
                  add          s11, a1, s3
                  mulhsu       zero, gp, a7
                  c.srli       a4, 12
                  sra          a5, sp, a0
                  mulh         s9, a1, a2
                  sltu         zero, a3, s2
                  or           t4, t1, t2
                  c.srai       a5, 27
                  sub          s11, t4, a2
4862:             c.addi16sp   sp, 144
                  addi         s7, s3, 506
                  sltu         s0, s9, s6
                  and          t2, a1, s8
                  c.beqz       s0, 4868f
                  or           a3, t1, t4
4868:             sub          s1, a0, s7
                  c.lui        a5, 27
4870:             xor          t5, tp, tp
                  or           tp, s0, t3
                  c.xor        s1, s1
                  mul          t3, s5, gp
                  and          gp, s8, s7
                  xori         sp, a1, 1540
                  srl          sp, t2, a3
                  lui          t1, 876546
                  c.slli       sp, 20
                  beq          s3, t6, 4891f
                  slli         zero, s7, 14
                  bge          s9, a6, 4882f
4882:             c.xor        a1, a3
                  mulhu        a3, t1, a6
                  xori         a6, s4, -1217
                  c.addi16sp   sp, 352
                  c.bnez       a3, 4904f
                  c.xor        a5, a3
                  slti         s9, t1, 1297
                  c.mv         a3, t3
                  rem          t1, s3, t4
4891:             xor          tp, a0, s11
                  rem          a5, sp, zero
                  c.nop
                  nop
                  sltiu        a3, s4, -320
                  xor          t2, zero, s9
                  bge          a4, s2, 4915f
                  c.addi4spn   a2, sp, 272
                  slt          t3, s2, a0
                  srli         a6, t3, 17
                  slt          sp, s9, s1
                  sll          s0, a0, s11
                  div          a4, sp, t5
4904:             c.add        s0, a4
                  and          t4, sp, s1
                  sltiu        s9, s5, 824
                  c.srli       a0, 24
                  c.addi       t0, -1
                  slli         s8, t6, 4
                  addi         t4, t1, 1778
                  c.addi4spn   a2, sp, 272
                  andi         s3, a1, 1273
                  bne          s11, t2, 4920f
                  and          gp, s3, a7
4915:             srl          s10, s6, t2
                  bltu         t3, gp, 4935f
                  c.srli       a1, 29
                  c.mv         a2, t3
                  bge          sp, a4, 4935f
4920:             divu         a0, a2, a0
                  div          s9, s1, t0
                  c.li         a0, -1
                  c.or         a2, a1
                  blt          s6, a3, 4940f
                  slli         a1, s7, 14
                  or           s10, t4, zero
                  c.addi16sp   sp, -16
                  c.bnez       a4, 4944f
                  c.andi       s0, 9
                  nop
                  c.and        a4, s0
                  or           s11, zero, a7
                  rem          s0, t0, s9
                  xor          a0, t3, ra
4935:             or           a5, t4, t6
                  sub          a6, a5, t0
                  c.bnez       s1, 4956f
                  mulh         t5, s10, s6
                  rem          t2, a5, a4
4940:             beq          s2, a1, 4954f
                  slti         s7, a6, 442
                  c.srli       s1, 26
                  bne          s11, s0, 4946f
4944:             c.srai       a2, 29
                  beq          s6, a0, 4953f
4946:             bne          s8, s6, 4964f
                  c.sub        s1, s1
                  sltu         t6, tp, zero
                  c.addi16sp   sp, -16
                  or           s11, a2, sp
                  sltu         t2, s5, s3
                  mul          a6, s6, t1
4953:             c.xor        a5, a5
4954:             slli         s0, zero, 13
                  slti         a0, s5, -1538
4956:             mul          tp, s5, sp
                  srai         s0, t1, 15
                  bge          s0, ra, 4977f
                  sll          s4, tp, s2
                  divu         s3, s2, s4
                  divu         a3, sp, t0
                  c.addi4spn   s0, sp, 480
                  remu         t1, ra, a7
4964:             c.addi16sp   sp, -16
                  c.addi4spn   a4, sp, 752
                  divu         s10, s10, sp
                  bgeu         zero, t6, 4987f
                  sll          s7, s3, a0
                  c.mv         gp, a1
                  c.sub        a2, a3
                  c.xor        a5, a2
                  c.xor        a0, a5
                  c.lui        s8, 23
                  srai         a4, t1, 30
                  c.srai       a2, 2
                  add          a4, a1, t0
4977:             c.bnez       s0, 4989f
                  mul          gp, a3, s7
                  sll          t2, tp, sp
                  slt          s11, a5, t6
                  slli         s9, zero, 31
                  c.add        a5, tp
                  c.add        a4, s11
                  c.addi4spn   a2, sp, 752
                  or           a4, s2, a1
                  mulhsu       s0, sp, a4
4987:             nop
                  c.srai       s1, 1
4989:             c.beqz       a2, 4991f
                  blt          s5, t2, 5010f
4991:             auipc        ra, 884010
                  div          t5, s0, s5
                  c.mv         s6, s8
                  c.andi       a4, 20
                  c.xor        a3, a1
                  c.srai       a5, 1
                  mulhu        zero, a7, t2
                  c.nop
                  srli         s7, s10, 3
                  div          s6, t4, s3
                  srai         a6, s2, 7
                  xori         a0, zero, -947
                  c.add        a0, s10
                  bge          a1, s5, 5019f
                  slli         ra, gp, 12
                  slt          a2, t6, s10
                  c.lui        a1, 22
                  lui          t0, 973332
                  c.slli       a0, 12
5010:             srl          ra, a3, a1
                  c.nop
                  c.srli       a0, 10
                  c.mv         s1, tp
                  c.srli       a0, 26
                  beq          a4, a5, 5017f
                  div          s11, s2, a3
5017:             sra          a3, a3, t1
                  ori          a0, s11, 97
5019:             c.srai       a2, 8
                  rem          a4, s1, t6
                  andi         a1, t5, -946
                  sltiu        s0, t2, -901
                  c.addi16sp   sp, 96
                  xor          ra, t6, s5
                  xori         s8, s1, 1730
                  auipc        a6, 108052
                  auipc        s10, 59981
                  nop
                  c.bnez       s1, 5040f
                  c.andi       s1, -1
                  addi         a0, t0, 345
                  slti         t3, a6, 855
                  sltu         s8, a6, t5
                  or           zero, t5, a3
                  c.andi       s0, -1
                  slli         t2, t4, 18
                  slt          a4, a7, a6
                  nop
                  c.add        s4, s6
5040:             beq          a7, t6, 5056f
                  bgeu         a6, t3, 5050f
                  or           s4, a5, a5
                  div          t4, s8, s1
                  addi         ra, s1, -1483
                  bne          s7, sp, 5056f
                  c.slli       s4, 20
                  c.sub        a1, a5
                  c.srai       a4, 23
                  sub          t5, a4, t2
5050:             mulhsu       a3, s6, a3
                  srli         a0, s4, 17
                  c.nop
                  c.or         a3, a4
                  xori         t0, t0, -1349
                  andi         t4, zero, 1590
5056:             ori          t0, a5, -477
                  bltu         tp, s5, 5070f
                  andi         t6, s6, 1427
                  bltu         s3, s3, 5060f
5060:             srl          s11, ra, s3
                  sltiu        t3, s6, 780
                  bne          s1, s0, 5074f
                  srl          s0, s7, s6
                  bgeu         s7, s7, 5071f
                  sltiu        tp, a1, 875
                  sltu         a0, t0, s0
                  c.addi4spn   s0, sp, 320
                  mul          s3, s2, t0
                  c.srli       s0, 9
5070:             lui          a5, 644101
5071:             sltiu        tp, gp, -668
                  c.slli       a5, 19
                  c.sub        a5, a0
5074:             slti         a3, a2, 1706
                  rem          a6, a5, ra
                  sltu         t1, t3, s7
                  c.beqz       s1, 5083f
                  slli         tp, a1, 8
                  srai         a0, s10, 30
                  sra          s11, a2, t0
                  auipc        zero, 610493
                  mulh         s0, a6, tp
5083:             beq          t4, zero, 5087f
                  bne          s3, s1, 5102f
                  divu         s10, a0, tp
                  srai         s1, s2, 2
5087:             c.nop
                  xor          s11, s9, zero
                  srai         s11, a0, 30
                  c.addi       t3, 6
                  bge          s8, zero, 5096f
                  ori          tp, s9, 1018
                  c.nop
                  sll          s0, s2, t6
                  bltu         a7, t3, 5104f
5096:             ori          s8, t6, 220
                  c.addi4spn   a3, sp, 624
                  c.srai       a2, 25
                  mulh         a5, t5, s9
                  remu         ra, t2, zero
                  bge          a4, s11, 5108f
5102:             sll          gp, a4, t3
                  c.addi       s8, 1
5104:             or           t1, s11, s9
                  add          s8, s8, a3
                  bgeu         a7, a2, 5108f
                  bne          s2, s11, 5109f
5108:             bgeu         t6, s5, 5126f
5109:             c.bnez       s0, 5123f
                  c.srai       a1, 23
                  c.bnez       s0, 5120f
                  c.nop
                  c.beqz       a4, 5118f
                  rem          sp, zero, t3
                  remu         s9, s5, a7
                  c.li         t0, -1
                  divu         t4, gp, a3
5118:             c.bnez       a1, 5120f
                  lui          s0, 580457
5120:             mulhsu       s10, a7, zero
                  div          a4, s1, s3
                  or           s7, ra, a4
5123:             srl          s3, a5, a6
                  c.addi16sp   sp, -16
                  slti         t2, s0, -1870
5126:             sub          s7, t6, a0
                  c.add        s3, s3
                  slt          t2, s2, s1
                  c.li         ra, 3
                  xor          t4, t3, a6
                  div          a6, gp, a6
                  sub          a0, s8, s8
                  c.nop
                  slti         a1, t0, 2024
                  c.beqz       a2, 5146f
                  add          a6, a4, s11
                  auipc        a3, 813316
                  sll          a6, a3, s9
                  slt          a2, a0, s4
                  c.addi4spn   a1, sp, 336
                  mulh         s1, tp, t0
                  c.slli       a5, 23
                  bltu         a1, gp, 5144f
5144:             srli         s11, a1, 0
                  c.bnez       a1, 5157f
5146:             c.addi4spn   a4, sp, 64
                  blt          s10, t4, 5165f
                  c.mv         a5, s3
                  c.or         s0, s0
                  c.slli       t1, 12
                  sltu         gp, sp, s9
                  and          a2, t1, t0
                  bge          s0, s5, 5160f
                  c.and        a2, a0
                  mulhu        t2, t0, a1
                  la           a0, region_0+443 #start riscv_load_store_hazard_instr_stream_20
                  xor          a1, sp, s0
                  lb           a1, 16(a0)
                  lb           t5, 16(a0)
                  ori          a1, s5, 475
                  lb           s9, 16(a0)
                  lbu          s8, -10(a0)
                  lb           s11, -10(a0)
                  sw           s1, -3(a0)
                  c.and        a5, a0
                  sh           a2, -3(a0)
                  lbu          s7, -3(a0)
                  sh           sp, -3(a0)
                  c.and        a4, s0
                  sb           tp, -3(a0)
                  lbu          a1, 2(a0)
                  sb           ra, -6(a0) #end riscv_load_store_hazard_instr_stream_20
                  c.bnez       s0, 5175f
5157:             xor          ra, zero, s5
                  c.li         s7, 8
                  div          s11, s0, s8
5160:             and          a6, gp, tp
                  sub          s6, s0, gp
                  add          ra, ra, s1
                  c.mv         a3, s6
                  ori          t2, s2, 678
5165:             srli         s6, t3, 20
                  add          a6, zero, t6
                  c.addi16sp   sp, -16
                  c.addi4spn   a1, sp, 192
                  slt          s7, t5, sp
                  c.and        a3, a0
                  bgeu         a4, t0, 5175f
                  nop
                  c.addi16sp   sp, -16
                  c.bnez       a2, 5193f
5175:             divu         a6, s8, tp
                  slti         gp, s1, 1754
                  mul          a6, t3, sp
                  rem          t6, a7, s2
                  andi         s9, s2, -1312
                  srai         s4, t3, 30
                  xori         s3, tp, -1744
                  rem          t4, sp, sp
                  bltu         t3, s1, 5196f
                  c.srai       s1, 1
                  mulh         t5, s6, t2
                  c.bnez       a5, 5189f
                  bltu         s5, s2, 5203f
                  c.add        s11, tp
5189:             rem          zero, s1, tp
                  slli         gp, s0, 31
                  bge          a2, s4, 5211f
                  c.lui        s1, 10
5193:             auipc        s6, 291122
                  c.xor        a0, a2
                  c.lui        t3, 6
5196:             blt          a6, s7, 5198f
                  rem          s10, s3, a7
5198:             slti         a2, a3, 705
                  rem          t0, t4, a5
                  mul          s7, tp, t1
                  c.andi       s1, 16
                  srl          tp, zero, s2
5203:             c.nop
                  and          s4, t5, a1
                  c.srai       a4, 18
                  c.andi       a2, 21
                  c.nop
                  sltu         sp, t0, tp
                  mulhu        t0, zero, t4
                  andi         tp, a7, 1596
5211:             c.beqz       a0, 5223f
                  c.and        a1, a2
                  srl          a6, s11, t2
                  c.li         ra, 14
                  bne          t3, s4, 5217f
                  c.lui        s0, 15
5217:             slli         a1, a7, 15
                  rem          s3, t5, t1
                  add          s0, a3, s5
                  srl          s11, ra, t2
                  bltu         a2, a4, 5229f
                  add          gp, s1, s2
5223:             c.addi       t2, 28
                  c.sub        a5, a5
                  bltu         t2, s4, 5231f
                  sub          s4, s9, t3
                  c.bnez       s0, 5234f
                  c.lui        t5, 21
5229:             c.and        a2, s0
                  c.slli       a2, 22
5231:             c.andi       a1, -1
                  xor          s11, a1, t3
                  addi         tp, ra, -495
5234:             c.add        s1, a5
                  c.addi4spn   a3, sp, 672
                  c.and        a2, a1
                  sub          t5, a7, a5
                  c.bnez       a5, 5247f
                  mulhsu       a5, a7, s0
                  c.mv         t2, t4
                  c.addi4spn   a0, sp, 16
                  mul          t0, a5, s6
                  sra          a2, s8, a2
                  blt          s4, gp, 5262f
                  slt          gp, sp, sp
                  c.or         a4, a5
5247:             slt          s10, a0, t1
                  lui          zero, 924438
                  c.srli       a4, 10
                  c.addi4spn   a0, sp, 432
                  c.andi       a4, -1
                  c.beqz       s0, 5263f
                  ori          t2, t2, 1471
                  slt          t3, s8, s11
                  add          a0, a2, t4
                  c.lui        s3, 2
                  add          s7, s9, t0
                  bne          ra, ra, 5276f
                  addi         s4, s10, 166
                  sltiu        tp, t5, 1063
                  c.slli       a5, 29
5262:             auipc        a0, 786741
5263:             mul          t2, s3, a0
                  c.srli       a2, 12
                  lui          s4, 418347
                  c.lui        gp, 21
                  lui          zero, 311135
                  blt          a0, s9, 5284f
                  sltu         a6, a4, s9
                  c.add        gp, t5
                  c.li         s0, -1
                  or           s4, zero, a6
                  srli         t2, t0, 27
                  beq          s8, s5, 5289f
                  blt          a6, t2, 5295f
5276:             c.or         a5, a1
                  or           a0, a4, s5
                  c.li         s3, 14
                  c.srli       a2, 29
                  auipc        zero, 688967
                  div          s3, t5, a2
                  c.andi       a0, -1
                  addi         gp, s4, 1944
5284:             c.srli       a5, 12
                  divu         t4, s10, t2
                  divu         t2, a7, zero
                  c.beqz       a3, 5289f
                  mulhu        t2, t4, s11
5289:             mul          ra, s8, s6
                  sltiu        s8, zero, 1117
                  c.and        a3, s0
                  c.or         a3, a1
                  mulhu        t2, tp, s10
                  rem          s10, t5, gp
5295:             divu         s10, s4, s8
                  c.mv         a1, s11
                  c.nop
                  sll          t6, t2, tp
                  c.mv         s0, t2
                  or           a1, s10, t5
                  remu         s9, a7, s10
                  sub          t2, t4, t1
                  c.srli       a1, 6
                  c.sub        a2, a4
                  auipc        ra, 894002
                  auipc        a4, 959475
                  c.add        t0, s8
                  bne          s8, s10, 5310f
                  sltu         t3, a4, t5
5310:             add          a3, a2, a2
                  xor          t6, t4, gp
                  or           tp, a2, a2
                  c.or         a5, a5
                  ori          gp, s6, 1041
                  c.addi       tp, -1
                  sra          s7, t2, t3
                  c.or         a2, a3
                  c.li         t3, 13
                  addi         gp, s3, 1843
                  c.bnez       a0, 5340f
                  bgeu         a0, a7, 5335f
                  andi         t2, a2, 1520
                  c.li         sp, 8
                  srai         s6, a1, 8
                  andi         t6, s8, -1040
                  bne          t0, t0, 5333f
                  c.or         a0, a0
                  slli         a4, gp, 31
                  c.lui        tp, 2
                  ori          a3, gp, -1505
                  sra          a1, t4, a1
                  sll          sp, tp, s5
5333:             c.slli       t4, 16
                  andi         s8, sp, 152
5335:             rem          a2, zero, t1
                  blt          s9, a3, 5338f
                  divu         tp, s3, t6
5338:             mulh         t2, s9, sp
                  c.srai       a4, 9
5340:             srai         s7, a1, 11
                  c.andi       a5, 12
                  mulhu        a2, s11, a5
                  srli         s0, t4, 8
                  slt          a5, s11, a0
                  rem          s0, s10, a4
                  c.xor        a3, a0
                  c.or         a3, s0
                  srai         s9, s0, 31
                  mul          ra, s7, sp
                  srai         t3, s6, 10
                  nop
                  rem          s7, zero, a7
                  or           tp, tp, t4
                  add          gp, s8, t3
                  divu         s0, t4, a1
                  c.addi16sp   sp, 112
                  c.beqz       a3, 5358f
5358:             xor          t0, a0, t0
                  addi         t0, zero, 3 #init loop 1 counter
                  c.sub        s0, a4
                  lui          a4, 31809
                  srai         ra, a2, 1
                  addi         t2, zero, 4 #init loop 1 limit
                  lui          a4, 1000536
                  c.lui        a3, 20
sub_2_113_1_t:    and          ra, s11, t3
                  srli         a0, s3, 30
                  addi         t0, t0, 8 #update loop 1 counter
                  c.or         a5, a4
                  srl          s11, t5, sp
                  c.addi4spn   a4, sp, 272
                  addi         t1, zero, 10 #init loop 0 counter
                  div          s1, s1, a6
                  addi         t4, zero, 9 #init loop 0 limit
                  c.add        a6, t3
sub_2_113_0_t:    addi         t3, s2, 19
                  c.slli       s4, 31
                  xori         a2, tp, -931
                  sub          s11, s9, s2
                  divu         s11, s1, a0
                  divu         a5, gp, t2
                  addi         t1, t1, -8 #update loop 0 counter
                  slli         a2, s6, 21
                  bgeu         t1, t4, sub_2_113_0_t #branch for loop 0
                  c.addi16sp   sp, 32
                  blt          t0, t2, sub_2_113_1_t #branch for loop 1
                  c.srli       s0, 6
                  add          t1, t0, s11
                  auipc        ra, 657392
                  remu         tp, a7, t3
                  mul          s10, s2, t2
                  sll          sp, a5, ra
                  c.add        t0, a7
                  ori          a0, a1, 1533
                  c.xor        a3, a0
                  c.add        a3, a1
                  mulhsu       zero, s4, t2
                  bne          s1, t1, 5385f
                  c.and        s1, a2
                  srl          zero, t0, s9
                  mulhsu       a6, a4, ra
                  addi         t0, s10, 1533
                  c.bnez       s1, 5392f
                  rem          a1, t5, t2
                  c.srli       a0, 14
                  xor          a4, sp, a3
                  c.mv         t2, s1
                  blt          s1, t4, 5383f
                  c.or         a1, a5
                  c.nop
                  or           a6, s1, s10
5383:             c.and        a1, a5
                  rem          t1, s7, ra
5385:             slli         ra, t5, 13
                  c.slli       a2, 1
                  auipc        t3, 949217
                  rem          t1, sp, s9
                  c.srli       s1, 31
                  lui          sp, 800825
                  la           sp, region_0+872 #start riscv_load_store_rand_instr_stream_6
                  c.srai       s0, 13
                  sb           sp, 10(sp)
                  or           s10, s7, s11
                  mulhu        s7, s10, sp
                  lh           s11, -12(sp)
                  lbu          s4, -7(sp)
                  sra          t2, a4, sp
                  c.lwsp       t4, 16(sp)
                  slli         zero, s8, 7
                  c.addi       ra, -1
                  lbu          s7, 11(sp)
                  c.swsp       s5, 12(sp)
                  lh           a0, 2(sp)
                  or           s3, s7, s11
                  lh           t4, -2(sp)
                  mulhu        a0, sp, s11
                  c.lwsp       a3, 16(sp)
                  sb           s8, -3(sp)
                  c.slli       s6, 31
                  srli         s9, a4, 31
                  lh           a0, -6(sp)
                  remu         t6, tp, a6
                  nop
                  lb           s10, 13(sp)
                  lh           t6, 10(sp)
                  lbu          a1, -9(sp)
                  c.slli       s7, 8
                  c.swsp       t1, 0(sp)
                  mulhsu       s3, a1, s4
                  lh           gp, 14(sp)
                  slli         a1, a1, 14
                  c.addi       s6, -1
                  sltu         t2, zero, s0
                  nop
                  add          a4, zero, t2
                  srai         s1, a2, 25
                  srli         a3, t2, 16
                  lbu          s0, 1(sp)
                  srli         a0, s8, 0
                  c.swsp       tp, 0(sp)
                  sll          a0, s3, sp
                  c.lwsp       s7, 12(sp) #end riscv_load_store_rand_instr_stream_6
                  c.andi       a2, -1
5392:             c.and        s1, s0
                  c.andi       a4, 13
                  slt          t1, s10, gp
                  c.li         s8, 19
                  c.nop
                  slli         s8, t1, 4
                  c.and        a5, a1
                  sub          t0, s5, a1
                  c.lui        s4, 16
                  or           s11, t1, s9
                  or           a2, t4, a4
                  div          t5, a3, zero
                  bne          zero, a7, 5423f
                  c.add        sp, a4
                  rem          s6, a3, sp
                  c.lui        a3, 3
                  bge          t2, a1, 5416f
                  mulh         s9, gp, a5
                  nop
                  c.srai       a0, 4
                  xori         s3, a0, 1153
                  and          a0, gp, s10
                  c.lui        s8, 31
                  mul          s9, s8, t6
5416:             bltu         sp, a4, 5428f
                  addi         t2, s2, -1629
                  lui          s1, 177016
                  c.and        a5, a1
                  blt          s7, ra, 5425f
                  blt          a2, s3, 5437f
                  or           t5, s7, s2
5423:             mul          a3, a2, t6
                  andi         s4, sp, -1138
5425:             ori          s3, s7, 1188
                  andi         s6, s9, 1298
                  c.beqz       s1, 5445f
5428:             c.addi16sp   sp, -16
                  mul          s0, zero, ra
                  sltu         t5, a2, t6
                  c.andi       a2, 31
                  ori          a3, a5, -1630
                  remu         s4, a6, s10
                  blt          a7, s8, 5440f
                  bgeu         s9, s1, 5444f
                  lui          s4, 658283
5437:             auipc        sp, 744224
                  bne          a4, a7, 5453f
                  blt          s5, a1, 5441f
5440:             sub          ra, t2, a7
5441:             sltu         s0, a7, s4
                  srli         t3, s10, 9
                  sub          a4, s10, a6
5444:             c.srai       s0, 28
5445:             mulhsu       s7, s8, a5
                  c.addi4spn   s0, sp, 432
                  ori          a2, s4, 1614
                  srai         s0, t1, 0
                  c.mv         tp, a6
                  c.addi4spn   a5, sp, 800
                  bltu         a5, a2, 5464f
                  c.mv         t5, s6
5453:             c.or         a4, a0
                  slti         t2, t1, -1756
                  slti         ra, s8, 476
                  blt          a6, t0, 5467f
                  c.nop
                  remu         t3, a6, s6
                  slli         t0, t1, 25
                  sltu         a2, s6, s10
                  mulhu        sp, tp, a5
                  andi         t0, a6, 1084
                  c.nop
5464:             nop
                  mulhu        t0, a1, a0
                  rem          a5, s10, s4
5467:             mul          s6, t0, a7
                  sll          t4, s7, s7
                  lui          a0, 954857
                  beq          a1, t5, 5488f
                  c.addi       a4, -1
                  nop
                  sltu         a6, s1, t0
                  andi         a5, t6, 1177
                  bltu         t3, s8, 5484f
                  srl          t4, t4, s3
                  mul          t4, s8, a3
                  c.or         a1, a1
                  sltiu        a3, a4, -1255
                  c.slli       a2, 21
                  ori          a5, t3, 175
                  c.addi       ra, -1
                  beq          s6, s1, 5503f
5484:             c.sub        a4, a1
                  c.addi       s10, 20
                  xori         a3, s3, 1731
                  xori         s0, s5, -294
5488:             rem          s8, s7, a6
                  and          t1, a1, s3
                  c.addi       t4, 19
                  c.andi       a0, 9
                  slli         t1, a1, 28
                  sub          s9, s3, a3
                  c.bnez       a3, 5513f
                  remu         gp, a2, s3
                  c.sub        a3, a5
                  sra          t3, sp, tp
                  rem          s4, a6, t4
                  slti         a5, t6, 389
                  srli         t6, t4, 24
                  mulh         a4, s6, s11
                  add          t4, s0, s8
5503:             mulh         a4, gp, s4
                  addi         s10, a7, 1274
                  xor          a2, tp, t6
                  and          t6, t2, s0
                  nop
                  slli         t3, a5, 23
                  c.beqz       s1, 5516f
                  c.andi       s1, -1
                  rem          s6, a6, a7
                  slti         s3, t2, -1546
5513:             mulhsu       ra, a3, sp
                  c.addi       t5, -1
                  blt          s8, a7, 5517f
                  la           t0, region_1+1422 #start riscv_hazard_instr_stream_14
                  c.andi       a1, -1
                  addi         s9, a1, -1549
                  lui          s9, 479497
                  sb           a2, -4(t0)
                  add          a1, s9, s7
                  sb           s7, 1(t0)
                  lw           s0, 38(t0)
                  mulhsu       s0, s0, a2
                  c.nop
                  lhu          s7, -8(t0)
                  slt          s9, s0, s7
                  lbu          s7, -39(t0)
                  lb           a2, -32(t0)
                  sltu         s0, s6, a2
                  sw           a1, 6(t0)
                  c.xor        a1, a1
                  lhu          a2, 12(t0)
                  lhu          s6, -4(t0)
                  lbu          a1, 42(t0)
                  lhu          s9, -22(t0)
                  c.xor        a1, a2
                  slti         s9, a2, -1003
                  nop
                  lbu          s0, -42(t0)
                  c.lui        s9, 5
                  c.and        s0, a2
                  lb           s0, -20(t0)
                  sub          s6, s7, s6
                  sb           a1, -40(t0)
                  sh           s7, 2(t0)
                  lbu          s9, 24(t0)
                  c.or         a2, a1
                  srli         a2, a1, 3
                  lbu          s7, 9(t0)
                  c.add        a1, a2
                  c.mv         s6, s0
                  lb           a1, -42(t0)
                  div          s6, a1, a1
                  c.srli       s0, 15
                  lhu          a2, 16(t0)
                  lhu          a2, -22(t0)
                  divu         s9, s0, a1
                  sw           s6, 58(t0)
                  slt          s9, a2, s7
                  sb           s7, -1(t0)
                  div          s7, s0, a1
                  slti         s7, s0, 483
                  lbu          s7, -49(t0) #end riscv_hazard_instr_stream_14
5516:             bge          t2, a5, 5527f
5517:             c.and        a0, a0
                  divu         t6, t4, s8
                  sltu         s1, t1, a6
                  c.addi16sp   sp, -16
                  c.bnez       a4, 5533f
                  c.and        a1, a2
                  div          a5, a3, s2
                  sra          t4, t5, s2
                  ori          s9, t2, -866
                  c.slli       s8, 27
5527:             sltu         a4, s8, a6
                  andi         s9, s10, -53
                  c.and        a4, s1
                  c.slli       t5, 21
                  slti         sp, zero, 1036
                  sltu         s3, s6, a1
5533:             c.beqz       s1, 5536f
                  mulh         s9, a4, a1
                  mulhu        a6, s1, s3
5536:             auipc        s4, 991101
                  div          t2, s9, a7
                  srai         a3, t1, 5
                  slt          sp, s7, sp
                  srli         t2, t3, 11
                  nop
                  mulhu        a1, t2, s5
                  mul          s3, s6, a1
                  bge          tp, ra, 5563f
                  mulh         s4, s8, t2
                  ori          s6, a6, -498
                  srl          gp, s9, s4
                  mulh         t5, t1, t5
                  sltu         s10, tp, s3
                  c.bnez       a0, 5563f
                  c.addi       gp, 1
                  c.sub        s1, s1
                  slli         zero, t6, 17
                  c.mv         t3, a4
                  c.mv         s10, s4
                  la           s10, amo_0+36 #start riscv_lr_sc_instr_stream_7
                  lr.w.rl       t2, (s10)
                  sc.w.rl       t5, t4, (s10) #end riscv_lr_sc_instr_stream_7
                  c.or         a0, s1
                  bltu         s9, s11, 5559f
                  add          a1, a0, tp
5559:             c.addi4spn   s1, sp, 336
                  c.li         s4, -1
                  slt          t6, s3, s7
                  c.bnez       s0, 5563f
5563:             srli         a2, a3, 17
                  lw           ra, 4(s5)
                  c.addi       a4, 14
                  mulhu        s11, a0, t0
                  addi         s5, s5, 60
                  slli         s8, zero, 5
                  mulhsu       t6, s10, a2
                  sll          gp, s4, t2
9909:             addi x28, x1, 1
9909:             c.jr x28
sub_3:            rem          a5, s7, a2
                  auipc        a3, 887151
                  blt          a1, a6, sub_3_stack_p
                  sll          a6, a3, s1
sub_3_stack_p:    addi         s5, s5, -64
                  c.and        a4, a3
                  mulh         t5, s6, a0
                  sw           ra, 4(s5)
                  addi         a1, a7, -1273
                  la           sp, region_1+1252 #start riscv_load_store_hazard_instr_stream_1
                  sb           s5, 118(sp)
                  lb           gp, 118(sp)
                  lhu          s3, 118(sp)
                  c.mv         s9, t3
                  lhu          s9, -162(sp)
                  lbu          t6, -162(sp)
                  sh           a6, -162(sp)
                  slti         s6, s2, 1104
                  lb           a5, -15(sp)
                  lb           ra, -23(sp)
                  c.mv         s4, a7
                  and          s9, s5, ra
                  sb           t1, -23(sp)
                  lh           s4, 230(sp)
                  sb           a5, 122(sp)
                  c.srai       a0, 21
                  sh           s0, 206(sp)
                  sh           a2, -152(sp)
                  sh           tp, 110(sp)
                  c.mv         a3, s10
                  lbu          a6, -96(sp)
                  lb           t0, -249(sp)
                  c.li         s7, -1
                  sb           s0, 178(sp) #end riscv_load_store_hazard_instr_stream_1
                  la           s1, region_1+149 #start load_store_instr_stream_1
                  la           t1, region_1+1900 #start load_store_instr_stream_2
                  lhu          s4, 501(s1)
                  sb           s8, -169(t1)
                  la           tp, region_1+1547 #start load_store_instr_stream_0
                  lh           t5, 431(s1)
                  sb           ra, 19(t1)
                  lbu          s10, 1512(s1)
                  sb           gp, 44(t1)
                  lbu          s9, -8(tp)
                  sw           a7, -11(tp)
                  lbu          t3, 995(s1)
                  lh           s9, 1681(s1)
                  lb           sp, 16(tp)
                  lhu          s10, 5(tp)
                  lbu          a5, -105(t1)
                  lb           t5, 12(tp)
                  lhu          s8, 80(t1)
                  lb           s6, 1714(s1)
                  lb           s7, 4(t1)
                  lh           s9, 1263(s1)
                  lbu          a2, -235(t1)
                  lb           a1, -119(t1)
                  sb           s4, 11(tp)
                  sh           s7, -7(tp)
                  lb           s7, -8(t1) #end load_store_instr_stream_2
                  lbu          a5, 1578(s1) #end load_store_instr_stream_1
                  lbu          s3, 14(tp)
                  lhu          a1, 7(tp)
                  lh           a5, 13(tp) #end load_store_instr_stream_0
sub_3_5:          jal          ra, 11f
0:                jal          t6, 2f
1:                c.j          13f
2:                jal          s10, 7f
3:                c.jal        8f
4:                c.j          1b
5:                jal          t0, 6f
6:                c.jal        12f
7:                c.jal        5b
8:                jal          s11, 0b
9:                c.j          4b
10:               c.j          9b
11:               jal          t1, 3b
12:               c.jal        10b
13:               c.jal        14f
14:               mulhsu       s4, t4, a6
                  addi         t6, zero, 5 #init loop 1 counter
                  or           t3, zero, a6
                  srli         s1, t4, 22
                  and          gp, s0, a3
                  c.sub        a2, a3
                  andi         t1, s10, -240
                  addi         a1, zero, 7 #init loop 1 limit
                  divu         t5, gp, s10
sub_3_11_1_t:     c.mv         s4, gp
                  addi         t6, t6, 2 #update loop 1 counter
                  c.andi       a0, -1
                  srli         tp, gp, 12
                  addi         s0, zero, -10 #init loop 0 counter
                  mulhu        a3, s9, a7
                  addi         zero, zero, 0 #init loop 0 limit
                  c.nop
sub_3_11_0_t:     c.addi4spn   a0, sp, 816
                  remu         s10, t4, t3
                  addi         s0, s0, 2 #update loop 0 counter
                  c.or         a4, s1
                  divu         ra, t0, a5
                  c.slli       s3, 29
                  sub          s1, zero, tp
                  c.beqz       s0, sub_3_11_0_t #branch for loop 0
                  bltu         t6, a1, sub_3_11_1_t #branch for loop 1
                  slti         s4, gp, -764
                  la           s6, region_0+963 #start load_store_instr_stream_1
                  la           t2, region_1+1889 #start load_store_instr_stream_0
                  lb           s0, 20(s6)
                  sh           ra, -49(t2)
                  lb           a4, -181(s6)
                  lbu          s3, -209(s6)
                  lb           a0, -8(t2)
                  lb           sp, 52(s6)
                  lb           s7, -32(t2)
                  lbu          a4, -183(s6)
                  lhu          s7, -25(t2)
                  lb           s10, -240(s6)
                  lbu          s8, -6(t2)
                  lb           a1, 34(t2)
                  lbu          tp, -118(s6)
                  lhu          sp, 21(t2)
                  lw           a5, -21(t2)
                  lhu          s3, -55(t2)
                  lbu          s7, -56(s6)
                  lbu          a5, 146(s6) #end load_store_instr_stream_1
                  sb           s2, 16(t2) #end load_store_instr_stream_0
                  la           t4, region_0+206 #start load_store_instr_stream_1
                  lh           sp, 1770(t4)
                  la           s7, region_1+752 #start load_store_instr_stream_0
                  lb           s1, 1203(t4)
                  lbu          a1, 487(t4)
                  sh           zero, 214(t4)
                  lbu          s3, -246(s7)
                  lbu          s8, -117(t4)
                  lh           s8, -8(s7)
                  lb           s0, 557(t4)
                  lbu          a2, 50(s7)
                  lb           t3, 665(t4)
                  sb           a0, 653(t4)
                  sb           s8, 234(t4)
                  sh           s1, -14(s7)
                  lb           a5, 1544(t4) #end load_store_instr_stream_1
                  lw           sp, 48(s7) #end load_store_instr_stream_0
                  la           s9, amo_0+4 #start riscv_lr_sc_instr_stream_0
                  lr.w.aq       a2, (s9)
                  sc.w.rl       a4, a4, (s9) #end riscv_lr_sc_instr_stream_0
                  la           sp, region_0+1489 #start riscv_hazard_instr_stream_0
                  xor          zero, s10, s6
                  sh           s10, 237(sp)
                  sb           zero, -96(sp)
                  sb           zero, 114(sp)
                  sb           a0, -253(sp)
                  lw           a0, 11(sp)
                  nop
                  lw           s6, -57(sp)
                  lb           s10, -90(sp)
                  lb           a1, 168(sp)
                  sltu         a1, a0, s6
                  lbu          s7, -164(sp)
                  c.or         a0, a0
                  mulhsu       s7, s10, s10
                  lui          zero, 732486
                  c.or         a0, a0
                  lb           s7, -121(sp)
                  c.li         s10, 5
                  sh           zero, -153(sp)
                  c.or         a0, a0
                  srl          s10, s7, s7
                  mulhsu       s6, zero, a0
                  lb           s10, -22(sp)
                  sb           a0, 147(sp)
                  lbu          a1, 106(sp)
                  lb           s10, -180(sp)
                  sltu         s7, s7, a1
                  lh           s10, -149(sp)
                  sw           s6, -137(sp)
                  rem          s7, a0, a1
                  lbu          a0, 191(sp)
                  lb           s6, 193(sp)
                  c.addi       s6, 28
                  lh           s7, -119(sp)
                  c.lui        a0, 3
                  lh           s6, -235(sp) #end riscv_hazard_instr_stream_0
                  la           s9, amo_0+28 #start riscv_lr_sc_instr_stream_1
                  c.slli       t2, 28
                  c.lui        s8, 6
                  c.andi       s1, -1
                  c.nop
                  sll          t3, t6, s5
                  c.andi       a1, -1
                  c.li         s8, 22
                  slt          t0, a6, s9
                  rem          a1, s7, s2
                  c.li         s7, 25
                  lr.w.aq       a0, (s9)
                  c.lui        t4, 9
                  sc.w          t0, t1, (s9) #end riscv_lr_sc_instr_stream_1
                  la           a6, amo_0+48 #start riscv_amo_instr_stream_0
                  la           a5, amo_0+8
                  la           a0, amo_0+32
                  la           s0, amo_0+4
                  slt          gp, s5, zero
                  amomin.w      t0, sp, (a6)
                  nop
                  amomaxu.w.aq  t5, a1, (a5)
                  amomaxu.w.rl  tp, a1, (a0)
                  amoswap.w.aq  s4, t1, (a5)
                  amoxor.w      zero, a5, (a6) #end riscv_amo_instr_stream_0
                  la           a5, region_1+258 #start riscv_hazard_instr_stream_1
                  lb           zero, 1085(a5)
                  lbu          a4, -142(a5)
                  sb           zero, 955(a5)
                  mulh         zero, t6, t6
                  c.slli       s11, 25
                  lb           s11, 591(a5)
                  lb           a4, 1674(a5)
                  divu         zero, s8, s8
                  add          s11, t6, t6
                  ori          zero, zero, 1615
                  lb           zero, -61(a5)
                  lb           a4, 1573(a5)
                  mulh         s11, zero, s9
                  sb           t6, 1255(a5)
                  sb           s8, 1332(a5)
                  mulhu        t6, s11, t6
                  c.sub        a4, a4
                  and          s8, s11, t6
                  c.addi       a4, 25
                  c.andi       a4, -1
                  sb           s11, 427(a5)
                  addi         zero, a4, 1530
                  andi         s11, a4, -1552
                  or           s11, t6, zero
                  lui          s8, 338053
                  auipc        zero, 596173
                  srl          zero, s11, s11
                  c.or         a4, a4
                  lb           zero, 1164(a5)
                  lb           zero, 725(a5)
                  lbu          s11, 884(a5)
                  lb           a4, 1195(a5)
                  sub          s11, zero, s8
                  sb           t6, 1077(a5)
                  lb           s11, 942(a5)
                  lw           a4, 554(a5)
                  sra          a4, s9, s8
                  c.sub        a4, a4
                  slti         s11, zero, -254
                  lh           t6, 746(a5)
                  lui          zero, 1004712
                  nop
                  c.sub        a4, a4
                  lb           s11, 303(a5)
                  xori         s8, zero, -712
                  sw           s8, 1530(a5)
                  lhu          s8, 1424(a5)
                  slt          s8, a4, zero
                  lhu          t6, 1566(a5)
                  andi         zero, t6, -827
                  lbu          t6, -5(a5)
                  c.mv         s9, s8
                  lb           a4, 1009(a5)
                  srli         s8, zero, 8
                  lb           t6, 223(a5)
                  sb           a4, 352(a5)
                  sb           s8, -123(a5) #end riscv_hazard_instr_stream_1
                  la           t0, region_0+823 #start riscv_load_store_hazard_instr_stream_0
                  lb           t2, -52(t0)
                  lbu          a2, -52(t0)
                  lb           a6, -52(t0)
                  lhu          s3, 45(t0)
                  sb           s4, -35(t0)
                  sw           t0, -35(t0)
                  sb           t0, -190(t0)
                  lb           s3, -190(t0)
                  lb           a6, -190(t0)
                  sb           t1, 64(t0)
                  lh           t6, -169(t0)
                  lhu          s11, 89(t0)
                  remu         gp, a1, t6
                  lbu          s9, 89(t0)
                  rem          s7, s1, s0
                  lb           a1, 89(t0)
                  slt          t4, a1, a4
                  rem          t3, s2, s8
                  lb           s0, 238(t0)
                  sb           s7, 238(t0)
                  remu         t4, a0, tp
                  lb           t3, 238(t0)
                  sb           s6, 238(t0)
                  sb           ra, 238(t0)
                  lbu          s7, 238(t0) #end riscv_load_store_hazard_instr_stream_0
                  la           sp, region_0+52 #start load_store_instr_stream_2
                  sb           s4, 9(sp)
                  la           a6, region_0+1179 #start load_store_instr_stream_1
                  c.lwsp       a3, 44(sp)
                  la           s10, region_0+1324 #start load_store_instr_stream_0
                  lb           a2, -5(sp)
                  sh           t6, -24(sp)
                  c.swsp       s7, 20(sp)
                  lh           t0, -9(a6)
                  lbu          s6, -45(s10)
                  lbu          t0, -45(sp)
                  sb           s11, -9(s10)
                  sh           t0, -16(sp)
                  lbu          a4, 57(s10)
                  lbu          t5, 6(a6)
                  lb           a0, 2(a6)
                  lb           t5, -7(a6)
                  lbu          a4, 43(sp)
                  lb           t1, 59(s10)
                  lh           s4, -4(s10)
                  lhu          s9, -11(a6) #end load_store_instr_stream_1
                  sh           a0, -62(s10)
                  lb           ra, -53(s10)
                  lb           a4, 62(sp) #end load_store_instr_stream_2
                  lb           s8, 15(s10) #end load_store_instr_stream_0
                  la           s6, region_0+100 #start riscv_load_store_rand_instr_stream_0
                  lhu          a0, 58(s6)
                  c.lui        t3, 9
                  lhu          t2, 62(s6)
                  c.xor        s1, s0
                  slti         a2, s7, -31
                  srli         t1, t2, 20
                  lbu          a2, 11(s6)
                  sll          zero, a0, a0
                  lb           a5, -30(s6)
                  mul          t3, s1, a0
                  mulhsu       a5, ra, tp
                  lbu          s4, 11(s6)
                  lbu          a4, 50(s6)
                  auipc        s1, 267826
                  sw           s2, 56(s6)
                  c.slli       s1, 25
                  sw           s11, 20(s6)
                  sb           sp, -26(s6)
                  c.li         a0, -1
                  c.nop
                  sw           s10, 40(s6)
                  srl          s8, t5, ra
                  sll          t6, a0, t3
                  c.xor        a2, a4
                  lbu          s10, -10(s6)
                  auipc        a1, 490390
                  lb           t5, -56(s6)
                  sltu         s7, s8, s6
                  sh           a5, -52(s6)
                  c.addi       ra, -1
                  lb           tp, -37(s6)
                  lbu          t3, 25(s6)
                  rem          ra, t6, s5
                  slti         s10, s5, 2038
                  c.addi       tp, -1
                  ori          s10, s4, -1901
                  lh           tp, 22(s6)
                  lb           s0, 19(s6)
                  c.addi16sp   sp, -16
                  sltiu        s0, s3, -322
                  lb           t1, 49(s6)
                  lhu          gp, 8(s6)
                  add          t3, s0, t1
                  sb           s10, -9(s6)
                  lb           tp, 13(s6)
                  lhu          a5, 32(s6)
                  nop
                  sw           s10, 0(s6) #end riscv_load_store_rand_instr_stream_0
                  addi         s4, zero, 10 #init loop 1 counter
                  sll          s6, s7, t2
                  slti         tp, s0, 767
                  c.nop
                  addi         t6, zero, 10 #init loop 1 limit
                  c.sub        a4, a3
sub_3_10_1_t:     c.nop
                  mulhu        ra, s6, s2
                  sll          zero, a0, t4
                  auipc        t0, 430613
                  addi         s4, s4, -8 #update loop 1 counter
                  rem          s3, tp, a2
                  andi         gp, s10, 1950
                  c.sub        s0, s0
                  slli         t5, t5, 8
                  addi         s8, zero, 0 #init loop 0 counter
                  c.and        s1, a4
                  addi         s9, zero, 16 #init loop 0 limit
                  c.mv         sp, s2
sub_3_10_0_t:     sltu         a1, t6, tp
                  addi         s8, s8, 4 #update loop 0 counter
                  beq          s8, s9, sub_3_10_0_t #branch for loop 0
                  bgeu         s4, t6, sub_3_10_1_t #branch for loop 1
                  c.add        t5, t6
                  sltiu        s8, t4, -943
                  bne          t0, t4, 14f
                  c.beqz       a2, 8f
                  c.srli       a2, 31
                  nop
                  sltu         s11, s1, s5
                  c.addi4spn   a5, sp, 624
                  xori         zero, s6, 1905
8:                bge          tp, sp, 22f
                  xor          t2, t0, t5
                  div          s11, s9, tp
                  c.andi       a3, 10
                  c.addi4spn   a0, sp, 864
                  bne          sp, t0, 23f
14:               mulhsu       s8, a4, t4
                  slt          s9, s8, a0
                  sltiu        s1, s0, 1302
                  c.nop
                  c.srai       s1, 2
                  xor          t0, s2, s3
                  ori          zero, s0, -633
                  beq          s3, s4, 30f
22:               c.beqz       a1, 23f
23:               srai         t5, t4, 31
                  c.add        a5, ra
                  c.add        ra, a3
                  srai         ra, s3, 18
                  sltiu        s1, s0, -1788
                  sub          s1, t0, tp
                  sltiu        a2, t3, 164
30:               c.addi4spn   s0, sp, 848
                  c.lui        s8, 8
                  mulh         a4, s9, s10
                  c.sub        a5, a5
                  c.beqz       a2, 45f
                  lui          a0, 58889
                  c.addi4spn   a4, sp, 736
                  mulhu        a4, zero, t6
                  slli         a3, s11, 26
                  c.or         a2, a0
                  sll          s1, s2, s5
                  or           s10, t0, s2
                  c.beqz       s0, 60f
                  blt          a4, t3, 61f
                  mulh         a4, s6, sp
45:               sltiu        t3, zero, 331
                  add          s11, s1, t4
                  rem          t2, s5, t5
                  c.mv         a2, ra
                  beq          t2, a4, 69f
                  xor          a6, s3, s2
                  c.lui        s1, 19
                  c.srai       a2, 5
                  bltu         s7, s10, 71f
                  nop
                  sltu         s10, s6, a3
                  andi         s3, s4, 1541
                  sub          s11, gp, a0
                  nop
                  ori          t4, s10, 504
60:               c.nop
61:               xori         s4, t3, 985
                  addi         t1, a1, 387
                  c.slli       sp, 9
                  mul          s1, s7, t0
                  mulh         s3, a5, zero
                  mulh         a2, tp, s3
                  srli         a2, s11, 10
                  xori         t5, t6, 824
69:               srl          a2, ra, s11
                  slti         a1, s8, 675
71:               c.addi       s9, -1
                  beq          a3, t1, 90f
                  lui          a5, 570277
                  bne          t0, t5, 85f
                  mulh         s0, a1, s4
                  lui          a5, 395904
                  c.or         s1, a4
                  srl          t2, a1, s7
                  blt          s9, s10, 89f
                  divu         s7, t2, s3
                  or           t0, a4, s5
                  slti         a4, t0, -128
                  beq          s7, s10, 91f
                  and          a4, tp, a1
85:               c.or         s0, a0
                  addi         s4, a2, 1333
                  sub          s8, a6, s9
                  c.addi4spn   a0, sp, 608
89:               sra          s7, s8, a3
90:               c.li         s0, -1
91:               c.addi       s10, -1
                  remu         s11, t0, s8
                  c.addi       a1, 19
                  rem          s6, t1, gp
                  mulhsu       a4, a0, s2
                  sltiu        a3, s5, -1583
                  c.sub        s0, a4
                  c.bnez       s0, 100f
                  div          a6, a2, a5
100:              bgeu         t4, ra, 105f
                  c.mv         t3, t3
                  and          a5, a1, sp
                  auipc        s1, 425641
                  c.lui        t4, 12
105:              c.nop
                  c.addi16sp   sp, -16
                  c.or         a1, s1
                  xori         s7, t2, -1776
                  xori         s0, s3, -1871
                  bge          a4, t5, 125f
                  mulh         s8, s1, a1
                  c.andi       a1, 31
                  xori         a5, s2, 452
                  c.sub        a1, s0
                  sra          s0, a7, s2
                  srli         s6, gp, 24
                  c.xor        a2, s1
                  div          zero, s11, t1
                  c.slli       tp, 7
                  xor          gp, s0, a2
                  c.and        s1, a3
                  bgeu         s3, s11, 140f
                  c.bnez       a2, 133f
                  sltiu        a1, t4, 1646
125:              xor          ra, s6, s6
                  c.slli       t6, 9
                  bgeu         a2, zero, 137f
                  blt          t4, a6, 140f
                  xori         a3, a0, -682
                  c.slli       t4, 15
                  c.addi       a3, -1
                  c.li         a0, 0
133:              mulhu        t3, t5, s11
                  c.addi4spn   s1, sp, 128
                  c.srai       a0, 7
                  rem          t1, t2, a7
137:              c.lui        ra, 23
                  c.xor        a5, a2
                  c.addi16sp   sp, 240
140:              lui          s6, 776107
                  divu         s3, s1, gp
                  slti         t2, t1, -1947
                  bltu         t4, a2, 152f
                  sub          a1, t2, t1
                  c.and        a1, a5
                  c.srli       a0, 12
                  c.addi       t0, -1
                  c.xor        a1, a0
                  c.addi4spn   a5, sp, 128
                  auipc        a6, 535736
                  bltu         t2, t0, 152f
152:              mulh         a1, s2, a0
                  c.beqz       a0, 170f
                  c.addi       s8, 9
                  bge          s8, s1, 175f
                  c.srai       a3, 6
                  c.addi4spn   a2, sp, 352
                  rem          sp, a0, a6
                  sltu         t3, t2, t0
                  divu         a5, a6, tp
                  sub          s1, a5, s10
                  c.and        a0, a4
                  c.addi4spn   s0, sp, 304
                  addi         a6, t6, 837
                  srli         s10, s3, 1
                  bge          s3, t6, 168f
                  bgeu         a4, sp, 178f
168:              c.srai       a4, 7
                  mulhu        a4, a3, a7
170:              rem          gp, s8, t6
                  divu         t0, gp, t6
                  xori         t3, s2, 1616
                  mulhsu       s11, s10, a4
                  and          t1, t6, a5
175:              c.andi       s0, 12
                  lui          s8, 644423
                  mulhu        a5, s4, s9
178:              c.slli       s4, 22
                  xori         gp, ra, -287
                  c.addi16sp   sp, 32
                  xor          a0, s10, s4
                  srai         t3, gp, 22
                  bne          a7, a4, 197f
                  andi         sp, a2, -4
                  blt          t5, s9, 187f
                  srl          t5, sp, s7
187:              rem          t2, s5, sp
                  c.srli       s1, 19
                  bgeu         s10, s7, 191f
                  lui          t0, 884117
191:              c.li         a2, -1
                  slli         t2, s1, 28
                  sra          s11, a7, s1
                  div          s0, s0, s4
                  div          t3, s2, a7
                  c.slli       s1, 4
197:              c.srai       a0, 9
                  c.bnez       a4, 212f
                  mulhu        t1, s11, s7
                  c.srli       a3, 28
                  andi         s6, gp, -1438
                  divu         s9, s1, t3
                  nop
                  sll          a3, zero, s2
                  c.addi4spn   a4, sp, 368
                  c.nop
                  mulh         s0, a3, s9
                  c.and        a5, a0
                  c.bnez       s1, 222f
                  remu         s10, zero, s9
                  srl          s8, s4, a6
212:              sub          t6, s5, a6
                  slti         s6, a7, -1249
                  slti         a0, s10, 1216
                  bltu         s7, t5, 233f
                  sll          t3, s5, s2
                  mulh         s1, s11, a7
                  la           s11, region_0+112 #start riscv_load_store_rand_instr_stream_1
                  srai         s7, a2, 0
                  c.addi4spn   a0, sp, 272
                  sb           zero, 41(s11)
                  sb           a1, -62(s11)
                  rem          t5, a2, a1
                  slt          t1, s5, s7
                  slti         t5, t0, -1986
                  c.or         a2, a1
                  lbu          s4, 14(s11)
                  c.addi4spn   a5, sp, 192
                  xori         t5, a5, 1551
                  c.addi16sp   sp, 448
                  c.andi       s0, 17
                  lhu          t4, -20(s11)
                  c.andi       a1, 16
                  lbu          s3, -31(s11)
                  lbu          a4, -21(s11)
                  lb           t3, 19(s11)
                  sltu         s1, gp, t4
                  lhu          s9, -10(s11)
                  lh           sp, 26(s11)
                  sb           s9, 51(s11)
                  c.mv         ra, s9
                  lbu          t1, -57(s11)
                  lbu          t1, 45(s11)
                  mulhu        s9, ra, s8
                  c.xor        a0, s1
                  lb           s7, -21(s11)
                  c.xor        a0, s0
                  sra          s0, sp, a7
                  lbu          s8, 42(s11)
                  mulh         t2, t4, s11
                  nop
                  auipc        t2, 618951
                  lb           t1, -14(s11) #end riscv_load_store_rand_instr_stream_1
                  bge          s10, a0, 229f
                  c.slli       s9, 1
                  c.and        a0, a1
                  mulhu        t5, t3, s10
222:              sll          s10, a2, s9
                  addi         s0, a1, 836
                  srai         t6, s4, 9
                  slli         t6, s10, 27
                  mulh         s7, s11, a5
                  slt          t6, sp, s11
                  mulhu        zero, s7, zero
229:              c.lui        a0, 21
                  ori          gp, a0, -1880
                  auipc        ra, 435445
                  srl          t4, t2, a6
233:              bgeu         ra, s4, 238f
                  c.lui        t6, 17
                  lui          s6, 402033
                  c.nop
                  srli         t2, t4, 26
238:              c.addi4spn   a4, sp, 528
                  c.li         s11, 4
                  c.srai       a0, 1
                  c.xor        a4, a3
                  c.slli       s10, 30
                  slti         zero, a2, -204
                  c.or         s1, a5
                  c.add        ra, a1
                  beq          s5, s6, 266f
                  mulhsu       s10, s9, s2
                  c.sub        a3, a1
                  divu         t0, sp, s9
                  nop
                  rem          s10, s6, s2
                  c.nop
                  bne          tp, s11, 255f
                  srli         a3, t3, 3
255:              srli         t0, t4, 31
                  blt          t3, tp, 274f
                  blt          a1, a2, 267f
                  srai         s8, a2, 11
                  c.and        a5, s1
                  bgeu         s8, t4, 272f
                  mulhsu       s6, zero, a6
                  addi         s3, a3, 121
                  xori         ra, tp, 218
                  c.or         s0, a1
                  div          tp, t0, s7
266:              srai         t0, a3, 3
267:              blt          a7, t6, 268f
268:              c.andi       a5, 16
                  sra          t6, a5, a0
                  xor          t1, s6, t3
                  mulh         t6, s0, s4
272:              ori          tp, t3, 1151
                  auipc        zero, 712611
274:              bge          s1, s4, 283f
                  mul          a1, t0, t3
                  c.mv         t2, s10
                  sltu         s6, s11, t6
                  c.sub        s1, s1
                  sltiu        zero, t6, 161
                  c.or         a2, a0
                  bne          s5, s9, 295f
                  mulhsu       s8, s2, s5
283:              c.andi       a2, 26
                  srl          a2, gp, t2
                  bltu         zero, s7, 296f
                  srl          t2, a0, s6
                  c.addi16sp   sp, 272
                  c.bnez       a4, 289f
289:              mulhsu       a1, t2, s10
                  sub          a1, s0, t5
                  sra          a4, a3, a4
                  srli         t0, t1, 10
                  c.beqz       a2, 304f
                  mulhsu       t4, s8, a2
295:              mulh         s10, t3, s2
296:              sll          s11, t5, t5
                  slli         t5, s0, 3
                  c.xor        a5, a0
                  srai         zero, sp, 4
                  bge          a1, a7, 318f
                  beq          tp, s8, 318f
                  div          gp, s0, t2
                  bge          t5, s6, 313f
304:              mul          s9, t0, t3
                  c.srli       a3, 12
                  c.nop
                  c.sub        a5, s1
                  ori          tp, t2, 729
                  c.srai       s1, 12
                  srli         a2, t2, 14
                  sra          a3, t3, a7
                  lui          s6, 398076
313:              c.srli       a0, 30
                  beq          ra, s7, 334f
                  rem          t5, t3, sp
                  c.and        s1, a5
                  mulhu        a1, t4, s4
318:              slt          s4, a1, t3
                  c.lui        t4, 18
                  blt          a5, t1, 338f
                  ori          t5, s9, -1060
                  xor          s9, s7, s2
                  div          t3, t5, s5
                  mulh         t2, ra, s9
                  c.addi16sp   sp, -16
                  slti         a5, t0, 1721
                  c.sub        a4, a1
                  mulhsu       s4, ra, a7
                  andi         t0, s4, 1814
                  div          a4, t3, t1
                  bltu         a6, s9, 337f
                  beq          s1, t1, 341f
                  and          t1, a1, a5
334:              beq          sp, s10, 349f
                  bltu         a3, t0, 337f
                  xori         t4, a1, 1156
337:              slti         t4, s2, 1836
338:              bne          s6, s9, 346f
                  mul          a5, tp, t6
                  slli         s10, t5, 18
341:              srli         gp, ra, 11
                  rem          t4, s0, zero
                  bltu         t4, a4, 353f
                  c.add        a4, tp
                  c.sub        a0, a5
346:              mulhsu       t2, s3, s1
                  mulh         s9, s1, s6
                  bne          t1, ra, 366f
349:              sltu         a1, sp, a7
                  sll          ra, s2, a1
                  c.addi       sp, -1
                  ori          t6, a4, -1652
353:              c.mv         a4, tp
                  sub          s9, s10, t4
                  c.li         s6, -1
                  c.slli       s10, 21
                  srli         s11, ra, 5
                  and          a0, s10, s10
                  c.addi16sp   sp, -16
                  c.or         a5, a3
                  mulh         a4, t2, s9
                  divu         s8, s10, s1
                  c.add        gp, a5
                  remu         a0, t3, a6
                  div          a1, s0, s4
366:              ori          ra, sp, 270
                  sltu         t3, tp, a7
                  addi         s9, a6, 1908
                  c.bnez       a5, 379f
                  remu         a0, gp, t3
                  c.slli       a5, 23
                  slli         a2, ra, 24
                  c.sub        a0, a1
                  srai         t6, ra, 26
                  c.add        a3, t5
                  c.xor        a1, a2
                  auipc        zero, 55106
                  c.bnez       a3, 396f
379:              sra          s8, tp, t3
                  ori          s0, s2, -546
                  divu         t4, s4, s6
                  blt          a7, tp, 402f
                  mulh         t3, t5, ra
                  srl          a6, a4, s9
                  mul          s8, s6, a4
                  c.slli       gp, 23
                  bltu         s11, s11, 397f
                  c.mv         tp, a0
                  c.bnez       s1, 407f
                  ori          a3, gp, 772
                  c.mv         a4, a1
                  c.add        a6, s9
                  c.srli       a1, 9
                  div          s1, s11, zero
                  bge          s6, s10, 401f
396:              rem          t2, t1, s0
397:              sltu         t0, a7, gp
                  c.beqz       a1, 408f
                  lui          a4, 863266
                  c.xor        s1, a5
401:              slti         t5, s11, 1632
402:              c.and        s1, a4
                  lui          a2, 196160
                  ori          t1, s7, 1777
                  srli         sp, t3, 13
                  c.addi       t3, -1
407:              mulh         zero, a1, ra
408:              div          a2, t1, s6
                  c.mv         s7, gp
                  xor          t5, sp, a6
                  mulhsu       a4, s10, s6
                  c.srai       s0, 24
                  c.xor        a2, a4
                  slti         a4, a1, 70
                  c.addi       a1, 24
                  c.nop
                  mul          zero, a6, s5
                  c.add        s10, a5
                  srl          tp, ra, zero
sub_3_4:          jal          ra, 6f
0:                c.j          2f
1:                jal          t1, 11f
2:                c.jal        8f
3:                jal          tp, 4f
4:                c.j          0b
5:                c.j          10f
6:                c.j          7f
7:                c.j          3b
8:                jal          t1, 5b
9:                jal          ra, 1b
10:               jal          ra, 9b
11:               c.lui        a1, 8
                  c.and        a1, s0
                  c.nop
                  div          a0, t0, gp
                  c.andi       a0, -1
                  c.addi       s4, 23
                  mulh         a1, s8, a3
                  mulhu        t6, a1, t1
                  c.srli       s0, 28
                  add          a5, a1, ra
                  beq          t4, a7, 431f
                  xor          ra, s6, s9
431:              bne          a0, s11, 432f
432:              blt          a5, zero, 450f
                  xori         s9, zero, 1369
                  nop
                  mul          a0, a1, s0
                  beq          s11, s3, 437f
437:              c.slli       a5, 21
                  mulh         s4, a0, s10
                  mulhu        t1, t5, s9
                  sltu         zero, s5, s7
                  mulhsu       s11, gp, s2
                  c.sub        a3, a4
                  c.beqz       s1, 460f
                  sltu         zero, a7, s5
                  ori          t6, s2, 1970
                  bge          s5, zero, 455f
                  beq          sp, t6, 455f
                  c.li         t3, -1
                  sltiu        s1, s10, -32
450:              mulhsu       s7, tp, t4
                  sll          a4, s0, t5
                  c.add        t1, t4
                  andi         t1, a5, -1638
                  sltiu        s7, s8, -1183
455:              c.addi4spn   a4, sp, 368
                  c.addi       t6, 18
                  srl          s1, a6, gp
                  rem          s8, sp, s6
                  c.srai       a0, 13
460:              slt          ra, t6, zero
                  slti         ra, s10, 641
                  c.xor        a4, a5
                  and          a6, t5, t2
                  auipc        sp, 930085
                  c.nop
                  sltiu        a1, s9, -1435
                  c.or         s0, a0
                  c.li         t1, 14
                  slti         s0, t1, 1177
                  nop
                  srli         s0, s4, 2
                  c.bnez       a3, 484f
                  mulh         t0, zero, s5
                  c.lui        s9, 25
                  andi         t6, s7, 869
                  c.add        a2, a4
                  mul          s6, a1, s4
                  c.li         s9, 24
                  xori         s3, a1, -1253
                  srai         a1, a1, 11
                  c.lui        t1, 9
                  auipc        a3, 217980
                  sll          s11, s9, t3
484:              auipc        t2, 680143
                  sltiu        s10, t4, 1482
                  srli         a1, s1, 23
                  c.or         a3, a5
                  c.srai       s1, 28
                  c.or         s0, a3
                  xori         a2, s10, 828
                  c.lui        s6, 17
                  c.nop
                  xor          s10, s11, t5
                  c.srai       a2, 16
                  slti         gp, t5, -205
                  divu         s9, a1, s7
                  sll          t3, s10, t2
                  andi         s7, t4, 900
                  sub          s9, a2, s8
                  auipc        a3, 824898
                  andi         a2, s1, -1901
                  xori         a5, s6, -1890
                  c.addi4spn   a4, sp, 912
                  mulhu        tp, sp, a5
                  srli         s7, a1, 6
                  c.bnez       a4, 511f
                  c.li         t1, 7
                  auipc        s10, 214001
                  sltiu        a1, s6, -1250
                  bne          s0, s7, 523f
511:              nop
                  mul          a0, zero, t2
                  c.addi       a4, 4
                  lui          gp, 1004248
                  nop
                  remu         a5, sp, a3
                  slti         s7, s1, 1065
                  or           s4, a1, a1
                  bgeu         t4, a3, 534f
                  c.xor        s0, a2
                  rem          t1, s4, t6
                  sltiu        gp, s5, 770
523:              c.li         s0, -1
                  andi         a4, tp, -1653
                  c.xor        a5, a2
                  c.andi       a3, 5
                  or           t4, t2, s5
                  bge          a5, a0, 537f
                  c.addi       tp, 19
                  slti         s4, s6, -593
                  srai         s11, tp, 27
                  addi         a0, t2, -1340
                  bne          s8, s11, 551f
534:              slli         t0, s11, 22
                  c.add        tp, ra
                  sll          sp, tp, sp
537:              mulhu        s4, zero, s3
                  mulh         s8, gp, a6
                  lui          sp, 99217
                  mulhsu       tp, t3, a7
                  c.xor        a2, a1
                  c.addi16sp   sp, 272
                  xori         s11, gp, -608
                  c.beqz       a2, 546f
                  nop
546:              xori         s3, a7, 1424
                  auipc        a0, 123167
                  mulhu        s10, s3, sp
                  mul          tp, t4, tp
                  mulhu        a5, s1, s3
551:              mulhu        s0, a1, a1
                  mulh         t6, a5, t2
                  slti         a1, s5, 593
                  bge          t0, a7, 564f
                  c.or         s0, a1
                  srli         t3, t6, 10
                  mulh         tp, s2, s6
                  c.nop
                  ori          a2, a1, -1816
                  andi         a4, t1, -1034
                  add          s4, t5, s10
                  sub          s7, s1, s8
                  srai         t0, ra, 28
564:              slli         s4, t0, 19
                  c.addi4spn   a3, sp, 80
                  c.andi       a2, -1
                  beq          gp, s8, 577f
                  sltiu        a3, a1, -1578
                  or           a5, a4, s8
                  remu         gp, a0, s11
                  mulhu        s8, s6, t3
                  sltu         t1, s7, s3
                  add          a4, s0, s7
                  slti         s0, s11, 2030
                  nop
                  c.mv         a6, a0
577:              c.sub        a5, s1
                  c.or         a4, a0
                  or           t2, a3, ra
                  divu         t0, gp, s2
                  bltu         a7, s6, 601f
                  sra          a2, tp, s10
                  sra          t1, t4, s4
                  slt          s10, a0, a3
                  sra          zero, s6, t4
                  slti         a5, s9, 1546
                  add          s7, ra, a7
                  c.andi       a3, -1
                  bne          s7, gp, 603f
                  c.bnez       a5, 601f
                  c.li         s6, -1
                  c.mv         t1, ra
                  sll          t1, s1, a6
                  addi         gp, a4, -1543
                  c.add        s8, t5
                  andi         sp, t3, -1915
                  nop
                  c.beqz       a1, 612f
                  add          a2, s7, s2
                  addi         s4, s2, -1696
601:              c.addi       t6, -1
                  c.addi4spn   a0, sp, 592
603:              mulhu        s9, s7, t4
                  la           sp, amo_0+60 #start riscv_amo_instr_stream_1
                  la           t3, amo_0+44
                  c.slli       a4, 24
                  mulhsu       s6, a7, a5
                  amomax.w      t2, s11, (t3)
                  amoadd.w      a0, ra, (t3)
                  amominu.w     ra, a0, (t3)
                  amomax.w.rl   t6, t4, (t3)
                  andi         t1, t2, -1138
                  amoxor.w      s0, a3, (sp)
                  c.slli       a3, 21
                  amomin.w.rl   s10, sp, (t3) #end riscv_amo_instr_stream_1
                  lui          gp, 1022311
                  srli         t0, s8, 13
                  c.nop
                  c.bnez       s0, 609f
                  c.addi       a3, 12
609:              c.xor        a3, a5
                  slti         a2, a4, -1144
                  c.srli       a1, 1
612:              or           s0, a2, t1
                  add          ra, t2, a7
                  c.addi4spn   a2, sp, 576
                  auipc        s6, 91786
                  mulh         zero, s0, a0
                  nop
                  mulhu        t1, a4, s2
                  rem          ra, ra, t4
                  sltu         a4, s4, s6
                  sub          a2, a5, t5
                  or           sp, t1, s11
                  bltu         ra, t2, 634f
                  sra          a0, t2, t0
                  andi         a3, s1, -1926
                  c.beqz       s0, 637f
                  slli         a1, a7, 28
                  c.mv         s10, s6
                  c.addi       a6, -1
                  c.xor        s0, a1
                  c.andi       a3, -1
                  addi         s3, gp, -748
                  c.li         a3, -1
634:              bne          tp, a0, 652f
                  srli         a3, a7, 17
                  div          a3, a3, a4
637:              srli         s0, zero, 18
                  bgeu         sp, s7, 647f
                  mul          s0, a3, a1
                  andi         a3, a4, 1637
                  srl          tp, t2, t5
                  mulh         s9, sp, s11
                  mulh         a3, ra, s6
                  c.beqz       s0, 662f
                  c.slli       s3, 21
                  xor          a2, a7, a7
647:              sltiu        t2, ra, -779
                  c.mv         s7, a5
                  slt          t5, zero, ra
                  c.andi       a2, 6
                  c.lui        gp, 21
652:              beq          sp, t0, 658f
                  c.sub        a5, a1
                  c.slli       s9, 17
                  blt          a4, s11, 656f
656:              sltiu        t3, sp, -408
                  c.srai       a4, 9
658:              remu         ra, s11, a6
                  bltu         gp, zero, 660f
660:              remu         t3, zero, s7
                  c.addi16sp   sp, 368
662:              sub          a0, ra, t4
                  mulh         a0, t0, ra
                  c.addi4spn   a2, sp, 960
                  xor          s1, s3, s10
                  auipc        gp, 565356
                  srli         t0, ra, 5
                  slt          t0, s9, s6
                  c.beqz       s0, 687f
                  xori         s0, t2, -9
                  mulhsu       s10, t3, s0
                  addi         s1, s11, 439
                  blt          tp, tp, 675f
                  srai         a3, s0, 30
675:              remu         a3, t4, a2
                  divu         a6, sp, s0
                  slt          tp, a7, t1
                  rem          s1, s0, s0
                  c.add        sp, a6
                  c.sub        a3, a2
                  ori          s11, s3, 306
                  c.addi4spn   a3, sp, 272
                  addi         s9, a4, 1099
                  slli         a0, s3, 8
                  sub          t6, zero, t4
                  addi         a4, s8, -1159
687:              srli         s7, s8, 23
                  c.mv         gp, s7
                  sra          t2, t5, ra
                  c.lui        a2, 4
                  addi         t6, t1, -1671
                  mulhu        ra, s2, a1
                  mulhu        a2, s1, s6
                  c.addi16sp   sp, 240
                  c.bnez       a4, 713f
                  c.addi16sp   sp, -16
                  slti         t2, a1, 1502
                  c.li         t0, 5
                  mulhsu       zero, s10, a0
                  srli         t5, s6, 4
                  c.add        t0, s9
                  div          a1, a5, a2
                  remu         s1, sp, t6
                  ori          a2, t2, -487
                  or           t6, t6, a7
                  c.srai       a3, 15
                  c.and        a5, a5
                  addi         a0, ra, -1343
                  slt          zero, s7, a0
                  bge          t1, a4, 712f
                  c.xor        a5, a2
712:              c.beqz       a1, 719f
713:              slti         s10, ra, 1823
                  sltu         a0, s2, s4
                  lui          a3, 904280
                  andi         zero, t4, 230
                  bgeu         s0, a6, 719f
                  c.mv         a6, s10
719:              mulh         t5, t5, s1
                  c.addi       a1, -1
                  c.xor        a5, a4
                  rem          a3, t6, s3
                  c.lui        s3, 28
                  c.li         sp, -1
                  lw           ra, 4(s5)
                  xori         t2, a2, 855
                  slti         t4, s11, 1375
                  addi         s5, s5, 64
                  slt          s3, a7, a1
                  c.add        s1, t6
1183:             addi x10, x1, 0
1183:             jalr x10, x10, 0
sub_1:            blt          s2, s7, sub_1_stack_p
                  c.nop
sub_1_stack_p:    addi         s5, s5, -36
                  c.xor        a1, a0
                  c.add        s10, s4
                  c.or         a0, s0
                  and          a6, s0, s11
                  sw           ra, 4(s5)
                  xori         a5, s9, 397
                  xor          t4, t5, t2
                  remu         a4, s1, a7
                  xor          a3, a1, s10
                  sltiu        s11, a2, 1651
                  la           s10, sub_4
                  addi         s10, s10, 1
                  mulhsu       ra, t6, s6
                  c.or         a3, a3
                  sll          a1, s9, tp
                  sll          s7, s0, t5
                  srai         a1, s10, 3
                  add          a2, s9, zero
                  bge          a5, t1, sub_1_j2 #branch to jump instr
                  slti         t0, a2, 1654
sub_1_j2:         c.jalr       s10 #jump sub_1 -> sub_4
                  or           a1, s2, s9
                  c.andi       a5, 8
                  c.or         a1, a0
                  c.andi       s1, 19
                  sltiu        t0, s3, -1270
                  la           t6, sub_3
                  addi         t6, t6, 1
                  c.add        s11, t3
                  nop
sub_1_j3:         c.jalr       t6 #jump sub_1 -> sub_3
                  c.xor        a1, a1
                  la           s6, sub_2
                  c.and        a3, a4
                  addi         s6, s6, 1
                  c.addi4spn   s1, sp, 16
                  bge          gp, t4, sub_1_j4 #branch to jump instr
                  sra          t6, s10, t2
                  rem          t5, s5, t1
                  c.addi4spn   a5, sp, 848
sub_1_j4:         c.jalr       s6 #jump sub_1 -> sub_2
                  c.mv         s11, s5
                  c.addi       t6, -1
                  xori         s0, s1, -964
                  c.nop
                  add          s3, t6, t1
                  mul          gp, a5, a2
                  la           s10, sub_5
                  addi         s10, s10, 1
                  c.add        t6, a5
                  xor          s11, s4, a2
sub_1_j5:         c.jalr       s10 #jump sub_1 -> sub_5
                  c.li         s3, -1
                  c.lui        s7, 31
                  sltiu        a3, s1, 1155
                  div          gp, zero, t6
                  c.beqz       a5, 20f
                  sll          a6, gp, t0
                  div          ra, t0, s6
                  beq          s1, t3, 20f
                  c.or         s0, a3
                  div          s3, s4, s9
                  c.beqz       a4, 17f
                  ori          ra, a7, 1350
                  srl          ra, t4, tp
                  c.slli       a2, 23
                  c.slli       s6, 2
                  c.srli       a4, 7
                  sra          a2, sp, t2
17:               bge          a0, zero, 33f
                  sll          gp, s11, s3
                  sltiu        s4, a6, -1785
20:               srai         s7, s1, 5
                  blt          s5, t3, 36f
                  sltu         t5, sp, s10
                  remu         a4, a3, s9
                  and          a1, s0, t0
                  c.nop
                  sub          t0, t1, t3
                  xor          s8, s2, zero
                  sll          ra, gp, tp
                  c.addi       s11, -1
                  sub          s11, t0, s8
                  c.lui        s3, 21
                  mulh         s11, t6, a7
33:               c.bnez       a2, 49f
                  remu         tp, t6, gp
                  c.or         a0, s0
36:               c.sub        s1, s0
                  mulh         t4, s6, ra
                  c.addi       a0, -1
                  c.add        a6, s8
                  bne          a2, a7, 50f
                  sltiu        s8, a7, -1746
                  bgeu         gp, a5, 49f
                  rem          a6, s4, s6
                  blt          a5, a1, 62f
                  c.sub        s0, a2
                  mulhu        s4, s9, s9
                  div          zero, s0, t1
                  c.mv         s10, gp
49:               c.andi       s1, -1
50:               c.add        a6, s9
                  or           s7, s9, s0
                  c.addi4spn   a2, sp, 992
                  blt          a0, a0, 71f
                  bltu         zero, a4, 68f
                  mulhsu       t5, s3, s0
                  auipc        t1, 948492
                  c.slli       gp, 14
                  sll          gp, s4, a0
                  c.sub        a1, a4
                  xori         a4, t5, 839
                  mul          a0, sp, s7
62:               auipc        a5, 396637
                  slti         t3, zero, -1469
                  sltu         t5, t2, a0
                  lui          s9, 355847
                  mulhu        s11, t5, s4
                  c.beqz       a2, 75f
68:               c.bnez       a3, 76f
                  add          s1, s1, s0
                  remu         s0, s7, t2
71:               add          s10, t4, a6
                  slt          a6, zero, a1
                  xor          s1, a4, s10
                  c.srli       a1, 25
75:               remu         sp, s3, s11
76:               sltiu        a2, s6, -753
                  c.addi4spn   a0, sp, 64
                  c.xor        a3, a5
                  lw           ra, 4(s5)
                  addi         s5, s5, 36
                  c.srli       a2, 3
                  c.li         gp, 4
                  c.sub        a5, a1
139:              addi x31, x1, 1
139:              c.jalr x31
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
                  csrr x4, 0x300 # MSTATUS
                  csrr x4, 0x342 # MCAUSE
                  srli x4, x4, 31
                  bne x4, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x4, 0x341 # MEPC
                  csrr x4, 0x342 # MCAUSE
                  li x23, 0x3 # BREAKPOINT
                  beq x4, x23, ebreak_handler
                  li x23, 0x8 # ECALL_UMODE
                  beq x4, x23, ecall_handler
                  li x23, 0x9 # ECALL_SMODE
                  beq x4, x23, ecall_handler
                  li x23, 0xb # ECALL_MMODE
                  beq x4, x23, ecall_handler
                  li x23, 0x1
                  beq x4, x23, instr_fault_handler
                  li x23, 0x5
                  beq x4, x23, load_fault_handler
                  li x23, 0x7
                  beq x4, x23, store_fault_handler
                  li x23, 0xc
                  beq x4, x23, pt_fault_handler
                  li x23, 0xd
                  beq x4, x23, pt_fault_handler
                  li x23, 0xf
                  beq x4, x23, pt_fault_handler
                  li x23, 0x2 # ILLEGAL_INSTRUCTION
                  beq x4, x23, illegal_instr_handler
                  csrr x23, 0x343 # MTVAL
                  1: la x17, test_done
                  jalr x1, x17, 0

ecall_handler:    
                  la x4, _start
                  sw x0, 0(x4)
                  sw x1, 4(x4)
                  sw x2, 8(x4)
                  sw x3, 12(x4)
                  sw x4, 16(x4)
                  sw x5, 20(x4)
                  sw x6, 24(x4)
                  sw x7, 28(x4)
                  sw x8, 32(x4)
                  sw x9, 36(x4)
                  sw x10, 40(x4)
                  sw x11, 44(x4)
                  sw x12, 48(x4)
                  sw x13, 52(x4)
                  sw x14, 56(x4)
                  sw x15, 60(x4)
                  sw x16, 64(x4)
                  sw x17, 68(x4)
                  sw x18, 72(x4)
                  sw x19, 76(x4)
                  sw x20, 80(x4)
                  sw x21, 84(x4)
                  sw x22, 88(x4)
                  sw x23, 92(x4)
                  sw x24, 96(x4)
                  sw x25, 100(x4)
                  sw x26, 104(x4)
                  sw x27, 108(x4)
                  sw x28, 112(x4)
                  sw x29, 116(x4)
                  sw x30, 120(x4)
                  sw x31, 124(x4)
                  la x17, write_tohost
                  jalr x0, x17, 0

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
                  csrr  x4, 0x341
                  addi  x4, x4, 4
                  csrw  0x341, x4
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
                  csrr  x4, 0x341
                  addi  x4, x4, 4
                  csrw  0x341, x4
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
                  csrr  x4, 0x300 # MSTATUS;
                  csrr  x4, 0x304 # MIE;
                  csrr  x4, 0x344 # MIP;
                  csrrc x4, 0x344, x4 # MIP;
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
