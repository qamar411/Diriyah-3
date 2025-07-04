.include "user_define.h"
.globl _start
.section .text
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x20, h0_start
jalr x0, x20, 0
h0_start:
                  li x30, 0x40001105
                  csrw 0x301, x30
kernel_sp:        
                  la x25, kernel_stack_end

trap_vec_init:    
                  la x30, mtvec_handler
                  ori x30, x30, 0
                  csrw 0x305, x30 # MTVEC

mepc_setup:       
                  la x30, init
                  csrw 0x341, x30

custom_csr_setup: 
                  nop

init_machine_mode:
                  li x30, 0x1800
                  csrw 0x300, x30 # MSTATUS
                  li x30, 0x0
                  csrw 0x304, x30 # MIE
                  mret
init:             
                  li x0, 0x0
                  li x1, 0x0
                  li x2, 0xff327b12
                  li x3, 0xfedfc882
                  li x4, 0x7
                  li x5, 0xc
                  li x6, 0xf593d879
                  li x7, 0x80000000
                  li x8, 0xf6a99ae3
                  li x9, 0xf281d47a
                  li x10, 0xf61ccc0f
                  li x11, 0x0
                  li x12, 0xe2d7c001
                  li x13, 0xa3c93e81
                  li x14, 0xfdb5ead8
                  li x15, 0xfc3c6d54
                  li x16, 0xdd6462df
                  li x17, 0x2e8d9f9e
                  li x18, 0x838a2ef0
                  li x19, 0x8
                  li x20, 0x4
                  li x21, 0x80000000
                  li x23, 0x2c1169b7
                  li x24, 0x80000000
                  li x26, 0x7
                  li x27, 0xfef85ba8
                  li x28, 0x88a92c3a
                  li x29, 0xf3a9f28d
                  li x30, 0xd
                  li x31, 0x0
                  la x22, user_stack_end
main:             la           a5, sub_1
                  addi         a5, a5, 358
                  slli         s1, t3, 15
                  c.lui        a6, 15
                  bltu         t2, t2, main_j3 #branch to jump instr
                  addi         a1, t4, -1168
                  divu         s1, a0, sp
                  lui          a6, 273356
                  divu         t5, s11, a5
                  andi         a0, s6, -1422
                  mulhu        a1, s7, s10
                  sra          tp, a4, t4
main_j3:          jalr         ra, a5, -357 #jump main -> sub_1
                  la           sp, region_1+154 #start riscv_load_store_hazard_instr_stream_0
                  lb           s0, 1164(sp)
                  lb           a7, 1556(sp)
                  lb           a7, 231(sp)
                  lb           gp, 231(sp)
                  lh           ra, 1722(sp)
                  sb           s6, 1722(sp)
                  xori         ra, s6, 1928
                  lb           s5, 169(sp)
                  mulhsu       t6, s1, a1
                  lbu          a5, 377(sp)
                  sb           t0, 377(sp)
                  lb           a6, 1674(sp)
                  lh           t4, 1674(sp)
                  sb           s7, 1356(sp)
                  sh           a0, 1356(sp)
                  lhu          a4, 1356(sp)
                  sh           s9, 790(sp)
                  lhu          a7, 790(sp)
                  sw           a7, 790(sp)
                  lw           s11, 790(sp)
                  sb           a4, 1047(sp)
                  lbu          t5, 1047(sp) #end riscv_load_store_hazard_instr_stream_0
                  addi         a5, zero, 10 #init loop 1 counter
                  c.nop
                  c.addi       t0, -1
                  addi         zero, zero, 0 #init loop 1 limit
                  div          s7, t1, t2
main_5_1_t:       lui          a7, 911524
                  addi         a5, a5, -10 #update loop 1 counter
                  divu         a6, a6, a5
                  slt          s0, s11, t3
                  c.srai       s1, 31
                  srl          t6, t2, a6
                  xor          s11, a4, gp
                  divu         a7, sp, s6
                  addi         s2, zero, -8 #init loop 0 counter
                  mulhsu       s0, s4, s8
                  addi         s3, zero, -20 #init loop 0 limit
                  slti         a2, s2, 432
main_5_0_t:       div          ra, t1, s2
                  sll          s5, t6, a3
                  mulhu        t3, t1, a2
                  c.mv         a2, t0
                  slt          tp, a3, t5
                  addi         s2, s2, -6 #update loop 0 counter
                  ori          s7, s4, -1082
                  bne          s2, s3, main_5_0_t #branch for loop 0
                  sub          s8, t5, a7
                  c.beqz       a5, main_5_1_t #branch for loop 1
                  sub          s10, s1, zero
main_2:           jal          ra, 6f
0:                jal          ra, 10f
1:                c.jal        8f
2:                jal          ra, 4f
3:                jal          t1, 1b
4:                jal          t1, 3b
5:                jal          ra, 15f
6:                c.j          13f
7:                c.jal        9f
8:                c.j          5b
9:                c.j          12f
10:               jal          ra, 14f
11:               c.j          0b
12:               c.jal        2b
13:               c.j          11b
14:               c.j          7b
15:               c.andi       s1, 4
                  la           ra, region_1+47 #start load_store_instr_stream_1
                  la           t4, region_0+901 #start load_store_instr_stream_0
                  sh           t5, 733(t4)
                  lh           t2, 111(ra)
                  lhu          s7, 43(ra)
                  lb           t0, 12(ra)
                  lbu          tp, -571(t4)
                  sw           t4, 197(ra)
                  lw           s8, 963(t4)
                  sb           a1, 370(t4)
                  sb           sp, -550(t4)
                  lb           t3, 744(t4)
                  lb           a3, 1048(t4)
                  sb           t1, 22(ra) #end load_store_instr_stream_1
                  sb           a4, -794(t4) #end load_store_instr_stream_0
                  la           a2, region_1+52 #start riscv_load_store_rand_instr_stream_0
                  sb           t4, 124(a2)
                  lbu          t3, -22(a2)
                  c.li         tp, -1
                  lh           a0, 116(a2)
                  lw           s3, 196(a2)
                  divu         s8, s5, a3
                  add          s5, a5, s9
                  c.sub        a5, a4
                  srli         sp, t2, 5
                  lbu          a6, 213(a2)
                  c.srli       a1, 11
                  lb           s7, 97(a2)
                  lh           gp, 94(a2)
                  lb           a0, 183(a2)
                  sll          a6, s9, t0
                  c.addi16sp   sp, 64
                  c.and        a3, a2
                  sh           s6, 50(a2)
                  c.lui        a4, 5
                  sb           t4, 71(a2)
                  c.and        a0, a5
                  lbu          s1, 228(a2)
                  c.or         a4, a2
                  divu         t1, ra, s10
                  mulh         ra, ra, t4
                  sb           s9, 242(a2)
                  addi         a3, s0, -339
                  rem          t0, t4, t1
                  lb           s11, 97(a2)
                  c.and        s0, a5
                  c.add        tp, t3
                  lw           t6, -40(a2)
                  c.or         s1, a1
                  slti         s2, s11, 214
                  lb           t6, 119(a2)
                  sll          t0, s9, a3
                  lbu          s8, 198(a2)
                  mulhu        t6, tp, s4
                  slti         a7, s0, -1294
                  lbu          ra, 189(a2)
                  c.mv         a1, a5
                  srai         s7, a6, 18
                  sb           sp, 255(a2)
                  sb           t3, 225(a2)
                  lhu          t1, -32(a2)
                  lb           t2, 81(a2)
                  slti         s10, a1, -170
                  lhu          zero, 222(a2)
                  c.slli       tp, 14
                  c.sub        s1, a0
                  sb           s8, 81(a2)
                  lw           s5, 16(a2) #end riscv_load_store_rand_instr_stream_0
                  la           a4, amo_0+8 #start riscv_lr_sc_instr_stream_0
                  andi         s10, s5, 1875
                  srai         t4, s6, 12
                  c.slli       ra, 22
                  sll          zero, t5, s11
                  sltu         a5, sp, a0
                  c.and        a0, a3
                  srli         t4, tp, 20
                  lr.w          s0, (a4)
                  sra          tp, ra, a3
                  c.nop
                  sc.w.rl       t4, ra, (a4) #end riscv_lr_sc_instr_stream_0
                  la           s0, amo_0+28 #start riscv_amo_instr_stream_0
                  la           tp, amo_0+16
                  sub          s5, a1, s7
                  amoswap.w     a7, s10, (tp)
                  srl          s11, tp, s0
                  amoor.w.aq    s8, s6, (s0) #end riscv_amo_instr_stream_0
                  la           a7, region_1+825 #start load_store_instr_stream_4
                  lb           a1, -130(a7)
                  la           t3, region_1+466 #start load_store_instr_stream_0
                  la           s7, region_1+573 #start load_store_instr_stream_1
                  la           t2, region_1+622 #start load_store_instr_stream_3
                  sb           zero, 871(t3)
                  lhu          t6, 95(a7)
                  sb           s1, 25(s7)
                  la           sp, region_1+550 #start load_store_instr_stream_2
                  lb           s5, -213(a7)
                  lbu          s8, -33(sp)
                  sb           gp, 54(s7)
                  lb           a6, -180(a7)
                  lbu          s0, -7(t2)
                  lhu          s8, 19(s7)
                  lbu          s1, 39(sp)
                  lb           s5, 1467(t3)
                  sh           s8, 6(t2)
                  lhu          ra, -4(sp)
                  lbu          a5, 45(t3)
                  lh           a6, -8(t2)
                  sh           a7, -62(sp)
                  lhu          s2, 1498(t3)
                  lb           t4, 61(sp)
                  lb           a3, 1401(t3)
                  lb           s10, 3(t2)
                  lb           a0, -78(a7)
                  lbu          gp, -22(s7)
                  lb           s0, 50(s7)
                  sb           t2, 188(a7)
                  lh           t6, -176(t3)
                  lb           s1, -44(sp)
                  lb           s2, -8(a7) #end load_store_instr_stream_4
                  lb           s1, 46(s7)
                  lb           a5, -55(sp)
                  lb           gp, -12(t2) #end load_store_instr_stream_3
                  lb           s2, 1461(t3)
                  lbu          a6, 54(s7) #end load_store_instr_stream_1
                  lb           s8, 39(sp) #end load_store_instr_stream_2
                  lb           a4, 1459(t3) #end load_store_instr_stream_0
                  bgeu         s8, s6, 11f
                  sub          a6, a5, s4
                  auipc        a1, 350193
                  slli         t2, s10, 20
                  xori         s2, s2, -1121
                  div          a0, s3, s10
                  sll          a4, a4, s4
                  remu         t0, s1, t2
                  c.slli       t6, 27
                  c.addi16sp   sp, 256
                  divu         t1, t6, s7
11:               c.andi       a0, -1
                  c.mv         s3, s6
                  c.sub        a4, s1
                  mulh         ra, a1, s10
                  blt          s3, t4, 28f
                  sll          a3, t1, s1
                  bgeu         s8, t0, 19f
                  c.or         a2, a1
19:               mulhu        s5, t2, ra
                  c.addi16sp   sp, -16
                  c.srai       a3, 11
                  auipc        a7, 903649
                  mulh         s0, s6, s10
                  c.mv         t2, s6
                  c.slli       s2, 5
                  mulhu        t4, a3, a0
                  srl          zero, s0, a0
28:               c.bnez       a5, 45f
                  c.and        a3, s1
                  andi         a4, t1, -655
                  bge          a7, ra, 47f
                  c.nop
                  bltu         s9, t6, 35f
                  remu         a2, s6, s3
35:               c.li         a4, 29
                  andi         tp, a5, 215
                  lui          t6, 205186
                  c.srai       a2, 9
                  mulh         sp, s7, a4
                  sltu         t1, s6, a4
                  mulh         s3, a2, t6
                  ori          a4, s11, -610
                  divu         s1, sp, s7
                  sub          s1, s3, s1
45:               c.bnez       a4, 50f
                  srli         t2, a0, 8
47:               bne          t0, a0, 53f
                  c.li         s0, 13
                  bne          s10, t0, 61f
50:               add          zero, t3, s8
                  mulhsu       a5, s9, s3
                  bge          s7, s10, 69f
53:               or           t2, s9, a0
                  slt          a3, tp, t6
                  sub          a4, t5, a7
                  c.nop
                  c.addi4spn   s0, sp, 832
                  sll          t0, s3, t1
                  xor          s0, a4, t0
                  bltu         a1, a1, 69f
61:               auipc        t4, 739427
                  c.beqz       a0, 70f
                  srl          t5, s4, s4
                  andi         s3, s1, 1134
                  c.bnez       a1, 73f
                  sll          t1, s0, a3
                  c.addi       s0, -1
                  sll          s5, t0, a6
69:               divu         gp, gp, t0
70:               c.and        a4, a4
                  slli         a7, t4, 12
                  mulhu        a6, zero, t1
73:               bltu         s9, a2, 90f
                  c.srli       a3, 24
                  beq          t6, s1, 89f
                  xori         s8, gp, 399
                  c.mv         t1, s10
                  slti         s2, s7, -1793
                  srai         s2, gp, 0
                  sltu         tp, s4, s9
                  sra          s1, a0, s3
                  c.addi16sp   sp, -16
                  c.bnez       a4, 103f
                  bne          gp, a3, 100f
                  c.add        tp, tp
                  c.add        ra, t2
                  c.andi       a4, -1
                  lui          zero, 992982
89:               c.srli       a2, 17
90:               ori          sp, a2, -552
                  ori          t5, t1, 654
                  c.addi4spn   s1, sp, 64
                  mulhu        s10, a1, a1
                  add          a5, a5, tp
                  c.nop
                  sltiu        s2, a3, -370
                  nop
                  xor          a6, s6, a1
                  divu         s1, zero, s3
100:              add          t4, t4, t3
                  c.lui        s5, 29
                  c.bnez       a4, 111f
103:              lui          ra, 409408
                  c.addi4spn   a4, sp, 672
                  c.sub        s0, a2
                  slt          a6, t1, s11
                  srai         a1, a3, 21
                  c.srai       a1, 27
                  c.add        s0, s9
                  c.add        ra, s3
111:              and          s0, s11, s11
                  c.mv         t5, s7
                  andi         s8, ra, 602
                  sub          tp, t1, s3
                  c.srai       a4, 30
                  bgeu         a5, s2, 125f
                  c.bnez       a0, 132f
                  slti         tp, a7, -932
                  mulhsu       a4, ra, s0
                  slt          s10, a7, a5
                  div          s8, t0, s11
                  sra          a5, s4, gp
                  c.srai       s0, 3
                  slli         s1, ra, 20
125:              c.addi4spn   s1, sp, 128
                  c.nop
                  slti         a2, s6, 844
                  c.beqz       s0, 131f
                  addi         a4, t0, -1395
                  mul          s7, a0, ra
131:              sltu         a5, a5, s1
132:              c.andi       s0, -1
                  c.srli       a2, 20
                  mulh         t5, s6, a7
                  c.xor        a5, a4
                  sltu         t5, a0, t1
                  sltu         t0, s3, s4
                  mul          t5, a7, s6
                  slt          s1, t1, s3
                  c.lui        s11, 18
                  slli         s11, sp, 15
                  sltu         t5, t6, t6
                  slti         ra, t4, 376
                  c.addi16sp   sp, 400
                  c.addi16sp   sp, -16
                  slt          a2, s8, s10
                  c.sub        a3, s1
                  div          t5, s5, t2
                  beq          s8, gp, 161f
                  sltu         a0, s4, s5
                  addi         t0, t1, -953
                  sra          t4, s8, a1
                  slt          s7, t2, t5
                  sub          a4, ra, s1
                  nop
                  c.srli       a2, 28
                  sltu         s11, t5, s8
                  lui          a2, 610661
                  sub          sp, s1, s9
                  divu         t3, s0, s10
161:              slti         a4, a1, -690
                  c.addi       a4, 24
                  ori          t4, a5, 1550
                  srai         a1, s6, 4
                  sltiu        s8, s0, 1851
                  mulhsu       a6, sp, tp
                  c.li         gp, -1
                  divu         s2, s4, t5
                  andi         s10, s6, 1805
                  sub          s5, s2, s9
                  c.slli       a3, 17
                  mulhu        a1, a2, s6
                  or           t6, t3, a5
                  c.nop
                  sltiu        s3, a1, 1219
                  lui          sp, 515007
                  bgeu         s8, t4, 183f
                  auipc        a7, 686476
                  mulhu        s1, s1, a6
                  slt          ra, t5, a4
                  blt          t0, t1, 196f
                  c.beqz       a3, 196f
183:              c.lui        s3, 22
                  blt          s5, a7, 198f
                  rem          t6, t5, s11
                  bltu         tp, s4, 200f
                  auipc        a4, 846845
                  slti         zero, s0, -794
                  c.slli       t1, 22
                  c.add        t3, a6
                  sltiu        s5, t4, -545
                  c.and        a3, a1
                  c.or         a1, a3
                  andi         s2, sp, -2044
                  c.bnez       a2, 215f
196:              bgeu         ra, s10, 203f
                  rem          a2, sp, ra
198:              mulhu        ra, t0, ra
                  c.beqz       a4, 204f
200:              nop
                  c.nop
                  c.xor        s1, s0
                  slli         t1, a3, 1
                  rem          zero, s10, s9
                  la           a5, sub_2
                  c.srli       a1, 29
                  addi         a5, a5, 320
                  or           s3, tp, t3
                  remu         t6, a5, t6
                  bne          s0, a5, main_j1 #branch to jump instr
                  srli         gp, t0, 3
                  xor          s5, t5, gp
main_j1:          jalr         ra, a5, -320 #jump main -> sub_2
203:              mulhu        s8, s1, s10
204:              mulh         a6, t0, s6
                  c.bnez       a3, 221f
                  nop
                  rem          gp, ra, a6
                  bne          a4, a7, 222f
                  c.add        t4, s11
                  bge          a1, a4, 219f
                  slt          a6, a1, t6
                  c.srai       s0, 31
                  c.addi4spn   a4, sp, 80
                  slti         t6, a7, -343
215:              bge          s10, s10, 232f
                  c.sub        s1, a4
                  c.and        a2, a5
                  c.beqz       s0, 224f
219:              c.and        a2, a4
                  c.add        t3, s6
221:              addi         t4, a6, -509
222:              c.andi       a3, -1
                  mulhu        zero, s8, s4
224:              beq          a0, a0, 229f
                  c.addi4spn   a5, sp, 272
                  c.li         gp, -1
                  srai         ra, t2, 14
                  bne          t3, t6, 242f
229:              slti         a1, sp, -1236
                  mulhu        tp, s8, a0
                  nop
232:              addi         a0, a5, -1564
                  mulhu        ra, t6, t1
                  mulhsu       a0, s6, sp
                  beq          s11, t1, 250f
                  srai         a7, s3, 31
                  c.addi       ra, 11
                  slli         s11, a3, 8
                  c.add        a0, t5
                  c.xor        s0, a3
                  and          a2, gp, s9
242:              c.lui        a6, 26
                  c.andi       s1, -1
                  add          a6, s6, s10
                  blt          s8, a3, 257f
                  rem          a1, s8, a7
                  c.nop
                  blt          t2, t2, 265f
                  c.xor        s0, s1
250:              slli         s5, t4, 21
                  slti         s1, a2, -366
                  and          t5, s10, a6
                  c.addi       ra, -1
                  c.addi       a5, -1
                  bgeu         s4, a2, 262f
                  mulhu        tp, t5, s5
257:              and          s0, tp, s10
                  bltu         t6, s10, 269f
                  c.and        a2, a2
                  addi         tp, gp, -1243
                  c.addi4spn   s1, sp, 848
262:              divu         a0, t6, s1
                  slt          gp, a5, s11
                  slti         a0, s2, 982
265:              srai         s2, a0, 25
                  ori          a7, a5, 680
                  srai         tp, s4, 4
                  bge          a6, s11, 288f
269:              lui          s7, 556844
                  c.andi       s1, 15
                  c.slli       s11, 23
                  mulh         s3, zero, a0
                  c.bnez       a4, 275f
                  remu         s8, t4, a4
275:              bge          a1, t6, 284f
                  ori          a1, a2, -2035
                  srai         t4, a2, 25
                  nop
                  slt          a0, a4, tp
                  c.sub        a0, s0
                  bge          s0, s9, 287f
                  ori          t3, a4, -93
                  andi         tp, s3, -1568
284:              mulhsu       t0, t6, a2
                  mulhsu       s7, a7, a3
                  bgeu         s8, s2, 288f
287:              blt          a2, s5, 307f
288:              sll          s2, s10, t0
                  mul          t5, t6, t5
                  c.xor        s1, a1
                  ori          s7, a2, -1315
                  c.sub        a3, a5
                  c.mv         s2, s5
                  sltu         a1, a0, a4
                  ori          t3, s0, 2026
                  sltu         t2, s7, s2
                  sll          t4, t6, t0
                  c.addi       t4, 24
                  ori          sp, t3, 22
                  mulhsu       t3, ra, t0
                  c.add        s3, s10
                  bge          s10, s6, 307f
                  c.xor        a4, a5
                  div          a1, tp, a4
                  sra          tp, t6, tp
                  beq          ra, t5, 320f
307:              c.addi16sp   sp, 112
                  bgeu         t0, t0, 311f
                  la           sp, region_1+1021 #start riscv_hazard_instr_stream_0
                  sra          a6, a6, a5
                  or           s0, a5, s0
                  c.srli       s0, 10
                  lbu          a6, -158(sp)
                  c.and        a5, s0
                  lw           a6, -165(sp)
                  c.srli       a5, 29
                  lbu          a5, 56(sp)
                  lbu          s3, 94(sp)
                  c.mv         s0, a6
                  c.srai       a4, 27
                  c.andi       a4, 7
                  andi         a6, a5, -381
                  lbu          a5, 110(sp)
                  lbu          a7, -120(sp)
                  slti         s3, a6, 920
                  and          a7, a4, a4
                  c.xor        a5, s0
                  sb           a5, -102(sp)
                  lb           a6, 165(sp)
                  srl          a5, s3, a6
                  div          a7, a6, a7
                  lhu          a4, -119(sp)
                  auipc        a6, 969009
                  lbu          a6, -165(sp)
                  lb           s3, -83(sp)
                  sb           a4, -10(sp)
                  c.xor        a4, a4
                  and          a7, s0, a7
                  sub          a6, a6, s0
                  c.srli       a4, 31
                  mul          s3, s0, a7
                  c.srli       a4, 3
                  auipc        a6, 92177
                  lbu          a5, -16(sp)
                  c.nop
                  c.add        a7, a4
                  xor          a4, a6, a7
                  c.srli       a4, 1
                  c.nop
                  lbu          a5, 138(sp) #end riscv_hazard_instr_stream_0
                  sltiu        a4, s11, 9
                  srli         zero, t2, 11
311:              nop
                  c.lui        s0, 16
                  la           t0, sub_2
                  c.mv         s11, a2
                  addi         t0, t0, -64
                  mulhu        sp, ra, a5
                  bgeu         t3, s5, main_j2 #branch to jump instr
                  c.xor        a1, a0
                  mulhsu       s8, t6, a2
                  xori         ra, s5, 504
                  sltu         sp, s8, t6
                  nop
                  or           a1, s11, a6
                  nop
main_j2:          jalr         ra, t0, 65 #jump main -> sub_2
                  c.lui        t3, 22
                  div          s3, ra, t4
                  srl          a6, s5, a4
                  c.addi16sp   sp, 208
                  divu         s0, a3, gp
                  mul          t5, s2, t6
                  ori          a0, s11, 1117
320:              divu         s8, a7, t5
                  sll          gp, s3, s7
                  beq          zero, t4, 337f
                  mul          t5, sp, t5
                  c.srai       s1, 8
                  lui          a4, 535462
                  rem          sp, a5, zero
                  bgeu         s8, s2, 341f
                  mul          s0, s3, sp
                  lui          t2, 247645
                  c.addi16sp   sp, 256
                  sltu         t0, t2, tp
                  mul          t0, gp, t2
                  sub          t6, s2, s10
                  nop
                  sltiu        s5, s7, 533
                  c.or         a1, a2
337:              sra          tp, s10, t2
                  sra          zero, t6, s2
                  c.mv         t3, t5
                  mulh         s3, s1, a6
341:              mulhu        s2, tp, a0
                  sll          a2, s7, zero
                  c.srli       s1, 6
                  c.bnez       a1, 353f
                  slt          s11, s8, gp
                  divu         a1, t1, t2
                  blt          s3, gp, 355f
                  c.and        s0, a5
                  c.addi4spn   a0, sp, 928
                  c.andi       a0, -1
                  sltiu        s0, a0, -146
                  c.li         a0, 24
353:              lui          zero, 799666
                  beq          t0, a2, 362f
355:              mulh         s0, sp, t4
                  c.srli       a5, 7
                  mulhu        t0, t2, a7
                  bltu         zero, a2, 364f
                  beq          t3, a7, 364f
                  c.bnez       a5, 364f
                  c.addi       t4, -1
362:              sra          t4, t0, a5
                  c.sub        a1, a1
364:              c.and        a0, a2
                  la x20, test_done
                  jalr x0, x20, 0
test_done:        
                  li gp, 1
                  ecall
sub_5:            addi         s6, s6, -60
                  slti         a5, s6, -105
                  xor          zero, t6, t1
                  sw           ra, 4(s6)
                  mul          a6, ra, gp
                  c.srai       a5, 16
                  sltu         s10, s4, a3
                  c.add        a6, s3
                  c.li         a3, -1
                  c.beqz       a3, 9f
                  c.mv         s5, t3
                  nop
                  c.sub        s1, s0
                  slt          s7, s10, a5
                  bge          t4, t0, 26f
                  c.addi       t4, 7
                  addi         a5, a2, -1109
9:                c.or         a3, a3
                  sltiu        t0, a5, -805
                  divu         s1, t4, a2
                  mul          s0, zero, s7
                  addi         t3, a5, -958
                  c.xor        a0, a2
                  c.addi16sp   sp, 288
                  mul          t6, ra, a6
                  sll          s8, a0, s0
                  c.sub        a5, s0
                  c.slli       gp, 27
                  mul          a6, s3, s11
                  slti         s2, s0, -795
                  remu         tp, ra, zero
                  bne          a0, s8, 36f
                  sll          s1, t1, ra
                  beq          s0, a1, 42f
26:               c.or         s1, s0
                  srl          a3, s3, a2
                  mulhu        t6, s2, a2
                  xori         a6, a1, -1801
                  srai         t5, a5, 5
                  c.xor        a5, s0
                  sll          s0, tp, t4
                  and          gp, s1, s2
                  remu         s2, s10, a7
                  divu         a0, zero, s11
36:               add          a2, t5, sp
                  c.xor        a4, a2
                  c.srai       a2, 25
                  srli         zero, a2, 11
                  mul          a2, t0, a0
                  slti         sp, a4, -848
42:               c.add        s8, ra
                  c.mv         a2, s0
                  c.addi       a2, 21
                  sltiu        s1, a2, -752
                  sra          t1, a0, s2
                  c.beqz       a3, 63f
                  c.andi       a2, -1
                  xor          a6, t5, gp
                  mul          tp, s9, a2
                  sll          a1, s6, a2
                  c.andi       a5, 14
                  c.beqz       a5, 71f
                  bltu         s0, s1, 68f
                  sll          s11, a5, ra
                  or           a0, s5, s1
                  mul          t6, a1, s9
                  sub          a4, s10, a7
                  bltu         gp, a3, 63f
                  bne          sp, a6, 79f
                  c.li         s7, 20
                  mul          a3, a7, a7
63:               or           a6, s11, gp
                  c.addi       s2, 6
                  blt          a7, a7, 78f
                  sub          ra, zero, t1
                  slt          a5, s11, sp
68:               add          a2, a1, s4
                  c.xor        a4, a0
                  bgeu         s9, t4, 77f
71:               sll          s11, t0, s2
                  c.srli       a5, 9
                  c.or         s0, s1
                  bne          s5, a4, 91f
                  c.andi       a2, 27
                  c.mv         s11, s5
77:               slt          s10, t5, s8
78:               slli         s11, tp, 30
79:               c.addi4spn   a1, sp, 80
                  c.or         a1, a5
                  bgeu         ra, s0, 86f
                  bltu         t4, a2, 100f
                  c.lui        s5, 17
                  c.addi       s2, 7
                  c.nop
86:               c.addi4spn   a1, sp, 192
                  beq          a2, s9, 99f
                  addi         s8, a3, 1341
                  andi         gp, s0, 1265
                  c.add        s11, gp
91:               xor          a7, gp, t3
                  bge          s1, s9, 98f
                  addi         s10, t3, 684
                  add          zero, s10, tp
                  c.addi16sp   sp, -16
                  div          s10, s11, t0
                  c.bnez       a5, 109f
98:               c.bnez       a2, 109f
99:               c.bnez       s0, 103f
100:              and          a0, a0, s6
                  c.slli       a2, 24
                  c.addi       s5, 26
103:              or           gp, s2, s9
                  mulhsu       s5, t6, a6
                  andi         ra, a7, -1524
                  slti         s7, tp, -488
                  c.mv         s0, t4
                  c.and        a5, a2
109:              c.and        a1, a0
                  c.nop
                  c.addi4spn   a0, sp, 864
                  c.li         s0, -1
                  slli         s5, a2, 9
                  c.srai       a5, 30
                  c.and        a2, s0
                  lw           ra, 4(s6)
                  c.add        a1, t5
                  addi         s6, s6, 60
                  or           a3, t2, t5
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 224
130:              addi x19, x1, 1
130:              c.jalr x19
sub_1:            bltu         a2, zero, sub_1_stack_p
                  c.srai       a4, 9
sub_1_stack_p:    addi         s6, s6, -16
                  sw           ra, 4(s6)
                  c.mv         a6, a3
                  ori          s2, s7, 1813
                  c.addi       s1, 24
                  slti         a3, a0, -1000
                  c.srli       a0, 14
                  slti         s2, s1, -6
                  or           zero, s9, s3
                  c.xor        s0, a0
                  auipc        s10, 838200
                  mulh         a1, s7, s10
                  c.addi       t6, 12
                  c.or         s0, a3
                  c.srai       a3, 1
                  and          s0, s7, s4
                  c.xor        a4, a4
                  beq          a7, s0, 20f
                  srai         s11, t4, 29
                  mulhu        a7, s4, s7
                  sltu         a1, s1, ra
                  c.and        s1, a1
                  c.srli       a4, 7
                  mulh         gp, s8, a1
20:               bgeu         s0, s10, 25f
                  c.and        a1, a1
                  auipc        s10, 745154
                  andi         s10, t0, 2019
                  and          t6, s8, s2
25:               ori          ra, ra, 2004
                  c.nop
                  sltu         a6, s3, t0
                  srl          t2, a1, ra
                  nop
                  div          s10, s0, s6
                  bgeu         s10, s0, 40f
                  c.beqz       a4, 40f
                  sra          s8, t2, s3
                  srli         s3, s2, 2
                  c.bnez       a4, 55f
                  and          t5, tp, t6
                  c.andi       a0, 12
                  rem          t5, s11, a2
                  nop
40:               sltiu        t3, sp, -1733
                  c.and        a4, s1
                  sltu         a3, a2, s0
                  sub          s1, a2, a2
                  c.and        a5, s0
                  c.or         a4, s1
                  srl          sp, s7, t2
                  slli         t5, s3, 31
                  xori         t2, zero, -700
                  lui          a2, 856091
                  mulhu        a5, a0, s9
                  c.addi16sp   sp, -16
                  sltu         t5, gp, zero
                  srai         t4, s2, 23
                  c.sub        s1, a0
55:               c.srai       a4, 4
                  and          t0, s3, s6
                  bltu         s8, s8, 73f
                  bne          sp, s3, 74f
                  andi         a7, t6, -728
                  c.xor        a1, a4
                  c.xor        s0, a5
                  c.and        s1, s0
                  rem          a3, tp, a0
                  beq          t0, gp, 80f
                  sub          t0, a3, t6
                  bge          s6, s0, 67f
67:               add          s0, a4, a2
                  bltu         s11, s10, 72f
                  lui          a2, 936219
                  add          s8, s1, a4
                  srl          t3, s10, s11
72:               xor          t2, a2, a3
73:               addi         s10, t0, 1618
74:               c.xor        a2, a1
                  beq          gp, t5, 91f
                  c.slli       sp, 31
                  c.xor        s1, s1
                  beq          t3, a7, 79f
79:               add          s8, tp, a0
80:               c.xor        a5, s0
                  srli         s8, s4, 14
                  mulh         sp, a4, s6
                  bne          s10, a0, 96f
                  or           tp, s11, tp
                  div          a4, tp, t0
                  andi         sp, s3, 1480
                  addi         t3, s11, -1031
                  addi         a2, a1, -1784
                  c.slli       sp, 3
                  bge          t3, t5, 106f
91:               c.mv         t2, t4
                  c.li         t4, -1
                  c.addi4spn   s1, sp, 336
                  xori         s5, a7, 1627
                  srai         a0, s11, 6
96:               mulhsu       a6, s1, s4
                  c.nop
                  c.srai       a0, 25
                  remu         ra, s8, a7
                  c.or         a5, a4
                  xori         s3, a3, -1126
                  add          t6, t5, s5
                  c.slli       s2, 19
                  srai         s7, s1, 19
                  c.addi       a4, 3
106:              xor          s2, a4, t1
                  bge          s5, a4, 122f
                  sltiu        ra, s6, 1555
                  mulhsu       a1, a0, s7
                  add          s0, s1, t3
                  c.lui        t3, 5
                  xor          s11, t0, t3
                  c.addi16sp   sp, -16
                  c.addi       t2, 1
                  c.add        a2, a0
                  xor          a3, s3, t1
                  remu         s2, a0, zero
                  c.mv         a1, s4
                  or           a5, s10, s2
                  slli         a0, s5, 0
                  andi         s7, tp, -183
122:              bltu         t0, t5, 136f
                  bne          a3, s1, 140f
                  mul          t5, a7, sp
                  c.srai       a1, 25
                  srl          sp, t5, a4
                  c.add        t0, a7
                  c.and        s1, a3
                  slli         t1, s10, 15
                  beq          s8, a7, 132f
                  c.lui        a3, 20
132:              xor          s0, s9, t1
                  c.add        t1, a6
                  and          t2, a2, a0
                  bltu         ra, s1, 143f
136:              mulh         t0, s7, s5
                  slti         a6, sp, 811
                  sltiu        a7, sp, -1264
                  rem          s1, sp, gp
140:              xor          tp, s11, tp
                  c.addi       t0, 31
                  div          s3, t0, a4
143:              c.addi4spn   s0, sp, 288
                  srli         zero, a4, 0
                  sltiu        s2, t6, -222
                  bge          t4, s3, 149f
                  mulhsu       t6, t2, t1
                  c.mv         s1, s5
149:              nop
                  sub          a3, t0, a0
                  divu         a1, s1, t6
                  c.srai       a1, 27
                  lw           ra, 4(s6)
                  and          a5, s10, s6
                  slt          a1, t1, s8
                  sltu         s5, s7, s0
                  addi         s6, s6, 16
                  and          t5, a7, t3
                  c.addi4spn   s0, sp, 688
166:              addi x7, x1, 0
166:              c.jr x7
sub_4:            ori          sp, s8, 1633
                  addi         s6, s6, -12
                  nop
                  c.sub        s1, a4
                  srai         a6, s7, 27
                  auipc        t1, 714298
                  sw           ra, 4(s6)
                  div          t4, zero, s7
                  la           s5, sub_5
                  c.addi16sp   sp, -16
                  c.andi       a5, 30
                  addi         s5, s5, -507
                  c.mv         s2, a4
                  mulhu        a7, s4, a4
                  c.addi16sp   sp, -16
                  c.xor        a0, s0
                  c.lui        a4, 31
sub_4_j7:         jalr         ra, s5, 507 #jump sub_4 -> sub_5
                  c.srai       a2, 10
                  srai         t0, t1, 12
                  c.srli       a4, 6
                  slt          s10, gp, a5
                  c.slli       s11, 29
                  slti         s8, s1, -1128
                  bne          s9, t1, 14f
                  sltu         gp, a2, s0
                  addi         s2, t3, -515
                  c.slli       s3, 23
                  c.addi4spn   a2, sp, 480
                  sll          tp, t6, zero
                  c.xor        a1, a3
                  c.srli       a0, 23
14:               sltiu        a3, t2, -295
                  andi         s10, a5, 1607
                  c.li         a5, 21
                  slli         s8, s3, 23
                  lui          a6, 6528
                  slt          tp, s7, a6
                  srl          t6, s1, t5
                  lw           ra, 4(s6)
                  addi         s6, s6, 12
                  c.xor        a0, a4
                  c.and        s1, a3
                  c.srai       a4, 31
                  slti         gp, zero, 859
45:               addi x26, x1, 0
45:               jalr x26, x26, 0
sub_3:            blt          t5, s5, sub_3_stack_p
sub_3_stack_p:    addi         s6, s6, -40
                  c.li         a4, 25
                  slli         t3, ra, 1
                  sw           ra, 4(s6)
                  c.andi       s1, 28
                  la           a6, amo_0+32 #start riscv_amo_instr_stream_10
                  amominu.w     zero, a7, (a6) #end riscv_amo_instr_stream_10
                  la           a1, region_0+536 #start riscv_load_store_rand_instr_stream_8
                  lhu          t3, -62(a1)
                  c.addi16sp   sp, 48
                  sb           s7, -221(a1)
                  div          s8, a6, s8
                  lbu          a5, 1125(a1)
                  lw           a6, 384(a1)
                  lw           s1, 960(a1)
                  sb           sp, -1(a1)
                  lhu          t1, 1264(a1)
                  sb           s4, 514(a1)
                  sh           a0, 1304(a1)
                  sb           s10, 545(a1)
                  lb           s11, 1034(a1)
                  slti         s11, t3, -376
                  lb           sp, -489(a1)
                  slli         s11, a4, 7
                  mulhu        a0, a1, s10
                  or           s2, t0, s8
                  lb           tp, 1151(a1)
                  lbu          tp, 585(a1)
                  c.andi       a2, -1
                  sb           t2, -321(a1)
                  c.sub        a3, a5
                  lb           gp, 1255(a1)
                  or           t0, a1, t4
                  nop
                  sw           s1, -132(a1)
                  sb           gp, 1392(a1) #end riscv_load_store_rand_instr_stream_8
                  la           s10, region_0+1726 #start riscv_load_store_hazard_instr_stream_27
                  lb           a0, -390(s10)
                  lb           sp, -390(s10)
                  lh           s8, -390(s10)
                  lhu          ra, -390(s10)
                  sw           s6, -390(s10)
                  lh           s11, -390(s10)
                  rem          a7, t2, t5
                  lbu          a4, -390(s10)
                  lhu          s8, -390(s10)
                  c.addi       a1, -1
                  sw           t1, -390(s10)
                  sh           t5, -390(s10)
                  lb           a2, -390(s10)
                  lbu          s7, -390(s10)
                  sub          a1, t3, a1
                  c.lui        t1, 12
                  lhu          s8, -390(s10)
                  sh           zero, -160(s10)
                  lbu          s3, -1349(s10)
                  lbu          a0, -1349(s10) #end riscv_load_store_hazard_instr_stream_27
sub_3_76:         jal          ra, 6f
0:                c.jal        8f
1:                jal          ra, 21f
2:                c.jal        12f
3:                c.jal        5f
4:                c.jal        11f
5:                c.jal        15f
6:                jal          t1, 18f
7:                c.j          0b
8:                c.j          13f
9:                c.jal        10f
10:               jal          ra, 4b
11:               c.j          3b
12:               c.jal        17f
13:               jal          t1, 14f
14:               c.jal        20f
15:               c.jal        7b
16:               c.j          9b
17:               c.jal        19f
18:               c.jal        2b
19:               c.jal        16b
20:               jal          ra, 1b
21:               nop
                  la           t6, region_1+1140 #start load_store_instr_stream_0
                  la           t3, region_0+918 #start load_store_instr_stream_1
                  lbu          s0, -703(t6)
                  lb           a3, 110(t3)
                  lbu          ra, 779(t6)
                  lbu          t5, 175(t3)
                  lb           a0, -429(t6)
                  lb           a1, -107(t3)
                  lhu          ra, -914(t6)
                  lbu          s7, -197(t3)
                  lw           t4, -1072(t6)
                  lb           t4, 50(t3)
                  lh           a5, -862(t6)
                  sb           s11, -493(t6)
                  lbu          s2, -203(t3)
                  sh           t2, -132(t3)
                  lbu          a3, -12(t6)
                  lbu          a4, -201(t6)
                  sw           zero, 50(t3) #end load_store_instr_stream_1
                  lh           a7, -166(t6) #end load_store_instr_stream_0
                  la           sp, region_1+598 #start riscv_hazard_instr_stream_21
                  divu         t0, t0, s0
                  slli         t3, s0, 19
                  or           t0, a5, t6
                  sltu         t3, t0, t3
                  divu         t0, s7, t3
                  mul          s0, t3, s7
                  srai         t6, t6, 15
                  sltiu        s7, s7, -513
                  lbu          s7, -141(sp)
                  lhu          t3, 204(sp)
                  lb           t0, 213(sp)
                  sb           t3, 174(sp)
                  sb           s7, 115(sp)
                  divu         a5, t6, t6
                  lb           s0, -173(sp)
                  c.andi       s0, -1
                  c.srli       a5, 24
                  c.li         t6, 28
                  sb           t3, 145(sp)
                  srli         t3, s0, 8
                  c.add        t6, s7
                  auipc        t3, 849854
                  auipc        a5, 1012038
                  divu         t0, t3, t6
                  mulhsu       t6, t0, t3
                  lb           t0, 95(sp)
                  mulhu        t6, s0, s7
                  sub          s7, s0, t6
                  nop
                  sub          s0, t0, t3
                  sb           s0, 88(sp)
                  sb           t3, -1(sp)
                  remu         s7, s0, t3
                  c.nop
                  and          s7, t6, t6
                  srai         t3, t0, 16
                  lhu          s7, -4(sp)
                  c.sub        a5, a5
                  sltu         s7, t3, s0
                  divu         s0, t6, s0
                  c.slli       t3, 20
                  sb           s7, 51(sp) #end riscv_hazard_instr_stream_21
                  la           t1, region_1+1081 #start load_store_instr_stream_2
                  la           t3, region_1+1542 #start load_store_instr_stream_3
                  la           sp, region_1+617 #start load_store_instr_stream_1
                  la           t5, region_1+984 #start load_store_instr_stream_4
                  lbu          t2, 26(t1)
                  lbu          s5, 9(t5)
                  lbu          zero, 43(t5)
                  lb           s3, -583(sp)
                  la           a5, region_1+1100 #start load_store_instr_stream_0
                  lbu          s7, -19(t5)
                  lbu          a0, 136(t3)
                  sb           t6, 39(t5)
                  sb           s2, 714(sp)
                  sb           t4, -39(t5)
                  lh           s8, 237(t1)
                  lh           a0, -101(t1)
                  lbu          s7, -366(sp)
                  lb           a6, 1183(sp)
                  lb           s5, -196(t1)
                  sb           a3, 457(a5)
                  lb           t6, -36(t5)
                  lbu          a1, 154(t3)
                  sb           s9, 510(sp)
                  sw           s7, 396(a5)
                  lbu          t6, -975(a5)
                  lb           a0, 953(sp)
                  lbu          s8, -8(t5)
                  sb           t4, -121(t3)
                  lbu          a7, 13(t5)
                  lbu          a2, 123(a5)
                  lh           t4, 42(t5)
                  sh           s0, 29(t1) #end load_store_instr_stream_2
                  lb           a4, -14(t3)
                  lb           tp, 1110(sp)
                  sh           t4, 1289(sp)
                  lbu          zero, -8(t5) #end load_store_instr_stream_4
                  lhu          s11, 48(t3) #end load_store_instr_stream_3
                  lbu          ra, 356(sp) #end load_store_instr_stream_1
                  lbu          s10, 47(a5) #end load_store_instr_stream_0
sub_3_56:         jal          ra, 10f
0:                c.jal        6f
1:                c.j          21f
2:                jal          ra, 1b
3:                c.j          7f
4:                jal          s8, 3b
5:                jal          t6, 2b
6:                c.j          8f
7:                c.jal        11f
8:                c.jal        9f
9:                c.j          5b
10:               jal          t1, 17f
11:               c.jal        12f
12:               c.j          14f
13:               c.j          22f
14:               c.j          20f
15:               jal          t1, 16f
16:               c.j          18f
17:               jal          ra, 4b
18:               jal          s5, 13b
19:               c.jal        0b
20:               jal          ra, 19b
21:               c.jal        15b
22:               or           a2, s4, tp
                  la           a1, region_0+1158 #start riscv_load_store_hazard_instr_stream_20
                  lbu          tp, 203(a1)
                  sw           t2, 34(a1)
                  sb           s4, 34(a1)
                  lb           s7, 34(a1)
                  sb           gp, 34(a1)
                  lbu          a5, -67(a1)
                  c.sub        a5, a3
                  sb           zero, -67(a1)
                  lh           s7, -242(a1)
                  lbu          t1, -242(a1)
                  lb           t5, -242(a1)
                  lb           a3, -242(a1)
                  sh           a7, -16(a1)
                  lw           a5, 186(a1)
                  sh           sp, 186(a1)
                  lbu          s5, 186(a1)
                  xori         gp, s0, 1777
                  slt          s0, s9, zero
                  lb           t1, 190(a1)
                  sb           t0, -209(a1)
                  lb           s11, -209(a1)
                  c.lui        s10, 1
                  sb           t2, -209(a1)
                  lb           t6, -209(a1) #end riscv_load_store_hazard_instr_stream_20
                  la           t5, region_0+1314 #start load_store_instr_stream_0
                  la           s10, region_0+1551 #start load_store_instr_stream_1
                  sb           s8, 143(s10)
                  lbu          a2, -767(t5)
                  sb           s1, -85(t5)
                  lh           t4, -63(s10)
                  lb           t6, -90(t5)
                  sh           t4, -131(s10)
                  lbu          s1, -233(s10)
                  sb           a5, -446(t5)
                  lb           s3, 148(s10)
                  sb           a4, 639(t5)
                  lbu          t2, 64(s10)
                  lb           t6, -781(t5)
                  lb           tp, -16(s10)
                  lb           s5, 178(s10) #end load_store_instr_stream_1
                  lbu          a0, -814(t5) #end load_store_instr_stream_0
                  la           a4, region_0+540 #start load_store_instr_stream_4
                  la           a0, region_0+1910 #start load_store_instr_stream_3
                  la           s11, region_0+601 #start load_store_instr_stream_1
                  lb           a6, -114(a4)
                  lbu          a3, -545(a0)
                  la           t5, region_0+390 #start load_store_instr_stream_0
                  sb           tp, -406(s11)
                  sb           s9, -529(a0)
                  lbu          t4, 1011(t5)
                  la           t1, region_0+1391 #start load_store_instr_stream_2
                  lb           t2, -246(a4)
                  lb           a6, 1384(s11)
                  lh           a2, 87(t1)
                  lbu          a3, -595(a0)
                  lb           a6, 49(a4)
                  lbu          t0, 1194(s11)
                  lbu          t6, -845(a0)
                  lhu          gp, -43(t1)
                  sb           tp, 216(t5)
                  lb           a6, -221(t1)
                  lb           a6, -375(t5)
                  lb           a7, 535(t5)
                  lbu          s10, 62(t1)
                  sb           a7, 155(a4)
                  lh           a7, -1596(a0)
                  lh           tp, 1137(s11)
                  lhu          t6, -722(a0)
                  sb           t2, -76(t1)
                  lb           a2, -889(a0)
                  sb           s6, 198(t1)
                  sb           s4, -147(a4)
                  sb           s8, 865(s11)
                  sb           a2, -10(t1) #end load_store_instr_stream_2
                  lbu          s10, -1760(a0)
                  lbu          t6, 38(a4) #end load_store_instr_stream_4
                  sh           a0, 767(s11) #end load_store_instr_stream_1
                  lb           zero, -287(t5)
                  lbu          s3, -1325(a0)
                  sb           a5, -869(a0) #end load_store_instr_stream_3
                  sh           s1, 364(t5) #end load_store_instr_stream_0
                  addi         s2, zero, 2 #init loop 0 counter
                  c.addi4spn   a5, sp, 448
                  addi         t5, zero, 2 #init loop 0 limit
sub_3_171_0_t:    mulhsu       s0, s11, tp
                  slti         gp, s0, 1581
                  c.li         a1, -1
                  div          t6, s6, t6
                  c.andi       a3, 13
                  c.andi       s1, -1
                  c.andi       a2, -1
                  xori         s1, t2, 101
                  sra          a6, zero, s10
                  mulhu        a3, a5, sp
                  addi         s2, s2, -1 #update loop 0 counter
                  slt          t3, a2, ra
                  c.srai       a2, 14
                  bgeu         s2, t5, sub_3_171_0_t #branch for loop 0
                  c.or         a1, a4
                  la           s3, amo_0+28 #start riscv_lr_sc_instr_stream_14
                  auipc        tp, 107687
                  lr.w          s8, (s3)
                  sc.w.aq       a6, a6, (s3) #end riscv_lr_sc_instr_stream_14
                  la           s2, region_0+23 #start load_store_instr_stream_0
                  la           sp, region_1+1131 #start load_store_instr_stream_1
                  lb           s10, -1(sp)
                  lb           a5, 6(s2)
                  lbu          a0, 2(sp)
                  sh           a3, -11(s2)
                  lbu          a7, -4(sp)
                  lbu          s1, -2(s2)
                  sb           s3, -4(sp)
                  sb           s8, 14(s2)
                  sb           s10, 10(sp)
                  sw           a6, 9(sp)
                  lbu          s8, -12(s2)
                  sb           gp, 4(sp) #end load_store_instr_stream_1
                  lb           a5, 10(s2) #end load_store_instr_stream_0
                  la           s7, region_1+614 #start load_store_instr_stream_0
                  la           t1, region_0+550 #start load_store_instr_stream_1
                  lb           a5, 3(s7)
                  sb           s6, 11(t1)
                  lbu          ra, 9(s7)
                  lbu          gp, -14(s7)
                  sw           s10, 14(t1)
                  sb           s10, -2(t1)
                  lh           a6, -4(s7)
                  lb           zero, -15(t1)
                  lb           t0, -2(t1)
                  lbu          s11, -1(t1)
                  lb           gp, 5(s7)
                  lbu          s5, 1(s7)
                  lh           a7, -10(t1)
                  lb           a7, 6(s7)
                  sb           t6, -11(t1) #end load_store_instr_stream_1
                  lb           gp, -3(s7) #end load_store_instr_stream_0
                  addi         a6, zero, 1 #init loop 1 counter
                  addi         a5, zero, 13 #init loop 1 limit
                  c.mv         s7, t1
sub_3_165_1_t:    mulhu        t3, s9, a2
                  c.or         a2, s1
                  addi         a6, a6, 3 #update loop 1 counter
                  addi         s3, zero, -9 #init loop 0 counter
                  addi         a1, zero, -14 #init loop 0 limit
sub_3_165_0_t:    remu         t4, s4, a0
                  addi         s3, s3, -5 #update loop 0 counter
                  bne          s3, a1, sub_3_165_0_t #branch for loop 0
                  srl          s10, a5, a7
                  bltu         a6, a5, sub_3_165_1_t #branch for loop 1
                  add          tp, t2, s4
                  la           sp, amo_0+20 #start riscv_amo_instr_stream_18
                  la           s5, amo_0+12
                  amominu.w.rl  s11, s9, (s5)
                  amomin.w.rl   t3, s8, (s5)
                  sll          gp, s1, s9
                  amoadd.w      s3, s11, (s5)
                  amominu.w.aq  s8, s4, (s5) #end riscv_amo_instr_stream_18
                  la           t2, amo_0+12 #start riscv_lr_sc_instr_stream_16
                  lui          a1, 1009253
                  auipc        s5, 42353
                  c.addi4spn   a4, sp, 960
                  slti         a7, s7, 1798
                  add          gp, s5, s5
                  c.lui        t1, 25
                  add          a1, s10, s5
                  c.addi       ra, -1
                  c.slli       t0, 22
                  lr.w.rl       a4, (t2)
                  nop
                  c.nop
                  c.lui        s2, 25
                  mul          t4, tp, a1
                  and          a7, a0, a6
                  sc.w          s0, s1, (t2) #end riscv_lr_sc_instr_stream_16
                  la           tp, region_1+1387 #start load_store_instr_stream_0
                  la           a6, region_1+1327 #start load_store_instr_stream_1
                  sb           a2, 172(tp)
                  lb           t4, 18(tp)
                  lbu          t6, 208(a6)
                  lbu          s10, 230(a6)
                  sb           t4, 228(tp)
                  lb           a1, 3(a6)
                  lhu          a0, -197(a6)
                  lh           s2, -253(tp)
                  lbu          s7, 152(tp)
                  lb           s1, 230(a6)
                  lbu          t3, -190(tp)
                  sb           s5, 164(a6)
                  lb           t2, 190(a6)
                  lbu          ra, 190(tp)
                  lb           a4, 121(tp)
                  lbu          t1, 92(a6)
                  lh           a7, -15(a6) #end load_store_instr_stream_1
                  sb           t3, 222(tp) #end load_store_instr_stream_0
                  la           a1, region_0+1340 #start riscv_load_store_rand_instr_stream_3
                  rem          zero, s9, a1
                  c.li         s2, -1
                  sh           a0, -80(a1)
                  and          s7, t1, t5
                  nop
                  and          t1, t6, s4
                  c.andi       a4, 12
                  c.li         a4, -1
                  sb           a2, -53(a1)
                  sh           s11, -214(a1)
                  sll          t1, ra, s8
                  mulhsu       a5, a4, s4
                  sb           s4, -137(a1)
                  lbu          a0, 173(a1)
                  c.addi       a2, 31
                  sb           t0, -155(a1)
                  slli         a2, tp, 20
                  sb           s0, 116(a1)
                  lb           t5, 192(a1)
                  sb           zero, 155(a1)
                  c.sub        s0, a4
                  lb           tp, -237(a1)
                  lw           s7, -40(a1)
                  lb           t5, -227(a1)
                  c.lw         a2, 36(a1)
                  c.srai       a5, 9
                  sb           gp, -79(a1)
                  lhu          t2, 66(a1)
                  lhu          s5, -46(a1)
                  divu         s0, a3, s5
                  c.addi       s0, -1
                  lbu          s3, 132(a1)
                  mulhu        a7, s4, s0
                  lbu          s7, -73(a1)
                  lb           a4, 142(a1)
                  lbu          t5, 6(a1)
                  mulhu        sp, a3, zero
                  lbu          a5, 217(a1)
                  lhu          s3, 100(a1)
                  nop
                  xori         zero, s9, -2016
                  sb           s6, -147(a1)
                  lbu          a3, -213(a1)
                  lbu          a3, -233(a1)
                  lb           s1, -189(a1)
                  mulhsu       t1, a5, s0
                  sb           t4, 10(a1)
                  sb           tp, -165(a1) #end riscv_load_store_rand_instr_stream_3
                  la           sp, region_1+414 #start riscv_load_store_rand_instr_stream_11
                  or           s7, s10, a3
                  c.xor        a2, a2
                  sh           s0, -116(sp)
                  xori         s5, t4, -1523
                  sll          t2, s4, s4
                  auipc        zero, 419625
                  sb           s7, -224(sp)
                  lb           a4, -35(sp)
                  lb           s7, 211(sp)
                  sb           s0, 7(sp)
                  div          a6, ra, a7
                  c.nop
                  mulh         a4, a2, s7
                  c.srli       a1, 18
                  sltiu        a6, sp, -521
                  c.or         a0, a4
                  sb           t0, -221(sp)
                  srli         zero, t2, 28
                  sb           a7, -183(sp)
                  lui          s11, 667452
                  slt          s10, s7, s11
                  lbu          a6, -229(sp)
                  lb           a5, -54(sp)
                  auipc        s10, 585444
                  div          a1, tp, a4
                  lh           a3, 232(sp)
                  sra          s3, s6, a5
                  lb           ra, -215(sp)
                  lb           t5, -63(sp)
                  srl          t6, t6, s10
                  c.srai       a5, 9
                  lw           s10, 94(sp)
                  sh           t6, -58(sp)
                  c.li         s10, 13
                  lh           t2, 130(sp)
                  lb           s3, 105(sp)
                  sb           a4, -197(sp)
                  lbu          t3, 31(sp)
                  lbu          s2, 86(sp)
                  addi         s1, s1, -1471
                  c.lui        t4, 27
                  add          s7, t0, s11
                  sw           s2, -138(sp)
                  xor          s2, a4, s6
                  c.and        s0, a5
                  sb           s11, -23(sp)
                  mulh         s5, tp, t2
                  sb           t1, 7(sp)
                  c.mv         a1, a1
                  or           t1, sp, s5
                  sltu         a0, s6, s4
                  lbu          t0, 51(sp)
                  lb           s7, 249(sp) #end riscv_load_store_rand_instr_stream_11
sub_3_74:         jal          ra, 21f
0:                c.j          6f
1:                jal          ra, 2f
2:                c.j          7f
3:                c.j          25f
4:                c.jal        24f
5:                c.jal        22f
6:                c.j          14f
7:                c.j          8f
8:                jal          t5, 18f
9:                jal          ra, 0b
10:               c.j          23f
11:               c.jal        1b
12:               jal          ra, 20f
13:               c.j          11b
14:               c.jal        19f
15:               c.j          17f
16:               c.jal        15b
17:               c.j          9b
18:               c.j          4b
19:               c.jal        5b
20:               c.jal        10b
21:               c.j          16b
22:               jal          t2, 12b
23:               c.j          13b
24:               jal          t1, 3b
25:               mulhu        t2, a6, s0
                  la           t6, amo_0+20 #start riscv_amo_instr_stream_11
                  la           t2, amo_0+52
                  la           a7, amo_0+24
                  c.addi16sp   sp, 224
                  amoswap.w.aq  s8, t6, (t6)
                  amoswap.w.aq  a4, gp, (t6)
                  amominu.w.aq  t0, a1, (t6)
                  amoxor.w.rl   s10, t6, (t6)
                  amoor.w       t4, t6, (a7)
                  amoswap.w.rl  tp, t1, (t6)
                  amomaxu.w.aq  s5, s8, (t2)
                  amoor.w.rl    sp, s10, (t2)
                  andi         t1, t6, -1835
                  amomaxu.w.rl  s7, a1, (a7)
                  amomin.w.rl   a0, t5, (t6) #end riscv_amo_instr_stream_11
                  la           t6, amo_0+12 #start riscv_lr_sc_instr_stream_5
                  sltiu        a6, t6, -1965
                  mulh         zero, s2, gp
                  or           tp, a0, t0
                  c.add        s3, a5
                  c.or         a5, a5
                  c.and        a3, a2
                  addi         s3, s0, -1085
                  div          s3, t3, t0
                  div          s3, s8, s8
                  lr.w.aq       t3, (t6)
                  andi         t0, t6, -471
                  srai         a0, s7, 28
                  c.add        tp, a3
                  c.addi       a0, 23
                  c.addi16sp   sp, 368
                  sc.w.rl       ra, t3, (t6) #end riscv_lr_sc_instr_stream_5
                  la           a3, amo_0+56 #start riscv_lr_sc_instr_stream_19
                  sra          a0, zero, a1
                  srli         sp, ra, 4
                  sltiu        zero, s9, 1098
                  div          s5, t5, tp
                  lr.w.aq       t4, (a3)
                  sc.w.aq       t3, t1, (a3) #end riscv_lr_sc_instr_stream_19
                  la           t5, amo_0+8 #start riscv_lr_sc_instr_stream_6
                  lr.w          s2, (t5)
                  c.addi16sp   sp, 96
                  sub          t2, sp, a6
                  sc.w.rl       s5, a6, (t5) #end riscv_lr_sc_instr_stream_6
                  la           s10, region_1+47 #start load_store_instr_stream_0
                  la           t0, region_0+1922 #start load_store_instr_stream_1
                  lb           t5, 9(t0)
                  lh           a6, 237(s10)
                  sb           t6, 198(s10)
                  sb           t5, 37(t0)
                  lbu          a2, 16(s10)
                  sb           s7, 49(t0)
                  sb           s5, -21(t0)
                  lbu          s2, -3(s10)
                  sb           a5, 230(s10)
                  lbu          a3, -31(t0) #end load_store_instr_stream_1
                  sb           a3, -36(s10)
                  lh           zero, 145(s10) #end load_store_instr_stream_0
                  la           gp, region_0+1098 #start riscv_load_store_hazard_instr_stream_21
                  sb           t5, 232(gp)
                  lhu          a0, -324(gp)
                  sb           zero, -173(gp)
                  lb           t2, 664(gp)
                  lhu          t3, 664(gp)
                  sh           t5, -966(gp)
                  lh           t3, -966(gp)
                  sh           t4, -652(gp)
                  lh           s2, -652(gp)
                  mul          t5, t5, s2
                  lb           t4, -652(gp)
                  lhu          t6, -652(gp)
                  sb           a3, -359(gp)
                  lhu          s1, 682(gp)
                  sh           sp, -192(gp)
                  sw           a6, -458(gp)
                  sb           a7, -863(gp)
                  sb           sp, -863(gp) #end riscv_load_store_hazard_instr_stream_21
                  la           a4, region_1+839 #start load_store_instr_stream_3
                  la           s2, region_1+1454 #start load_store_instr_stream_4
                  lbu          a2, 51(s2)
                  la           s7, region_1+1587 #start load_store_instr_stream_1
                  lbu          t6, 31(a4)
                  lb           a5, 0(s7)
                  lbu          a2, 1(s7)
                  sb           s8, -963(s2)
                  la           t0, region_1+209 #start load_store_instr_stream_2
                  lh           t2, 133(t0)
                  la           s8, region_1+875 #start load_store_instr_stream_0
                  lbu          t2, -6(s7)
                  lbu          t3, 146(a4)
                  lw           t3, 101(a4)
                  lb           s10, 19(t0)
                  lh           a6, 591(s8)
                  lw           a2, 390(s2)
                  lh           s1, -79(a4)
                  lb           ra, -96(t0)
                  lb           sp, 449(s2)
                  lb           t3, 14(s7)
                  lh           t1, 189(t0)
                  lb           tp, 6(s7)
                  sb           a7, 96(a4)
                  sb           s0, -28(s8)
                  lbu          t2, -2(s7)
                  lb           sp, -82(t0)
                  sb           a7, -8(s7)
                  lb           tp, 941(s8)
                  sb           gp, 132(t0) #end load_store_instr_stream_2
                  lb           ra, -993(s2)
                  lbu          s1, 190(a4)
                  lbu          a3, 452(s2)
                  sb           t1, 23(s2)
                  sb           s2, -12(s7)
                  lbu          a7, 130(a4)
                  lbu          t3, 202(a4) #end load_store_instr_stream_3
                  lw           ra, -295(s8)
                  lbu          sp, -311(s2)
                  lbu          t5, 16(s7)
                  lh           a7, -1332(s2) #end load_store_instr_stream_4
                  sb           t1, -2(s7) #end load_store_instr_stream_1
                  sb           s8, 388(s8) #end load_store_instr_stream_0
                  la           sp, amo_0+56 #start riscv_lr_sc_instr_stream_15
                  sltiu        s3, s2, -910
                  slt          tp, a0, t2
                  sra          ra, s5, a2
                  lr.w          a6, (sp)
                  sra          t1, a4, a3
                  nop
                  sc.w          a5, t4, (sp) #end riscv_lr_sc_instr_stream_15
                  la           a2, region_1+1145 #start load_store_instr_stream_1
                  lb           a4, -60(a2)
                  la           t1, region_0+1618 #start load_store_instr_stream_0
                  lb           a5, -52(a2)
                  lb           a7, -35(t1)
                  lw           t2, 58(t1)
                  sb           s9, 39(t1)
                  lh           t0, 1(a2)
                  lhu          t2, -49(a2)
                  lbu          t2, 43(t1)
                  sb           t1, -50(a2)
                  sb           a2, 1(a2)
                  sb           t1, -4(t1)
                  lb           zero, -25(a2)
                  lbu          a7, -62(t1)
                  lb           s7, -27(t1)
                  lbu          zero, -53(t1)
                  sb           t4, 62(a2) #end load_store_instr_stream_1
                  sb           s7, 12(t1)
                  lh           a6, -12(t1) #end load_store_instr_stream_0
                  la           sp, region_0+939 #start load_store_instr_stream_1
                  la           a2, region_0+801 #start load_store_instr_stream_0
                  lbu          t4, 22(sp)
                  lbu          t6, 16(a2)
                  lbu          a0, -32(sp)
                  la           s10, region_0+1990 #start load_store_instr_stream_2
                  lbu          s7, -8(a2)
                  sb           t1, -7(a2)
                  lb           ra, 10(a2)
                  lhu          a0, -21(sp)
                  lh           a0, -5(a2)
                  sb           a4, 55(sp)
                  sb           tp, -1876(s10)
                  sh           s10, 7(a2)
                  lh           t0, -1736(s10)
                  lb           a5, -6(sp)
                  lb           a5, 52(sp) #end load_store_instr_stream_1
                  lh           zero, -1640(s10)
                  lbu          gp, 2(a2)
                  lhu          t4, -106(s10)
                  sb           t1, -1392(s10) #end load_store_instr_stream_2
                  sw           a4, 3(a2) #end load_store_instr_stream_0
                  la           t0, region_0+860 #start riscv_hazard_instr_stream_1
                  c.srli       a3, 15
                  lbu          zero, -184(t0)
                  lbu          t6, -233(t0)
                  srli         a3, zero, 15
                  sltiu        a3, a6, 37
                  lbu          a5, -24(t0)
                  lb           zero, -251(t0)
                  c.and        a3, a3
                  lh           tp, 102(t0)
                  slti         t6, tp, 1848
                  slti         a6, t6, 1931
                  lb           a5, 61(t0)
                  mulhu        t6, tp, zero
                  slti         t6, a3, -697
                  xor          a3, tp, tp
                  sb           tp, 5(t0)
                  andi         t6, a5, -960
                  divu         a5, a3, a6
                  lw           t6, -40(t0)
                  lhu          t6, 242(t0)
                  c.sub        a5, a3
                  c.mv         a5, a6
                  sb           a3, -158(t0)
                  mulhu        a5, a6, a3
                  sltiu        a3, a5, -768
                  lb           tp, 213(t0)
                  lw           a6, -68(t0)
                  c.nop
                  sh           a5, -226(t0)
                  c.srai       a3, 10
                  srli         a6, a3, 24
                  lhu          a6, 194(t0)
                  sb           a3, -233(t0)
                  c.srai       a3, 22
                  mul          a6, t6, t6
                  sb           zero, 73(t0)
                  xor          tp, a3, a5
                  lh           a3, -30(t0)
                  sb           tp, 22(t0)
                  sb           zero, 9(t0)
                  sb           tp, 69(t0)
                  sra          zero, tp, a6
                  lbu          a5, 59(t0)
                  sub          t6, a6, a3
                  sh           zero, -160(t0)
                  sltu         a3, t6, t6
                  lui          a6, 981646
                  lhu          tp, 232(t0)
                  sh           zero, 138(t0)
                  c.xor        a5, a5
                  and          a3, a3, a5
                  sb           zero, 244(t0) #end riscv_hazard_instr_stream_1
                  la           sp, region_1+843 #start riscv_load_store_hazard_instr_stream_12
                  lbu          a7, -500(sp)
                  lbu          tp, -64(sp)
                  lhu          t5, 461(sp)
                  slti         a5, a4, 1246
                  sb           t1, 461(sp)
                  lw           a7, 461(sp)
                  c.srli       a2, 17
                  sb           a0, 82(sp)
                  sb           s1, -346(sp)
                  sb           t1, -346(sp)
                  lb           s3, -346(sp)
                  lbu          zero, -346(sp)
                  lbu          t1, -346(sp) #end riscv_load_store_hazard_instr_stream_12
                  la           ra, region_1+1808 #start riscv_hazard_instr_stream_24
                  sb           s2, 142(ra)
                  slt          gp, a6, gp
                  add          a2, s2, s2
                  c.slli       a6, 1
                  lhu          a2, -10(ra)
                  slti         a6, s2, 1362
                  sh           a2, 172(ra)
                  xor          gp, s2, a5
                  lbu          a5, 89(ra)
                  slti         s2, s7, -1448
                  sltiu        s2, gp, 154
                  c.xor        a2, a5
                  c.or         a5, a5
                  c.add        a2, gp
                  c.lui        a2, 29
                  nop
                  c.xor        a5, a2
                  sltu         a6, s2, a5
                  or           a2, a2, gp
                  slt          s7, a6, a2
                  c.xor        a2, a5
                  or           s7, gp, a2
                  sh           s2, 172(ra)
                  lw           gp, -192(ra)
                  c.and        a5, a2
                  sltu         s7, a2, a6
                  mulhsu       a5, a6, gp
                  lh           a2, -108(ra)
                  c.xor        a5, a5
                  lw           a2, 180(ra)
                  sb           a6, 34(ra)
                  c.addi       s7, 1
                  slti         a2, s7, 1615
                  div          s2, s7, s2
                  sb           gp, 105(ra)
                  remu         gp, a5, s7
                  lb           s7, -209(ra)
                  c.sub        a5, a5
                  lh           a5, 146(ra) #end riscv_hazard_instr_stream_24
                  la           s8, region_0+1794 #start load_store_instr_stream_1
                  la           gp, region_0+1610 #start load_store_instr_stream_3
                  la           t4, region_0+1286 #start load_store_instr_stream_0
                  la           s5, region_0+295 #start load_store_instr_stream_2
                  sb           a5, -1515(gp)
                  sb           s5, -8(s8)
                  lbu          t2, -214(t4)
                  lhu          t3, 24(s8)
                  sb           s8, 55(s5)
                  sh           a3, 290(gp)
                  sh           t1, 348(gp)
                  lb           a5, 55(s5)
                  lbu          t0, -79(gp)
                  sh           s7, -644(gp)
                  lb           a6, -11(s8)
                  lb           s1, -27(s5)
                  sb           t2, -187(gp)
                  sb           s10, -50(s8)
                  lb           a4, -317(gp)
                  lh           s2, -17(s5)
                  lb           s1, -90(gp)
                  lbu          s0, 160(t4)
                  lh           t6, 60(s8)
                  lbu          s1, 8(s5)
                  sb           s3, -1496(gp)
                  sb           a0, -26(s5)
                  lh           a2, 242(t4)
                  sb           t2, 55(s8)
                  lh           t6, 30(s8)
                  lb           s10, 12(s5)
                  lb           t3, -27(s8)
                  sh           s1, 162(t4)
                  lhu          t5, -47(s5)
                  lbu          t6, 6(s5)
                  lbu          a0, -42(s5) #end load_store_instr_stream_2
                  lbu          a7, -1299(gp) #end load_store_instr_stream_3
                  lhu          a4, 50(t4)
                  sw           t5, -46(s8) #end load_store_instr_stream_1
                  lhu          a6, -206(t4) #end load_store_instr_stream_0
                  la           t5, region_1+449 #start load_store_instr_stream_0
                  la           s10, region_1+1978 #start load_store_instr_stream_1
                  lh           a0, 169(t5)
                  sb           t2, -1181(s10)
                  lh           a6, -77(t5)
                  lbu          sp, -703(s10)
                  lw           gp, -1170(s10)
                  lb           s7, 229(t5)
                  sh           s3, 21(t5)
                  sb           t3, 20(s10)
                  lh           a2, -51(t5)
                  sh           s7, 153(t5)
                  lh           a3, -179(t5)
                  lw           tp, -50(s10)
                  lbu          s11, -771(s10) #end load_store_instr_stream_1
                  lbu          zero, -52(t5)
                  sb           s8, 139(t5) #end load_store_instr_stream_0
                  la           gp, region_0+1612 #start load_store_instr_stream_0
                  la           s10, region_1+819 #start load_store_instr_stream_1
                  lb           s1, 164(gp)
                  lb           a5, 15(s10)
                  lhu          a3, 13(s10)
                  sb           a4, -242(gp)
                  sb           a5, 8(s10)
                  sb           t0, -6(s10)
                  lhu          t0, -692(gp)
                  sb           a2, -493(gp)
                  lbu          a0, 0(s10)
                  lb           s11, -8(s10) #end load_store_instr_stream_1
                  sb           s11, 310(gp) #end load_store_instr_stream_0
sub_3_63:         jal          ra, 0f
0:                jal          s5, 3f
1:                c.j          10f
2:                c.jal        9f
3:                jal          ra, 4f
4:                c.jal        6f
5:                jal          ra, 2b
6:                jal          ra, 8f
7:                c.jal        1b
8:                jal          t1, 5b
9:                jal          ra, 7b
10:               ori          a7, zero, -468
sub_3_80:         jal          ra, 23f
0:                c.jal        18f
1:                jal          t1, 6f
2:                c.jal        17f
3:                c.jal        10f
4:                c.jal        9f
5:                jal          a6, 3b
6:                c.j          8f
7:                c.j          11f
8:                c.jal        26f
9:                jal          t1, 2b
10:               c.jal        0b
11:               c.j          12f
12:               jal          ra, 14f
13:               c.j          16f
14:               c.j          25f
15:               c.jal        4b
16:               jal          t1, 7b
17:               c.j          1b
18:               c.jal        13b
19:               c.j          22f
20:               jal          ra, 15b
21:               jal          ra, 20b
22:               c.jal        24f
23:               c.j          19b
24:               jal          a0, 5b
25:               jal          ra, 21b
26:               ori          gp, s11, -1856
sub_3_82:         jal          ra, 17f
0:                c.j          5f
1:                c.j          3f
2:                c.jal        9f
3:                jal          t0, 13f
4:                c.jal        0b
5:                c.j          1b
6:                c.jal        2b
7:                c.jal        6b
8:                jal          tp, 18f
9:                c.j          15f
10:               c.j          4b
11:               c.jal        16f
12:               c.jal        7b
13:               c.jal        12b
14:               c.jal        10b
15:               c.j          11b
16:               jal          t1, 8b
17:               c.jal        14b
18:               c.addi16sp   sp, 432
sub_3_59:         jal          ra, 3f
0:                jal          ra, 5f
1:                jal          ra, 20f
2:                c.jal        12f
3:                c.j          24f
4:                c.jal        18f
5:                jal          t1, 15f
6:                c.j          7f
7:                c.jal        0b
8:                c.j          19f
9:                jal          ra, 16f
10:               c.jal        8b
11:               jal          s2, 23f
12:               jal          s7, 1b
13:               jal          ra, 6b
14:               jal          a7, 11b
15:               jal          s0, 4b
16:               jal          t5, 25f
17:               c.j          2b
18:               jal          ra, 14b
19:               jal          t1, 22f
20:               jal          ra, 21f
21:               c.jal        13b
22:               c.jal        9b
23:               c.j          10b
24:               c.j          17b
25:               c.slli       a5, 10
                  la           t1, region_0+1473 #start load_store_instr_stream_1
                  la           s10, region_0+313 #start load_store_instr_stream_3
                  la           a6, region_0+1541 #start load_store_instr_stream_4
                  la           a1, region_0+382 #start load_store_instr_stream_2
                  lh           ra, -759(a6)
                  lhu          s7, 57(t1)
                  lb           s2, 313(s10)
                  lb           t5, -1501(a6)
                  la           a7, region_0+1102 #start load_store_instr_stream_0
                  lhu          t5, -771(a6)
                  lb           t4, -1381(a6)
                  lhu          t4, 417(a6)
                  sb           s6, -4(a1)
                  lhu          s7, -45(t1)
                  lhu          s11, 13(t1)
                  lb           t5, 1189(s10)
                  lbu          sp, -187(a7)
                  lbu          zero, -239(a7)
                  lbu          t0, 11(t1)
                  sb           gp, 177(a7)
                  sb           tp, 882(s10)
                  lh           zero, -25(t1)
                  lb           t2, 12(a1)
                  lbu          t4, -7(a7)
                  lb           s1, -105(s10)
                  lb           a3, -16(t1)
                  lbu          s3, -40(s10)
                  lb           s1, -1445(a6)
                  lb           a2, -7(a1)
                  sh           t0, 27(t1)
                  sb           gp, -1(a1)
                  lw           zero, 575(s10) #end load_store_instr_stream_3
                  lh           t4, 53(t1)
                  sh           s0, -49(t1)
                  sb           a6, -151(a7)
                  lb           gp, 15(a1) #end load_store_instr_stream_2
                  lb           s3, -460(a6) #end load_store_instr_stream_4
                  lh           sp, -66(a7)
                  lbu          s11, -22(t1) #end load_store_instr_stream_1
                  sb           a7, 167(a7) #end load_store_instr_stream_0
                  la           sp, region_0+1619 #start riscv_load_store_hazard_instr_stream_6
                  lhu          s10, 59(sp)
                  lh           t5, -27(sp)
                  sb           t5, -27(sp)
                  srl          ra, t4, ra
                  lbu          zero, -40(sp)
                  c.andi       a5, -1
                  lbu          a5, -40(sp)
                  sb           s9, -40(sp)
                  lb           a2, 16(sp)
                  c.xor        a0, a0
                  lbu          gp, 3(sp)
                  sb           s9, -29(sp)
                  sh           s0, -29(sp)
                  c.xor        a0, a5
                  lhu          ra, -55(sp)
                  sub          a5, a4, s9
                  lbu          s2, 8(sp)
                  sh           s11, 17(sp)
                  c.lui        gp, 17
                  remu         t0, s6, tp
                  lhu          a6, 17(sp)
                  sb           s8, 12(sp)
                  lh           s5, 27(sp)
                  lb           t0, 43(sp)
                  sb           a2, 58(sp)
                  lbu          t0, -43(sp)
                  lbu          a3, -43(sp) #end riscv_load_store_hazard_instr_stream_6
                  la           t0, region_1+623 #start load_store_instr_stream_1
                  la           gp, region_0+677 #start load_store_instr_stream_0
                  sh           a5, 5(t0)
                  sh           s5, 7(t0)
                  lb           s0, -12(t0)
                  lb           s1, 23(gp)
                  lhu          t4, -25(gp)
                  lbu          s10, 43(gp)
                  lb           a7, -48(gp)
                  sh           gp, 3(t0)
                  sb           s3, 8(t0)
                  lhu          sp, -1(t0)
                  lhu          t5, -1(t0) #end load_store_instr_stream_1
                  lbu          a6, 32(gp)
                  lb           s8, 22(gp)
                  sw           s8, -25(gp) #end load_store_instr_stream_0
                  la           s2, amo_0+48 #start riscv_lr_sc_instr_stream_20
                  lui          t3, 40134
                  c.lui        s11, 22
                  lui          a2, 5088
                  andi         s5, a4, -1710
                  c.or         s0, a2
                  andi         tp, zero, 20
                  sltu         s11, a5, ra
                  c.li         s7, 14
                  addi         sp, ra, -952
                  xori         a7, a5, 1207
                  auipc        s0, 293939
                  mulhsu       s11, t0, a3
                  sltiu        sp, a0, -228
                  div          ra, t1, s1
                  slt          gp, s2, t4
                  lr.w.rl       a0, (s2)
                  sc.w.aq       s3, s1, (s2) #end riscv_lr_sc_instr_stream_20
                  la           ra, region_0+1737 #start riscv_hazard_instr_stream_4
                  c.or         a2, a2
                  slti         t4, a2, 1827
                  andi         a2, a2, -2037
                  c.nop
                  lbu          t2, -226(ra)
                  c.addi       a2, -1
                  mulhu        a2, a2, s8
                  divu         t2, t4, t2
                  sb           a2, -68(ra)
                  lbu          s10, -127(ra)
                  sb           t4, -41(ra)
                  lb           t2, -128(ra)
                  mulhsu       a2, t4, a2
                  lb           t2, -210(ra)
                  lhu          s8, -63(ra)
                  rem          t4, t3, t2
                  div          a2, s10, s10
                  c.addi       t2, -1
                  lh           t3, 177(ra)
                  lb           t3, 49(ra)
                  c.and        a2, a2
                  lbu          t3, -220(ra)
                  lbu          s10, 97(ra)
                  xori         t2, t2, 1997
                  addi         t4, t4, -940
                  sb           a2, 157(ra)
                  lb           t4, 72(ra) #end riscv_hazard_instr_stream_4
                  la           s0, region_0+1463 #start load_store_instr_stream_1
                  lbu          tp, 39(s0)
                  lbu          t4, 48(s0)
                  la           t0, region_1+749 #start load_store_instr_stream_0
                  sb           gp, 32(t0)
                  lbu          tp, 20(s0)
                  lb           a4, 8(t0)
                  lh           a4, -43(s0)
                  sb           s8, -56(s0)
                  sb           s9, 24(t0)
                  sw           a4, 191(t0)
                  lw           s2, 21(s0)
                  sb           ra, 11(s0)
                  sb           s1, -8(s0)
                  sb           gp, -226(t0)
                  lb           a1, -62(s0)
                  lb           a0, 8(s0) #end load_store_instr_stream_1
                  lb           s2, -167(t0) #end load_store_instr_stream_0
                  la           a4, region_1+640 #start load_store_instr_stream_1
                  la           t5, region_0+1783 #start load_store_instr_stream_0
                  sb           t5, 113(a4)
                  lb           t2, -249(a4)
                  sb           s3, -1184(t5)
                  sh           t4, -82(a4)
                  sw           a6, -927(t5)
                  lb           zero, -106(a4)
                  lbu          tp, -117(a4)
                  sb           a6, 94(t5)
                  lbu          t3, -99(t5)
                  sb           t1, -33(a4)
                  sb           t5, -179(a4)
                  lb           s1, -1515(t5)
                  sh           zero, -46(a4)
                  sb           a6, -374(t5)
                  lb           s10, 215(a4) #end load_store_instr_stream_1
                  sb           s5, -48(t5)
                  sb           s0, -376(t5) #end load_store_instr_stream_0
                  la           sp, region_1+1959 #start riscv_load_store_hazard_instr_stream_22
                  lb           s2, -53(sp)
                  sra          a0, ra, s5
                  c.addi       t1, -1
                  sb           sp, -2(sp)
                  lbu          a5, 37(sp)
                  c.or         a3, a2
                  xor          s3, t1, t2
                  xori         t6, ra, 1768
                  sh           a7, 37(sp)
                  lbu          s10, 37(sp)
                  sb           a4, 28(sp)
                  lbu          a4, 28(sp)
                  sb           a5, 28(sp)
                  lh           t4, -113(sp)
                  lb           s2, 12(sp)
                  lh           a2, 37(sp)
                  mul          a3, s0, s2
                  lbu          t4, -66(sp)
                  lbu          t1, -141(sp)
                  sb           a7, -4(sp)
                  lh           s8, -17(sp)
                  c.and        a4, a5
                  lhu          t3, -17(sp) #end riscv_load_store_hazard_instr_stream_22
sub_3_60:         jal          ra, 14f
0:                jal          ra, 1f
1:                c.j          20f
2:                c.j          11f
3:                c.jal        28f
4:                c.j          5f
5:                jal          ra, 24f
6:                c.jal        7f
7:                c.j          23f
8:                jal          ra, 3b
9:                jal          ra, 2b
10:               c.j          26f
11:               c.j          6b
12:               c.jal        8b
13:               c.j          0b
14:               c.j          9b
15:               jal          t1, 4b
16:               jal          ra, 15b
17:               jal          ra, 10b
18:               jal          ra, 16b
19:               c.j          17b
20:               jal          s5, 27f
21:               jal          ra, 19b
22:               c.j          13b
23:               c.jal        21b
24:               c.j          25f
25:               c.j          12b
26:               c.j          22b
27:               jal          t1, 18b
28:               c.addi16sp   sp, 352
                  la           s3, region_1+966 #start riscv_hazard_instr_stream_22
                  sb           a4, 149(s3)
                  ori          s8, s11, -1784
                  lhu          a4, -16(s3)
                  c.li         s8, 23
                  c.srli       a4, 6
                  sw           s11, -202(s3)
                  lbu          a4, -189(s3)
                  srl          sp, s8, s8
                  sh           s0, 256(s3)
                  lhu          s0, 12(s3)
                  lb           s8, 91(s3)
                  lb           s11, 216(s3)
                  lh           s8, -140(s3)
                  sb           a4, -161(s3)
                  rem          s11, s0, s8
                  lb           a4, 167(s3)
                  lb           tp, 149(s3)
                  lb           s8, -185(s3)
                  sb           a4, 252(s3)
                  lb           a4, 131(s3)
                  lbu          a4, 16(s3)
                  lbu          s0, -141(s3)
                  sltiu        sp, tp, -1501
                  sll          sp, tp, sp
                  c.lui        s8, 26
                  lbu          s0, 100(s3)
                  lh           sp, -40(s3)
                  lb           s8, 23(s3)
                  sb           tp, -41(s3)
                  sltu         s0, tp, sp
                  srli         sp, a4, 9
                  lb           tp, 151(s3)
                  sb           a4, -159(s3)
                  lb           a4, -157(s3)
                  lb           s11, 8(s3)
                  lbu          s8, -45(s3)
                  xor          s8, s0, s11
                  lb           sp, 171(s3) #end riscv_hazard_instr_stream_22
                  la           a6, amo_0+40 #start riscv_lr_sc_instr_stream_2
                  nop
                  c.nop
                  andi         t3, gp, 1789
                  c.srli       s1, 20
                  c.or         a0, a0
                  mulh         s7, s9, a2
                  c.srai       a5, 11
                  lr.w.rl       s3, (a6)
                  sra          s5, s7, a6
                  rem          t1, a3, s7
                  sc.w.aq       t1, s11, (a6) #end riscv_lr_sc_instr_stream_2
                  la           a0, amo_0+12 #start riscv_lr_sc_instr_stream_9
                  lr.w.rl       a7, (a0)
                  slti         a4, t0, 1943
                  c.srli       a5, 21
                  xor          t0, s5, s10
                  lui          s11, 633844
                  mulh         s11, a4, s3
                  sc.w.rl       t4, s7, (a0) #end riscv_lr_sc_instr_stream_9
sub_3_71:         jal          ra, 6f
0:                jal          t1, 2f
1:                c.jal        5f
2:                c.j          7f
3:                jal          ra, 17f
4:                c.j          1b
5:                c.j          10f
6:                jal          ra, 9f
7:                c.jal        13f
8:                jal          ra, 18f
9:                jal          t0, 16f
10:               c.jal        3b
11:               jal          t0, 14f
12:               jal          tp, 8b
13:               c.jal        20f
14:               c.jal        15f
15:               c.j          12b
16:               c.j          4b
17:               jal          t0, 19f
18:               c.j          21f
19:               jal          s3, 0b
20:               c.j          11b
21:               srli         a5, s9, 15
                  addi         s7, zero, -4 #init loop 1 counter
                  div          t2, tp, s2
                  addi         s1, zero, 9 #init loop 1 limit
sub_3_153_1_t:    sub          t2, t1, a3
                  sltu         s3, t4, a6
                  c.addi       tp, 29
                  remu         s11, t3, a2
                  mul          a1, s5, gp
                  addi         s7, s7, 1 #update loop 1 counter
                  addi         s0, zero, -9 #init loop 0 counter
                  c.and        a4, s1
                  addi         zero, zero, 0 #init loop 0 limit
sub_3_153_0_t:    or           s10, t2, s8
                  sra          t1, a4, a4
                  addi         s0, s0, 9 #update loop 0 counter
                  c.beqz       s0, sub_3_153_0_t #branch for loop 0
                  bltu         s7, s1, sub_3_153_1_t #branch for loop 1
                  nop
                  la           s1, region_1+473 #start load_store_instr_stream_2
                  la           gp, region_1+139 #start load_store_instr_stream_4
                  la           t4, region_1+215 #start load_store_instr_stream_3
                  sh           a7, 19(gp)
                  sb           a3, -7(s1)
                  la           t0, region_1+618 #start load_store_instr_stream_1
                  lbu          s7, -4(t4)
                  sb           a3, 9(gp)
                  la           s10, region_1+1925 #start load_store_instr_stream_0
                  lbu          a7, 16(s1)
                  lbu          s0, 6(gp)
                  lh           t5, -59(gp)
                  lh           t6, -9(gp)
                  lbu          sp, -1113(s10)
                  sb           s5, 7(t4)
                  sh           a0, -11(s1)
                  lbu          a7, 5(t0)
                  lb           s0, 9(s1)
                  lhu          a3, 14(t0)
                  lb           s3, 9(t4)
                  sb           s11, -1342(s10)
                  lbu          t6, 12(s1)
                  lbu          a4, -11(t0)
                  sb           s2, -17(gp)
                  lbu          t2, -9(t0)
                  lb           s0, -1322(s10)
                  sb           t1, 6(s1)
                  lb           s2, 14(s1)
                  lhu          a3, -9(gp)
                  lb           a6, -3(t4)
                  sb           zero, 0(t0)
                  sb           a2, -774(s10)
                  lb           t6, -19(gp)
                  lbu          a0, -36(gp) #end load_store_instr_stream_4
                  sb           ra, 1(t0)
                  lb           t5, -5(s1) #end load_store_instr_stream_2
                  lbu          s3, 3(t4)
                  lb           t5, -2(t0)
                  lb           s8, -10(t4)
                  sh           s7, 8(t0)
                  sb           s10, -11(t0) #end load_store_instr_stream_1
                  lb           s0, -9(t4) #end load_store_instr_stream_3
                  lhu          s3, -37(s10) #end load_store_instr_stream_0
                  la           tp, amo_0+56 #start riscv_lr_sc_instr_stream_23
                  lr.w.aq       s10, (tp)
                  slti         s3, a5, -1090
                  sc.w.rl       s7, ra, (tp) #end riscv_lr_sc_instr_stream_23
                  addi         a1, zero, -3 #init loop 0 counter
                  sub          zero, s7, t6
                  ori          s3, zero, 1469
                  sltu         sp, a7, sp
                  lui          s0, 653022
                  addi         t2, zero, -11 #init loop 0 limit
                  divu         s1, s8, t4
                  or           tp, tp, s2
                  c.sub        a5, s1
                  andi         s7, sp, -187
                  slti         t5, s9, 983
                  c.addi16sp   sp, 320
                  c.andi       a4, 0
                  sll          s3, zero, s7
                  mulhu        s0, s9, a5
sub_3_157_0_t:    and          a6, s1, s7
                  sra          s5, t3, s6
                  xori         s10, zero, -1811
                  addi         a1, a1, -1 #update loop 0 counter
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  c.sub        a4, a5
                  mulh         t3, a5, a4
                  c.add        s0, s8
                  divu         s0, a6, zero
                  bge          a1, t2, sub_3_157_0_t #branch for loop 0
                  sll          ra, a2, s3
                  la           sp, region_0+1674 #start riscv_hazard_instr_stream_12
                  c.xor        s1, a5
                  lbu          a5, -20(sp)
                  lui          a5, 22755
                  c.mv         s1, gp
                  lhu          gp, 64(sp)
                  lb           t0, -29(sp)
                  c.add        s2, a1
                  c.srai       s1, 13
                  c.lui        s1, 8
                  lb           a5, 53(sp)
                  and          s2, t0, a5
                  sw           s2, 62(sp)
                  lw           gp, 42(sp)
                  srl          s1, s1, s1
                  srl          a5, a1, gp
                  sh           t0, -42(sp)
                  srl          a1, s2, s2
                  nop
                  lhu          a1, -36(sp)
                  sb           gp, 52(sp)
                  c.sub        a1, a1
                  xori         t0, gp, 1352
                  sw           t0, -18(sp)
                  srli         gp, s1, 12
                  c.srli       a1, 17
                  ori          t0, gp, -717
                  lbu          s1, -31(sp)
                  lbu          a5, -28(sp)
                  srai         t0, t0, 17
                  lbu          s2, -15(sp)
                  lb           s2, -60(sp)
                  and          s1, a1, s2
                  lb           a1, 15(sp) #end riscv_hazard_instr_stream_12
                  la           s3, region_1+286 #start load_store_instr_stream_1
                  sb           s11, 839(s3)
                  la           s8, region_1+822 #start load_store_instr_stream_2
                  la           a7, region_1+812 #start load_store_instr_stream_0
                  lb           a0, 409(s8)
                  sb           a5, 1121(s3)
                  lbu          s5, 457(s3)
                  lbu          s1, 643(a7)
                  lb           a3, 525(s3)
                  lh           a4, -592(a7)
                  lbu          a2, 804(s8)
                  sb           s4, -485(a7)
                  lbu          a2, -481(s8)
                  lb           s0, -718(a7)
                  sh           sp, 518(s3)
                  sb           sp, -681(a7)
                  lb           gp, 233(s3)
                  lbu          tp, -761(s8)
                  lbu          s0, 365(s3)
                  lb           t4, 813(a7)
                  lb           a2, 1665(s3)
                  sb           a6, 1033(a7)
                  lbu          a3, 529(s8) #end load_store_instr_stream_2
                  sh           a7, 672(s3) #end load_store_instr_stream_1
                  lw           t0, 676(a7) #end load_store_instr_stream_0
                  la           sp, region_1+1073 #start load_store_instr_stream_2
                  la           a4, region_1+1798 #start load_store_instr_stream_1
                  la           a5, region_1+1507 #start load_store_instr_stream_3
                  la           a3, region_1+1455 #start load_store_instr_stream_0
                  lb           s0, -39(sp)
                  sb           s7, 44(a3)
                  sw           t4, -63(a3)
                  sb           s11, -175(a4)
                  lb           t3, -48(sp)
                  lhu          s8, 11(a3)
                  lb           ra, -127(a4)
                  lbu          a2, 16(sp)
                  lhu          a2, -15(a5)
                  lh           t3, 25(sp)
                  lb           s11, 32(sp)
                  sb           s8, -68(a4)
                  lbu          t5, 12(a5)
                  sb           s7, 177(a4)
                  lh           a2, 15(a5)
                  lbu          s0, 6(a5)
                  lbu          s0, -26(sp)
                  lb           s5, -4(a5)
                  lh           a7, 21(a3)
                  sb           t6, -15(sp)
                  sw           s10, -50(a4)
                  sb           t5, 10(a5)
                  lbu          a1, 20(sp)
                  lbu          a1, 58(a3)
                  lb           s8, 105(a4)
                  sb           s0, 6(a5)
                  lw           s7, 47(sp) #end load_store_instr_stream_2
                  lbu          t1, -255(a4)
                  sb           s1, 76(a4) #end load_store_instr_stream_1
                  sb           zero, 10(a5)
                  sh           gp, -9(a5) #end load_store_instr_stream_3
                  lb           s10, -30(a3) #end load_store_instr_stream_0
                  la           a3, region_1+724 #start riscv_hazard_instr_stream_0
                  sltu         a1, gp, gp
                  slli         t4, t4, 28
                  lb           s3, -585(a3)
                  lb           ra, -50(a3)
                  lb           gp, 462(a3)
                  lh           s3, 600(a3)
                  lbu          a1, -429(a3)
                  c.lui        s3, 19
                  lbu          s3, -569(a3)
                  lb           zero, 197(a3)
                  lb           zero, -193(a3)
                  sra          zero, gp, zero
                  c.li         t4, -1
                  sb           a1, 249(a3)
                  slli         t4, gp, 23
                  lb           gp, 253(a3)
                  sb           zero, -69(a3)
                  sb           zero, 167(a3)
                  div          a1, ra, t4
                  lb           ra, -639(a3)
                  xori         ra, ra, 1085
                  lbu          gp, 731(a3)
                  lhu          t4, 994(a3)
                  sb           a1, 396(a3)
                  lhu          ra, 366(a3)
                  lb           a1, 1111(a3)
                  srli         s3, t4, 3
                  sltu         zero, t4, gp
                  c.nop
                  add          zero, a1, zero
                  lhu          t4, 46(a3)
                  xori         ra, ra, -1009
                  sb           a1, 1173(a3)
                  sb           t4, 233(a3)
                  lb           gp, 817(a3) #end riscv_hazard_instr_stream_0
                  la           s2, region_1+462 #start riscv_hazard_instr_stream_6
                  slti         tp, t6, -34
                  xori         s5, tp, 594
                  sra          t5, t6, a0
                  lb           tp, 5(s2)
                  mulhu        t5, a4, t5
                  c.nop
                  srli         t5, a0, 18
                  lbu          t5, 13(s2)
                  lhu          a4, 4(s2)
                  lb           t6, 14(s2)
                  c.or         a0, a0
                  andi         a4, a4, -1849
                  srai         t5, t6, 5
                  lb           tp, 11(s2)
                  lw           t6, -6(s2)
                  lh           a0, -8(s2)
                  and          a0, a0, s5
                  lhu          a4, 16(s2)
                  lb           tp, 16(s2)
                  lh           t5, 16(s2)
                  sb           s5, -4(s2)
                  mulhu        t6, t6, a0
                  sb           a4, -1(s2)
                  sub          t6, t6, a0
                  sltiu        tp, a4, -862
                  lb           a4, -7(s2)
                  sh           s5, 16(s2)
                  lbu          a0, -9(s2)
                  rem          s5, t5, s5
                  and          t6, tp, a0
                  sb           t5, -9(s2)
                  div          a0, t6, a4
                  xori         a4, s5, -726
                  mulhsu       tp, tp, a4
                  div          a0, a4, s5
                  sh           tp, 0(s2)
                  sll          tp, t6, t5
                  c.srli       a4, 9
                  rem          a4, s5, t5
                  lbu          tp, 0(s2)
                  lbu          a4, -7(s2)
                  sb           t5, 11(s2)
                  sb           a0, -13(s2)
                  lb           s5, -3(s2)
                  lbu          a0, 15(s2)
                  or           t5, tp, a0
                  lbu          a0, 2(s2)
                  lb           tp, 12(s2)
                  sh           tp, -14(s2)
                  rem          tp, t6, s5
                  lhu          a4, -4(s2)
                  sh           a0, -8(s2)
                  lb           a0, 4(s2)
                  rem          t6, tp, a0
                  lbu          a0, -1(s2) #end riscv_hazard_instr_stream_6
                  la           sp, region_1+1404 #start riscv_load_store_hazard_instr_stream_30
                  sb           s7, -347(sp)
                  lbu          zero, -347(sp)
                  sb           t1, -347(sp)
                  sb           tp, -453(sp)
                  lbu          s7, 70(sp)
                  sub          t2, s7, tp
                  lhu          t4, 70(sp)
                  sh           ra, 70(sp)
                  div          s2, t2, s3
                  mulhu        a5, a4, a7
                  sh           a4, 70(sp)
                  mulhsu       t2, t2, s10
                  lh           t3, -1080(sp)
                  sw           sp, -1080(sp)
                  sb           ra, -1080(sp) #end riscv_load_store_hazard_instr_stream_30
                  la           s0, region_0+413 #start load_store_instr_stream_1
                  la           a7, region_1+1689 #start load_store_instr_stream_0
                  lbu          t1, -394(s0)
                  sb           t6, -255(a7)
                  lb           s8, 422(s0)
                  lb           a3, 1493(s0)
                  sb           a3, 110(s0)
                  lbu          t6, -1003(a7)
                  sb           t5, -1071(a7)
                  sh           s5, 1353(s0)
                  lbu          a0, 754(s0)
                  sb           a7, 1277(s0)
                  lb           s2, 538(s0)
                  sb           s6, -89(a7)
                  lhu          t2, 67(s0) #end load_store_instr_stream_1
                  sb           zero, 306(a7)
                  lb           s8, -28(a7) #end load_store_instr_stream_0
sub_3_65:         jal          ra, 4f
0:                jal          ra, 2f
1:                jal          t1, 17f
2:                c.jal        16f
3:                c.j          13f
4:                c.j          12f
5:                c.j          1b
6:                c.j          5b
7:                jal          t3, 19f
8:                c.j          10f
9:                c.jal        6b
10:               c.jal        9b
11:               c.jal        20f
12:               jal          t1, 3b
13:               jal          sp, 14f
14:               jal          s7, 8b
15:               c.jal        11b
16:               jal          t1, 7b
17:               c.jal        0b
18:               c.j          15b
19:               c.j          18b
20:               c.add        t0, s10
                  la           a5, region_1+1023 #start riscv_hazard_instr_stream_11
                  lb           a1, 255(a5)
                  sb           s10, -252(a5)
                  lbu          a2, -225(a5)
                  lb           t2, 135(a5)
                  c.nop
                  sb           a2, -87(a5)
                  lb           t2, -225(a5)
                  sb           s10, -244(a5)
                  lb           s0, 136(a5)
                  sra          s0, s10, s10
                  lw           sp, 61(a5)
                  lui          s10, 374877
                  and          s10, s10, a2
                  c.srai       s0, 26
                  c.lui        a2, 20
                  sh           s10, 67(a5)
                  sb           sp, -146(a5)
                  lbu          a1, -102(a5)
                  sb           a1, -206(a5)
                  lbu          sp, -185(a5)
                  slti         sp, a1, 557
                  and          a2, s0, s10
                  sh           sp, 1(a5)
                  slt          t2, a2, a2
                  lh           a2, 95(a5)
                  lbu          t2, -248(a5)
                  lbu          a2, 138(a5)
                  mulhu        sp, t2, t2
                  nop
                  sh           a2, 209(a5)
                  mulhsu       a2, s0, a1
                  srl          a1, sp, s0
                  andi         t2, s0, -787
                  srai         s10, a1, 20
                  sw           s10, 225(a5)
                  xor          a1, s10, a2
                  lh           s10, 239(a5)
                  slt          t2, sp, a1
                  sb           a2, -19(a5)
                  lbu          s10, -157(a5) #end riscv_hazard_instr_stream_11
                  la           sp, region_1+372 #start riscv_load_store_hazard_instr_stream_1
                  sb           s0, 186(sp)
                  sb           a4, 186(sp)
                  c.lwsp       a2, 4(sp)
                  slli         a1, a1, 18
                  c.and        a5, a2
                  c.swsp       t6, 4(sp)
                  c.lwsp       a0, 4(sp)
                  c.lwsp       s10, 4(sp)
                  c.lwsp       a0, 4(sp)
                  c.lwsp       a5, 4(sp)
                  c.and        a1, s0
                  slt          a7, t6, a4
                  c.lwsp       s5, 4(sp)
                  c.swsp       s7, 4(sp)
                  c.swsp       t2, 4(sp)
                  c.lwsp       a4, 4(sp)
                  c.swsp       t5, 4(sp)
                  c.swsp       tp, 4(sp) #end riscv_load_store_hazard_instr_stream_1
                  la           tp, region_0+1098 #start riscv_hazard_instr_stream_28
                  lh           a1, 32(tp)
                  lw           a2, -186(tp)
                  c.li         a6, -1
                  sra          t4, a7, a6
                  lw           a6, -222(tp)
                  lb           a7, 196(tp)
                  sb           a7, 203(tp)
                  lbu          a6, 145(tp)
                  remu         a2, a7, a6
                  srai         a7, a7, 4
                  lbu          a1, 138(tp)
                  c.add        a7, a0
                  lbu          a7, 43(tp)
                  c.or         a1, a2
                  lbu          a7, -240(tp)
                  lbu          a7, -27(tp)
                  divu         a7, a7, a2
                  rem          t4, t4, a1
                  lbu          a1, 72(tp)
                  c.slli       t4, 23
                  mulh         a0, a7, a7
                  lb           a7, -165(tp)
                  sb           a1, 13(tp)
                  c.and        a1, a2
                  lbu          t4, 171(tp)
                  sb           a0, -212(tp)
                  sltiu        a2, a2, 472
                  lb           t4, 223(tp)
                  or           a6, a0, a1
                  c.nop
                  lb           a7, -186(tp)
                  lui          a7, 256525
                  add          a7, a0, a1
                  sb           a6, 189(tp)
                  lb           t4, 64(tp)
                  c.mv         a6, a0
                  sb           a6, -90(tp)
                  lbu          a2, -105(tp)
                  sb           a7, 148(tp)
                  lbu          a7, -111(tp)
                  lhu          a6, -42(tp)
                  sw           a2, -126(tp)
                  lb           a6, -129(tp) #end riscv_hazard_instr_stream_28
                  la           s1, region_1+1804 #start load_store_instr_stream_0
                  la           t0, region_0+139 #start load_store_instr_stream_1
                  lbu          s2, -134(t0)
                  sb           a4, -10(s1)
                  lb           a1, 3(s1)
                  lb           s11, -13(s1)
                  lh           a5, 14(s1)
                  sw           s0, 69(t0)
                  sh           s3, 249(t0)
                  lb           t4, 1(s1)
                  lb           a4, 70(t0)
                  sb           s1, -15(t0) #end load_store_instr_stream_1
                  lb           a1, 7(s1)
                  sb           s0, -3(s1) #end load_store_instr_stream_0
                  la           a1, amo_0+24 #start riscv_amo_instr_stream_0
                  c.and        a0, a0
                  c.or         a0, a5
                  amomax.w.aq   a4, s2, (a1)
                  c.and        a4, a3
                  amomax.w.aq   t1, s4, (a1)
                  amomin.w.rl   zero, s10, (a1)
                  amomaxu.w.rl  a6, t1, (a1)
                  c.andi       a4, 8
                  amoswap.w     a2, s10, (a1)
                  auipc        s3, 609568
                  amomax.w      t6, t5, (a1) #end riscv_amo_instr_stream_0
sub_3_66:         jal          ra, 10f
0:                c.j          4f
1:                c.j          13f
2:                c.j          3f
3:                c.j          17f
4:                c.jal        2b
5:                c.j          12f
6:                c.j          11f
7:                c.j          5b
8:                c.jal        6b
9:                c.j          16f
10:               c.jal        14f
11:               jal          ra, 7b
12:               c.j          9b
13:               jal          t1, 0b
14:               jal          a4, 8b
15:               c.jal        1b
16:               c.j          15b
17:               sltu         s7, tp, tp
                  la           sp, region_1+562 #start riscv_load_store_rand_instr_stream_0
                  c.addi       t2, -1
                  nop
                  lw           a4, 2(sp)
                  sb           zero, -1(sp)
                  rem          a6, s6, s6
                  c.srai       a2, 11
                  sb           s4, 9(sp)
                  lb           s7, -9(sp)
                  lui          t3, 926424
                  sh           s5, -16(sp)
                  lh           a1, -8(sp)
                  div          a6, s8, a4
                  lhu          t5, 14(sp)
                  mulh         ra, t1, gp
                  mulh         ra, s2, t1
                  lb           t4, -4(sp)
                  lb           t1, 12(sp)
                  lh           ra, -12(sp)
                  remu         t3, t5, t1
                  lbu          t4, -15(sp)
                  lbu          s11, -6(sp)
                  lb           s5, -14(sp)
                  sb           a1, 14(sp)
                  c.srai       s1, 9
                  c.and        a0, s1
                  srai         t0, s11, 14
                  srl          s10, s9, a3
                  lb           t1, -9(sp)
                  addi         tp, gp, -1618
                  sb           a5, -8(sp)
                  c.and        a5, a4
                  lh           t5, -4(sp)
                  lw           t3, 10(sp)
                  lb           t2, 1(sp)
                  sh           a7, -12(sp)
                  c.srai       s1, 11
                  sb           a7, -16(sp)
                  lbu          gp, 16(sp)
                  lbu          s1, -12(sp)
                  sb           a7, 12(sp)
                  lh           t5, -14(sp)
                  sltu         ra, t0, s9
                  c.addi       a3, -1
                  lbu          t6, 8(sp)
                  sh           a2, 4(sp)
                  c.sub        s0, a1
                  lhu          gp, 10(sp) #end riscv_load_store_rand_instr_stream_0
                  la           t1, amo_0+8 #start riscv_lr_sc_instr_stream_18
                  srl          t3, s0, a7
                  xori         ra, s2, -1110
                  lr.w.aq       sp, (t1)
                  sc.w.rl       s10, sp, (t1) #end riscv_lr_sc_instr_stream_18
sub_3_87:         jal          ra, 27f
0:                c.jal        20f
1:                c.j          10f
2:                c.jal        24f
3:                c.jal        1b
4:                c.jal        3b
5:                c.jal        23f
6:                jal          t1, 25f
7:                c.j          2b
8:                c.j          9f
9:                c.j          21f
10:               c.jal        5b
11:               c.j          4b
12:               c.jal        28f
13:               c.j          19f
14:               c.jal        7b
15:               c.jal        17f
16:               c.j          8b
17:               jal          t1, 18f
18:               c.jal        22f
19:               c.j          12b
20:               c.jal        16b
21:               c.j          6b
22:               c.j          11b
23:               c.jal        14b
24:               c.jal        0b
25:               jal          t1, 13b
26:               c.j          15b
27:               jal          ra, 26b
28:               mulhsu       a7, t3, s1
                  la           s11, region_1+924 #start load_store_instr_stream_4
                  la           a2, region_1+1608 #start load_store_instr_stream_1
                  la           t4, region_1+1744 #start load_store_instr_stream_2
                  sb           a6, -107(s11)
                  lhu          s8, 12(t4)
                  la           s5, region_1+1705 #start load_store_instr_stream_0
                  lh           ra, -16(t4)
                  lb           s0, 15(t4)
                  la           s7, region_1+1053 #start load_store_instr_stream_3
                  lb           a5, 132(s11)
                  sb           s3, -426(s5)
                  lbu          a1, 3(t4)
                  lw           a5, -1489(s5)
                  lb           sp, 95(s11)
                  sh           sp, -225(s7)
                  lb           t1, 209(a2)
                  lw           s8, 147(s5)
                  sh           s6, 16(t4)
                  sh           s10, -1687(s5)
                  sh           s0, -83(s7)
                  sh           t0, 4(s11)
                  lb           tp, -108(a2)
                  lb           s3, -144(s7)
                  sh           tp, -76(s11)
                  lw           a1, -12(t4)
                  lh           sp, 89(s7)
                  lhu          t5, -1231(s5)
                  lbu          t6, -52(a2)
                  lb           t3, 254(s7)
                  lb           t6, -10(t4)
                  lbu          a1, 57(s5)
                  lb           a5, 15(t4)
                  lb           t5, 173(s11)
                  lb           sp, -30(a2)
                  c.lw         s1, 40(a2)
                  lbu          tp, 48(s11)
                  sb           zero, 235(s7)
                  sb           s4, 1(t4)
                  lb           s0, -216(s7)
                  lb           a0, -674(s5)
                  sb           tp, -18(s7)
                  sh           s2, -1587(s5)
                  sb           gp, -232(s7)
                  sb           a4, -58(a2) #end load_store_instr_stream_1
                  sw           t2, -97(s7) #end load_store_instr_stream_3
                  sb           s10, 25(s11)
                  lb           tp, -7(t4) #end load_store_instr_stream_2
                  lhu          a5, -120(s11) #end load_store_instr_stream_4
                  lb           t0, 214(s5) #end load_store_instr_stream_0
                  la           s11, amo_0+56 #start riscv_amo_instr_stream_8
                  amomaxu.w     s8, s6, (s11) #end riscv_amo_instr_stream_8
                  la           s7, amo_0+32 #start riscv_amo_instr_stream_4
                  amoxor.w.aq   t0, sp, (s7)
                  amomaxu.w     a3, a7, (s7) #end riscv_amo_instr_stream_4
                  addi         s7, zero, -7 #init loop 1 counter
                  rem          zero, s1, sp
                  addi         a2, zero, -19 #init loop 1 limit
                  sll          t2, t4, s7
                  add          a5, s7, tp
                  xor          s3, t4, a7
sub_3_154_1_t:    c.lui        a4, 30
                  addi         s7, s7, -6 #update loop 1 counter
                  addi         ra, zero, -8 #init loop 0 counter
                  srai         sp, a6, 17
                  andi         t3, s4, -921
                  sll          t2, sp, a3
                  addi         s0, zero, -7 #init loop 0 limit
                  div          t1, a1, t5
                  auipc        s8, 621354
sub_3_154_0_t:    c.addi       t2, 9
                  sub          t3, a4, t2
                  addi         ra, ra, 6 #update loop 0 counter
                  c.andi       s1, 0
                  blt          ra, s0, sub_3_154_0_t #branch for loop 0
                  slti         s3, s9, 855
                  sra          s10, zero, tp
                  xori         a6, t0, -1882
                  bne          s7, a2, sub_3_154_1_t #branch for loop 1
                  mulhsu       a3, s6, a0
                  la           a5, region_0+1068 #start load_store_instr_stream_1
                  sh           gp, -634(a5)
                  la           tp, region_1+1108 #start load_store_instr_stream_0
                  lbu          s8, -628(tp)
                  lw           t5, -340(a5)
                  sb           a3, 16(tp)
                  lb           zero, -631(a5)
                  lh           a3, -672(a5)
                  sb           a4, -969(a5)
                  lb           t4, 737(tp)
                  lb           t3, -661(a5)
                  sb           t2, -151(tp)
                  lb           s7, 674(a5)
                  lb           ra, 203(a5)
                  lhu          s0, 226(tp)
                  lh           s7, 288(tp)
                  lh           a4, 98(a5)
                  sb           zero, 45(tp)
                  lbu          s3, 643(tp)
                  sw           t1, 860(a5) #end load_store_instr_stream_1
                  sh           a1, -652(tp) #end load_store_instr_stream_0
                  la           sp, region_0+962 #start riscv_load_store_hazard_instr_stream_28
                  lh           s8, -110(sp)
                  lh           s8, 158(sp)
                  sh           s4, 158(sp)
                  sb           t1, 195(sp)
                  lbu          t1, 195(sp)
                  lbu          t5, 195(sp)
                  sb           a5, 195(sp)
                  lb           s8, 195(sp)
                  srl          a4, s5, a2
                  sb           s10, 111(sp)
                  lbu          ra, 111(sp)
                  sub          a2, sp, s5
                  sra          s2, s4, a3
                  lb           a6, -5(sp)
                  lb           a6, -5(sp)
                  slli         a3, a1, 2
                  lbu          s11, -5(sp)
                  sb           s9, -5(sp) #end riscv_load_store_hazard_instr_stream_28
                  la           a4, region_0+389 #start load_store_instr_stream_0
                  la           a5, region_0+178 #start load_store_instr_stream_3
                  lbu          sp, -255(a4)
                  la           s10, region_0+1912 #start load_store_instr_stream_1
                  lb           t1, -159(s10)
                  la           s3, region_0+886 #start load_store_instr_stream_2
                  lhu          s2, -55(a4)
                  la           s1, region_0+502 #start load_store_instr_stream_4
                  lb           s5, -385(s1)
                  lw           t5, 690(s3)
                  sb           s10, 234(s3)
                  sb           a7, -11(a5)
                  sw           a3, -220(s10)
                  lh           s0, -205(a4)
                  lh           t6, -268(s1)
                  lbu          t5, -295(s3)
                  lhu          zero, -224(s10)
                  lb           s8, 1177(s1)
                  sb           s1, 332(s3)
                  sh           t6, 4(a5)
                  lbu          s8, 452(s3)
                  lbu          s2, -7(a5)
                  lhu          a3, 56(s10)
                  lbu          t5, 1077(s3)
                  lbu          t5, -16(a5)
                  lb           a6, 225(a4)
                  sb           t6, 1022(s3)
                  lw           t3, -386(s3)
                  lhu          t4, -390(s1)
                  lhu          sp, -46(s10) #end load_store_instr_stream_1
                  lb           s2, 1(a5)
                  lbu          a7, -13(a5)
                  sb           zero, 48(a4)
                  sh           a4, 1458(s1) #end load_store_instr_stream_4
                  lbu          a1, -733(s3) #end load_store_instr_stream_2
                  lbu          a1, 15(a5) #end load_store_instr_stream_3
                  sh           s1, -197(a4)
                  lb           a2, 180(a4) #end load_store_instr_stream_0
                  la           t2, region_0+1653 #start riscv_load_store_rand_instr_stream_1
                  mulhu        a4, gp, s6
                  lb           s8, -66(t2)
                  sb           t5, -117(t2)
                  lb           a7, 162(t2)
                  sb           s4, 164(t2)
                  c.and        a4, a5
                  mulh         s2, s1, t2
                  sb           a3, 198(t2)
                  c.addi4spn   a1, sp, 320
                  mulhu        ra, a2, t6
                  sb           t2, 60(t2)
                  lb           a5, -10(t2)
                  sub          ra, tp, gp
                  lw           s11, 247(t2)
                  sub          t1, s1, s6
                  c.xor        a2, a1
                  mulhsu       gp, t1, a5
                  c.and        a1, a3
                  c.addi16sp   sp, 16
                  sltu         a7, t4, s10
                  sb           t5, -254(t2)
                  sb           tp, -250(t2) #end riscv_load_store_rand_instr_stream_1
                  la           s7, region_0+1823 #start riscv_load_store_hazard_instr_stream_24
                  sh           s6, 9(s7)
                  sh           t4, 9(s7)
                  sb           s8, 9(s7)
                  lbu          s5, 9(s7)
                  sw           a4, 9(s7)
                  lh           s2, 9(s7)
                  sw           t5, 9(s7)
                  c.nop
                  sb           s9, 9(s7)
                  lbu          a3, 9(s7)
                  c.li         t0, 22
                  sh           a3, 9(s7)
                  lbu          s2, 6(s7)
                  sb           s4, -2(s7)
                  lbu          gp, 8(s7)
                  slli         s2, t1, 31
                  lbu          gp, 8(s7)
                  lb           zero, 8(s7)
                  mul          a5, a4, s3
                  lb           a3, 8(s7)
                  lbu          zero, 8(s7)
                  sb           s4, 8(s7)
                  lbu          s8, 8(s7)
                  sb           a0, -11(s7) #end riscv_load_store_hazard_instr_stream_24
                  la           a2, region_0+1637 #start riscv_load_store_hazard_instr_stream_7
                  lb           a5, -1492(a2)
                  sb           s6, -779(a2)
                  lbu          s7, -894(a2)
                  sb           s7, -894(a2)
                  c.li         t3, -1
                  and          a1, s9, a2
                  lbu          s10, -894(a2)
                  lhu          a7, -233(a2)
                  sh           s11, -233(a2)
                  lh           s2, -233(a2)
                  lh           a1, -233(a2)
                  sb           s11, -1(a2)
                  lb           t4, -1(a2)
                  lui          a7, 480227
                  c.li         ra, -1
                  lb           t2, -1(a2)
                  lb           t5, -1(a2)
                  sw           t1, -1(a2)
                  srai         zero, t4, 8
                  sw           t0, -1(a2)
                  lh           gp, -1(a2)
                  c.mv         t6, a4
                  sh           t5, -1(a2)
                  lhu          s2, -1(a2)
                  sw           s10, -1(a2) #end riscv_load_store_hazard_instr_stream_7
                  la           sp, region_0+1238 #start load_store_instr_stream_0
                  la           s8, region_1+172 #start load_store_instr_stream_1
                  lbu          a4, 1813(s8)
                  lhu          s0, 602(s8)
                  lbu          s10, -189(sp)
                  sb           ra, 142(s8)
                  lb           a7, -461(sp)
                  sb           sp, -102(sp)
                  lbu          s11, -1183(sp)
                  lb           s7, 869(s8)
                  lh           s0, -920(sp)
                  lbu          t0, -322(sp)
                  sh           a7, 1390(s8) #end load_store_instr_stream_1
                  lbu          s1, -323(sp)
                  lbu          s11, -973(sp) #end load_store_instr_stream_0
                  la           a6, amo_0+0 #start riscv_amo_instr_stream_22
                  amomaxu.w.aq  s1, a0, (a6)
                  mulhsu       s1, gp, a6
                  amoand.w.rl   s8, s9, (a6)
                  divu         sp, s11, a5
                  amoxor.w      s11, a5, (a6)
                  amomin.w.aq   a4, t3, (a6)
                  amomin.w.aq   a3, a4, (a6)
                  srli         t1, t5, 3
                  amoor.w       zero, tp, (a6)
                  amomax.w.aq   s8, a3, (a6)
                  amoxor.w      a0, s10, (a6)
                  amoor.w.aq    s8, a5, (a6) #end riscv_amo_instr_stream_22
                  la           s1, region_0+914 #start load_store_instr_stream_0
                  lbu          t2, 11(s1)
                  la           gp, region_0+699 #start load_store_instr_stream_1
                  lhu          t6, 56(s1)
                  lbu          a2, -470(gp)
                  sb           s6, 33(s1)
                  sw           a2, -619(gp)
                  lhu          s0, -62(s1)
                  lb           ra, 17(s1)
                  lbu          s5, 231(gp)
                  lh           t2, 607(gp)
                  sb           s2, -41(s1)
                  lb           t0, 592(gp)
                  sh           a0, 731(gp)
                  lbu          s0, 59(s1)
                  lh           a1, 4(s1)
                  sh           ra, -489(gp) #end load_store_instr_stream_1
                  lb           a5, -25(s1) #end load_store_instr_stream_0
                  la           a0, region_1+1201 #start riscv_load_store_rand_instr_stream_29
                  c.addi4spn   a4, sp, 48
                  lb           a7, -18(a0)
                  lbu          zero, -28(a0)
                  sw           t5, 55(a0)
                  lhu          t6, 41(a0)
                  sb           s4, -6(a0)
                  lh           s3, 63(a0)
                  lb           a5, -24(a0)
                  lbu          a6, -20(a0)
                  lb           tp, 64(a0)
                  lbu          a6, 40(a0)
                  sw           s4, -1(a0)
                  srl          a7, zero, s4
                  sb           ra, -2(a0)
                  mulhu        t6, t1, s5
                  c.addi4spn   a3, sp, 336
                  c.addi4spn   a1, sp, 160
                  lb           a5, -28(a0)
                  lbu          a3, 55(a0)
                  c.and        a2, a3
                  mul          t0, t0, a5
                  lb           s2, 34(a0)
                  sw           ra, 63(a0)
                  lui          a4, 730117
                  c.addi4spn   a2, sp, 304
                  andi         s1, a3, -979
                  lh           ra, 21(a0)
                  sb           a6, 44(a0)
                  lui          s8, 366057
                  sltu         t3, s1, t5
                  mulh         s5, a6, a3
                  sw           t5, -49(a0)
                  sw           gp, 43(a0)
                  addi         a7, s4, -386
                  sb           s10, 45(a0)
                  lbu          s5, 4(a0) #end riscv_load_store_rand_instr_stream_29
                  la           a3, region_1+463 #start load_store_instr_stream_0
                  sb           a7, 196(a3)
                  la           t0, region_1+386 #start load_store_instr_stream_2
                  la           tp, region_1+1633 #start load_store_instr_stream_4
                  lh           t6, -53(tp)
                  la           a0, region_1+916 #start load_store_instr_stream_1
                  lh           s5, -14(a0)
                  lb           t5, -149(t0)
                  sb           s2, -9(tp)
                  lbu          s10, -13(a0)
                  sh           s9, -177(a3)
                  la           t2, region_1+254 #start load_store_instr_stream_3
                  lh           gp, -94(t0)
                  sb           sp, 7(a0)
                  sb           gp, 10(t2)
                  c.sw         s0, 16(a0)
                  lbu          zero, -233(t0)
                  lbu          a5, 18(a3)
                  sb           a2, 7(tp)
                  lh           sp, 113(a3)
                  lbu          t6, -15(a0)
                  lh           a2, -206(t0)
                  lb           t1, 38(a3)
                  lhu          a5, -213(a3)
                  sh           s2, 4(t2)
                  lb           s11, -80(a3)
                  lb           gp, -46(tp)
                  lb           s0, -231(t0)
                  lhu          sp, -2(t2)
                  sb           a4, -10(t2)
                  lb           t3, 15(a0)
                  lb           t4, 64(tp)
                  lbu          a1, 83(a3)
                  lh           a1, -5(tp)
                  sh           a4, 12(t0)
                  lb           s2, -16(a0)
                  sb           s10, -22(tp)
                  sb           a4, 244(a3)
                  lbu          a6, -247(t0) #end load_store_instr_stream_2
                  lb           t4, 2(tp)
                  sw           t6, -6(t2) #end load_store_instr_stream_3
                  lb           sp, -4(a0) #end load_store_instr_stream_1
                  sb           gp, 55(tp) #end load_store_instr_stream_4
                  sh           t1, -205(a3) #end load_store_instr_stream_0
                  addi         t3, zero, 10 #init loop 1 counter
                  c.mv         sp, a4
                  srai         t4, s3, 29
                  sltu         s1, s5, a1
                  c.addi16sp   sp, 176
                  c.li         t5, 22
                  c.lui        ra, 22
                  addi         t2, zero, 17 #init loop 1 limit
                  or           s8, ra, t4
                  mul          t0, s6, s4
                  remu         zero, a1, s2
sub_3_168_1_t:    c.add        s11, s1
                  ori          zero, a1, -1563
                  c.addi4spn   a5, sp, 528
                  c.nop
                  sltu         t6, t0, t1
                  addi         t3, t3, 7 #update loop 1 counter
                  addi         sp, tp, -244
                  addi         a0, zero, -10 #init loop 0 counter
                  srli         a4, s7, 1
                  c.srli       a2, 3
                  addi         s2, zero, 14 #init loop 0 limit
                  slli         a4, t3, 23
                  c.lui        s7, 20
sub_3_168_0_t:    c.andi       a4, 4
                  c.addi16sp   sp, 192
                  c.slli       a5, 16
                  addi         a0, a0, 6 #update loop 0 counter
                  c.or         a1, s0
                  bne          a0, s2, sub_3_168_0_t #branch for loop 0
                  slt          a7, t4, sp
                  slti         t4, a3, -1767
                  sll          s8, t0, gp
                  blt          t3, t2, sub_3_168_1_t #branch for loop 1
                  rem          t1, t3, s10
                  la           sp, region_0+4 #start riscv_hazard_instr_stream_20
                  slt          a6, s7, a2
                  lb           a2, 1432(sp)
                  lhu          gp, 1504(sp)
                  lbu          a7, 411(sp)
                  lh           a7, 1704(sp)
                  lbu          s7, 1313(sp)
                  lh           gp, 1888(sp)
                  lbu          a7, 818(sp)
                  srl          a6, a7, a7
                  lbu          s7, 1413(sp)
                  lb           gp, 1948(sp)
                  ori          s0, s0, -216
                  sub          a6, s0, s7
                  srl          s0, gp, s0
                  addi         a7, s7, -953
                  lbu          a2, 1572(sp)
                  or           gp, a2, s0
                  sh           gp, 134(sp)
                  lbu          a2, 839(sp)
                  add          s0, gp, gp
                  lw           gp, 996(sp)
                  and          gp, s0, a7
                  lbu          a6, 1285(sp)
                  lb           s0, 909(sp)
                  lbu          a6, 1297(sp)
                  sb           s7, 1949(sp)
                  lbu          a6, 153(sp)
                  lbu          s0, 226(sp)
                  add          s7, a6, a7
                  c.nop
                  or           a6, gp, s7
                  lb           s7, 1141(sp)
                  sltu         a6, s7, s7
                  lbu          a2, 981(sp)
                  lb           s7, 1193(sp)
                  lui          a7, 96937
                  lbu          a7, 1613(sp)
                  sll          s7, gp, s0
                  addi         s7, s7, 1132
                  lh           a6, 1384(sp)
                  lbu          s0, 496(sp)
                  c.addi       a7, -1
                  lhu          s7, 618(sp)
                  lbu          a2, 639(sp)
                  lb           gp, 1486(sp) #end riscv_hazard_instr_stream_20
                  la           sp, region_1+353 #start riscv_load_store_hazard_instr_stream_29
                  sb           a7, -108(sp)
                  sb           a3, -108(sp)
                  lbu          t1, -108(sp)
                  or           a7, a4, s9
                  lbu          a1, -108(sp)
                  sb           a7, -108(sp)
                  sltu         a1, s11, zero
                  mulhsu       t3, t3, s3
                  lbu          s7, -108(sp)
                  lbu          s3, 97(sp)
                  remu         zero, t2, s3
                  lb           a2, 97(sp)
                  sltu         t1, s0, tp
                  srai         a4, a5, 15
                  sw           t0, 171(sp)
                  lb           zero, 176(sp)
                  lbu          s1, -142(sp)
                  lhu          gp, 251(sp)
                  mulhu        gp, a2, s4
                  lw           a4, 251(sp)
                  lh           a4, 251(sp)
                  sh           s0, 251(sp) #end riscv_load_store_hazard_instr_stream_29
sub_3_81:         jal          ra, 21f
0:                jal          ra, 7f
1:                c.jal        11f
2:                c.j          1b
3:                jal          ra, 10f
4:                c.j          9f
5:                c.j          0b
6:                jal          t1, 2b
7:                jal          t6, 15f
8:                c.jal        12f
9:                c.jal        6b
10:               c.j          19f
11:               c.j          20f
12:               c.j          18f
13:               jal          ra, 8b
14:               jal          ra, 16f
15:               c.j          22f
16:               c.jal        5b
17:               c.jal        13b
18:               jal          ra, 14b
19:               c.j          17b
20:               jal          sp, 3b
21:               c.j          4b
22:               c.jal        23f
23:               srl          t2, s7, a6
                  la           s10, region_0+722 #start riscv_hazard_instr_stream_5
                  c.and        s0, s0
                  lbu          s0, -13(s10)
                  sb           a0, -12(s10)
                  lw           s5, -2(s10)
                  lb           s5, 1(s10)
                  add          t3, a0, t3
                  lb           s0, -1(s10)
                  sb           s8, 7(s10)
                  lb           s5, -3(s10)
                  lb           zero, 15(s10)
                  divu         zero, s5, t3
                  lbu          a0, -9(s10)
                  lh           a0, -8(s10)
                  and          t3, s8, s5
                  mul          t3, s0, zero
                  nop
                  srl          a0, s5, s0
                  nop
                  nop
                  c.or         a0, s0
                  c.slli       t3, 27
                  lbu          s8, -12(s10)
                  andi         s5, t3, 1677
                  sb           s0, 11(s10)
                  divu         s5, s5, a0
                  sb           a0, 15(s10)
                  srl          s8, t3, s8
                  sb           s8, -13(s10) #end riscv_hazard_instr_stream_5
                  la           a0, amo_0+0 #start riscv_lr_sc_instr_stream_10
                  rem          t5, s4, gp
                  srai         t1, a2, 31
                  c.li         gp, 18
                  lr.w.rl       gp, (a0)
                  add          s1, t6, s4
                  sc.w          tp, t4, (a0) #end riscv_lr_sc_instr_stream_10
                  la           sp, amo_0+36 #start riscv_amo_instr_stream_23
                  la           s7, amo_0+32
                  la           a7, amo_0+12
                  lui          a1, 203330
                  amoswap.w.aq  a1, t0, (sp)
                  andi         s3, s7, 472
                  amoand.w      t1, sp, (sp)
                  xori         t0, a5, 441
                  amoswap.w.rl  a4, s3, (s7)
                  amoor.w       s2, a5, (sp)
                  divu         s0, a7, s6
                  amoadd.w.rl   t3, t6, (a7)
                  amomin.w      s10, s5, (a7)
                  ori          a0, s1, -766
                  andi         a4, s11, 1127
                  amoxor.w.aq   tp, t5, (s7) #end riscv_amo_instr_stream_23
                  la           t1, amo_0+20 #start riscv_amo_instr_stream_1
                  la           t5, amo_0+32
                  amoor.w.aq    a0, a1, (t5)
                  c.addi       s0, 8
                  and          a4, s0, a6
                  amoswap.w     s8, ra, (t1) #end riscv_amo_instr_stream_1
                  la           a6, region_1+264 #start load_store_instr_stream_1
                  lhu          s8, 2(a6)
                  la           a5, region_0+1448 #start load_store_instr_stream_0
                  lbu          a1, 10(a6)
                  lbu          tp, 93(a5)
                  lb           s2, 14(a6)
                  lb           gp, 6(a6)
                  sb           s5, 0(a6)
                  lbu          t2, 86(a5)
                  sw           s7, -16(a5)
                  lhu          s11, -14(a6)
                  lb           s3, 5(a6)
                  lbu          gp, -12(a6) #end load_store_instr_stream_1
                  sb           zero, -110(a5)
                  sb           a3, -3(a5)
                  lhu          s7, -24(a5) #end load_store_instr_stream_0
                  la           t1, amo_0+56 #start riscv_lr_sc_instr_stream_21
                  divu         a3, s3, a0
                  add          ra, t3, sp
                  lr.w.aq       a2, (t1)
                  c.srai       a0, 19
                  c.add        s0, tp
                  c.sub        a0, s0
                  slli         t6, s11, 17
                  srai         a6, s0, 30
                  andi         t2, t4, 1192
                  sc.w.aq       t0, s4, (t1) #end riscv_lr_sc_instr_stream_21
                  la           t3, region_0+1155 #start load_store_instr_stream_0
                  la           tp, region_0+373 #start load_store_instr_stream_2
                  la           s3, region_0+1278 #start load_store_instr_stream_1
                  lw           s8, 118(s3)
                  sb           s0, 3(t3)
                  sh           a2, -11(tp)
                  lb           a6, 8(t3)
                  lb           a1, -787(s3)
                  lbu          t2, -856(s3)
                  lb           s8, 122(s3)
                  sw           s6, 7(tp)
                  lbu          a3, -14(t3)
                  lb           t6, 4(tp)
                  lh           a4, 5(tp)
                  lw           s11, -662(s3)
                  sb           s0, 3(t3)
                  lbu          s11, -4(tp)
                  sb           a7, -16(tp) #end load_store_instr_stream_2
                  lbu          a2, -510(s3)
                  lbu          s11, 1(t3)
                  lw           a7, 210(s3) #end load_store_instr_stream_1
                  sb           s9, 6(t3) #end load_store_instr_stream_0
sub_3_73:         jal          ra, 4f
0:                c.jal        15f
1:                c.j          11f
2:                c.jal        10f
3:                c.j          26f
4:                c.j          13f
5:                c.jal        2b
6:                c.jal        17f
7:                c.jal        3b
8:                c.jal        23f
9:                c.j          14f
10:               c.j          22f
11:               c.jal        12f
12:               c.j          16f
13:               c.j          8b
14:               c.jal        1b
15:               c.jal        19f
16:               c.j          20f
17:               c.j          25f
18:               c.j          7b
19:               jal          a0, 18b
20:               jal          t1, 0b
21:               c.j          6b
22:               jal          ra, 21b
23:               c.jal        24f
24:               c.jal        5b
25:               c.j          9b
26:               xor          ra, t0, a5
                  la           t5, amo_0+60 #start riscv_lr_sc_instr_stream_3
                  lr.w.rl       t6, (t5)
                  c.li         t2, -1
                  sc.w.rl       t4, tp, (t5) #end riscv_lr_sc_instr_stream_3
                  la           ra, amo_0+48 #start riscv_amo_instr_stream_19
                  sub          t1, ra, s0
                  amominu.w.rl  t0, gp, (ra)
                  c.nop
                  ori          s1, sp, 705
                  c.addi16sp   sp, -16
                  amoor.w.aq    s3, s4, (ra)
                  amoadd.w.aq   a1, t5, (ra)
                  amoadd.w.aq   a0, s0, (ra)
                  amoor.w       a4, s4, (ra)
                  amoand.w.aq   sp, t2, (ra)
                  amomin.w      a7, a2, (ra)
                  amoor.w.aq    a1, t0, (ra)
                  amoxor.w.rl   s3, a3, (ra)
                  amominu.w.rl  zero, s6, (ra) #end riscv_amo_instr_stream_19
                  la           t6, region_0+1012 #start riscv_load_store_rand_instr_stream_25
                  lbu          s10, -41(t6)
                  lhu          sp, -38(t6)
                  lb           a3, 15(t6)
                  mulhu        t2, a5, t1
                  nop
                  lui          s1, 132787
                  lbu          t5, -22(t6)
                  lhu          s11, -30(t6)
                  sh           a0, 30(t6)
                  slt          zero, s6, a6
                  sb           s10, -32(t6)
                  sltiu        a1, s2, -109
                  sh           t0, 16(t6)
                  lb           s7, 3(t6)
                  lhu          a6, 8(t6)
                  lh           a4, -24(t6)
                  lbu          s11, -45(t6)
                  lbu          t1, 21(t6)
                  slli         s3, t3, 2
                  lh           a0, -50(t6)
                  nop
                  sb           a0, 51(t6)
                  lb           t3, 30(t6)
                  lb           ra, 62(t6)
                  mul          a0, a7, s0
                  lbu          s3, 59(t6)
                  sll          a6, s11, t2
                  c.addi       t1, 19
                  lhu          s11, 6(t6)
                  lb           s0, -62(t6)
                  xor          s11, t6, a3
                  lbu          s7, -29(t6)
                  slti         ra, a5, -500
                  lb           s8, 23(t6)
                  andi         ra, a0, -1663
                  c.srai       a2, 7
                  sb           ra, -48(t6)
                  sb           s4, 17(t6)
                  srl          s8, zero, s9
                  lbu          sp, 56(t6)
                  auipc        t4, 250553
                  lbu          s2, 60(t6)
                  lw           s5, 36(t6)
                  rem          gp, t4, s6
                  srai         t1, a2, 21
                  c.sub        s1, s0
                  mulh         a4, a5, s11
                  mulhu        a0, t5, s1
                  lh           s3, 10(t6)
                  lhu          a1, 46(t6) #end riscv_load_store_rand_instr_stream_25
                  la           sp, region_1+728 #start riscv_load_store_rand_instr_stream_13
                  c.lwsp       a3, 16(sp)
                  c.srli       a1, 17
                  c.mv         t1, ra
                  nop
                  sb           t2, -13(sp)
                  sb           s0, -9(sp)
                  c.slli       a6, 7
                  sb           tp, -7(sp)
                  sltu         t6, s0, s9
                  xor          a3, gp, a4
                  c.swsp       tp, 16(sp)
                  sb           t2, 3(sp)
                  lh           t1, -4(sp)
                  sb           s8, -16(sp)
                  c.srli       a0, 2
                  sb           a5, -9(sp)
                  c.addi       s0, -1
                  sb           a2, -9(sp)
                  lb           zero, -6(sp)
                  sh           t2, 14(sp)
                  sb           ra, -15(sp)
                  lbu          gp, -9(sp)
                  lb           t0, 15(sp)
                  xori         t1, s1, 105
                  slli         a0, a0, 16
                  lbu          s0, -15(sp)
                  ori          a3, a3, 875
                  sb           gp, -10(sp)
                  sb           t4, -5(sp)
                  lb           a5, 15(sp)
                  lw           s0, -4(sp)
                  sh           a2, -8(sp)
                  slti         ra, t6, -639
                  lb           ra, -1(sp)
                  lb           s3, -1(sp)
                  sb           s1, -13(sp)
                  sll          t0, s5, t3
                  lb           s8, -3(sp)
                  div          t4, s0, ra
                  lb           s7, 3(sp)
                  lbu          ra, -13(sp)
                  c.lwsp       t0, 16(sp)
                  sh           zero, -14(sp) #end riscv_load_store_rand_instr_stream_13
                  addi         t6, zero, 9 #init loop 1 counter
                  addi         tp, zero, 11 #init loop 1 limit
sub_3_158_1_t:    xori         s7, s1, -1644
                  addi         t6, t6, 2 #update loop 1 counter
                  slt          t4, s4, t1
                  andi         gp, a4, -1304
                  addi         s1, zero, -4 #init loop 0 counter
                  addi         s2, zero, 8 #init loop 0 limit
sub_3_158_0_t:    sltu         zero, t4, s10
                  addi         s1, s1, 8 #update loop 0 counter
                  mul          t3, s0, s6
                  bltu         s1, s2, sub_3_158_0_t #branch for loop 0
                  c.add        s0, t0
                  bne          t6, tp, sub_3_158_1_t #branch for loop 1
                  sra          a4, t1, t3
                  addi         ra, zero, 10 #init loop 1 counter
                  c.or         s1, a4
                  c.addi16sp   sp, -16
                  add          s10, s5, s3
                  xor          s11, tp, s1
                  addi         t4, zero, 10 #init loop 1 limit
                  c.andi       a1, -1
sub_3_162_1_t:    slt          zero, s7, a5
                  c.srli       a1, 18
                  sra          s1, s5, a3
                  addi         ra, ra, -7 #update loop 1 counter
                  remu         a2, ra, t5
                  c.mv         a0, gp
                  srl          s1, t6, s4
                  lui          a5, 206402
                  addi         a4, zero, 10 #init loop 0 counter
                  c.xor        a3, a5
                  andi         s3, a1, -1209
                  c.and        a5, a5
                  addi         t3, zero, 10 #init loop 0 limit
                  srai         s11, s11, 10
                  mulhsu       s2, a4, s7
                  or           t2, zero, a0
                  auipc        s3, 509986
                  c.sub        a3, s0
sub_3_162_0_t:    and          s3, t1, a3
                  c.addi16sp   sp, -16
                  add          t6, t3, s10
                  addi         a4, a4, -9 #update loop 0 counter
                  srai         a6, t4, 6
                  bgeu         a4, t3, sub_3_162_0_t #branch for loop 0
                  bgeu         ra, t4, sub_3_162_1_t #branch for loop 1
                  c.and        a5, a2
                  la           s5, region_0+1325 #start riscv_load_store_hazard_instr_stream_18
                  sra          s1, s6, zero
                  sb           gp, -37(s5)
                  sb           s7, -37(s5)
                  sh           s6, -37(s5)
                  lw           sp, -37(s5)
                  add          t4, a0, s1
                  sw           s8, -37(s5)
                  srli         t0, tp, 6
                  lh           s3, -199(s5)
                  lh           a6, -199(s5)
                  lbu          s0, -199(s5)
                  lh           s0, -199(s5)
                  add          a7, a0, ra
                  lh           a2, -199(s5)
                  lb           a5, -199(s5)
                  sh           a4, -199(s5) #end riscv_load_store_hazard_instr_stream_18
                  addi         a2, zero, -8 #init loop 0 counter
                  sra          t0, a0, s4
                  sltu         s11, s6, s2
                  c.li         s3, -1
                  addi         zero, zero, 0 #init loop 0 limit
sub_3_160_0_t:    ori          s7, a3, 719
                  c.nop
                  addi         a2, a2, 8 #update loop 0 counter
                  c.bnez       a2, sub_3_160_0_t #branch for loop 0
                  c.addi4spn   a0, sp, 704
                  la           sp, region_1+652 #start riscv_hazard_instr_stream_2
                  srai         a6, a6, 27
                  lhu          s1, -312(sp)
                  c.li         s0, -1
                  lb           s0, 407(sp)
                  c.add        s0, a6
                  lh           s1, -270(sp)
                  lbu          tp, -419(sp)
                  lbu          gp, -294(sp)
                  sb           s1, 844(sp)
                  lb           gp, -635(sp)
                  sltu         s0, a6, a6
                  lbu          tp, 1097(sp)
                  c.lwsp       tp, 24(sp)
                  andi         s0, a6, -50
                  c.slli       a6, 28
                  lw           gp, 676(sp)
                  sb           s1, 1257(sp)
                  lbu          s0, -460(sp)
                  lb           a6, 853(sp)
                  lb           s1, -631(sp)
                  lb           gp, -89(sp)
                  c.li         gp, 30
                  lhu          t4, -254(sp)
                  sra          gp, tp, tp
                  sub          tp, s0, t4
                  c.lwsp       s0, 52(sp)
                  c.lui        a6, 3
                  ori          s1, t4, -1342
                  lb           tp, 799(sp)
                  lb           tp, -504(sp)
                  lb           s1, -257(sp)
                  lb           gp, -79(sp)
                  lb           gp, 1202(sp)
                  lbu          s1, -626(sp)
                  lbu          s0, 780(sp) #end riscv_hazard_instr_stream_2
                  la           a7, amo_0+56 #start riscv_lr_sc_instr_stream_1
                  lr.w.rl       tp, (a7)
                  c.or         a3, a4
                  c.addi       t5, 21
                  slti         t4, a0, -1481
                  sc.w.aq       t6, t3, (a7) #end riscv_lr_sc_instr_stream_1
                  la           a6, region_1+1129 #start riscv_hazard_instr_stream_16
                  lb           s11, 221(a6)
                  c.add        a0, t6
                  slt          t6, t4, s2
                  c.mv         a0, s0
                  sb           a0, 250(a6)
                  xori         s2, t4, -1289
                  c.sub        a0, s0
                  mulh         t4, t4, a0
                  auipc        a0, 568789
                  c.mv         t4, s11
                  divu         t6, a0, s2
                  lbu          s0, -25(a6)
                  rem          t4, s2, t6
                  sh           t6, 195(a6)
                  lbu          t6, -224(a6)
                  sltu         a0, s11, s11
                  lb           s2, 201(a6)
                  sb           t6, 134(a6)
                  sb           t4, -187(a6)
                  lb           t6, -242(a6)
                  srli         t6, t6, 7
                  slt          t6, t4, s2
                  auipc        s0, 1001550
                  xor          s0, s11, s2
                  c.xor        a0, s0
                  rem          t4, t6, s0
                  sh           s0, -131(a6)
                  sb           t6, -222(a6)
                  add          s0, s2, s0
                  lb           t6, -238(a6)
                  lb           a0, -2(a6)
                  mulhsu       a0, s2, t4
                  c.add        t6, t4
                  lb           t6, -69(a6)
                  c.add        s11, s11
                  add          s11, s2, s11
                  or           t4, s0, t6
                  lbu          t6, 128(a6)
                  c.or         a0, a0
                  lb           s11, -101(a6)
                  lbu          s11, 150(a6)
                  xori         t6, s0, 1308
                  c.or         s0, s0
                  auipc        s0, 472607
                  lw           s11, -137(a6)
                  lb           t6, 76(a6)
                  sb           a0, -194(a6)
                  lhu          s2, -171(a6) #end riscv_hazard_instr_stream_16
                  addi         t2, zero, 4 #init loop 1 counter
                  c.xor        s1, a5
                  remu         s1, s7, t2
                  addi         ra, zero, 4 #init loop 1 limit
                  srli         s11, gp, 20
sub_3_169_1_t:    and          s8, s10, zero
                  sll          a6, ra, tp
                  c.xor        s1, s1
                  addi         t2, t2, -2 #update loop 1 counter
                  sub          a2, s3, zero
                  addi         a1, zero, -6 #init loop 0 counter
                  mulh         a2, a6, s1
                  addi         zero, zero, 0 #init loop 0 limit
                  xori         t6, a5, -1447
                  andi         t1, zero, -171
                  add          s1, s4, s5
                  c.srli       a4, 29
                  c.nop
                  ori          s0, s0, -1243
sub_3_169_0_t:    slti         t4, a4, 1844
                  addi         a1, a1, 3 #update loop 0 counter
                  c.addi16sp   sp, 16
                  mulhu        s0, a6, s10
                  c.sub        a2, a4
                  c.beqz       a1, sub_3_169_0_t #branch for loop 0
                  andi         t4, t2, 980
                  remu         a7, s8, s7
                  bgeu         t2, ra, sub_3_169_1_t #branch for loop 1
                  rem          t4, a5, t5
                  la           t5, region_1+737 #start load_store_instr_stream_1
                  la           a5, region_1+388 #start load_store_instr_stream_2
                  la           s5, region_1+1421 #start load_store_instr_stream_0
                  la           t0, region_1+1247 #start load_store_instr_stream_3
                  lbu          t6, 1428(a5)
                  lhu          a6, 5(s5)
                  lw           t2, 11(t5)
                  lhu          s2, 1396(a5)
                  sb           sp, 16(s5)
                  lw           s0, 13(t0)
                  sw           t5, 3(s5)
                  lb           s0, 5(t5)
                  lhu          sp, 494(a5)
                  lbu          t4, 475(a5)
                  lbu          sp, 16(s5)
                  lbu          t6, -94(t0)
                  lb           a6, 78(t0)
                  sb           sp, 6(t5)
                  lh           a3, 3(s5)
                  sb           gp, 14(t5)
                  lbu          tp, 188(t0)
                  sb           a4, 375(a5)
                  lhu          a4, -11(s5)
                  lb           s0, 591(a5)
                  sb           s11, 1180(a5)
                  lb           a6, -57(t0)
                  sb           s6, 1538(a5)
                  lbu          t3, 2(s5)
                  lbu          s1, 928(a5)
                  sb           a4, 14(t5) #end load_store_instr_stream_1
                  lbu          a0, -68(t0)
                  lb           t2, 78(t0)
                  lh           sp, -108(a5) #end load_store_instr_stream_2
                  sw           s7, -235(t0)
                  lbu          t3, 182(t0)
                  lbu          t2, -76(t0) #end load_store_instr_stream_3
                  sb           s1, 14(s5) #end load_store_instr_stream_0
                  la           tp, region_1+992 #start load_store_instr_stream_2
                  la           a4, region_1+174 #start load_store_instr_stream_1
                  sb           t1, -931(tp)
                  lbu          t0, 139(a4)
                  lb           ra, -104(a4)
                  sb           t2, -29(tp)
                  la           s5, region_1+666 #start load_store_instr_stream_0
                  lb           s3, -48(a4)
                  sh           t3, -2(a4)
                  lh           a6, 16(a4)
                  lb           t4, 423(s5)
                  lh           t1, -64(a4)
                  lb           ra, 204(s5)
                  lb           ra, 285(tp)
                  lw           a0, 992(tp)
                  lb           t2, 252(a4)
                  lh           zero, 486(s5)
                  lbu          sp, 250(a4) #end load_store_instr_stream_1
                  lh           s8, 504(tp) #end load_store_instr_stream_2
                  lb           a5, -223(s5)
                  lb           a1, 361(s5) #end load_store_instr_stream_0
                  la           ra, region_0+1272 #start riscv_load_store_hazard_instr_stream_5
                  andi         s11, t1, 863
                  lbu          s7, 13(ra)
                  sb           s2, 13(ra)
                  lbu          s11, 31(ra)
                  sb           t5, 31(ra)
                  sb           t5, 31(ra)
                  sb           s6, -5(ra)
                  lbu          t5, -5(ra)
                  sb           a7, -5(ra)
                  c.nop
                  sb           s6, -5(ra)
                  slt          a7, a5, a7
                  srli         t0, t3, 14
                  lbu          a6, -5(ra)
                  lb           t5, -5(ra)
                  c.and        s1, a2
                  sb           a6, -5(ra)
                  sb           s11, -5(ra)
                  lb           t3, -5(ra) #end riscv_load_store_hazard_instr_stream_5
                  la           t2, region_0+1750 #start load_store_instr_stream_2
                  la           a4, region_0+1212 #start load_store_instr_stream_0
                  la           s3, region_0+1750 #start load_store_instr_stream_4
                  sb           gp, -941(t2)
                  la           t6, region_0+1170 #start load_store_instr_stream_1
                  lb           ra, -13(a4)
                  sb           t3, 3(s3)
                  la           a7, region_0+292 #start load_store_instr_stream_3
                  lbu          a1, -1459(t2)
                  sb           s0, -1415(t2)
                  lb           a1, -8(a7)
                  lbu          s7, -1022(t6)
                  sb           a7, 25(a4)
                  sh           gp, -800(t2)
                  sw           t6, 174(s3)
                  lhu          zero, -4(a7)
                  lbu          ra, -62(a4)
                  sb           tp, -368(t6)
                  sb           s1, 183(t2)
                  lbu          gp, -115(s3)
                  sb           zero, -44(a4)
                  sb           s0, -15(a4)
                  sh           t1, 14(a7)
                  lbu          a0, 13(a7)
                  lbu          s7, 627(t6)
                  sb           s5, -1242(t2)
                  lb           a1, 9(a7)
                  sb           s1, -404(t2)
                  lbu          a2, -717(t6)
                  sw           t0, -12(a7) #end load_store_instr_stream_3
                  sb           s10, 144(s3)
                  sh           s1, -16(t2)
                  sh           t6, -504(t6) #end load_store_instr_stream_1
                  lbu          t5, 186(t2)
                  lb           t4, 13(a4)
                  lw           a2, -20(a4)
                  sb           a5, -1273(t2) #end load_store_instr_stream_2
                  lw           tp, -210(s3) #end load_store_instr_stream_4
                  c.lw         a1, 52(a4) #end load_store_instr_stream_0
                  la           sp, region_0+1152 #start riscv_load_store_rand_instr_stream_19
                  c.sub        a2, s1
                  lb           a7, 141(sp)
                  lb           zero, -263(sp)
                  sh           s6, 264(sp)
                  lhu          s1, 274(sp)
                  lbu          a7, 748(sp)
                  c.or         a2, s0
                  divu         s11, s3, t5
                  sw           s10, -1004(sp)
                  sh           t3, 450(sp)
                  c.nop
                  sb           a2, -189(sp)
                  srai         ra, t5, 6
                  nop
                  c.andi       a5, 10
                  sb           s3, 697(sp)
                  sltu         s3, s8, a1
                  srai         a3, sp, 6
                  remu         a7, s3, a5
                  srli         s3, tp, 5
                  divu         s2, a6, sp
                  sltiu        s8, sp, 334
                  lh           a4, -898(sp)
                  sb           t0, 437(sp)
                  xor          a2, t0, t5
                  c.andi       a3, -1
                  lbu          s2, 350(sp)
                  mul          s5, s7, s6
                  c.or         a4, s0
                  sb           s6, 373(sp)
                  lbu          s3, 103(sp)
                  lb           gp, 107(sp)
                  xori         a4, s8, 1477
                  sll          s0, s9, a6
                  lb           s0, -511(sp)
                  divu         s11, ra, s11
                  lb           s11, 370(sp)
                  lb           s7, 109(sp)
                  divu         t3, t2, zero
                  mul          t1, t0, sp
                  remu         tp, a3, s4
                  lbu          a3, -533(sp)
                  sra          t1, a6, s3
                  sb           zero, -259(sp)
                  mulhsu       s7, s8, a5
                  lbu          a3, 538(sp)
                  sh           t2, -898(sp) #end riscv_load_store_rand_instr_stream_19
sub_3_86:         jal          ra, 3f
0:                jal          t1, 14f
1:                jal          s0, 13f
2:                c.j          5f
3:                c.jal        6f
4:                jal          t1, 8f
5:                c.jal        15f
6:                c.j          12f
7:                c.j          10f
8:                c.jal        0b
9:                jal          ra, 11f
10:               c.j          4b
11:               c.jal        2b
12:               jal          a1, 1b
13:               jal          ra, 7b
14:               c.j          9b
15:               c.xor        a2, s1
                  la           s2, amo_0+60 #start riscv_amo_instr_stream_5
                  la           ra, amo_0+44
                  la           s3, amo_0+24
                  srl          a2, a4, s1
                  amoswap.w.aq  s5, t6, (s3)
                  amomaxu.w.rl  s7, a6, (ra)
                  amomax.w.rl   tp, s0, (s3)
                  amoor.w.rl    a5, s6, (ra)
                  mulhsu       a5, s6, s9
                  amoswap.w     gp, s2, (s3)
                  nop
                  amoand.w.aq   a6, t4, (s3)
                  srai         t4, s8, 26
                  amoadd.w.aq   s8, t1, (s3)
                  c.srli       a5, 23
                  amoor.w.rl    t0, t6, (ra) #end riscv_amo_instr_stream_5
                  la           s2, amo_0+8 #start riscv_lr_sc_instr_stream_7
                  slt          t6, s6, a7
                  mul          s10, s7, s1
                  lr.w.rl       s5, (s2)
                  c.xor        a2, a1
                  c.and        a5, a2
                  add          s11, s5, a1
                  sub          gp, t4, s2
                  c.andi       a2, 17
                  sltiu        s1, gp, -820
                  divu         a4, a0, s4
                  slt          a0, a4, a1
                  c.slli       a0, 18
                  sltu         t6, s9, a6
                  c.li         s11, -1
                  nop
                  sc.w.aq       t2, s1, (s2) #end riscv_lr_sc_instr_stream_7
                  addi         a3, zero, -10 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
sub_3_167_0_t:    remu         a7, s4, s6
                  slti         t4, s4, 986
                  mulh         ra, s2, gp
                  c.add        a4, a6
                  addi         a3, a3, 10 #update loop 0 counter
                  c.lui        t4, 11
                  c.srli       a1, 12
                  c.nop
                  c.beqz       a3, sub_3_167_0_t #branch for loop 0
                  ori          s10, t2, -724
                  la           a6, region_1+1923 #start riscv_load_store_rand_instr_stream_23
                  c.addi       gp, -1
                  c.slli       t5, 18
                  c.xor        a1, s0
                  c.and        a3, a1
                  lw           s5, 49(a6)
                  lbu          s0, 1(a6)
                  divu         s7, tp, s9
                  mulhsu       a7, s11, s8
                  sb           a0, -30(a6)
                  sb           s11, -14(a6)
                  srli         s10, t0, 20
                  c.srai       a1, 15
                  lbu          s3, 18(a6)
                  sltu         t1, ra, sp
                  lb           a0, -46(a6)
                  div          t5, a0, a3
                  lbu          t5, 7(a6)
                  slt          s7, s10, t2
                  lb           s5, 56(a6)
                  c.andi       s0, -1
                  sb           s7, 42(a6)
                  sltiu        a4, s3, 765
                  lhu          s3, -11(a6)
                  mulh         a2, a5, a6
                  addi         a7, a1, 30
                  div          t2, a6, a4
                  mulhu        s1, s5, s0
                  divu         t6, s3, t5
                  sb           a7, -8(a6)
                  c.li         a2, 6
                  c.srai       s0, 17
                  or           tp, a0, s10
                  lh           ra, 31(a6)
                  sb           s10, 64(a6)
                  c.or         s1, a5
                  nop
                  lbu          t6, -17(a6)
                  c.slli       gp, 18
                  c.mv         gp, s2
                  sb           t4, 6(a6) #end riscv_load_store_rand_instr_stream_23
                  la           sp, region_1+286 #start riscv_load_store_hazard_instr_stream_8
                  lb           s0, -143(sp)
                  c.slli       s7, 7
                  sw           gp, -202(sp)
                  sh           zero, -202(sp)
                  lbu          ra, 212(sp)
                  mul          tp, a7, a6
                  c.add        a0, s2
                  sh           zero, 212(sp)
                  sra          s1, t5, s6
                  slli         gp, s2, 26
                  sb           t0, -233(sp)
                  c.andi       a5, -1
                  lb           a6, 184(sp)
                  sb           t3, 32(sp)
                  sh           gp, 32(sp)
                  lb           t0, -247(sp)
                  sb           a4, -138(sp) #end riscv_load_store_hazard_instr_stream_8
                  la           a0, region_0+1855 #start riscv_load_store_rand_instr_stream_30
                  c.xor        a1, a4
                  lh           s5, 9(a0)
                  lbu          s1, -52(a0)
                  sb           ra, -4(a0)
                  or           t4, s8, s10
                  ori          s11, s11, 1294
                  lhu          gp, -27(a0)
                  lb           ra, 10(a0)
                  lhu          tp, 31(a0)
                  lb           gp, -45(a0)
                  srl          a4, s0, a6
                  lhu          gp, 15(a0)
                  lb           s5, -31(a0)
                  rem          a7, s7, a3
                  lbu          a3, 35(a0)
                  xor          a3, t5, a6
                  sb           sp, -46(a0)
                  sb           sp, 30(a0)
                  sw           t3, 21(a0)
                  c.sub        a5, a4
                  sb           t3, -58(a0)
                  slti         a6, t5, 1606
                  sh           a7, -47(a0)
                  lb           zero, 18(a0)
                  andi         t4, s11, -1350
                  sw           t6, 17(a0)
                  sb           s9, -25(a0)
                  srl          sp, t3, s8
                  srl          a1, s8, t1
                  sw           sp, 49(a0)
                  lbu          s8, -21(a0)
                  mulhu        s7, gp, a1
                  srl          s0, t4, gp
                  sb           t3, 42(a0)
                  lh           t2, -43(a0) #end riscv_load_store_rand_instr_stream_30
                  la           a3, region_0+1640 #start riscv_load_store_hazard_instr_stream_4
                  lb           a7, -19(a3)
                  lbu          a4, -19(a3)
                  lbu          a4, -19(a3)
                  lw           a2, 48(a3)
                  lhu          s3, 2(a3)
                  mulh         a0, s1, a4
                  add          t1, s1, a4
                  lbu          s8, -30(a3)
                  lh           t3, -58(a3)
                  lbu          a7, -58(a3)
                  lbu          t1, 39(a3)
                  srli         a6, a2, 22
                  lb           a7, 39(a3)
                  sb           t1, 39(a3)
                  mulhu        ra, s0, tp
                  mul          s1, t6, s4
                  lbu          s3, 39(a3)
                  c.mv         t3, a0
                  lbu          s3, 39(a3)
                  lbu          a6, 39(a3)
                  lb           ra, 34(a3)
                  lhu          t0, 34(a3)
                  lbu          s3, -12(a3) #end riscv_load_store_hazard_instr_stream_4
                  la           s3, region_0+1967 #start load_store_instr_stream_1
                  la           s0, region_1+1362 #start load_store_instr_stream_0
                  lw           s7, -3(s3)
                  lb           t3, -639(s0)
                  sb           a4, -1053(s0)
                  lb           a6, 299(s0)
                  sb           s4, -12(s3)
                  sb           ra, -813(s0)
                  sw           t3, 13(s3)
                  lbu          t1, 10(s3)
                  lb           t5, -528(s0)
                  lbu          t3, 0(s3)
                  lhu          a0, -1090(s0)
                  lb           t1, 7(s3)
                  sb           s8, -2(s3)
                  lb           s10, 16(s3) #end load_store_instr_stream_1
                  sw           t2, -742(s0) #end load_store_instr_stream_0
sub_3_77:         jal          ra, 20f
0:                jal          ra, 11f
1:                c.jal        15f
2:                c.j          17f
3:                c.j          6f
4:                c.j          0b
5:                c.jal        3b
6:                jal          ra, 4b
7:                jal          t5, 18f
8:                c.j          9f
9:                jal          s0, 5b
10:               c.j          19f
11:               jal          s7, 12f
12:               c.jal        16f
13:               jal          t1, 7b
14:               jal          ra, 13b
15:               c.j          8b
16:               c.j          21f
17:               jal          t1, 1b
18:               c.j          10b
19:               c.j          2b
20:               jal          s11, 14b
21:               andi         t5, a7, 1395
                  la           a0, amo_0+44 #start riscv_lr_sc_instr_stream_11
                  c.nop
                  slli         s10, s6, 24
                  or           s11, zero, s10
                  lr.w          a5, (a0)
                  slt          t4, a5, s2
                  mulh         t4, t4, zero
                  c.slli       t3, 6
                  c.srai       s0, 26
                  divu         t6, a6, zero
                  sltiu        t5, s6, 1424
                  c.addi4spn   a5, sp, 496
                  mulh         t2, t3, a7
                  andi         a3, s6, -1291
                  sc.w.aq       a7, t0, (a0) #end riscv_lr_sc_instr_stream_11
sub_3_68:         jal          ra, 23f
0:                c.jal        18f
1:                c.jal        5f
2:                c.jal        25f
3:                c.j          24f
4:                c.jal        16f
5:                c.jal        19f
6:                c.j          1b
7:                c.jal        11f
8:                c.j          0b
9:                jal          ra, 27f
10:               c.j          14f
11:               c.j          4b
12:               jal          ra, 17f
13:               c.j          9b
14:               jal          ra, 3b
15:               c.j          2b
16:               c.jal        6b
17:               c.j          20f
18:               c.jal        7b
19:               c.j          12b
20:               jal          t1, 26f
21:               c.j          15b
22:               c.j          10b
23:               c.j          21b
24:               jal          a6, 13b
25:               jal          s2, 8b
26:               jal          ra, 22b
27:               c.andi       a5, 15
                  la           a0, region_1+1317 #start riscv_load_store_hazard_instr_stream_31
                  lb           s5, 14(a0)
                  lhu          s7, 47(a0)
                  andi         a6, a7, -300
                  c.mv         a2, a5
                  lw           a1, 47(a0)
                  sb           a2, 243(a0)
                  div          a5, a1, s6
                  sb           t1, 0(a0)
                  lbu          a5, 46(a0)
                  andi         a2, sp, 1332
                  lh           s2, -163(a0)
                  lb           s8, -79(a0)
                  sh           a5, 31(a0)
                  lb           t6, -79(a0)
                  lbu          s7, -95(a0)
                  sb           s10, 255(a0)
                  lw           s3, 255(a0)
                  lb           tp, -239(a0)
                  lbu          t5, -239(a0)
                  sh           t1, -57(a0)
                  sb           gp, -230(a0)
                  sh           a2, 245(a0)
                  lbu          t5, 128(a0) #end riscv_load_store_hazard_instr_stream_31
                  la           s1, region_0+1294 #start riscv_load_store_rand_instr_stream_15
                  sltiu        a4, a6, -743
                  mulhu        s3, a5, a7
                  and          a2, a0, s1
                  lui          a3, 224041
                  lb           a7, 216(s1)
                  lui          t3, 1034743
                  sb           tp, -196(s1)
                  c.addi4spn   a3, sp, 448
                  lh           a6, 208(s1)
                  lb           s0, 47(s1)
                  rem          t1, tp, ra
                  rem          t0, s10, s7
                  ori          t0, t6, -1402
                  sb           a7, 94(s1)
                  c.add        a3, a7
                  c.xor        a2, a0
                  lbu          a6, -45(s1)
                  lb           t5, 207(s1)
                  slt          t4, a3, t0
                  sub          a2, a1, t0
                  lui          t0, 944677
                  c.addi       s2, 23
                  c.or         a5, a1
                  lbu          a2, 43(s1)
                  c.xor        a0, a2
                  sb           a3, 190(s1)
                  c.lui        s2, 5
                  sb           a1, -137(s1)
                  sw           s2, -174(s1)
                  lw           t1, 186(s1)
                  lhu          t6, -102(s1)
                  lbu          tp, 107(s1)
                  lbu          a1, -29(s1)
                  slti         a4, t6, -744
                  lbu          a4, -201(s1)
                  mulh         s11, s8, tp
                  c.xor        s0, a0
                  slli         t3, t2, 24
                  xori         a3, a2, -1854
                  c.mv         t5, a1
                  lbu          a3, 119(s1)
                  lhu          a6, 32(s1)
                  lbu          s2, 210(s1)
                  c.addi       s3, -1
                  slt          a7, s1, gp
                  lh           s3, -124(s1)
                  lb           s10, 44(s1) #end riscv_load_store_rand_instr_stream_15
                  la           a5, region_1+1421 #start load_store_instr_stream_2
                  la           tp, region_1+1617 #start load_store_instr_stream_3
                  lbu          t0, -24(a5)
                  la           ra, region_1+175 #start load_store_instr_stream_1
                  la           s0, region_1+965 #start load_store_instr_stream_0
                  sw           s2, -49(tp)
                  lbu          t0, -14(ra)
                  lh           t6, 15(tp)
                  sw           a6, -37(tp)
                  lb           a1, 62(a5)
                  lhu          t0, -3(ra)
                  lbu          s7, 8(s0)
                  lb           t4, -22(a5)
                  sb           s2, 38(a5)
                  sh           a0, -13(ra)
                  lb           t1, 36(tp)
                  lb           s3, 26(tp)
                  sb           s4, -8(ra)
                  sb           a4, -46(a5)
                  lbu          s3, 64(s0)
                  sb           s9, -5(s0)
                  sb           ra, 63(tp)
                  lb           s3, 8(ra)
                  sb           s1, -20(a5) #end load_store_instr_stream_2
                  lbu          s10, -36(tp)
                  sw           t0, 39(tp)
                  lb           gp, -34(s0)
                  lbu          t0, 42(tp) #end load_store_instr_stream_3
                  lbu          s1, -5(ra) #end load_store_instr_stream_1
                  sb           t5, 2(s0) #end load_store_instr_stream_0
                  la           sp, region_1+501 #start riscv_hazard_instr_stream_13
                  lb           t6, 2(sp)
                  lb           a6, -4(sp)
                  mulhsu       a3, t3, a6
                  div          t6, a4, t3
                  sb           t3, 1(sp)
                  sra          a4, a4, a4
                  c.or         a3, a3
                  lbu          a3, 12(sp)
                  and          t3, a4, a6
                  c.add        t6, a4
                  xor          t4, a4, t3
                  lbu          t3, -4(sp)
                  sb           t3, 4(sp)
                  lbu          a4, 2(sp)
                  sltu         a3, t3, t3
                  lh           t6, 7(sp)
                  c.add        t3, a6
                  c.li         a4, 19
                  slli         t4, t6, 16
                  mul          t3, a3, a6
                  xori         a6, t3, 1081
                  lh           t3, -15(sp)
                  lbu          a6, 14(sp)
                  lbu          a6, 16(sp)
                  sb           t4, -16(sp)
                  c.slli       t4, 15
                  sb           t4, 0(sp)
                  xori         a4, t4, -849
                  ori          t4, a6, 1897
                  c.nop
                  sll          t4, t4, a3
                  sltiu        a3, a3, -613
                  lbu          t4, -14(sp)
                  mulhu        t3, a3, a6
                  c.xor        a4, a3
                  lb           a4, 4(sp)
                  lbu          a3, 5(sp)
                  lhu          t4, -7(sp)
                  srli         a6, t3, 8
                  c.nop
                  sh           t3, 9(sp)
                  sh           a6, -7(sp)
                  auipc        a3, 285596
                  srl          t4, t3, a4
                  lb           t4, -7(sp)
                  lb           a6, 0(sp)
                  sb           a6, 8(sp)
                  lbu          a6, -8(sp)
                  lbu          t3, -16(sp) #end riscv_hazard_instr_stream_13
                  la           a3, amo_0+20 #start riscv_amo_instr_stream_3
                  la           s7, amo_0+44
                  slli         a5, t2, 17
                  amoadd.w.rl   t0, s3, (a3)
                  amoand.w      a6, t3, (s7)
                  amoor.w.aq    a6, t2, (s7)
                  amoswap.w     s2, a3, (a3) #end riscv_amo_instr_stream_3
                  la           t2, region_1+325 #start load_store_instr_stream_0
                  sb           a4, 53(t2)
                  la           gp, region_0+300 #start load_store_instr_stream_1
                  lb           a1, -160(t2)
                  sh           s3, -115(t2)
                  lbu          s5, 176(t2)
                  sb           s5, -106(t2)
                  sb           s10, 5(gp)
                  lbu          s5, 25(gp)
                  lb           t6, 57(gp)
                  sh           s6, -71(t2)
                  lbu          t3, -45(gp)
                  lbu          s11, 51(gp) #end load_store_instr_stream_1
                  lb           s2, -90(t2) #end load_store_instr_stream_0
                  la           t3, region_0+1175 #start load_store_instr_stream_1
                  lbu          a7, -2(t3)
                  la           s8, region_1+731 #start load_store_instr_stream_0
                  lb           s2, -13(t3)
                  lh           s1, -79(s8)
                  lhu          a1, -7(t3)
                  lb           s11, -210(s8)
                  lh           a3, 135(s8)
                  lbu          t6, 180(s8)
                  lbu          t0, 88(s8)
                  sb           a7, 12(t3)
                  lbu          s0, 10(t3) #end load_store_instr_stream_1
                  sb           s8, 78(s8)
                  lbu          a0, -116(s8) #end load_store_instr_stream_0
                  addi         sp, zero, -5 #init loop 1 counter
                  ori          t3, gp, 534
                  add          a1, zero, tp
                  addi         t5, zero, 10 #init loop 1 limit
sub_3_164_1_t:    sub          a0, s1, t3
                  sub          tp, s2, t1
                  addi         sp, sp, 3 #update loop 1 counter
                  and          s0, t6, a7
                  addi         a5, zero, -5 #init loop 0 counter
                  slti         a2, t2, 289
                  addi         a7, zero, 6 #init loop 0 limit
                  mul          t4, gp, s8
sub_3_164_0_t:    andi         t0, a2, 1030
                  sll          ra, a2, s5
                  sltiu        a2, t3, 908
                  addi         a5, a5, 3 #update loop 0 counter
                  blt          a5, a7, sub_3_164_0_t #branch for loop 0
                  c.xor        a0, s1
                  mulhu        ra, s11, t5
                  remu         ra, s11, s2
                  c.nop
                  beq          sp, t5, sub_3_164_1_t #branch for loop 1
                  div          a0, t6, a5
                  la           s1, region_0+1439 #start load_store_instr_stream_1
                  lb           s2, -2(s1)
                  la           t3, region_1+1871 #start load_store_instr_stream_0
                  lb           a2, 86(t3)
                  lb           tp, 6(s1)
                  lb           t5, 36(t3)
                  lb           sp, 4(s1)
                  sh           t0, -211(t3)
                  lb           s3, -2(s1)
                  sh           t5, -235(t3)
                  sb           a5, 16(s1)
                  lb           ra, -246(t3)
                  lbu          a7, 0(s1)
                  lh           a2, -9(s1)
                  sh           a0, 9(s1) #end load_store_instr_stream_1
                  lbu          a7, -18(t3) #end load_store_instr_stream_0
                  la           a2, region_0+535 #start load_store_instr_stream_3
                  la           a4, region_0+727 #start load_store_instr_stream_2
                  lb           a1, 214(a2)
                  la           s2, region_0+514 #start load_store_instr_stream_0
                  lh           zero, 5(a4)
                  la           a5, region_0+1869 #start load_store_instr_stream_1
                  lbu          tp, -238(a5)
                  lbu          s8, -3(a5)
                  lbu          s8, 989(s2)
                  lb           s5, -15(a4)
                  lb           a1, 745(s2)
                  sh           sp, -527(a2)
                  sb           a2, 1364(s2)
                  lhu          a7, -59(a5)
                  lb           s7, 264(s2)
                  sb           s8, 1451(a2)
                  lhu          a6, -15(a4)
                  sb           a3, -252(a5)
                  lb           a7, 4(a4)
                  lbu          t4, 28(a5)
                  lb           t3, 1070(a2)
                  lbu          t1, 1097(s2)
                  lh           s11, 342(s2)
                  sb           a7, -535(a2) #end load_store_instr_stream_3
                  sb           t5, -224(a5)
                  sb           t4, 1229(s2)
                  lbu          t5, 1117(s2)
                  lbu          s8, 13(a5)
                  lb           s5, -8(a4)
                  sb           s7, 120(a5)
                  lb           a7, 12(a4) #end load_store_instr_stream_2
                  lb           s3, -17(a5) #end load_store_instr_stream_1
                  lbu          s1, -61(s2) #end load_store_instr_stream_0
                  la           tp, region_1+686 #start riscv_load_store_rand_instr_stream_24
                  lbu          a1, 155(tp)
                  lbu          a4, -137(tp)
                  sb           t0, 176(tp)
                  divu         t3, a5, s0
                  or           t4, t4, a3
                  or           a2, s7, s4
                  sb           tp, -39(tp)
                  lh           sp, 136(tp)
                  ori          zero, a7, 98
                  lhu          s7, -46(tp)
                  sw           s3, 98(tp)
                  sb           t4, 190(tp)
                  xori         a4, t6, 680
                  auipc        t0, 1047109
                  sh           s5, -240(tp)
                  sb           s2, 27(tp)
                  sb           s9, -215(tp)
                  lb           s11, 9(tp)
                  lhu          sp, -12(tp)
                  sh           s10, -116(tp)
                  lh           s11, 40(tp)
                  lb           a1, 81(tp)
                  sb           a7, 246(tp)
                  lbu          t5, 156(tp)
                  lb           t2, 117(tp)
                  lbu          s8, 74(tp)
                  c.or         a4, a3
                  c.add        s3, a3
                  c.andi       a2, -1
                  lbu          t4, -239(tp)
                  lh           a3, -40(tp)
                  lbu          s0, -155(tp)
                  lh           zero, -98(tp)
                  lb           a5, -249(tp)
                  lh           t3, 130(tp)
                  lbu          a3, 115(tp)
                  lbu          s1, -205(tp)
                  c.addi       a6, 11
                  sb           a2, 49(tp)
                  lbu          gp, -101(tp) #end riscv_load_store_rand_instr_stream_24
                  la           s1, region_1+1708 #start load_store_instr_stream_1
                  lb           s5, 27(s1)
                  la           s10, region_0+1882 #start load_store_instr_stream_0
                  lw           t5, 26(s10)
                  lh           s7, 42(s1)
                  lbu          t5, -22(s10)
                  sb           a4, 29(s1)
                  lh           s5, 46(s1)
                  lb           a0, 61(s10)
                  lw           tp, -54(s10)
                  sb           sp, 5(s10)
                  lbu          s11, 23(s1)
                  lbu          s5, 53(s1)
                  lb           a0, 25(s10)
                  lb           t4, -1(s1)
                  lbu          sp, -51(s1)
                  lbu          a6, -11(s10)
                  sh           a7, 40(s1) #end load_store_instr_stream_1
                  lb           s11, 29(s10) #end load_store_instr_stream_0
                  addi         s11, zero, -6 #init loop 0 counter
                  addi         gp, zero, 12 #init loop 0 limit
                  c.slli       t5, 2
                  xori         t4, s4, 1397
                  c.srli       a5, 16
sub_3_173_0_t:    c.addi       s7, -1
                  addi         s11, s11, 6 #update loop 0 counter
                  c.nop
                  blt          s11, gp, sub_3_173_0_t #branch for loop 0
                  slti         tp, a7, -847
                  la           sp, region_1+1373 #start riscv_load_store_rand_instr_stream_17
                  lb           s3, 13(sp)
                  mulhu        ra, a4, a0
                  c.xor        a4, s1
                  lb           a0, -15(sp)
                  sll          t1, t6, s10
                  lh           s7, -11(sp)
                  lbu          s8, -8(sp)
                  c.add        a2, s2
                  c.and        a5, a2
                  sh           t0, 15(sp)
                  sb           s5, 16(sp)
                  lbu          a5, -6(sp)
                  lb           a0, -4(sp)
                  sb           t2, 10(sp)
                  sh           a6, -9(sp)
                  lb           a1, -10(sp)
                  lb           zero, 11(sp)
                  lbu          t3, -4(sp)
                  lb           ra, 12(sp)
                  lbu          s7, 10(sp)
                  slt          s8, t1, tp
                  sb           s2, 0(sp)
                  lbu          a2, -14(sp)
                  lhu          t4, -1(sp)
                  sb           t0, 16(sp)
                  lbu          t0, 14(sp)
                  mulhsu       s11, ra, ra
                  sb           s3, 14(sp)
                  sh           zero, -3(sp)
                  sb           a6, -16(sp)
                  lhu          s7, 1(sp)
                  sb           t2, 2(sp)
                  sb           t1, -1(sp)
                  lbu          zero, 16(sp)
                  lb           t3, 11(sp)
                  sltiu        s0, a1, 1800
                  c.and        a5, a3
                  andi         ra, s1, 1344
                  lhu          gp, 1(sp)
                  lb           t0, 2(sp) #end riscv_load_store_rand_instr_stream_17
                  la           sp, region_1+23 #start riscv_load_store_rand_instr_stream_22
                  sb           t5, 669(sp)
                  lh           s7, 147(sp)
                  sb           t5, 1355(sp)
                  c.lui        a6, 30
                  sb           t0, 994(sp)
                  lb           gp, 547(sp)
                  sb           s0, 360(sp)
                  or           a3, a4, a3
                  c.srli       a3, 15
                  lh           a7, 561(sp)
                  lb           s0, 15(sp)
                  lb           a6, 476(sp)
                  c.slli       t3, 13
                  mulhu        t2, t5, s7
                  sb           a3, 1427(sp)
                  sw           t4, 1957(sp)
                  srai         s11, s10, 8
                  xor          t0, ra, a6
                  lb           a2, 1776(sp)
                  lb           s10, 1168(sp)
                  slli         a1, s5, 21
                  or           t2, s9, t3
                  sb           a0, 610(sp)
                  c.srli       s1, 2
                  c.andi       a5, 31
                  c.addi       a3, 16
                  c.mv         a4, ra
                  or           a7, a1, a5
                  xor          a1, s10, t6
                  sb           a3, 30(sp)
                  srli         s2, s7, 22
                  sb           t6, 1454(sp) #end riscv_load_store_rand_instr_stream_22
                  la           s10, region_0+1301 #start riscv_hazard_instr_stream_9
                  c.or         s0, a3
                  and          s11, s7, a0
                  addi         a1, a0, -1383
                  auipc        a0, 551204
                  c.mv         a0, s11
                  lbu          a3, -46(s10)
                  lhu          s0, 81(s10)
                  sb           a0, 290(s10)
                  lbu          a3, -42(s10)
                  lh           a1, -849(s10)
                  xor          s11, s0, a1
                  lui          a1, 275087
                  lb           a3, 604(s10)
                  lbu          s0, -961(s10)
                  nop
                  lhu          s7, -787(s10)
                  sh           s7, -499(s10)
                  lbu          a3, 464(s10)
                  lbu          s11, -346(s10)
                  lbu          s11, 220(s10)
                  lbu          a3, -46(s10)
                  lb           a3, -169(s10)
                  andi         s11, s7, -672
                  sh           a1, -559(s10)
                  c.nop
                  slti         a0, a3, 1577
                  slt          a3, s7, s7
                  lbu          s11, 496(s10)
                  sb           a1, -1001(s10)
                  lbu          a3, -440(s10)
                  lw           s0, -757(s10)
                  lbu          a3, -675(s10)
                  lbu          a1, -228(s10)
                  lhu          s7, -1085(s10) #end riscv_hazard_instr_stream_9
                  la           sp, region_0+1092 #start riscv_load_store_rand_instr_stream_21
                  lbu          a7, 11(sp)
                  srl          tp, a7, s11
                  sw           s5, -52(sp)
                  nop
                  c.and        a4, s0
                  c.swsp       a5, 8(sp)
                  andi         ra, t5, 1792
                  c.lwsp       a1, 60(sp)
                  slti         t6, s4, -1532
                  div          s1, t3, s8
                  div          t4, t3, s2
                  lhu          a6, 26(sp)
                  c.lwsp       t4, 56(sp)
                  lbu          t5, -45(sp)
                  add          a7, ra, a5
                  lbu          gp, -13(sp)
                  lbu          t4, -22(sp)
                  mul          s10, s10, sp
                  sb           a0, -43(sp)
                  divu         a4, s3, a3
                  c.and        s1, a5
                  sb           s5, -35(sp)
                  sb           s5, 47(sp)
                  lb           a7, -4(sp)
                  lui          ra, 245578
                  lb           a5, 21(sp)
                  lw           t6, -8(sp)
                  lb           a1, 18(sp)
                  sltu         a1, zero, s6
                  c.andi       a2, -1
                  lbu          s7, -49(sp)
                  mulhu        gp, s2, s8
                  lbu          a6, -40(sp)
                  mulh         zero, sp, a2
                  sw           s5, -20(sp)
                  lbu          s0, 33(sp)
                  c.swsp       s9, 56(sp)
                  sb           s0, 10(sp)
                  sb           s3, -13(sp)
                  c.add        s8, tp
                  and          t1, s0, a7
                  sll          a0, t1, s1
                  sra          s2, a3, s0
                  lb           a0, -24(sp)
                  sltu         s0, t5, a1
                  or           s1, a5, s11
                  lbu          a7, 62(sp)
                  and          t5, a5, a2
                  c.and        a0, a3
                  remu         a5, s10, t1
                  lh           tp, 50(sp) #end riscv_load_store_rand_instr_stream_21
                  la           ra, region_0+1141 #start load_store_instr_stream_4
                  la           s7, region_0+902 #start load_store_instr_stream_2
                  la           t0, region_0+1720 #start load_store_instr_stream_3
                  sw           s2, -28(t0)
                  la           t2, region_0+1197 #start load_store_instr_stream_1
                  la           gp, region_0+327 #start load_store_instr_stream_0
                  lb           a3, 36(t2)
                  lbu          a0, 16(s7)
                  lhu          s2, -7(gp)
                  sb           a2, -54(gp)
                  sw           s4, -14(s7)
                  lh           t4, 42(t0)
                  lhu          s2, 425(ra)
                  sb           t6, -7(s7)
                  sh           a3, -55(t2)
                  lb           s10, 636(ra)
                  sb           tp, 18(gp)
                  lb           t1, 44(t0)
                  lh           s3, -2(s7)
                  lb           t4, 10(t2)
                  sw           t0, 6(s7)
                  lw           a3, 37(gp)
                  lb           sp, 17(gp)
                  lbu          s0, -35(t0)
                  sb           zero, 15(s7)
                  lb           tp, -8(gp)
                  lw           sp, -11(gp)
                  lbu          s10, -52(t0)
                  lb           t6, 805(ra)
                  sb           s6, 254(ra)
                  sb           a7, -16(t2)
                  sb           t5, 28(gp)
                  sb           a7, 7(t0)
                  sb           s2, 6(s7) #end load_store_instr_stream_2
                  lw           t1, -49(t2)
                  lh           t6, -245(ra) #end load_store_instr_stream_4
                  lbu          t3, -43(t0)
                  lbu          tp, 55(gp)
                  sh           sp, -35(t2) #end load_store_instr_stream_1
                  lbu          t3, -46(t0) #end load_store_instr_stream_3
                  sb           t3, -24(gp) #end load_store_instr_stream_0
                  la           s2, region_1+793 #start riscv_load_store_hazard_instr_stream_26
                  sb           tp, -55(s2)
                  sb           s11, -55(s2)
                  lhu          a7, -55(s2)
                  lbu          t3, -55(s2)
                  add          sp, t1, t4
                  lh           tp, -55(s2)
                  lh           t2, -55(s2)
                  sra          t1, s3, s7
                  lb           s8, -55(s2)
                  lhu          a7, 37(s2)
                  sh           t2, 37(s2)
                  lbu          t1, 37(s2)
                  lbu          s5, 37(s2)
                  lbu          a0, 37(s2)
                  lh           a3, 37(s2)
                  lbu          s1, 37(s2)
                  c.srai       a3, 25
                  sb           a3, 37(s2)
                  lbu          a3, 37(s2)
                  lhu          s8, -63(s2)
                  lh           a5, -63(s2) #end riscv_load_store_hazard_instr_stream_26
                  addi         s3, zero, 4 #init loop 0 counter
                  c.xor        a2, a2
                  addi         s5, zero, 9 #init loop 0 limit
                  c.sub        a3, a5
                  add          zero, t2, s5
                  sra          tp, s6, tp
                  c.xor        a0, s1
sub_3_156_0_t:    c.add        t6, a4
                  andi         tp, a2, -1596
                  mulhu        a0, zero, s8
                  addi         s3, s3, 6 #update loop 0 counter
                  and          a2, s4, s0
                  mulhsu       a5, t3, sp
                  c.and        s1, s1
                  c.srli       a2, 11
                  ori          a5, gp, 1804
                  blt          s3, s5, sub_3_156_0_t #branch for loop 0
                  slli         a1, s0, 27
                  la           a5, region_1+1680 #start load_store_instr_stream_1
                  la           s5, region_1+681 #start load_store_instr_stream_2
                  sb           a6, -240(s5)
                  lhu          t5, 50(a5)
                  la           a1, region_1+48 #start load_store_instr_stream_3
                  sb           a0, -169(a5)
                  lhu          t0, -207(s5)
                  lbu          s8, -98(s5)
                  lb           t2, -195(a5)
                  lb           s10, -41(a1)
                  lb           gp, 245(a5)
                  lb           a2, -1(a1)
                  lw           ra, 187(s5)
                  la           s11, region_1+660 #start load_store_instr_stream_0
                  lbu          t4, -5(a1)
                  lb           t3, 73(s11)
                  sw           s1, -12(a1)
                  lb           ra, -7(a1)
                  sb           s8, 1048(s11)
                  lb           s10, 6(a1)
                  lb           s10, 234(s5)
                  lb           s7, -195(s5)
                  sb           t2, 31(a1)
                  lbu          sp, 73(a5)
                  sb           s9, -574(s11)
                  lh           tp, 820(s11)
                  sb           a3, 15(s11)
                  sb           s4, 51(s5) #end load_store_instr_stream_2
                  lb           s10, -49(a5) #end load_store_instr_stream_1
                  sb           t4, 50(a1) #end load_store_instr_stream_3
                  lbu          a6, -248(s11) #end load_store_instr_stream_0
                  la           sp, region_0+133 #start riscv_load_store_hazard_instr_stream_25
                  lbu          tp, 44(sp)
                  lbu          s10, -4(sp)
                  sb           s2, -54(sp)
                  c.srai       a4, 11
                  lbu          s0, -54(sp)
                  lbu          t1, -47(sp)
                  lbu          a2, 26(sp)
                  sb           t1, 31(sp)
                  sw           t3, 31(sp)
                  sw           t2, 31(sp)
                  lb           ra, 31(sp)
                  lhu          s3, 33(sp)
                  lb           zero, 0(sp)
                  lbu          a2, -6(sp)
                  remu         gp, t0, a4
                  lb           s2, -6(sp)
                  sb           s5, -6(sp)
                  lhu          s11, -21(sp)
                  sb           s6, 37(sp)
                  lh           s1, 37(sp)
                  lb           s2, 36(sp)
                  sh           t3, -29(sp) #end riscv_load_store_hazard_instr_stream_25
                  la           tp, region_0+1491 #start load_store_instr_stream_0
                  la           a1, region_1+599 #start load_store_instr_stream_1
                  lb           s0, -8(tp)
                  sb           a6, 207(a1)
                  lb           t1, 843(a1)
                  sb           t5, -16(tp)
                  lhu          s10, 363(a1)
                  lbu          a7, -10(tp)
                  lh           a3, 917(a1)
                  lbu          t1, -12(tp)
                  lbu          s1, -2(tp)
                  sb           s3, 1105(a1)
                  lh           sp, 703(a1)
                  sb           a4, 1(tp)
                  lhu          t6, 393(a1)
                  lbu          s3, 9(tp)
                  lbu          s5, 32(a1)
                  lb           gp, -250(a1) #end load_store_instr_stream_1
                  lhu          sp, 11(tp) #end load_store_instr_stream_0
                  la           sp, region_1+468 #start riscv_load_store_rand_instr_stream_16
                  mul          a2, gp, t5
                  lui          t1, 576876
                  c.slli       ra, 9
                  remu         s11, a7, t0
                  mulhu        t5, s6, sp
                  sb           a3, 15(sp)
                  remu         t3, gp, a0
                  c.xor        a5, a1
                  divu         t5, ra, s7
                  mulh         t0, a7, s10
                  xori         a4, s0, -1323
                  lb           s11, -13(sp)
                  slti         s10, tp, -739
                  srai         a4, s8, 6
                  mulhu        gp, s5, a5
                  c.lwsp       t2, 8(sp)
                  sh           s3, -2(sp)
                  lbu          a6, 15(sp)
                  slt          t5, a3, t2
                  lhu          s2, 10(sp)
                  divu         s7, s6, s7
                  lhu          s3, 2(sp)
                  c.lui        s2, 24
                  srli         gp, s0, 9
                  c.swsp       t6, 8(sp)
                  sltiu        a5, s0, -587
                  sb           t1, 1(sp)
                  add          s2, a1, s10
                  c.slli       s7, 9
                  c.li         t0, -1
                  lui          zero, 562185
                  remu         ra, t2, a0
                  sb           t4, 3(sp) #end riscv_load_store_rand_instr_stream_16
sub_3_84:         jal          ra, 5f
0:                jal          ra, 4f
1:                c.jal        15f
2:                c.jal        7f
3:                c.j          13f
4:                c.jal        1b
5:                c.jal        11f
6:                jal          ra, 8f
7:                c.jal        14f
8:                jal          ra, 16f
9:                c.jal        6b
10:               c.j          0b
11:               c.jal        3b
12:               jal          t0, 9b
13:               c.j          10b
14:               c.jal        12b
15:               c.j          2b
16:               sub          s11, t5, s10
                  la           t4, region_0+1059 #start riscv_load_store_rand_instr_stream_18
                  lb           s0, -4(t4)
                  c.slli       t1, 13
                  lbu          t5, -8(t4)
                  andi         ra, t5, -617
                  remu         t1, s1, s9
                  c.nop
                  lb           zero, 3(t4)
                  auipc        a3, 833100
                  lhu          a1, -3(t4)
                  c.srli       a2, 5
                  sub          s10, s2, ra
                  sb           a5, 12(t4)
                  c.mv         s3, t4
                  lh           a2, 9(t4)
                  slt          t5, a5, s2
                  lhu          t2, -1(t4)
                  lb           sp, 9(t4)
                  sb           a7, -15(t4)
                  lh           t3, 11(t4)
                  c.addi       t3, 5
                  sb           t5, 11(t4)
                  c.srli       a1, 23
                  lb           sp, 4(t4)
                  c.addi4spn   a1, sp, 448
                  lbu          zero, -8(t4)
                  lbu          s5, -3(t4)
                  sb           s9, -11(t4) #end riscv_load_store_rand_instr_stream_18
                  la           sp, region_1+25 #start riscv_load_store_hazard_instr_stream_3
                  sb           t6, 680(sp)
                  sltiu        a1, a3, 1216
                  sb           t5, 1167(sp)
                  sh           a0, 947(sp)
                  sh           s4, 947(sp)
                  lb           t3, 947(sp)
                  sh           tp, 947(sp)
                  sb           a2, 1132(sp)
                  lh           t2, 1331(sp)
                  lhu          tp, 1331(sp)
                  lbu          t6, 1331(sp)
                  sb           s0, 1331(sp)
                  sb           t0, 1331(sp)
                  lb           s1, 1193(sp)
                  xori         a4, a1, 703
                  lhu          gp, 459(sp)
                  c.li         t6, 15
                  sb           t2, 124(sp)
                  lb           s7, 124(sp)
                  slt          a6, s10, t0
                  sh           sp, 973(sp) #end riscv_load_store_hazard_instr_stream_3
sub_3_83:         jal          ra, 1f
0:                c.jal        3f
1:                jal          t0, 14f
2:                c.j          4f
3:                c.j          2b
4:                c.jal        7f
5:                c.j          13f
6:                c.jal        10f
7:                c.jal        12f
8:                jal          ra, 11f
9:                jal          s2, 8b
10:               jal          t1, 9b
11:               c.jal        0b
12:               jal          tp, 15f
13:               c.jal        6b
14:               c.jal        5b
15:               c.andi       a0, 23
                  addi         s7, zero, 9 #init loop 1 counter
                  c.lui        ra, 27
                  mulhsu       t6, gp, sp
                  slli         a1, s2, 24
                  mulhu        s1, s5, gp
                  addi         a6, zero, 15 #init loop 1 limit
                  mulhu        t4, t3, s8
                  c.srai       s0, 26
sub_3_161_1_t:    ori          s0, a6, 1058
                  srl          s10, a6, t0
                  sltu         a3, zero, s5
                  addi         s7, s7, 6 #update loop 1 counter
                  divu         a4, s1, t2
                  divu         a1, a6, s10
                  nop
                  addi         s11, zero, 0 #init loop 0 counter
                  sltiu        s10, s6, -970
                  sll          s3, t1, t5
                  slt          s10, a2, t2
                  addi         t3, zero, -16 #init loop 0 limit
                  remu         s1, t1, t6
sub_3_161_0_t:    c.add        t4, s5
                  addi         s11, s11, -8 #update loop 0 counter
                  nop
                  bne          s11, t3, sub_3_161_0_t #branch for loop 0
                  c.lui        tp, 13
                  mulh         a0, t0, s7
                  c.srli       a1, 15
                  and          a0, s8, s1
                  beq          s7, a6, sub_3_161_1_t #branch for loop 1
                  xori         ra, a7, -687
                  addi         a4, zero, 2 #init loop 1 counter
                  xor          s5, tp, t3
                  c.sub        s0, a0
                  c.xor        a3, a4
                  sltu         s8, a4, gp
                  mulhsu       tp, t3, s10
                  addi         a2, zero, -19 #init loop 1 limit
sub_3_159_1_t:    c.nop
                  divu         t1, s7, s2
                  addi         a7, ra, 1310
                  c.xor        s1, a4
                  c.add        t4, s6
                  c.sub        s1, a0
                  addi         a4, a4, -7 #update loop 1 counter
                  divu         a7, s1, a5
                  xor          a5, s1, t3
                  c.mv         a6, t2
                  divu         t5, a1, s0
                  addi         a0, zero, -7 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
                  sub          gp, s6, a6
                  c.and        s1, a4
                  c.srai       s0, 19
                  addi         a6, s7, 517
sub_3_159_0_t:    div          t6, t3, s4
                  c.srli       s1, 9
                  xori         a1, a4, -326
                  addi         a0, a0, 7 #update loop 0 counter
                  c.sub        s1, a3
                  c.beqz       a0, sub_3_159_0_t #branch for loop 0
                  c.xor        s1, s0
                  bne          a4, a2, sub_3_159_1_t #branch for loop 1
                  div          t4, a2, s4
                  la           s2, region_1+240 #start riscv_load_store_rand_instr_stream_2
                  lb           ra, 1506(s2)
                  c.add        a5, s7
                  sra          a5, t0, s11
                  and          t0, s4, t2
                  remu         a1, s2, a7
                  c.slli       tp, 1
                  c.lui        a5, 24
                  lb           a1, 1150(s2)
                  lb           a3, 623(s2)
                  xor          t2, s1, s0
                  c.add        a6, t0
                  add          a7, zero, s0
                  slli         s1, a1, 20
                  lbu          s7, 201(s2)
                  add          s10, a6, s7
                  ori          ra, t6, 896
                  sb           s11, 1001(s2)
                  c.addi       t2, -1
                  lb           t0, 595(s2)
                  add          t5, a0, sp
                  sh           t1, 394(s2)
                  andi         zero, s5, 75
                  lbu          a0, 179(s2)
                  sb           s0, 378(s2)
                  sra          s10, a0, s6
                  sh           s1, 782(s2)
                  div          t2, t2, a1
                  lbu          s7, 777(s2)
                  ori          tp, a1, 1257
                  lhu          s1, -156(s2)
                  c.mv         t1, a0
                  slti         t3, s4, 465
                  mulhu        a4, a2, a3
                  sw           s11, 480(s2)
                  lb           t3, 983(s2)
                  sh           a0, 992(s2)
                  lb           t6, 1706(s2)
                  divu         ra, s10, a0
                  mulhsu       s11, a6, ra
                  lbu          a1, 517(s2)
                  srl          a6, a1, ra
                  c.mv         a0, ra
                  sb           s2, -116(s2)
                  sll          s8, s11, a7
                  sb           a1, 915(s2) #end riscv_load_store_rand_instr_stream_2
sub_3_69:         jal          ra, 4f
0:                c.j          17f
1:                c.jal        15f
2:                jal          ra, 24f
3:                c.jal        2b
4:                c.j          23f
5:                c.j          1b
6:                c.j          26f
7:                c.j          28f
8:                c.jal        20f
9:                c.j          13f
10:               jal          ra, 12f
11:               c.jal        9b
12:               jal          t1, 5b
13:               c.jal        27f
14:               jal          ra, 22f
15:               c.jal        14b
16:               c.jal        21f
17:               jal          t1, 6b
18:               c.jal        10b
19:               c.j          11b
20:               c.jal        7b
21:               jal          ra, 0b
22:               c.j          16b
23:               c.j          3b
24:               c.j          18b
25:               c.j          19b
26:               c.jal        25b
27:               jal          ra, 8b
28:               c.xor        a4, a5
                  la           sp, region_0+1535 #start riscv_hazard_instr_stream_31
                  lb           a0, 30(sp)
                  c.slli       gp, 9
                  c.add        s2, a5
                  c.addi       a6, 8
                  sltiu        a6, gp, -16
                  sb           s2, -64(sp)
                  lhu          a0, 51(sp)
                  lbu          gp, 59(sp)
                  c.xor        a0, a0
                  lh           s5, 21(sp)
                  lb           a0, 62(sp)
                  sb           s2, -35(sp)
                  lui          a5, 862599
                  lb           gp, -8(sp)
                  divu         s2, s2, s5
                  c.sub        a0, a0
                  sb           s2, -58(sp)
                  xor          a6, s5, a6
                  c.and        a0, a0
                  lbu          s2, 15(sp)
                  lb           gp, -38(sp)
                  sb           s5, 20(sp)
                  lb           a6, 12(sp)
                  slti         s2, a5, 1274
                  lb           s2, -26(sp)
                  add          s2, a0, a6
                  c.andi       a0, -1
                  lh           a5, -39(sp)
                  slli         s2, a0, 0
                  srl          s5, a0, s2
                  nop
                  lb           a5, -21(sp)
                  lhu          s5, 21(sp)
                  c.add        a0, gp
                  c.and        a0, a5
                  c.add        a6, s5
                  sltiu        a6, a0, -1160
                  lb           s5, -42(sp)
                  sb           a6, -10(sp)
                  lbu          a5, -14(sp)
                  xor          a0, s5, s5
                  sw           gp, -39(sp)
                  sltu         a5, s2, a0
                  divu         a5, a6, s2
                  remu         a6, s2, a5
                  xori         s5, s2, -87
                  remu         a0, s2, a5
                  srai         s5, a6, 7
                  div          a5, s5, a5
                  andi         a5, s5, -355
                  slti         a5, a0, -1907
                  lw           gp, 17(sp) #end riscv_hazard_instr_stream_31
                  la           t0, region_1+318 #start riscv_load_store_hazard_instr_stream_0
                  sb           t0, 81(t0)
                  nop
                  lb           a4, 81(t0)
                  lbu          s7, 81(t0)
                  lbu          s3, 81(t0)
                  sb           sp, 81(t0)
                  c.or         s0, a4
                  lb           t3, 81(t0)
                  sb           s2, 81(t0)
                  lb           ra, 81(t0)
                  mulhu        t2, s2, tp
                  lbu          s3, 81(t0)
                  lbu          s0, 40(t0)
                  lb           t6, 40(t0) #end riscv_load_store_hazard_instr_stream_0
sub_3_78:         jal          ra, 5f
0:                jal          tp, 10f
1:                c.jal        0b
2:                c.jal        13f
3:                c.jal        8f
4:                c.j          15f
5:                c.j          11f
6:                c.j          9f
7:                c.j          6b
8:                jal          t1, 7b
9:                c.jal        2b
10:               jal          a6, 14f
11:               jal          ra, 3b
12:               c.j          1b
13:               jal          s7, 12b
14:               c.jal        4b
15:               c.mv         ra, s1
                  la           s2, region_1+129 #start load_store_instr_stream_1
                  la           a0, region_0+1982 #start load_store_instr_stream_0
                  lbu          s8, -196(a0)
                  lb           s10, 986(s2)
                  lbu          s5, 648(s2)
                  lb           t6, 1487(s2)
                  sb           s8, -52(a0)
                  sb           t4, -223(a0)
                  lb           t2, 437(s2)
                  sh           a5, -36(a0)
                  sb           s11, 47(s2) #end load_store_instr_stream_1
                  lb           s8, -58(a0) #end load_store_instr_stream_0
                  la           sp, region_1+1981 #start riscv_load_store_hazard_instr_stream_16
                  lbu          s0, 8(sp)
                  sb           s7, 8(sp)
                  lb           a2, 8(sp)
                  lbu          a3, 8(sp)
                  sb           t5, -14(sp)
                  sb           t5, -14(sp)
                  sb           zero, -62(sp)
                  lbu          s3, -26(sp)
                  srli         a4, a1, 17
                  lh           a4, 9(sp)
                  lbu          t3, 9(sp)
                  lb           s7, 9(sp)
                  divu         tp, s6, s7
                  lh           t6, 9(sp)
                  rem          t3, ra, a2
                  sh           gp, 9(sp)
                  and          s2, s4, t0
                  c.or         a0, a0
                  c.sub        s1, s0
                  lhu          s10, -51(sp)
                  lhu          gp, -51(sp)
                  lh           s3, -51(sp)
                  lbu          s1, -51(sp)
                  mulhsu       t3, a4, t5
                  lhu          t6, -51(sp) #end riscv_load_store_hazard_instr_stream_16
                  addi         t0, zero, 1 #init loop 1 counter
                  nop
                  addi         s11, zero, -7 #init loop 1 limit
                  c.and        a4, a3
sub_3_175_1_t:    slti         a0, t3, 408
                  c.srai       a1, 30
                  addi         t0, t0, -4 #update loop 1 counter
                  c.andi       a4, 11
                  srl          t3, s5, zero
                  and          t4, tp, s11
                  lui          a4, 533306
                  c.nop
                  addi         t6, zero, -10 #init loop 0 counter
                  addi         a3, zero, -12 #init loop 0 limit
                  addi         sp, t1, -1407
                  c.mv         sp, s4
sub_3_175_0_t:    remu         a7, t2, gp
                  addi         t6, t6, -4 #update loop 0 counter
                  c.add        t2, tp
                  slti         s7, s1, -2005
                  addi         a7, gp, 792
                  bge          t6, a3, sub_3_175_0_t #branch for loop 0
                  sll          a2, s6, t5
                  srl          t2, t4, a2
                  sub          a5, t0, s0
                  c.li         ra, 15
                  c.mv         s8, a5
                  c.sub        a5, a0
                  bne          t0, s11, sub_3_175_1_t #branch for loop 1
                  mulh         s2, a6, t0
                  la           s8, amo_0+28 #start riscv_lr_sc_instr_stream_17
                  lr.w.aq       t3, (s8)
                  rem          a0, s6, zero
                  auipc        a3, 902958
                  c.add        gp, s4
                  c.andi       a2, 3
                  sltiu        a3, s11, -755
                  slti         zero, t1, -1375
                  c.slli       t1, 2
                  sra          t3, ra, a2
                  c.srai       a2, 25
                  c.xor        s1, s1
                  c.xor        a0, a2
                  sc.w.aq       gp, s10, (s8) #end riscv_lr_sc_instr_stream_17
                  la           t0, region_1+1844 #start riscv_load_store_rand_instr_stream_27
                  sb           sp, -177(t0)
                  mul          s5, a7, gp
                  c.or         a4, a2
                  and          s8, s6, t3
                  c.li         t4, -1
                  sra          t5, t6, t5
                  sb           t2, -67(t0)
                  lui          s2, 69567
                  c.and        a4, s1
                  lb           tp, -201(t0)
                  sb           s4, 123(t0)
                  sb           a5, 127(t0)
                  lbu          t5, -97(t0)
                  c.and        a3, a4
                  lh           a2, -38(t0)
                  c.or         s0, a3
                  c.li         t4, 28
                  lb           t3, 70(t0)
                  sb           s2, 109(t0)
                  or           s8, s2, t5
                  sb           a2, -55(t0)
                  c.addi16sp   sp, -16
                  and          s8, ra, a5
                  sh           s8, -96(t0)
                  lhu          t4, 8(t0)
                  c.slli       t6, 1
                  nop
                  andi         a4, s4, -942
                  c.and        a4, a5
                  c.and        a2, a0
                  lw           zero, 36(t0)
                  c.andi       s1, 6
                  lb           s10, 57(t0)
                  ori          s8, s6, 925
                  div          t5, s5, t1
                  srli         s1, t0, 15
                  lhu          a1, -18(t0)
                  addi         a5, ra, -1845
                  lbu          s11, 117(t0)
                  c.nop
                  lbu          a7, -53(t0) #end riscv_load_store_rand_instr_stream_27
                  la           t3, region_0+1059 #start load_store_instr_stream_1
                  la           gp, region_1+743 #start load_store_instr_stream_0
                  lh           a3, -169(t3)
                  lb           ra, -96(t3)
                  sh           tp, -35(gp)
                  sb           tp, -110(gp)
                  lh           a5, -161(gp)
                  lh           s7, 133(gp)
                  sb           s4, 98(t3)
                  lhu          t5, 95(t3)
                  sb           t6, -42(gp)
                  lhu          s8, 165(gp)
                  lhu          a2, -99(t3)
                  lbu          s10, -90(t3)
                  lb           a7, 81(gp)
                  sb           t4, -80(t3)
                  lb           s3, 238(gp)
                  sb           t4, -117(t3)
                  sb           a4, -32(t3)
                  lb           a3, -116(gp)
                  lb           s0, -88(t3) #end load_store_instr_stream_1
                  sh           zero, 237(gp) #end load_store_instr_stream_0
                  la           t4, region_0+143 #start riscv_load_store_rand_instr_stream_9
                  lb           s7, 4(t4)
                  sub          s0, ra, t3
                  rem          t0, t5, t0
                  sb           s7, -12(t4)
                  or           a5, a7, ra
                  sh           t2, -1(t4)
                  lui          s11, 851285
                  sb           ra, -14(t4)
                  ori          t1, t4, 811
                  nop
                  lhu          gp, 9(t4)
                  lbu          s1, -4(t4)
                  c.srai       a1, 11
                  c.nop
                  lbu          s11, 7(t4)
                  and          tp, a5, s4
                  lui          s8, 119647
                  lb           s10, -14(t4)
                  c.lui        t3, 21
                  mulh         s2, t3, sp
                  lh           s2, -15(t4)
                  sb           a3, -14(t4)
                  lhu          sp, 3(t4)
                  rem          s10, s3, a1
                  sb           a6, -16(t4)
                  sb           tp, 6(t4)
                  lbu          ra, -12(t4)
                  sra          a4, a5, a0
                  c.srai       a1, 26
                  lbu          t2, -12(t4)
                  mulhu        t1, s0, ra
                  mul          t1, a7, zero
                  sb           t2, 7(t4)
                  c.or         s1, a5
                  lb           zero, -10(t4)
                  sb           s3, 8(t4)
                  lb           gp, -1(t4)
                  lb           a2, -12(t4)
                  srl          s3, s9, s8
                  lbu          s5, 0(t4)
                  sra          a0, t2, a0
                  sb           zero, -13(t4)
                  lbu          s8, -14(t4)
                  lui          s5, 167836
                  lw           t3, 9(t4)
                  and          t0, s9, a6
                  lh           s10, 11(t4)
                  lui          s7, 629383
                  slt          a0, s4, t3
                  sb           s7, -13(t4) #end riscv_load_store_rand_instr_stream_9
                  la           a3, amo_0+48 #start riscv_lr_sc_instr_stream_12
                  lr.w          ra, (a3)
                  xor          a7, s9, t0
                  or           t2, a7, s3
                  srl          a6, t4, s3
                  mul          t5, s0, a2
                  sltiu        s1, a6, 731
                  c.mv         s5, gp
                  mulh         a2, s2, a6
                  c.lui        t0, 18
                  sub          s0, t5, t2
                  sra          a2, t2, tp
                  sc.w.rl       a4, a6, (a3) #end riscv_lr_sc_instr_stream_12
                  la           sp, region_1+123 #start riscv_load_store_hazard_instr_stream_19
                  sb           s9, 1756(sp)
                  sb           s11, 1756(sp)
                  lbu          s5, 610(sp)
                  sb           a2, 982(sp)
                  lbu          a5, 982(sp)
                  lb           t1, 982(sp)
                  lb           t4, 982(sp)
                  c.srai       a1, 16
                  lb           a2, 982(sp)
                  lb           s11, 982(sp)
                  lbu          tp, 982(sp)
                  lb           t5, 982(sp)
                  sra          zero, s11, a5
                  lbu          gp, 982(sp)
                  lb           t0, 1262(sp)
                  lbu          a4, 1262(sp)
                  sb           ra, 1166(sp)
                  sb           s2, 1342(sp)
                  sb           s3, 1342(sp)
                  lb           a2, 1342(sp) #end riscv_load_store_hazard_instr_stream_19
                  la           sp, region_1+1479 #start riscv_load_store_hazard_instr_stream_23
                  lhu          s8, -5(sp)
                  lbu          a3, -5(sp)
                  lb           t3, -80(sp)
                  lhu          t4, -39(sp)
                  sb           a1, -152(sp)
                  sw           a0, -75(sp)
                  mulhsu       s2, t5, s6
                  sb           a7, -160(sp)
                  lbu          a1, -160(sp)
                  sb           t0, -160(sp)
                  sb           s6, 4(sp)
                  sh           a6, 109(sp)
                  lb           s7, 161(sp)
                  lw           s7, 161(sp)
                  sw           a1, 161(sp)
                  lhu          t3, 161(sp)
                  lbu          a3, -135(sp)
                  lhu          a0, -135(sp)
                  sb           s3, 156(sp)
                  lb           a7, 187(sp)
                  lhu          a4, -241(sp) #end riscv_load_store_hazard_instr_stream_23
                  la           t5, region_1+397 #start riscv_load_store_rand_instr_stream_6
                  c.add        a2, gp
                  c.srai       a1, 15
                  c.srli       a1, 28
                  c.srai       a2, 19
                  mulhsu       ra, s5, t4
                  remu         a0, ra, t2
                  lbu          a3, -7(t5)
                  mulh         a6, s0, a0
                  sh           t2, 9(t5)
                  lb           a7, -11(t5)
                  lh           a6, 3(t5)
                  sll          a5, t1, gp
                  c.nop
                  auipc        tp, 168462
                  or           t1, a7, gp
                  lhu          gp, -3(t5)
                  lh           s2, -13(t5)
                  lhu          tp, 15(t5)
                  c.slli       gp, 29
                  lbu          s8, -4(t5)
                  lb           a2, 8(t5)
                  sb           a5, -8(t5)
                  lhu          a0, -7(t5)
                  c.and        a1, a3
                  srl          a5, a7, s0
                  addi         s2, a2, 82
                  xori         t0, a2, -1083
                  c.sub        a1, a0
                  c.lui        t3, 10
                  sb           s3, 10(t5)
                  nop
                  sub          t0, sp, a4
                  lb           gp, 10(t5)
                  sb           s1, 15(t5)
                  auipc        a3, 1006371
                  c.and        a0, a5
                  c.slli       s8, 22
                  c.and        a1, a2
                  sra          t3, a1, s9
                  lb           s8, 16(t5)
                  lb           s10, 4(t5)
                  lb           s7, 6(t5)
                  sw           gp, -9(t5)
                  lh           t0, 1(t5)
                  sb           a3, 0(t5) #end riscv_load_store_rand_instr_stream_6
sub_3_62:         jal          ra, 9f
0:                c.j          1f
1:                c.jal        10f
2:                c.jal        6f
3:                c.j          5f
4:                jal          a4, 0b
5:                jal          ra, 11f
6:                jal          ra, 12f
7:                c.jal        4b
8:                c.jal        7b
9:                c.jal        2b
10:               jal          ra, 15f
11:               jal          ra, 13f
12:               c.jal        3b
13:               jal          s7, 14f
14:               c.j          8b
15:               mulh         ra, s11, t6
                  la           s10, region_0+1773 #start load_store_instr_stream_1
                  la           t2, region_0+1755 #start load_store_instr_stream_2
                  lhu          t5, 47(t2)
                  lb           a5, -194(s10)
                  lb           t4, -26(t2)
                  la           s11, region_0+805 #start load_store_instr_stream_0
                  lbu          zero, -25(t2)
                  lb           tp, 174(s10)
                  lb           t6, -131(s10)
                  lbu          ra, -22(s10)
                  sb           a7, 201(t2)
                  sb           a7, 234(s11)
                  lb           a6, -24(t2)
                  lbu          s3, 196(s10)
                  lh           a6, 193(s10)
                  lb           t0, -178(s11)
                  sh           s7, 189(t2)
                  lhu          t1, -87(s11)
                  sh           a2, -3(s11)
                  lbu          t0, -235(s10) #end load_store_instr_stream_1
                  lbu          s8, 84(t2) #end load_store_instr_stream_2
                  sb           a1, 214(s11)
                  sb           t4, -125(s11) #end load_store_instr_stream_0
                  la           s5, amo_0+36 #start riscv_amo_instr_stream_6
                  la           s3, amo_0+16
                  la           s7, amo_0+4
                  amomaxu.w.aq  tp, s6, (s7)
                  amoadd.w      s0, ra, (s7)
                  srl          s11, s0, a2
                  amoand.w.aq   t6, a0, (s3)
                  amoswap.w.aq  a1, zero, (s7)
                  mulhu        t6, a0, s4
                  lui          zero, 910944
                  sll          sp, a2, a1
                  xor          a7, gp, t1
                  c.addi       a7, -1
                  mul          s2, s10, t6
                  amoand.w.rl   s1, s3, (s7)
                  amomaxu.w.rl  s8, s6, (s3)
                  amomax.w.aq   a5, t5, (s5)
                  c.slli       t5, 28
                  amoor.w       a5, t5, (s7)
                  slt          s11, a1, s6
                  amoand.w.rl   s8, s8, (s7)
                  amoxor.w.aq   s10, t3, (s5) #end riscv_amo_instr_stream_6
                  la           ra, region_0+1258 #start riscv_hazard_instr_stream_7
                  lbu          a5, -58(ra)
                  lb           a5, -240(ra)
                  add          a3, s2, a3
                  slti         gp, a3, -250
                  c.and        a3, a5
                  sh           a3, -202(ra)
                  srl          s2, tp, tp
                  c.mv         a5, a5
                  c.addi       a3, -1
                  mulhu        tp, tp, tp
                  mulh         tp, s2, a3
                  lb           a0, -205(ra)
                  lbu          gp, 204(ra)
                  xor          gp, gp, s2
                  sb           a5, -157(ra)
                  lbu          a5, -205(ra)
                  c.addi       a5, 31
                  c.srli       a0, 3
                  mulh         a3, s2, gp
                  srl          a3, gp, a3
                  sltiu        s2, a5, 1206
                  c.or         a5, a5
                  divu         a0, a0, tp
                  lbu          a3, -101(ra)
                  lb           s2, -6(ra)
                  mulhu        a5, a0, a0
                  c.andi       a5, 4
                  ori          gp, s2, 92
                  mulh         a5, a5, tp
                  c.sub        a0, a5
                  lbu          gp, -115(ra)
                  lb           a3, 17(ra)
                  sb           a3, -57(ra)
                  lbu          gp, 95(ra)
                  sra          gp, a0, a3
                  lui          a5, 55887
                  slti         a0, s2, 1893
                  sb           tp, 173(ra)
                  sltiu        a0, a0, -1120
                  sb           tp, -47(ra)
                  srli         a3, s2, 12
                  xori         s2, a3, 752
                  lb           tp, -147(ra) #end riscv_hazard_instr_stream_7
                  la           s1, region_0+701 #start load_store_instr_stream_2
                  la           a6, region_0+1382 #start load_store_instr_stream_3
                  la           a3, region_0+482 #start load_store_instr_stream_1
                  lh           s0, 1273(s1)
                  sb           gp, 42(a6)
                  la           s11, region_0+1362 #start load_store_instr_stream_0
                  lb           s5, 1278(s1)
                  lb           s5, 9(a3)
                  lbu          ra, 10(a3)
                  lbu          s3, 884(s1)
                  la           a1, region_0+1255 #start load_store_instr_stream_4
                  lb           a4, -3(s11)
                  lbu          s7, 460(s1)
                  lhu          s7, 598(a6)
                  sb           a0, -11(s11)
                  lb           gp, -2(a3)
                  lh           gp, -679(s1)
                  lw           s5, -767(a1)
                  lbu          s3, -671(a6)
                  sw           t4, 14(s11)
                  lhu          gp, -14(a3)
                  lbu          s2, -356(a6)
                  lbu          t4, -1189(a6)
                  sh           a2, -12(a3)
                  sh           t2, -85(a1)
                  lbu          t2, -1188(a1)
                  lb           gp, 15(s11)
                  lbu          s8, 15(a3)
                  lh           t6, -389(s1)
                  lb           tp, -698(a6)
                  sh           ra, 53(s1)
                  lb           t4, 402(a1)
                  lbu          t0, -3(a3) #end load_store_instr_stream_1
                  sb           t5, 1260(s1)
                  lbu          a2, -709(a1)
                  sh           a0, -588(a6)
                  sw           a4, -567(a1) #end load_store_instr_stream_4
                  sb           sp, 758(s1) #end load_store_instr_stream_2
                  lh           s2, -980(a6) #end load_store_instr_stream_3
                  lbu          sp, 8(s11) #end load_store_instr_stream_0
                  la           ra, amo_0+32 #start riscv_lr_sc_instr_stream_13
                  lr.w          s8, (ra)
                  divu         a1, t3, a6
                  srl          zero, a4, s6
                  sc.w          sp, ra, (ra) #end riscv_lr_sc_instr_stream_13
sub_3_67:         jal          ra, 1f
0:                c.j          3f
1:                jal          ra, 13f
2:                c.j          0b
3:                jal          a3, 15f
4:                c.jal        18f
5:                jal          ra, 12f
6:                jal          t0, 7f
7:                c.j          9f
8:                jal          ra, 10f
9:                jal          ra, 2b
10:               jal          s3, 17f
11:               jal          ra, 6b
12:               c.jal        11b
13:               jal          ra, 5b
14:               jal          ra, 4b
15:               jal          t1, 8b
16:               c.j          14b
17:               c.j          16b
18:               xor          gp, t3, s9
                  la           s7, region_1+620 #start load_store_instr_stream_0
                  lbu          a4, 1171(s7)
                  la           a2, region_0+1887 #start load_store_instr_stream_1
                  sb           t6, 86(s7)
                  sb           t6, -252(a2)
                  lbu          t2, 809(s7)
                  sb           a1, 525(s7)
                  lhu          gp, 85(a2)
                  lbu          s11, 10(a2)
                  lbu          t5, -242(a2)
                  lb           t0, -41(s7)
                  sb           a4, -20(a2)
                  lbu          a0, -161(a2)
                  lbu          a1, -462(s7)
                  sb           s3, -228(a2) #end load_store_instr_stream_1
                  lbu          s0, 1121(s7) #end load_store_instr_stream_0
                  la           s3, region_0+1105 #start riscv_hazard_instr_stream_14
                  lb           a1, 0(s3)
                  sh           a4, -211(s3)
                  c.sub        s1, s1
                  c.andi       a0, 21
                  lbu          a4, -21(s3)
                  c.slli       s1, 6
                  or           s1, s1, a4
                  sb           a1, 136(s3)
                  c.and        s1, a0
                  c.li         t6, -1
                  c.xor        a1, a1
                  lh           a0, 125(s3)
                  lb           t6, 93(s3)
                  sb           a4, -240(s3)
                  lbu          s1, -58(s3)
                  c.srli       a1, 26
                  srai         a0, s1, 26
                  slt          zero, a4, t6
                  mulhu        a4, zero, a0
                  lbu          a0, -213(s3)
                  div          t6, zero, a0
                  xori         s1, s1, -730
                  slli         zero, s1, 22
                  sb           a4, -121(s3)
                  c.sub        a0, s1
                  srai         a1, a1, 0
                  c.slli       a1, 12
                  lb           a4, -142(s3)
                  lbu          s1, -42(s3)
                  sub          t6, s1, zero
                  sub          a0, zero, zero
                  lh           zero, -129(s3)
                  lbu          a1, 141(s3)
                  mul          a0, s1, a1
                  c.and        a4, a4
                  srl          zero, a4, a0
                  c.andi       a4, -1
                  c.and        a4, s1
                  auipc        a1, 703648
                  slli         a4, s1, 8
                  lbu          s1, -120(s3) #end riscv_hazard_instr_stream_14
                  addi         t3, zero, -10 #init loop 1 counter
                  mulhu        a2, s11, t1
                  srai         s7, a5, 16
                  addi         s1, zero, 18 #init loop 1 limit
                  mulhsu       s11, s1, s1
sub_3_166_1_t:    addi         t2, zero, -326
                  sltu         t0, s8, s5
                  mul          sp, s0, a3
                  addi         t3, t3, 9 #update loop 1 counter
                  c.sub        a1, a4
                  addi         s8, zero, 10 #init loop 0 counter
                  sra          a3, s3, s0
                  addi         a5, zero, 10 #init loop 0 limit
                  c.or         a0, s0
                  nop
                  mulh         s11, s2, s0
                  c.srai       a2, 11
                  mulh         tp, t0, t2
                  slt          t1, zero, s2
                  sub          t1, a2, s6
sub_3_166_0_t:    divu         t6, a0, s6
                  mulh         t0, t4, a1
                  c.and        a0, a4
                  slti         a6, a0, 1413
                  remu         sp, s3, a5
                  addi         s8, s8, -8 #update loop 0 counter
                  sltu         s10, t1, t3
                  bgeu         s8, a5, sub_3_166_0_t #branch for loop 0
                  c.lui        s5, 5
                  c.and        a1, s0
                  c.li         sp, -1
                  mulh         sp, a6, a0
                  mul          s2, s8, s1
                  bltu         t3, s1, sub_3_166_1_t #branch for loop 1
                  mulhu        t5, s3, a1
                  la           t0, amo_0+48 #start riscv_amo_instr_stream_9
                  amomin.w.aq   a3, s8, (t0)
                  amoadd.w.aq   a1, t3, (t0)
                  c.sub        s0, a4
                  amoadd.w.rl   s2, gp, (t0)
                  amomin.w.aq   a1, sp, (t0)
                  amomaxu.w.rl  a2, zero, (t0)
                  amoxor.w.rl   s8, a7, (t0)
                  amoadd.w.rl   gp, t4, (t0) #end riscv_amo_instr_stream_9
                  addi         s0, zero, -2 #init loop 0 counter
                  or           sp, t6, t3
                  srl          t5, t0, zero
                  addi         a6, zero, -14 #init loop 0 limit
sub_3_174_0_t:    c.and        a4, a5
                  addi         s0, s0, -2 #update loop 0 counter
                  auipc        a1, 696460
                  addi         a1, a5, -1719
                  beq          s0, a6, sub_3_174_0_t #branch for loop 0
                  c.or         a4, s0
                  addi         s7, zero, 4 #init loop 1 counter
                  addi         s8, zero, 3 #init loop 1 limit
                  sll          ra, ra, s0
sub_3_163_1_t:    slt          t1, s5, zero
                  addi         s7, s7, -1 #update loop 1 counter
                  addi         s5, zero, -3 #init loop 0 counter
                  c.andi       a5, 19
                  c.addi4spn   a4, sp, 144
                  addi         a3, zero, -10 #init loop 0 limit
sub_3_163_0_t:    xori         s1, a2, 1421
                  addi         s5, s5, -8 #update loop 0 counter
                  auipc        t1, 973662
                  bge          s5, a3, sub_3_163_0_t #branch for loop 0
                  bge          s7, s8, sub_3_163_1_t #branch for loop 1
                  sltiu        tp, s7, 778
                  la           a6, region_1+954 #start load_store_instr_stream_1
                  la           a2, region_0+112 #start load_store_instr_stream_0
                  lbu          a7, 80(a6)
                  lb           a7, -33(a6)
                  lbu          s0, 9(a2)
                  lbu          s5, 35(a2)
                  sh           a6, 34(a6)
                  lb           t3, 156(a6)
                  sb           s5, -7(a2)
                  lb           ra, 53(a2)
                  sb           a5, 231(a6)
                  lh           ra, 46(a2)
                  lbu          t2, -251(a6)
                  lbu          s11, -181(a6)
                  lhu          s11, 234(a6)
                  sb           a2, -59(a2)
                  lhu          t4, 188(a6) #end load_store_instr_stream_1
                  sb           t6, 29(a2)
                  sb           s2, -5(a2) #end load_store_instr_stream_0
                  la           s7, region_1+1840 #start riscv_hazard_instr_stream_26
                  sb           sp, 47(s7)
                  lbu          a1, 6(s7)
                  c.srai       a1, 9
                  lw           sp, -28(s7)
                  c.sub        a5, a5
                  c.lui        a5, 13
                  sb           t4, 35(s7)
                  sw           s3, -24(s7)
                  sw           s3, -28(s7)
                  add          sp, s0, a1
                  sb           t4, 57(s7)
                  sb           s3, -9(s7)
                  c.slli       sp, 22
                  andi         sp, t4, 1739
                  slti         s3, s0, -1946
                  c.add        t4, a5
                  rem          t4, s0, t4
                  divu         s0, a1, s0
                  sb           sp, -18(s7)
                  c.addi       a1, 6
                  lh           s3, -62(s7)
                  sh           sp, 42(s7)
                  lbu          sp, -13(s7)
                  or           s0, t4, a5
                  sh           t4, -64(s7)
                  or           sp, t4, s3
                  mulh         a5, a5, a1
                  c.xor        a5, a1
                  sb           s0, 47(s7)
                  lh           s0, 12(s7)
                  c.lui        s0, 18
                  ori          s0, s3, -507
                  sb           a5, 8(s7)
                  rem          sp, s3, s0
                  srai         sp, s3, 10
                  sb           s3, -29(s7) #end riscv_hazard_instr_stream_26
                  la           a6, region_1+686 #start riscv_load_store_hazard_instr_stream_10
                  lb           s0, -53(a6)
                  sb           sp, -53(a6)
                  lb           s1, 5(a6)
                  c.andi       a5, 10
                  sb           a0, -45(a6)
                  sb           t2, -45(a6)
                  sb           s1, -45(a6)
                  lb           a1, 22(a6)
                  lb           s0, 22(a6)
                  sra          a2, t5, s10
                  lhu          a4, 52(a6)
                  lhu          t2, 52(a6) #end riscv_load_store_hazard_instr_stream_10
                  la           a0, amo_0+0 #start riscv_amo_instr_stream_15
                  la           t6, amo_0+60
                  amomin.w.rl   s1, s3, (a0)
                  amoxor.w      a7, s2, (t6)
                  amoor.w.rl    a3, s0, (t6)
                  amoor.w.aq    a1, s8, (a0)
                  amoadd.w      s5, a4, (a0) #end riscv_amo_instr_stream_15
                  la           a6, region_0+109 #start riscv_load_store_hazard_instr_stream_14
                  lb           s10, 52(a6)
                  sb           sp, 52(a6)
                  mulhsu       a3, a3, s3
                  lbu          a5, 52(a6)
                  lbu          s11, 26(a6)
                  lb           ra, 26(a6)
                  lb           a3, -11(a6)
                  sb           a5, 12(a6)
                  mulhu        s0, s10, s6
                  lh           zero, 5(a6)
                  lhu          a7, 5(a6)
                  lh           t4, 5(a6)
                  c.lui        ra, 9
                  sh           t3, 33(a6)
                  lhu          ra, 1(a6)
                  lbu          t4, 1(a6)
                  lb           t2, 1(a6)
                  lb           gp, 1(a6)
                  lhu          a5, -53(a6)
                  lb           t5, 0(a6)
                  divu         a0, s7, a4
                  sh           s0, -7(a6) #end riscv_load_store_hazard_instr_stream_14
                  la           sp, region_0+497 #start riscv_load_store_hazard_instr_stream_13
                  lb           t3, 33(sp)
                  and          t5, sp, ra
                  sll          gp, s8, tp
                  lbu          a0, -33(sp)
                  lw           s7, -33(sp)
                  lbu          s11, -33(sp)
                  lhu          a4, -33(sp)
                  sltu         t0, a5, t3
                  lb           a6, -33(sp)
                  sw           t4, -33(sp)
                  sb           gp, -33(sp)
                  lb           ra, 36(sp)
                  lb           s5, 36(sp)
                  lbu          a4, 36(sp)
                  remu         s0, a7, a1
                  lb           s2, 36(sp) #end riscv_load_store_hazard_instr_stream_13
                  la           t1, region_0+1417 #start load_store_instr_stream_0
                  lb           a0, 131(t1)
                  la           s3, region_1+1705 #start load_store_instr_stream_1
                  lbu          sp, 114(t1)
                  lh           t2, -1229(s3)
                  lb           t6, -370(s3)
                  sb           sp, 146(t1)
                  lbu          a6, -230(t1)
                  lw           gp, -1393(s3)
                  lbu          t3, 175(s3)
                  lhu          a3, -67(t1)
                  lbu          a0, -34(t1)
                  lb           t5, 109(t1)
                  lbu          gp, 138(t1)
                  lbu          t5, -1083(s3)
                  lb           t0, -1590(s3)
                  sb           ra, -1042(s3)
                  lb           zero, -764(s3) #end load_store_instr_stream_1
                  sb           t3, -215(t1) #end load_store_instr_stream_0
                  la           s5, amo_0+12 #start riscv_amo_instr_stream_7
                  amoxor.w      a7, s1, (s5)
                  c.li         a5, -1
                  mulhu        a0, s7, t6
                  amoand.w      t4, s5, (s5)
                  c.slli       s10, 13
                  sra          zero, sp, a1
                  amoadd.w.rl   zero, s9, (s5)
                  amominu.w.rl  a5, a4, (s5)
                  amominu.w.aq  a4, a3, (s5)
                  ori          a5, a2, 921
                  amoswap.w.aq  zero, t0, (s5) #end riscv_amo_instr_stream_7
sub_3_75:         jal          ra, 12f
0:                c.jal        11f
1:                c.j          4f
2:                c.jal        9f
3:                jal          s3, 23f
4:                c.jal        21f
5:                jal          ra, 8f
6:                c.jal        15f
7:                jal          t1, 14f
8:                jal          ra, 26f
9:                c.j          13f
10:               c.j          20f
11:               c.jal        22f
12:               c.jal        3b
13:               c.jal        6b
14:               c.j          18f
15:               jal          t1, 10b
16:               c.j          7b
17:               c.jal        19f
18:               c.j          0b
19:               c.j          16b
20:               jal          ra, 5b
21:               c.jal        25f
22:               c.jal        1b
23:               jal          sp, 24f
24:               jal          t1, 17b
25:               c.j          2b
26:               rem          t1, a5, a2
                  la           s10, region_1+258 #start load_store_instr_stream_0
                  la           a4, region_0+433 #start load_store_instr_stream_1
                  sb           s1, 1(s10)
                  lb           t3, -11(s10)
                  lbu          a2, -66(a4)
                  sb           a7, -11(s10)
                  lb           t4, 126(a4)
                  sh           a6, -39(a4)
                  lb           a0, -11(s10)
                  lbu          a3, -167(a4)
                  sb           s8, 11(s10)
                  lb           a2, 132(a4)
                  lb           s8, 6(s10)
                  sh           s4, -163(a4)
                  sb           zero, 3(s10)
                  lbu          s5, -13(s10)
                  lb           t4, 9(s10)
                  lb           t6, -15(a4) #end load_store_instr_stream_1
                  sh           ra, 12(s10) #end load_store_instr_stream_0
                  la           s8, amo_0+16 #start riscv_lr_sc_instr_stream_4
                  div          tp, t4, a1
                  or           a6, ra, a1
                  sub          t3, gp, s9
                  slti         a4, s10, -702
                  c.srai       a1, 1
                  lr.w.rl       t1, (s8)
                  sltiu        s5, t3, -1089
                  addi         gp, s10, -1273
                  slt          a0, sp, s9
                  c.add        s5, s4
                  c.nop
                  sc.w.rl       zero, s4, (s8) #end riscv_lr_sc_instr_stream_4
                  la           s8, amo_0+40 #start riscv_amo_instr_stream_21
                  rem          a5, s0, t3
                  and          t5, s11, s2
                  amoadd.w.rl   a7, s0, (s8)
                  amomin.w.aq   gp, s7, (s8)
                  amomin.w      s10, s5, (s8)
                  amomax.w      a1, a1, (s8)
                  amominu.w     s0, a2, (s8)
                  amoxor.w.aq   s1, s0, (s8)
                  amoswap.w.rl  s3, sp, (s8)
                  c.mv         sp, t0
                  amomaxu.w     s0, t2, (s8)
                  amoadd.w.rl   zero, sp, (s8)
                  srli         t4, s1, 4
                  amominu.w.aq  t3, a3, (s8) #end riscv_amo_instr_stream_21
                  la           t1, amo_0+0 #start riscv_amo_instr_stream_13
                  andi         s7, zero, -1581
                  amoadd.w      s1, gp, (t1)
                  amominu.w     t0, gp, (t1)
                  amoswap.w.aq  a7, s3, (t1)
                  amoor.w       s8, a7, (t1)
                  srl          gp, ra, t3
                  amominu.w.aq  s0, t5, (t1)
                  c.addi4spn   a3, sp, 624
                  c.sub        a1, s0
                  amoswap.w.rl  a6, t4, (t1)
                  c.sub        a4, a2
                  amoor.w.rl    a1, a5, (t1)
                  sltiu        a3, a3, 1334
                  amominu.w.aq  t4, s5, (t1) #end riscv_amo_instr_stream_13
                  la           s8, amo_0+44 #start riscv_lr_sc_instr_stream_22
                  slti         a7, a0, -1365
                  lui          t4, 502741
                  slt          t0, a7, ra
                  c.addi4spn   a3, sp, 272
                  c.andi       a2, -1
                  sltu         s1, t0, gp
                  c.sub        a2, a4
                  lr.w.rl       t2, (s8)
                  srl          sp, gp, t6
                  sc.w.rl       t3, t4, (s8) #end riscv_lr_sc_instr_stream_22
                  la           s5, region_1+1058 #start load_store_instr_stream_1
                  la           s10, region_0+1257 #start load_store_instr_stream_0
                  sw           a4, 218(s5)
                  lbu          t0, -239(s5)
                  sh           t3, 59(s10)
                  lb           tp, -235(s5)
                  lh           t6, 173(s10)
                  sh           s7, -102(s5)
                  lbu          t4, 98(s10)
                  lbu          a3, 254(s5)
                  sh           t3, 230(s5)
                  lb           s8, 89(s5)
                  lb           s3, 174(s10)
                  lbu          a3, 125(s5)
                  lb           t5, -147(s10)
                  lbu          t5, 201(s5)
                  lbu          t1, -189(s5) #end load_store_instr_stream_1
                  lb           a6, 217(s10)
                  lbu          a2, -18(s10)
                  lh           a4, -143(s10) #end load_store_instr_stream_0
                  la           s7, region_0+1091 #start riscv_hazard_instr_stream_23
                  lbu          t6, -990(s7)
                  lbu          ra, 101(s7)
                  sb           a0, 826(s7)
                  lbu          t3, -166(s7)
                  lbu          a1, -676(s7)
                  lbu          ra, -40(s7)
                  divu         ra, t3, t3
                  add          t3, a1, s1
                  addi         t3, t3, -1435
                  sb           a0, 802(s7)
                  lh           t6, -609(s7)
                  mulhu        a0, s1, s1
                  sb           ra, -277(s7)
                  divu         a1, s1, ra
                  c.or         s1, s1
                  andi         a0, t6, -1046
                  lui          ra, 654774
                  c.srli       a0, 20
                  lbu          a0, 534(s7)
                  lb           t3, 37(s7)
                  slli         t3, s1, 19
                  sb           t6, -733(s7)
                  auipc        s1, 438837
                  c.srai       s1, 3
                  lb           ra, -838(s7)
                  c.slli       a1, 6
                  lb           ra, 254(s7)
                  c.slli       ra, 9
                  lb           ra, 670(s7)
                  lb           s1, 645(s7)
                  lb           a0, 110(s7)
                  c.lui        t6, 5
                  sb           a0, 199(s7)
                  sb           a1, 707(s7)
                  sb           ra, 59(s7)
                  lb           ra, -308(s7)
                  lui          a1, 805836
                  c.lui        a1, 22
                  sb           t3, 618(s7)
                  c.lui        a0, 20
                  lbu          t6, 278(s7)
                  div          s1, t6, t6
                  sb           t6, -1076(s7)
                  c.li         a1, 9
                  sb           a0, 632(s7)
                  sb           t6, -582(s7)
                  sb           t6, -233(s7)
                  sb           a1, -868(s7) #end riscv_hazard_instr_stream_23
                  la           s10, region_1+1921 #start riscv_load_store_rand_instr_stream_10
                  c.li         s1, -1
                  lbu          a2, -2(s10)
                  sb           t6, -12(s10)
                  lb           zero, 16(s10)
                  sb           s11, 4(s10)
                  add          s3, s10, a2
                  lui          ra, 278591
                  sb           sp, 2(s10)
                  lbu          tp, -14(s10)
                  c.mv         a6, s0
                  srl          s7, a0, a2
                  lbu          s11, 14(s10)
                  lb           t1, 13(s10)
                  lb           t0, -15(s10)
                  lh           sp, -9(s10)
                  lh           s1, -7(s10)
                  sll          a7, t3, a6
                  slt          t4, s0, t2
                  lb           gp, 3(s10)
                  sb           a6, -6(s10)
                  sb           s7, -10(s10)
                  lbu          s0, 8(s10)
                  c.andi       a2, 18
                  lbu          a5, -6(s10)
                  lb           tp, -6(s10)
                  sb           t6, -2(s10)
                  lbu          t5, -9(s10)
                  sb           a5, -3(s10)
                  lbu          a4, 5(s10)
                  andi         s8, s1, 59
                  mulh         s11, s5, a0
                  lbu          a2, 7(s10)
                  lh           a0, -11(s10)
                  c.xor        a0, a0
                  sb           ra, 4(s10)
                  lbu          s2, -6(s10)
                  ori          a6, sp, 36
                  c.srli       a0, 14
                  addi         t6, s2, -1075
                  lbu          t5, 4(s10) #end riscv_load_store_rand_instr_stream_10
                  la           s10, region_0+919 #start riscv_load_store_rand_instr_stream_14
                  lhu          s3, 3(s10)
                  lbu          t6, 0(s10)
                  c.srai       a1, 18
                  sh           s7, -13(s10)
                  mulh         t0, t1, s1
                  or           s11, s6, s11
                  lb           a0, -14(s10)
                  lhu          a7, -5(s10)
                  c.and        a4, s1
                  andi         s0, t3, 1647
                  c.or         a2, a4
                  sw           sp, -7(s10)
                  sb           t6, 16(s10)
                  c.li         ra, -1
                  lhu          tp, 11(s10)
                  divu         s7, a4, s3
                  sb           s11, -14(s10)
                  lb           tp, -2(s10)
                  lbu          a2, 10(s10)
                  lb           gp, 4(s10)
                  lhu          a7, -3(s10)
                  lw           t4, -15(s10)
                  xori         sp, a4, 1515
                  lbu          a2, 0(s10)
                  xori         t0, gp, -45
                  c.srai       a5, 23
                  lw           s2, 9(s10)
                  lb           a4, -15(s10)
                  lb           t6, 1(s10)
                  divu         a1, gp, s10
                  remu         s0, a5, t0
                  xori         t2, zero, 2042
                  c.srai       a4, 29
                  sb           s2, 6(s10)
                  c.srli       s1, 19
                  lhu          t3, 1(s10)
                  sb           s8, -16(s10)
                  mulhu        a2, s7, s2
                  sra          a7, t2, a0
                  c.andi       a0, 19
                  xor          a4, t0, t2
                  sh           s5, 5(s10)
                  lhu          a7, -13(s10)
                  lb           s7, 6(s10)
                  lh           gp, 3(s10)
                  mulh         s1, t5, t0
                  c.slli       gp, 9
                  srai         s8, a4, 24
                  c.addi       a5, -1
                  srli         s3, s3, 27
                  slti         a4, s6, 700
                  lbu          a3, -16(s10)
                  c.addi       s0, 2
                  c.sub        a4, a5
                  sb           a2, -1(s10)
                  lb           tp, 14(s10) #end riscv_load_store_rand_instr_stream_14
                  la           s11, region_0+1862 #start riscv_load_store_rand_instr_stream_31
                  sb           t1, -16(s11)
                  srli         zero, s1, 22
                  c.add        a5, gp
                  lb           a2, 14(s11)
                  lb           a0, -15(s11)
                  lw           a7, 14(s11)
                  lbu          t6, 15(s11)
                  mulh         tp, t4, t4
                  lb           a4, 15(s11)
                  c.addi16sp   sp, 224
                  lh           s2, 10(s11)
                  c.mv         a4, t2
                  sh           t2, 8(s11)
                  and          s1, s4, s6
                  sra          s3, t6, t5
                  lhu          a4, 12(s11)
                  lbu          tp, -5(s11)
                  sh           a4, 6(s11)
                  lhu          s3, 10(s11)
                  lw           s10, -2(s11)
                  sb           a4, -13(s11)
                  c.nop
                  c.srli       a0, 9
                  sb           a4, 8(s11)
                  srli         s7, s4, 28
                  lb           a0, 13(s11)
                  sb           t6, -15(s11)
                  sb           ra, -6(s11)
                  sb           t6, -4(s11)
                  lbu          gp, -15(s11)
                  c.addi16sp   sp, -16
                  sll          s3, a7, t3
                  c.addi       a7, 21
                  sb           s7, 11(s11)
                  sb           tp, -10(s11)
                  slli         a1, s1, 21
                  lb           a1, 13(s11)
                  sh           t2, 10(s11) #end riscv_load_store_rand_instr_stream_31
                  la           t3, amo_0+0 #start riscv_amo_instr_stream_16
                  la           sp, amo_0+48
                  amoor.w.rl    s7, s7, (t3)
                  andi         s0, a0, -157
                  mulh         s10, a2, a0
                  amoadd.w.aq   t1, a6, (t3)
                  srai         a5, s4, 12
                  amomin.w      t2, s7, (t3) #end riscv_amo_instr_stream_16
sub_3_79:         jal          ra, 23f
0:                c.jal        1f
1:                jal          ra, 26f
2:                c.j          7f
3:                jal          t1, 22f
4:                c.j          14f
5:                c.j          11f
6:                jal          a6, 10f
7:                c.jal        25f
8:                c.jal        4b
9:                c.j          19f
10:               c.jal        24f
11:               c.jal        30f
12:               c.jal        20f
13:               c.jal        0b
14:               jal          tp, 21f
15:               jal          ra, 12b
16:               c.jal        3b
17:               jal          ra, 6b
18:               c.jal        8b
19:               c.j          28f
20:               c.jal        2b
21:               c.jal        16b
22:               c.jal        9b
23:               c.jal        27f
24:               c.jal        15b
25:               c.j          13b
26:               c.jal        5b
27:               c.jal        18b
28:               c.j          29f
29:               c.j          17b
30:               slli         t6, t1, 20
                  la           tp, amo_0+16 #start riscv_amo_instr_stream_14
                  la           s7, amo_0+40
                  and          s8, s1, s0
                  amoor.w.aq    t5, s11, (s7)
                  amoor.w.rl    gp, t6, (tp)
                  ori          sp, a2, -761
                  c.xor        a0, a1
                  amoswap.w     s1, t0, (s7) #end riscv_amo_instr_stream_14
sub_3_72:         jal          ra, 12f
0:                c.j          8f
1:                jal          t1, 17f
2:                jal          s8, 5f
3:                c.jal        15f
4:                c.j          18f
5:                c.jal        10f
6:                c.j          14f
7:                jal          ra, 20f
8:                c.jal        2b
9:                jal          ra, 0b
10:               jal          s7, 7b
11:               c.j          9b
12:               jal          t1, 16f
13:               c.j          19f
14:               c.j          4b
15:               c.j          11b
16:               c.j          1b
17:               jal          ra, 6b
18:               c.j          13b
19:               jal          ra, 3b
20:               mulh         a7, t1, s0
sub_3_85:         jal          ra, 4f
0:                jal          ra, 7f
1:                c.j          9f
2:                c.jal        16f
3:                jal          ra, 11f
4:                c.jal        15f
5:                c.j          3b
6:                c.j          10f
7:                c.j          13f
8:                c.j          6b
9:                c.jal        8b
10:               c.jal        0b
11:               c.j          12f
12:               jal          sp, 14f
13:               jal          t1, 2b
14:               jal          t1, 1b
15:               jal          ra, 5b
16:               andi         a3, s11, -1891
                  la           s2, region_0+1818 #start load_store_instr_stream_1
                  la           gp, region_0+349 #start load_store_instr_stream_2
                  lhu          s3, -92(s2)
                  la           s11, region_0+1275 #start load_store_instr_stream_0
                  sb           s6, 152(s2)
                  sb           s11, 35(gp)
                  sb           a4, -6(s11)
                  la           t1, region_0+1891 #start load_store_instr_stream_4
                  la           a0, region_0+909 #start load_store_instr_stream_3
                  lbu          a5, -203(s2)
                  lh           a5, -1003(t1)
                  lbu          a6, -35(gp)
                  sb           s9, 29(s11)
                  lb           t5, -1728(t1)
                  lhu          s7, 59(s11)
                  sb           a1, -167(a0)
                  sb           s10, -31(s2)
                  lh           tp, -841(a0)
                  lbu          s8, 48(s2)
                  lb           s8, -52(gp)
                  sb           ra, -110(s2)
                  sb           gp, 24(gp)
                  lb           a4, -6(s11)
                  lh           s0, -19(s11)
                  lbu          zero, -1018(t1)
                  lbu          zero, 95(s2)
                  lh           s5, 413(a0)
                  lbu          t2, -2(s11)
                  lbu          s5, -785(t1)
                  lbu          a3, -109(s2)
                  sb           zero, 68(t1)
                  lhu          s1, 445(a0)
                  sh           s2, -1045(t1)
                  lb           a4, -209(t1)
                  lbu          a6, 2(gp)
                  sb           a0, 53(gp)
                  lb           s10, -1658(t1)
                  lbu          tp, -35(s2) #end load_store_instr_stream_1
                  lb           t3, 238(a0) #end load_store_instr_stream_3
                  lbu          s0, 61(gp)
                  lb           ra, 2(s11)
                  lb           s0, 48(gp)
                  lb           tp, 11(s11)
                  lb           s3, -141(t1) #end load_store_instr_stream_4
                  lbu          s7, 0(gp) #end load_store_instr_stream_2
                  sb           s2, -4(s11) #end load_store_instr_stream_0
sub_3_58:         jal          ra, 6f
0:                c.jal        7f
1:                c.jal        3f
2:                c.j          0b
3:                c.jal        15f
4:                jal          ra, 16f
5:                c.jal        17f
6:                c.j          25f
7:                jal          t1, 26f
8:                c.jal        11f
9:                jal          ra, 20f
10:               c.j          21f
11:               c.j          12f
12:               c.jal        19f
13:               c.j          2b
14:               c.j          8b
15:               jal          t3, 10b
16:               jal          ra, 23f
17:               c.jal        1b
18:               c.j          14b
19:               c.jal        27f
20:               c.jal        18b
21:               c.jal        4b
22:               c.j          24f
23:               c.jal        22b
24:               c.jal        13b
25:               c.jal        5b
26:               c.jal        9b
27:               c.and        a0, a3
                  la           t0, region_1+83 #start riscv_load_store_rand_instr_stream_28
                  mulh         t3, s1, s11
                  divu         s1, a0, a3
                  lb           t2, 242(t0)
                  lb           t2, 135(t0)
                  lbu          a1, 133(t0)
                  xori         t2, a4, 1895
                  add          s3, tp, s0
                  lhu          s2, -23(t0)
                  mulhu        s0, s9, s11
                  mulh         t2, a5, a4
                  c.add        s5, t0
                  lbu          a4, -11(t0)
                  sb           s8, 238(t0)
                  lhu          sp, -63(t0)
                  lbu          t3, -19(t0)
                  lbu          s10, 27(t0)
                  sb           a1, 86(t0)
                  lb           s1, 36(t0)
                  lb           zero, 194(t0)
                  lb           s10, -34(t0)
                  srai         gp, tp, 1
                  sb           s11, -59(t0)
                  lb           s7, -46(t0)
                  lbu          a5, -9(t0)
                  lb           t1, 52(t0)
                  lb           t1, 54(t0)
                  sh           sp, -13(t0)
                  lb           a0, 146(t0)
                  sh           s10, 57(t0)
                  lh           ra, 13(t0)
                  lbu          a0, 228(t0)
                  andi         t5, s6, -1031
                  lb           s10, -80(t0)
                  c.li         s5, -1
                  slt          s7, s4, a1
                  sb           s2, 183(t0)
                  c.mv         s0, t0
                  sb           a4, -72(t0)
                  lb           gp, 57(t0)
                  lhu          s5, 225(t0)
                  c.xor        a5, a2
                  lbu          a3, 246(t0)
                  add          s11, t1, s9
                  sb           a2, 188(t0) #end riscv_load_store_rand_instr_stream_28
                  la           t6, region_0+1346 #start load_store_instr_stream_0
                  lw           t5, 2(t6)
                  la           s1, region_1+702 #start load_store_instr_stream_1
                  lh           tp, 72(s1)
                  lhu          s8, 62(s1)
                  lb           ra, 9(s1)
                  sb           tp, -9(t6)
                  lbu          a7, -206(s1)
                  lw           t3, -90(s1)
                  lbu          s5, -97(s1)
                  sb           a4, 15(t6)
                  lb           tp, -9(t6)
                  lb           zero, 203(s1)
                  lb           t2, 123(s1)
                  lw           ra, -14(t6)
                  lb           s0, 211(s1)
                  lb           sp, 0(t6)
                  sh           a6, -2(t6)
                  lh           t2, -10(t6)
                  sh           s4, -232(s1) #end load_store_instr_stream_1
                  sb           s3, -16(t6) #end load_store_instr_stream_0
                  la           a0, region_1+337 #start riscv_hazard_instr_stream_3
                  auipc        a2, 278648
                  sb           t2, -136(a0)
                  andi         t2, ra, -936
                  sra          t2, t2, ra
                  add          t2, a5, t2
                  rem          t2, ra, s2
                  sltiu        t2, a5, -1285
                  lb           t2, -256(a0)
                  lbu          s2, 44(a0)
                  lb           ra, -14(a0)
                  sra          a6, a2, a2
                  sb           t2, -186(a0)
                  c.addi       a5, 10
                  c.lui        a2, 3
                  mulhu        ra, s2, a6
                  lb           a6, 31(a0)
                  and          ra, a2, a6
                  lbu          t2, 152(a0)
                  lb           a2, -136(a0)
                  lbu          t2, -119(a0)
                  addi         a2, s2, -152
                  c.sub        a2, a2
                  or           s2, a6, ra
                  and          a6, a6, ra
                  srai         s2, s2, 17
                  nop
                  c.xor        a2, a5
                  lh           ra, -181(a0)
                  nop
                  lb           s2, -136(a0)
                  lb           t2, 229(a0)
                  lui          ra, 586501
                  sub          a6, a5, s2
                  mul          a6, a2, a5
                  c.add        a5, s2
                  sw           a5, 159(a0)
                  lhu          a5, 11(a0)
                  slt          a6, a5, ra
                  and          a6, a5, t2
                  c.slli       a2, 18
                  lhu          t2, -45(a0)
                  sub          a2, ra, a6
                  lbu          a5, 186(a0)
                  sb           a5, -158(a0)
                  lhu          s2, 151(a0)
                  lbu          t2, 122(a0) #end riscv_hazard_instr_stream_3
                  la           t6, amo_0+48 #start riscv_lr_sc_instr_stream_0
                  mul          t5, s0, s8
                  lr.w.aq       sp, (t6)
                  sc.w          a1, a5, (t6) #end riscv_lr_sc_instr_stream_0
                  la           s10, amo_0+40 #start riscv_amo_instr_stream_20
                  la           gp, amo_0+48
                  amomax.w.aq   s0, a0, (gp)
                  amominu.w     zero, sp, (gp) #end riscv_amo_instr_stream_20
                  la           s3, region_1+976 #start riscv_load_store_hazard_instr_stream_17
                  lb           a4, 11(s3)
                  sb           a1, 11(s3)
                  lbu          t1, 11(s3)
                  mulhu        s2, zero, s0
                  sb           a0, 11(s3)
                  sb           s7, 11(s3)
                  lb           t2, 11(s3)
                  lb           t2, 11(s3)
                  lb           a5, 11(s3)
                  lb           a5, 11(s3)
                  sb           s1, 11(s3)
                  sb           s7, 11(s3)
                  lb           t4, 11(s3)
                  lb           t0, 11(s3)
                  c.addi4spn   a2, sp, 176
                  sb           a4, 11(s3)
                  lbu          s5, 11(s3)
                  rem          gp, s1, s4
                  lui          s7, 743547
                  sb           a5, 11(s3) #end riscv_load_store_hazard_instr_stream_17
                  la           tp, region_1+658 #start riscv_hazard_instr_stream_29
                  sb           a3, -11(tp)
                  lbu          a1, 16(tp)
                  sll          s0, s0, a5
                  c.or         a3, s0
                  sb           ra, 15(tp)
                  nop
                  lb           a0, -4(tp)
                  lbu          s0, -15(tp)
                  mulhu        s0, a1, s0
                  c.mv         ra, ra
                  andi         a1, a0, -1680
                  lbu          a0, -4(tp)
                  lbu          a3, -7(tp)
                  lb           ra, -13(tp)
                  lbu          a0, 0(tp)
                  lb           a1, 9(tp)
                  sll          ra, a3, ra
                  c.srai       a3, 7
                  slti         a0, a0, -1195
                  sh           a1, 14(tp)
                  sra          a5, a1, a1
                  c.slli       s0, 5
                  remu         a1, a1, a0
                  lui          a5, 683878
                  sh           a3, -4(tp)
                  sb           a1, 13(tp)
                  c.or         a5, a1
                  c.srli       s0, 3
                  lb           a3, -9(tp)
                  sll          s0, a3, a0
                  c.nop
                  lb           a5, -10(tp)
                  lbu          s0, 9(tp)
                  mulhu        ra, a0, a5
                  lh           a3, -16(tp)
                  sw           a3, 14(tp)
                  div          a1, a0, a5
                  slti         a3, a0, -755
                  lh           ra, 8(tp)
                  sub          a1, ra, ra
                  c.srai       a3, 15
                  sw           s0, 6(tp)
                  sltu         ra, a3, ra
                  remu         a3, a1, ra
                  lbu          s0, 0(tp)
                  sb           ra, -9(tp)
                  c.or         s0, s0
                  lb           s0, -12(tp)
                  c.lui        a0, 5
                  lb           a3, 12(tp) #end riscv_hazard_instr_stream_29
                  la           sp, region_1+567 #start load_store_instr_stream_2
                  la           ra, region_1+472 #start load_store_instr_stream_0
                  la           s3, region_1+707 #start load_store_instr_stream_1
                  sh           s2, 13(sp)
                  lb           s8, -11(ra)
                  sb           a1, 3(sp)
                  lbu          a1, 146(s3)
                  sh           s2, -237(s3)
                  sw           a0, 56(ra)
                  lb           a5, 40(ra)
                  sb           t3, -12(sp)
                  lh           tp, -34(ra)
                  lb           a6, -1(sp)
                  sh           s9, -209(s3)
                  sb           t5, 30(ra)
                  lb           a7, -232(s3)
                  lbu          t3, -50(s3)
                  lb           a5, -2(sp) #end load_store_instr_stream_2
                  sh           s4, 58(ra)
                  lhu          gp, 23(s3)
                  sw           gp, 109(s3) #end load_store_instr_stream_1
                  lhu          a3, 14(ra) #end load_store_instr_stream_0
                  la           ra, region_0+1556 #start riscv_load_store_hazard_instr_stream_15
                  lbu          a2, -101(ra)
                  lb           t5, -101(ra)
                  lui          t5, 861527
                  lbu          zero, 247(ra)
                  lb           a4, 102(ra)
                  lh           tp, 46(ra)
                  srl          a3, a3, t4
                  lbu          s2, -37(ra)
                  sb           s0, 100(ra)
                  lh           zero, 192(ra)
                  lh           s0, -182(ra)
                  sh           tp, -148(ra) #end riscv_load_store_hazard_instr_stream_15
                  addi         t6, zero, -5 #init loop 0 counter
                  mulh         a3, s1, s3
                  addi         t4, zero, 13 #init loop 0 limit
                  divu         s11, a4, a5
                  c.addi4spn   s1, sp, 96
sub_3_155_0_t:    addi         zero, s2, -419
                  andi         a2, t0, 652
                  and          s5, s0, t5
                  addi         t6, t6, 9 #update loop 0 counter
                  or           t5, a3, t5
                  slti         tp, s9, 1396
                  c.srli       a0, 10
                  c.xor        s1, a5
                  bne          t6, t4, sub_3_155_0_t #branch for loop 0
                  slti         s3, t6, 198
                  la           a5, region_1+489 #start load_store_instr_stream_1
                  la           t2, region_0+1033 #start load_store_instr_stream_0
                  sb           s3, -9(a5)
                  lb           gp, 833(t2)
                  lb           a7, -16(a5)
                  sb           s3, -14(a5)
                  lbu          a1, -400(t2)
                  lh           a6, -15(a5)
                  sh           tp, -789(t2)
                  lb           t6, -14(a5)
                  lb           s2, -16(a5)
                  lb           t6, -886(t2)
                  lw           a1, -13(a5) #end load_store_instr_stream_1
                  sb           t2, 922(t2)
                  sb           s9, -127(t2)
                  lb           t4, 626(t2) #end load_store_instr_stream_0
                  la           a0, region_0+1307 #start riscv_load_store_rand_instr_stream_7
                  c.mv         t6, a7
                  lb           zero, 62(a0)
                  c.addi       t6, -1
                  sb           a5, 22(a0)
                  lbu          t0, -38(a0)
                  c.addi       s0, 28
                  srli         s1, s3, 11
                  c.addi4spn   a4, sp, 48
                  slli         tp, ra, 2
                  lhu          zero, 61(a0)
                  lbu          t2, 52(a0)
                  or           t2, t0, a4
                  mulhsu       a4, a1, t2
                  sra          s1, s4, a6
                  slti         t3, s8, 826
                  rem          s3, s11, s1
                  c.nop
                  sh           s11, -45(a0)
                  sb           s11, 50(a0)
                  and          s7, a3, s3
                  sltiu        a1, a7, 1044
                  lbu          tp, 6(a0)
                  lui          s11, 384143
                  c.or         s0, a2
                  lhu          gp, 41(a0)
                  c.li         s5, -1
                  addi         s2, s2, 199
                  mulhu        s10, s8, s2
                  lb           s1, 34(a0)
                  lh           s3, -3(a0)
                  andi         s0, ra, -1693
                  sh           t2, -19(a0)
                  lbu          a2, 18(a0)
                  sub          ra, a6, s9
                  mul          a5, t2, s7
                  xor          sp, a2, s0
                  sb           t6, 22(a0)
                  mulh         s2, s7, a5
                  c.srai       s0, 7
                  sub          a4, s5, tp
                  lb           ra, 2(a0)
                  c.xor        a2, a4
                  lw           s8, -55(a0)
                  c.lui        t1, 22
                  mulh         s8, t6, a2
                  lbu          t6, -55(a0)
                  slli         s11, t4, 16
                  lbu          a7, 21(a0) #end riscv_load_store_rand_instr_stream_7
                  la           tp, region_0+459 #start riscv_hazard_instr_stream_15
                  c.mv         a2, s3
                  sh           s2, 19(tp)
                  c.and        a4, a2
                  sb           a2, -8(tp)
                  lb           a2, 222(tp)
                  lbu          t5, 90(tp)
                  lbu          a2, -68(tp)
                  add          s2, s2, a4
                  c.andi       a3, -1
                  c.srli       a3, 29
                  c.srai       a2, 3
                  mulhu        s3, a3, s3
                  sh           t5, -139(tp)
                  sltiu        a3, t5, -1469
                  sb           s3, 102(tp)
                  lb           t5, -162(tp)
                  sub          s3, a3, a3
                  c.srai       a2, 12
                  slti         s2, s3, -1378
                  c.addi       s2, 15
                  c.and        a4, a2
                  mulhu        s3, t5, t5
                  lbu          s3, 28(tp)
                  c.nop
                  srai         a4, t5, 25
                  c.nop
                  sub          t5, s3, a2
                  c.lui        a2, 29
                  lb           a4, 14(tp)
                  lhu          a3, -133(tp)
                  sw           a3, 113(tp)
                  sw           a3, -211(tp)
                  or           a2, a2, a2
                  srl          a4, t5, s3
                  slti         t5, s3, 1936
                  lbu          s2, -203(tp)
                  addi         a4, s2, -129
                  lh           a4, -97(tp)
                  c.mv         t5, s2
                  ori          s2, t5, 1937
                  lh           a3, 13(tp)
                  lb           t5, -117(tp)
                  addi         s3, t5, -84
                  c.and        a3, a3
                  lhu          a4, 133(tp)
                  lh           s2, -179(tp)
                  c.slli       a3, 30
                  lb           s3, -151(tp)
                  lbu          a2, 7(tp)
                  lb           a4, -210(tp)
                  lb           t5, -168(tp) #end riscv_hazard_instr_stream_15
                  mul          a3, t1, s7
                  bgeu         s3, tp, 12f
                  ori          a1, gp, -1866
                  mulhsu       gp, a4, a4
                  c.addi       s5, 13
                  lui          a7, 811133
                  c.add        s8, t6
                  c.beqz       a0, 21f
                  blt          s10, s5, 25f
                  div          t4, s10, zero
                  mulh         zero, s2, s5
                  div          a5, s6, s2
12:               c.beqz       a2, 15f
                  sra          a5, s9, s8
                  sltiu        a3, t4, -651
15:               mulhu        t5, s11, a1
                  c.bnez       a0, 31f
                  ori          t0, s9, 1910
                  xor          t3, a3, a3
                  c.addi4spn   s1, sp, 128
                  sltiu        a2, s2, -1900
21:               slt          a5, a2, a1
                  nop
                  xori         t4, a0, 1779
                  sra          t4, tp, a3
25:               c.sub        s0, a5
                  remu         s8, t3, gp
                  xori         t2, tp, 1762
                  divu         tp, s7, t2
                  div          t0, a5, a2
                  c.add        t5, t1
31:               c.beqz       a1, 46f
                  c.lui        a3, 17
                  c.andi       a3, 28
                  divu         t3, s1, s9
                  and          a7, gp, t6
                  rem          s3, a4, s0
                  c.lui        a2, 24
                  c.addi16sp   sp, -16
                  c.mv         s7, t4
                  mul          t6, a7, s5
                  sub          s0, zero, s1
                  c.beqz       a2, 46f
                  sltiu        s3, zero, -495
                  bne          s6, sp, 55f
                  remu         s5, t2, tp
46:               slt          a4, gp, s3
                  slli         a0, a4, 2
                  c.andi       a4, -1
                  c.addi16sp   sp, 432
                  bgeu         s5, sp, 65f
                  srl          s10, t6, a4
                  mul          gp, t2, a1
                  c.sub        a0, s0
                  beq          s9, s8, 70f
55:               slt          a4, tp, s1
                  div          s8, s3, t4
                  or           s0, zero, gp
                  bne          s4, a5, 66f
                  nop
                  and          ra, s7, t5
                  bne          a5, t2, 72f
                  c.srli       a4, 15
                  srl          s8, t6, zero
                  c.andi       a1, -1
65:               addi         s10, s1, 2043
66:               sltiu        t6, s7, 1255
                  beq          tp, tp, 78f
                  remu         t4, s10, a4
                  mulhsu       t0, a0, s0
70:               sub          t6, s9, a0
                  andi         s5, s4, 1362
72:               mulhu        ra, s6, a0
                  c.addi16sp   sp, 96
                  lui          a5, 746132
                  c.srai       a2, 3
                  slli         tp, a2, 21
                  nop
78:               or           s7, s3, s8
                  xori         a2, s1, 789
                  c.nop
                  blt          s7, sp, 95f
                  blt          a2, t4, 92f
                  c.addi       a6, -1
                  c.xor        s1, s1
                  auipc        t1, 322716
                  slti         s10, a0, -733
                  slt          tp, a3, s6
                  rem          s0, s4, a4
                  c.add        tp, s5
                  ori          tp, zero, -816
                  c.addi       tp, -1
92:               bne          s7, s11, 109f
                  c.sub        a3, a3
                  sll          tp, s10, a6
95:               addi         s7, s1, -1826
                  c.add        t0, s11
                  xor          a5, a7, a1
                  sltu         gp, a4, t5
                  beq          gp, t6, 118f
                  c.nop
                  sll          s2, a3, a6
                  rem          s3, a7, a4
                  c.add        a7, sp
                  c.srli       a4, 14
                  c.addi16sp   sp, 352
                  srl          gp, s4, a6
                  c.sub        a0, a5
                  beq          s4, t3, 117f
109:              c.li         a0, -1
                  rem          a7, s9, s8
                  c.addi       gp, -1
                  add          tp, s7, s8
                  c.slli       a4, 28
                  sub          a1, s11, t1
                  beq          s2, a1, 123f
                  bltu         s10, s9, 130f
117:              c.beqz       s1, 121f
118:              lui          t5, 124427
                  addi         t5, a7, 312
                  c.andi       a2, 14
121:              bltu         s0, t1, 130f
                  c.and        a3, a3
123:              bne          s4, s6, 138f
                  c.mv         t4, s3
                  c.addi16sp   sp, -16
                  mulhsu       tp, s3, s10
                  nop
                  xori         a0, a1, 330
                  c.beqz       s1, 134f
130:              c.mv         t0, s0
                  c.bnez       a2, 137f
                  c.sub        a5, a4
                  c.sub        a3, s1
                  la           gp, region_0+663 #start load_store_instr_stream_1
                  la           s8, region_0+1095 #start load_store_instr_stream_0
                  lb           s2, 48(gp)
                  sb           zero, -60(s8)
                  la           t5, region_0+617 #start load_store_instr_stream_2
                  lb           a6, 74(gp)
                  lh           s0, -185(t5)
                  sb           t1, -50(s8)
                  sb           s6, 115(t5)
                  sb           s2, 8(gp)
                  lbu          s1, -254(s8)
                  lhu          s10, 199(t5)
                  lb           sp, 194(gp)
                  sh           s7, 173(t5)
                  lbu          tp, 34(gp)
                  sb           tp, -234(s8)
                  sb           t1, -95(t5)
                  lbu          s1, -144(s8)
                  lb           a6, 70(gp)
                  sb           s10, -86(s8)
                  lbu          s10, 100(t5)
                  sb           s8, -232(t5)
                  lh           s10, -93(gp) #end load_store_instr_stream_1
                  lhu          s1, 171(t5) #end load_store_instr_stream_2
                  lb           t3, 32(s8) #end load_store_instr_stream_0
134:              or           a6, s7, a6
                  auipc        ra, 509948
                  c.and        s1, a4
137:              remu         s11, s4, s10
138:              c.and        a0, a0
                  c.beqz       a4, 147f
                  c.addi       a4, 29
                  sll          s11, t3, s7
                  srl          s5, s11, a7
                  c.add        s3, t5
                  c.addi4spn   a3, sp, 544
                  mulh         a1, s9, t1
                  c.xor        s1, a4
147:              srai         s0, s10, 27
                  sub          a7, a0, s9
                  mulhu        t5, s5, s1
                  c.sub        s0, a2
                  andi         s1, a7, -42
                  ori          a7, s10, 2012
                  sltiu        sp, a0, 1050
                  beq          a3, a6, 159f
                  srli         s3, sp, 17
                  c.addi       a5, 1
                  sll          gp, s8, s10
                  c.li         s5, -1
159:              c.sub        s0, a5
                  c.xor        a2, a5
                  c.xor        a5, a5
                  add          tp, t4, sp
                  divu         t2, sp, s11
                  mulhu        s2, t1, s6
                  and          zero, a1, s3
                  c.mv         tp, s2
                  c.mv         t4, ra
                  c.srli       s1, 11
                  bgeu         a1, s10, 173f
                  auipc        a2, 949200
                  slti         a0, tp, 1143
                  bltu         a6, tp, 185f
173:              bgeu         zero, s3, 183f
                  c.andi       a3, 1
                  slt          a7, a1, a7
                  lui          t5, 639365
                  add          s8, a3, sp
                  xori         a4, sp, -583
                  mulhu        s7, a5, tp
                  mul          s0, s9, s10
                  c.li         t5, -1
                  rem          s8, s6, sp
183:              c.mv         a2, t3
                  div          s3, tp, s8
185:              c.addi4spn   a1, sp, 48
                  c.xor        a1, a4
                  addi         t5, a1, -809
                  div          zero, a1, a0
                  srl          a7, a7, a0
                  rem          t4, t2, t0
                  mulh         zero, a3, t1
                  c.addi4spn   a3, sp, 368
                  c.addi16sp   sp, 320
                  srl          a7, ra, s11
                  c.mv         a7, s6
                  c.lui        s2, 22
                  or           a6, tp, a6
                  addi         a6, s3, -1702
                  blt          s2, s8, 216f
                  xori         a3, a0, 1799
                  beq          t5, s9, 216f
                  mulh         s0, s9, t2
                  bge          s10, a2, 213f
                  c.or         a5, a4
                  addi         t6, t5, -662
                  sltu         s11, sp, t5
                  divu         a1, t0, s10
                  c.beqz       a3, 222f
                  c.or         s0, s0
                  c.and        a5, a1
                  div          ra, t5, a0
                  c.addi4spn   a0, sp, 656
213:              c.or         a2, a3
                  sltu         sp, s10, s7
                  srai         a3, t6, 7
216:              lui          t5, 619336
                  mul          t1, a5, s1
                  or           a5, t1, t5
                  c.srai       a3, 13
                  or           s5, s4, a2
                  and          a7, a0, t6
222:              slti         ra, s10, -1281
                  ori          s3, a3, -815
                  srli         s5, a4, 11
                  remu         s0, s1, t4
                  slli         a1, ra, 6
                  c.andi       a5, 16
                  c.andi       a0, -1
                  c.or         a5, a4
                  c.addi16sp   sp, -16
                  add          t1, a7, t4
                  c.slli       a4, 7
                  beq          t4, zero, 244f
                  srai         a0, a3, 24
                  c.sub        s1, a3
                  mulh         ra, a0, s11
                  c.addi       s11, -1
                  c.addi       s10, 26
                  c.or         s1, a1
                  c.srli       s1, 21
                  c.bnez       a2, 249f
                  c.add        s8, s4
                  c.srli       a5, 17
244:              srl          s10, ra, t5
                  andi         a0, a4, 1084
                  bne          ra, a2, 260f
                  c.lui        gp, 14
                  c.sub        a2, a1
249:              c.add        t4, s3
                  srl          a2, s10, tp
                  sub          s10, sp, s0
                  c.nop
                  auipc        gp, 797614
                  srli         a5, a1, 30
                  mulhu        a0, s10, a0
                  rem          s10, a0, gp
                  andi         gp, s11, -213
                  sltiu        s3, s11, 884
                  or           s8, gp, s7
260:              slt          t1, t3, s8
                  add          sp, s0, t1
                  c.lui        s0, 24
                  c.add        t2, s3
                  c.add        a3, s2
                  srl          s10, s11, gp
                  srli         a3, a4, 1
                  div          s10, s4, t3
                  c.or         a0, a3
                  c.and        a5, a2
                  c.andi       s0, -1
                  c.lui        t5, 25
                  auipc        t5, 887928
                  bne          t0, s3, 290f
                  sltu         tp, s7, s2
                  lui          a7, 502123
                  sra          a3, s6, s3
                  bltu         ra, a4, 292f
                  c.beqz       a4, 291f
                  xor          s2, s10, a0
                  addi         a4, s5, -1747
                  sll          s10, s0, a7
                  c.slli       a4, 3
                  xor          zero, s6, t1
                  la           a0, amo_0+60 #start riscv_amo_instr_stream_17
                  la           tp, amo_0+20
                  srl          t4, t5, sp
                  c.or         s1, s1
                  amomin.w.rl   a6, t4, (a0)
                  amoadd.w.rl   a4, a0, (tp) #end riscv_amo_instr_stream_17
                  ori          s11, s8, -129
                  c.addi       s7, -1
                  sltu         t3, t2, s2
                  c.srai       s0, 18
                  or           t6, s8, a7
                  mulhsu       tp, tp, gp
290:              c.addi4spn   a3, sp, 896
291:              addi         a7, s5, 1088
292:              blt          a1, s5, 303f
                  ori          tp, s6, 41
                  c.srli       s1, 21
                  c.addi4spn   a0, sp, 496
                  c.mv         s7, a6
                  ori          a3, t4, -3
                  xor          tp, sp, s1
                  mul          a5, a0, s10
                  divu         s10, t4, a7
                  c.addi4spn   a0, sp, 416
                  ori          t4, s2, -1859
303:              ori          s11, s1, -933
                  c.slli       tp, 25
                  slt          tp, s3, s9
                  sll          s5, t6, a0
                  slti         s0, a6, 1159
                  c.addi4spn   a1, sp, 352
                  bltu         s8, s7, 319f
                  c.beqz       a1, 316f
                  or           gp, t2, s7
                  c.bnez       a4, 327f
                  xori         s7, s6, -1973
                  add          s8, s3, t2
                  c.srai       a2, 9
316:              lui          s8, 1038656
                  c.srai       a1, 4
                  bgeu         a3, a0, 323f
319:              slli         s8, s7, 5
                  add          gp, t1, s6
                  sub          sp, zero, s0
                  slti         a6, s8, 1413
323:              add          s3, s1, s5
                  c.bnez       a4, 343f
                  addi         t5, s2, -1499
                  div          a4, a2, s3
327:              and          t2, s5, s3
                  la           sp, region_0+1543 #start riscv_hazard_instr_stream_8
                  slt          s3, s3, s0
                  mul          a4, a0, a0
                  lb           a4, -16(sp)
                  sll          s0, s3, s3
                  lb           t1, 46(sp)
                  lbu          s0, -56(sp)
                  sb           a4, -14(sp)
                  lhu          t1, 35(sp)
                  c.sub        a0, s0
                  c.srli       s0, 27
                  sw           t1, -31(sp)
                  lbu          t1, -48(sp)
                  mulhsu       s3, s3, a4
                  sw           a7, -3(sp)
                  lb           a4, -14(sp)
                  sb           a7, -38(sp)
                  lbu          a7, 34(sp)
                  c.mv         s3, s3
                  c.andi       s0, -1
                  mulh         a4, s3, s0
                  mul          a4, t1, a7
                  lb           s3, -52(sp)
                  sb           a4, -22(sp) #end riscv_hazard_instr_stream_8
                  beq          tp, t0, 332f
                  blt          a3, a3, 343f
                  c.addi4spn   a4, sp, 912
                  c.and        a1, s0
332:              xori         s11, s7, 80
                  c.andi       a3, 21
                  sub          s5, s0, t1
                  slli         s1, s1, 6
                  c.and        s0, a0
                  sub          sp, s10, s3
                  c.and        a0, a2
                  auipc        a4, 600487
                  c.addi4spn   a5, sp, 608
                  mulhsu       s7, s6, a3
                  rem          s7, s7, gp
343:              rem          a1, s1, s5
                  slli         t1, s8, 30
                  xor          gp, t3, t0
                  mulhsu       s0, s3, a6
                  sltiu        s11, s8, 599
                  c.mv         a4, a6
                  bge          t5, a7, 357f
                  c.bnez       a3, 366f
                  divu         a3, ra, gp
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, 128
                  c.andi       a3, 5
                  add          s0, s2, ra
                  addi         a3, s7, 1942
357:              add          s10, a4, zero
                  bne          s1, a3, 373f
                  slt          t4, a4, s11
                  sltu         a4, sp, t1
                  c.mv         s2, ra
                  c.addi       a2, 8
                  blt          t6, s6, 366f
                  c.lui        t3, 28
                  c.beqz       a4, 369f
366:              sltu         a4, ra, t0
                  xor          a1, t2, ra
                  srli         t5, a0, 18
369:              srai         tp, a0, 25
                  c.addi       s10, -1
                  c.li         t0, -1
                  bltu         a6, s1, 381f
373:              srli         ra, a4, 27
                  sll          s10, t0, s8
                  c.nop
                  c.andi       a0, -1
                  c.lui        s1, 27
                  c.andi       a4, 25
                  c.addi       s10, -1
                  mulh         t0, s1, a0
381:              bgeu         a1, a1, 390f
                  c.sub        a1, a3
                  c.xor        a5, a1
                  xori         tp, ra, -1709
                  sra          a3, t2, t0
                  c.beqz       a0, 394f
                  c.andi       a4, 14
                  addi         s1, t6, 1078
                  sra          s5, s3, s3
390:              bgeu         a2, tp, 401f
                  c.srli       a4, 5
                  c.sub        a4, a0
                  c.addi       t1, 28
394:              divu         s11, t3, s4
                  slti         a2, s1, 1765
                  srli         ra, t5, 29
                  mulhsu       t6, s2, s4
                  bge          a6, zero, 402f
                  c.srai       s1, 11
                  c.add        a1, s5
401:              c.or         a2, a3
402:              mulhsu       a1, sp, s11
                  and          a2, t5, t3
                  mul          zero, s5, zero
                  ori          gp, a4, -1975
                  nop
                  c.and        s0, a2
                  c.slli       t2, 24
                  mul          sp, s6, s6
                  c.xor        s1, s1
                  sll          sp, a3, s4
                  c.srli       a0, 16
                  and          s10, t3, a7
                  c.bnez       a3, 425f
                  c.lui        a0, 3
                  c.lui        t5, 25
                  xori         s1, tp, -1307
                  mul          t0, s10, ra
                  bgeu         t6, zero, 424f
                  srli         a5, s8, 8
                  c.add        t0, s1
                  c.and        a4, a5
                  nop
424:              sub          t1, t4, t6
425:              srli         sp, ra, 30
                  blt          s7, gp, 436f
                  mulhu        a2, t3, s4
                  srl          s1, t3, a3
                  and          t0, t6, a6
                  auipc        t5, 843762
                  mulh         t4, gp, t1
                  srai         a5, t1, 22
                  c.bnez       s1, 448f
                  c.xor        a0, a2
                  mul          t4, s7, s4
436:              div          a4, s8, s0
                  xori         s8, a5, 970
                  bge          a0, s1, 446f
                  or           t4, a3, s1
                  c.lui        s3, 13
                  c.slli       a2, 17
                  c.mv         t3, s10
                  xor          a3, t0, gp
                  rem          a6, ra, sp
                  mulhu        t1, s11, a0
446:              sltiu        tp, s10, -1564
                  c.addi4spn   a2, sp, 288
448:              and          tp, ra, s1
                  or           a4, s9, t3
                  bgeu         t0, s1, 458f
                  sll          a5, s9, a4
                  mul          ra, a2, s11
                  auipc        t0, 856515
                  c.mv         a2, s6
                  c.andi       a3, 12
                  bne          a1, s8, 473f
                  or           s1, a7, tp
458:              bltu         s10, t6, 464f
                  srai         s11, t4, 21
                  c.nop
                  divu         a2, t3, a5
                  srli         s10, a4, 28
                  ori          t5, a4, 665
464:              c.add        s7, a4
                  c.beqz       a3, 470f
                  c.li         t1, -1
                  slt          gp, t3, gp
                  c.andi       a2, -1
                  c.xor        a4, a0
470:              srl          ra, a5, a6
                  sra          t0, t2, t2
                  ori          s0, a4, 1578
473:              c.or         s0, a2
                  andi         s11, s0, -1040
                  mulhu        s1, s3, gp
                  c.xor        a3, a1
                  sltiu        a5, s5, -388
                  c.and        a5, a2
                  auipc        gp, 729300
                  beq          s11, s6, 495f
                  remu         a1, t5, gp
                  c.li         a4, -1
                  nop
                  c.lui        a0, 11
                  c.srli       s0, 9
                  bltu         a2, sp, 497f
                  srai         t0, t2, 25
                  c.or         a2, a1
                  and          s5, t2, a4
                  c.andi       a2, 12
                  add          sp, tp, s6
                  srli         t1, s5, 6
                  srl          t2, s8, sp
                  slti         s1, tp, -1929
495:              sll          gp, a4, a0
                  sltiu        a6, a5, -147
497:              andi         s0, tp, -192
                  bltu         a3, a5, 512f
                  andi         gp, a3, -1314
                  c.slli       a5, 18
                  mulh         t4, s6, s11
                  nop
                  c.or         a1, a5
                  c.srai       a0, 19
                  c.xor        s1, a1
                  add          t2, a6, a0
                  ori          s7, t5, -164
                  beq          s9, s0, 527f
                  ori          s8, t4, -1218
                  or           s11, tp, a3
                  c.mv         t2, a1
512:              slli         a0, t6, 21
                  c.mv         t6, t1
                  add          t0, a2, s10
                  sltu         zero, s8, t0
                  mul          s3, t5, a5
                  beq          s10, a2, 528f
                  beq          s8, a4, 522f
                  and          a3, a3, t4
                  srai         t3, t3, 3
                  slt          t6, s6, s6
522:              div          s11, a6, s1
                  c.add        t0, s6
                  sll          t2, gp, a2
                  c.beqz       a0, 538f
                  sra          a6, s8, s7
527:              addi         a4, s8, 1796
528:              c.addi       a7, 21
                  rem          sp, t4, t3
                  bltu         s3, sp, 540f
                  sub          a7, s4, a4
                  mulhsu       s0, s7, s7
                  srai         a7, s8, 15
                  slli         a1, a0, 4
                  add          t3, s5, s11
                  mulhu        s11, s5, a2
                  xor          a1, s2, s3
538:              c.addi16sp   sp, -16
                  bltu         a2, t5, 550f
540:              c.sub        s1, a5
                  slli         a2, t4, 7
                  bltu         tp, s11, 557f
                  c.addi4spn   a4, sp, 752
                  slti         a0, s9, 1840
                  bgeu         s9, s10, 562f
                  bge          sp, t3, 562f
                  and          s3, s2, s0
                  c.xor        a3, a1
                  and          t5, a3, t1
550:              c.addi16sp   sp, 304
                  c.bnez       s1, 565f
                  c.slli       a5, 10
                  c.srli       a5, 21
                  auipc        s8, 258251
                  rem          s2, gp, ra
                  xori         a2, s10, 1329
557:              c.srai       s0, 13
                  c.nop
                  c.slli       t0, 29
                  c.slli       s2, 21
                  beq          t3, s8, 570f
562:              divu         s0, s11, s7
                  c.slli       s10, 3
                  srli         s8, sp, 3
565:              c.lui        t3, 18
                  srli         t3, sp, 5
                  sltu         a5, s1, s7
                  xori         a1, sp, 1404
                  sra          t1, t6, s9
570:              mulh         t6, t2, s4
                  beq          s0, a6, 575f
                  addi         a2, s9, 1064
                  c.beqz       s1, 577f
                  remu         t3, sp, a2
575:              sub          t2, s8, s10
                  mulhu        a2, sp, a5
577:              auipc        s2, 979361
                  c.mv         a3, a2
                  xor          s5, s0, tp
                  sub          t4, t2, s7
                  blt          gp, a3, 590f
                  sltu         t5, a1, s6
                  sltu         a5, s10, t0
                  c.addi16sp   sp, -16
                  c.sub        a5, a0
                  c.add        a3, tp
                  mulhsu       ra, s6, s11
                  srli         t0, a3, 31
                  slti         t4, ra, 1170
590:              slti         ra, a6, -1518
                  c.beqz       a5, 605f
                  add          s1, a2, s2
                  c.srai       a5, 13
                  c.or         a3, a0
                  mulhsu       gp, a7, s5
                  c.bnez       s1, 604f
                  mul          s1, s4, s0
                  slt          s7, s10, a5
                  c.and        s1, a1
                  bge          s1, s6, 605f
                  c.slli       a6, 3
                  c.addi4spn   a0, sp, 96
                  and          s10, s3, t3
604:              sltu         s11, s8, zero
605:              lui          s10, 843160
                  c.and        a4, s0
                  c.and        a5, a1
                  addi         tp, sp, 1449
                  andi         t5, s1, -151
                  c.mv         a0, a6
                  c.addi       ra, -1
                  slli         s5, s0, 10
                  ori          s7, zero, 1328
                  c.bnez       a1, 617f
                  c.mv         a2, t2
                  lui          tp, 222866
617:              c.add        t5, t3
                  sll          s2, a2, s7
                  sll          a4, t0, s6
                  c.addi       s1, -1
                  xor          s1, t0, t0
                  sub          s2, t5, s8
                  ori          t3, gp, -1309
                  nop
                  xor          a7, s2, zero
                  xor          t2, a5, s10
                  divu         s10, s2, a5
                  c.slli       t3, 14
                  c.nop
                  bgeu         a5, s6, 641f
                  c.xor        a1, a5
                  c.xor        a5, a1
                  bge          a0, s7, 648f
                  andi         a6, s3, -1421
                  c.or         s1, s0
                  lui          a4, 212024
                  sltu         t3, a0, sp
                  c.srai       a4, 14
                  c.lui        s0, 24
                  lui          t5, 618971
641:              c.slli       s2, 26
                  sll          s8, a3, zero
                  mul          t1, a3, sp
                  slt          tp, s11, s7
                  c.mv         s8, t3
                  bltu         a0, sp, 661f
                  nop
648:              srl          t4, zero, zero
                  c.addi16sp   sp, -16
                  sltu         a5, s5, zero
                  srl          s7, s6, t2
                  beq          s9, s2, 656f
                  c.addi16sp   sp, -16
                  xor          ra, t5, s1
                  c.slli       t4, 7
656:              bgeu         t0, tp, 670f
                  slti         s11, a0, 1638
                  rem          a0, s10, t3
                  c.sub        s1, a2
                  c.sub        a3, s1
661:              remu         s5, a0, a1
                  sub          s3, gp, s11
                  bltu         s7, gp, 674f
                  c.srai       a4, 1
                  ori          t4, s7, -254
                  c.addi       sp, 17
                  ori          a1, a3, -1626
                  mulh         t1, t4, a7
                  slt          t2, s3, s10
670:              beq          s0, s8, 678f
                  c.lui        a7, 26
                  slti         sp, t5, 503
                  c.or         a0, a3
674:              c.and        a2, a0
                  mulh         a6, s6, ra
                  c.sub        a3, a4
                  slli         a6, s11, 4
678:              or           ra, s6, zero
                  c.bnez       s0, 684f
                  rem          a2, t5, s0
                  sub          t6, s4, s1
                  sltu         gp, a0, a0
                  srli         t5, s10, 30
684:              c.and        a1, s1
                  c.sub        a2, s0
                  xori         ra, t5, 322
                  srli         tp, gp, 18
                  bgeu         tp, s10, 694f
                  bgeu         t0, a5, 704f
                  c.and        a4, a2
                  sra          t3, s9, t0
                  c.lui        s11, 17
                  beq          a3, a0, 708f
694:              divu         t1, a0, a1
                  c.nop
                  blt          s10, s7, 707f
                  nop
                  c.srli       a2, 16
                  c.or         a3, a4
                  srli         sp, t4, 12
                  srli         t3, t4, 2
                  mulhsu       t6, t4, s4
                  sll          a2, zero, s8
704:              blt          a1, t0, 715f
                  sra          s7, gp, a1
                  mulhsu       s0, a6, s5
707:              c.lui        s10, 27
708:              c.slli       s7, 14
                  add          a2, s2, s7
                  sub          a4, a2, a5
                  mulhsu       t1, s10, s0
                  sltiu        s11, zero, 223
                  sltu         t4, s0, s5
                  mulhu        t0, s4, s9
715:              c.srai       a1, 1
                  sub          s3, ra, a6
                  c.mv         a4, s2
                  sra          sp, t4, gp
                  addi         a7, s0, -821
                  xori         zero, t4, -701
                  addi         s7, a7, 1725
                  c.add        a5, s2
                  sra          s8, s11, zero
                  c.slli       t1, 9
                  sub          t5, zero, s0
                  c.andi       a0, -1
                  remu         a5, a6, tp
                  andi         t3, zero, -727
                  c.mv         s10, s2
                  c.srai       s1, 21
                  beq          s6, sp, 746f
                  c.srli       a5, 27
                  c.xor        a5, a1
                  sra          t3, zero, a0
                  addi         sp, s2, -673
                  c.or         a2, a3
                  c.andi       a0, 29
                  mulhsu       t2, t1, s7
                  div          a2, a6, t6
                  c.srai       s1, 9
                  addi         t1, a7, 1334
                  slt          a6, s3, sp
                  ori          s0, s10, -29
                  ori          a5, s0, -841
                  c.slli       s1, 26
746:              remu         t5, s4, a6
                  c.srai       s1, 15
                  c.bnez       s1, 764f
                  c.andi       s0, 16
                  c.slli       s5, 19
                  sub          a5, a7, t4
                  lui          s10, 784099
                  divu         a6, a2, ra
                  slt          gp, a4, a6
                  c.add        t2, a5
                  blt          t4, gp, 766f
                  xori         a2, s2, 568
                  xori         s3, s1, -53
                  c.srai       s1, 9
                  c.addi16sp   sp, 368
                  c.or         a2, s1
                  beq          gp, a1, 776f
                  mulhu        tp, t0, a3
764:              srai         a2, a2, 11
                  xor          a4, a5, s2
766:              sltu         s5, a5, a7
                  xori         tp, s9, 1698
                  c.addi16sp   sp, -16
                  bne          t2, s10, 786f
                  c.mv         gp, s10
                  xori         a1, s2, 920
                  and          a0, ra, a7
                  c.beqz       s1, 787f
                  c.andi       a2, 27
                  c.add        s5, s4
776:              mulhsu       s0, t3, sp
                  andi         a1, t6, 1315
                  sub          sp, a6, t0
                  sltiu        t6, s0, -1897
                  sra          t2, s2, s4
                  remu         t6, s9, t4
                  c.lui        a4, 29
                  c.srli       s1, 14
                  c.addi16sp   sp, -16
                  add          a6, ra, tp
786:              bgeu         s9, gp, 796f
787:              rem          ra, t5, s3
                  srli         t0, t2, 1
                  beq          a7, a0, 797f
                  xor          s3, t6, s0
                  auipc        t1, 371552
                  addi         s3, s4, -1708
                  c.beqz       a1, 797f
                  xori         t3, a3, -596
                  remu         s10, a0, s2
796:              c.li         t4, -1
797:              div          ra, a4, s0
                  c.xor        a2, s1
                  sra          a1, s11, gp
                  remu         s10, zero, s6
                  c.sub        a4, a4
                  xor          ra, s8, t2
                  c.and        s0, a2
                  remu         s0, t1, t2
                  c.lui        t5, 27
                  slt          a3, t1, s3
                  c.nop
                  c.addi4spn   a2, sp, 112
                  and          s1, s10, t6
                  mulh         s3, a5, s0
                  or           a2, t2, a6
                  and          ra, s2, tp
                  div          a7, s9, s3
                  mulhu        a4, t3, a1
                  nop
                  mulh         t4, t1, s4
                  nop
                  c.andi       a3, -1
                  beq          t4, tp, 832f
                  ori          a3, s3, -526
                  beq          s4, a0, 830f
                  c.mv         a5, t2
                  srl          tp, ra, s8
                  remu         s1, a3, s3
                  c.addi       a3, -1
                  slli         a6, gp, 0
                  mul          s11, zero, s0
                  lui          a2, 376821
                  mul          sp, a3, s1
830:              add          s10, a3, zero
                  xori         t6, a4, 701
832:              divu         a6, s11, s7
                  bgeu         s0, t4, 836f
                  c.add        t5, t6
                  add          gp, gp, ra
836:              c.andi       a5, 3
                  c.srli       a3, 19
                  div          s2, t6, t1
                  divu         s0, s3, gp
                  c.slli       t6, 15
                  sra          t6, t3, t6
                  sltu         t5, t0, s6
                  c.add        a1, a7
                  sltu         a4, s8, s3
                  c.beqz       a2, 853f
                  c.or         s1, a2
                  c.nop
                  andi         a0, s3, -679
                  lui          zero, 278700
                  c.or         a0, s1
                  c.srai       a5, 23
                  bgeu         a6, ra, 857f
853:              xori         a2, s11, 1757
                  sub          a4, ra, sp
                  c.bnez       s0, 874f
                  mulhu        t3, s5, a3
857:              c.slli       a4, 10
                  mul          s11, ra, a1
                  c.addi       a6, 9
                  c.mv         sp, s6
                  c.li         s7, 29
                  c.lui        t3, 2
                  mulhu        s11, a3, a2
                  c.sub        a4, a3
                  c.andi       a4, 12
                  rem          s3, ra, sp
                  bne          a0, s9, 884f
                  mulh         a1, s0, s10
                  bltu         t5, s6, 873f
                  c.mv         a0, tp
                  add          a0, t1, a1
                  bgeu         a0, s7, 883f
873:              slli         s0, s0, 11
874:              beq          zero, sp, 883f
                  c.srai       a2, 23
                  mulh         t6, s9, a7
                  ori          t2, t3, -1319
                  nop
                  c.add        a2, s9
                  c.mv         ra, a6
                  c.bnez       a0, 890f
                  bne          s5, a3, 887f
883:              mul          s8, t5, s10
884:              c.srli       s1, 4
                  c.or         a4, a5
                  ori          s3, a5, 1652
887:              and          gp, t5, s4
                  srai         ra, s10, 13
                  beq          gp, s6, 902f
890:              or           zero, s3, t3
                  bge          s1, s0, 895f
                  andi         sp, ra, 2017
                  c.srai       a2, 12
                  addi         ra, s6, 814
895:              xori         a3, s3, -1542
                  beq          sp, t0, 911f
                  sltiu        tp, a4, 1329
                  c.slli       ra, 31
                  slli         a7, a3, 5
                  srai         s7, s0, 6
                  bltu         a6, s11, 911f
902:              ori          s3, t3, -1958
                  and          t5, s8, a0
                  or           tp, a7, s2
                  bgeu         a6, a3, 915f
                  xori         a4, t4, -1847
                  c.addi4spn   a2, sp, 208
                  slt          a3, s2, a2
                  slt          a7, zero, s10
                  c.andi       a0, 20
911:              mul          a6, zero, a0
                  addi         a4, a7, 1302
                  mulhu        a0, a4, gp
                  la           t0, sub_4
                  srai         a7, tp, 22
                  c.addi       a1, 22
                  sra          t2, a1, t0
                  mul          s8, s9, s0
                  addi         t0, t0, -680
                  bne          sp, s10, sub_3_j6 #branch to jump instr
                  slti         a4, a7, 1397
sub_3_j6:         jalr         ra, t0, 681 #jump sub_3 -> sub_4
                  add          s8, s7, t0
                  remu         s10, s11, s10
915:              xor          a1, s1, s7
                  c.addi       s5, -1
                  rem          a7, ra, s7
                  slli         a5, t6, 19
                  c.addi4spn   a5, sp, 176
                  slti         s7, t6, -1299
                  bgeu         a3, a5, 929f
                  mul          t4, tp, s6
                  c.or         s1, a4
                  c.lui        a1, 13
                  mulh         t6, t1, t1
                  lui          sp, 374105
                  xor          a2, s11, gp
                  srl          a2, zero, a2
929:              c.addi16sp   sp, 208
                  addi         a7, s9, 1954
                  bltu         s9, t2, 935f
                  or           t2, a3, tp
                  xori         s0, s4, -276
                  c.srai       a3, 29
935:              bge          s6, s5, 946f
                  c.beqz       a3, 945f
                  div          a1, tp, s10
                  nop
                  mulh         s2, t4, s10
                  sltiu        s7, a7, -1293
                  c.addi16sp   sp, -16
                  mul          zero, s11, t1
                  bltu         sp, a7, 951f
                  c.mv         t0, t1
945:              xor          t1, sp, sp
946:              c.andi       a5, -1
                  addi         t6, s10, -1132
                  bgeu         a5, t5, 962f
                  sub          a7, zero, a0
                  addi         a2, a0, -1778
951:              c.bnez       a2, 965f
                  and          t2, zero, s8
                  c.beqz       a4, 959f
                  mulh         zero, t6, t4
                  blt          a5, t2, 970f
                  bne          t2, s8, 960f
                  c.addi16sp   sp, 64
                  c.beqz       a1, 969f
959:              sll          a2, t1, t5
960:              c.srai       s1, 29
                  c.bnez       s1, 964f
962:              c.andi       a1, -1
                  nop
964:              blt          a0, a0, 980f
965:              bge          a1, a5, 976f
                  c.slli       s8, 16
                  bltu         a6, t2, 986f
                  c.add        a2, tp
969:              c.bnez       a3, 977f
970:              slt          s3, a4, s9
                  c.srai       a3, 27
                  remu         a4, a3, t4
                  nop
                  beq          t3, a2, 988f
                  c.slli       a5, 4
976:              srai         s2, zero, 28
977:              c.addi       t4, 19
                  srli         a5, tp, 22
                  rem          t1, t4, s6
980:              ori          a5, t0, 220
                  c.add        sp, s9
                  slti         ra, s11, -262
                  beq          tp, tp, 998f
                  c.bnez       a2, 999f
                  bgeu         a4, sp, 1002f
986:              c.addi16sp   sp, 16
                  mul          gp, s5, a2
988:              c.sub        a4, a1
                  c.nop
                  mulhu        t6, t3, s7
                  c.addi16sp   sp, 352
                  c.addi       s5, -1
                  or           t4, s7, s8
                  c.or         s0, a0
                  mulhsu       a3, s1, a3
                  c.sub        a1, s0
                  c.slli       t5, 6
998:              c.addi       a5, 19
999:              c.add        t4, a5
                  xori         a6, s6, -1353
                  c.beqz       a3, 1012f
1002:             srli         t6, tp, 27
                  c.and        a0, a4
                  slt          t5, s5, a7
                  srai         t5, s4, 31
                  srl          s7, t2, t0
                  srai         s2, s6, 27
                  ori          tp, a7, -477
                  blt          sp, t6, 1026f
                  addi         a1, a3, -1320
                  c.slli       s7, 28
1012:             sltu         t3, t0, s6
                  xori         t3, s10, -15
                  c.add        s5, a5
                  addi         gp, a7, -399
                  remu         s2, a0, a4
                  and          s1, a0, s1
                  bne          s8, t0, 1023f
                  sll          a7, zero, a7
                  mulhsu       s10, s9, a2
                  mulhsu       s8, t4, a7
                  mulhu        s3, t5, t1
1023:             c.srli       a4, 3
                  divu         s0, a4, s0
                  auipc        s10, 339566
1026:             add          t5, t6, t6
                  or           a2, s4, sp
                  addi         s11, s11, -1820
                  c.add        s1, tp
                  bge          t0, zero, 1044f
                  mulhu        s10, t1, a3
                  c.addi4spn   s1, sp, 784
                  srl          t3, s1, a0
                  slt          s5, a3, s1
                  beq          s11, s9, 1046f
                  c.andi       a2, -1
                  srli         ra, s6, 17
                  sltu         zero, gp, t0
                  srli         a7, gp, 16
                  rem          s0, gp, s9
                  c.sub        a1, a3
                  sra          a3, s1, a6
                  bge          a4, s10, 1054f
1044:             mulhsu       s11, zero, s11
                  c.srli       a1, 28
1046:             c.lui        gp, 12
                  sra          a3, t6, s2
                  bge          s11, a2, 1064f
                  bne          s4, ra, 1064f
                  and          t2, tp, ra
                  or           t5, s5, s4
                  slti         a4, s9, 326
                  c.sub        a5, a3
1054:             and          s8, a4, s3
                  bltu         s5, t0, 1068f
                  beq          s0, s8, 1067f
                  auipc        t4, 1000943
                  beq          s3, a0, 1075f
                  xori         a0, sp, 781
                  c.sub        a0, a4
                  blt          t5, a6, 1064f
                  slli         s2, a5, 22
                  c.andi       s1, -1
1064:             bgeu         sp, s7, 1081f
                  srai         s8, t4, 22
                  bltu         s4, t1, 1071f
1067:             sub          s2, a1, t5
1068:             div          t0, zero, sp
                  sra          s3, s6, s8
                  c.andi       a0, -1
1071:             lui          t1, 617346
                  bltu         s6, a4, 1087f
                  slt          t4, s9, a5
                  c.add        t1, t6
1075:             auipc        t3, 667142
                  auipc        s1, 122735
                  mulh         s2, a3, tp
                  c.xor        a5, a5
                  blt          t5, t5, 1087f
                  beq          a7, a6, 1099f
1081:             andi         a0, tp, 2045
                  div          t2, t3, t1
                  srli         s5, s5, 31
                  c.mv         s8, t0
                  c.beqz       a3, 1095f
                  add          sp, s8, s5
1087:             slt          t0, s3, s0
                  mulhu        tp, t6, a6
                  sub          s5, t3, t0
                  xori         zero, s2, -42
                  slli         s7, a6, 3
                  mulhsu       t0, s10, t1
                  remu         a4, a4, s6
                  nop
1095:             c.and        a4, a0
                  rem          s10, s3, a2
                  bne          t0, a0, 1101f
                  bltu         s1, a1, 1109f
1099:             c.nop
                  rem          t4, a5, ra
1101:             auipc        tp, 688451
                  c.and        s1, a5
                  c.nop
                  add          t4, t5, a7
                  c.srli       s1, 28
                  mul          s8, s7, s0
                  c.addi16sp   sp, -16
                  c.xor        s0, a4
1109:             sltu         s2, s5, s8
                  bltu         t6, t2, 1119f
                  sltu         a5, tp, t4
                  c.andi       a3, -1
                  sub          a3, s2, s10
                  c.srli       a2, 15
                  ori          t0, ra, -1292
                  sll          s5, a5, t0
                  divu         sp, t2, t4
                  c.beqz       a3, 1133f
1119:             slt          s7, s8, s6
                  div          s7, s4, s10
                  c.addi4spn   s1, sp, 272
                  bltu         tp, s5, 1126f
                  bge          a1, tp, 1129f
                  sltiu        s0, a7, 1144
                  mulhsu       a0, ra, gp
1126:             c.srai       a5, 23
                  mul          s5, t3, s6
                  slli         t5, s10, 18
1129:             srli         zero, t3, 9
                  srai         s5, a7, 24
                  sltu         t3, a1, a4
                  c.xor        a3, a2
1133:             bne          gp, a7, 1141f
                  sltu         s3, a7, a6
                  c.srli       a3, 28
                  xor          t0, sp, s9
                  srli         s11, s5, 24
                  slt          s7, s9, s4
                  c.or         s0, a0
                  mulhu        a3, t1, s2
1141:             and          t5, t3, s8
                  divu         a0, tp, ra
                  c.mv         ra, s10
                  nop
                  div          a7, s6, a0
                  ori          s2, s6, -749
                  slli         a2, tp, 7
                  xori         a0, t6, -45
                  c.mv         t4, t1
                  srl          s5, t5, a6
                  c.andi       s0, -1
                  slt          zero, t6, s11
                  bne          s9, s1, 1163f
                  mulhsu       s0, s9, a5
                  slt          a2, s3, zero
                  c.lui        ra, 10
                  c.mv         gp, a4
                  c.bnez       a3, 1163f
                  c.mv         s2, ra
                  bltu         a0, s7, 1175f
                  c.mv         s3, gp
                  ori          t1, t2, -1288
1163:             c.srai       s1, 31
                  auipc        s7, 641981
                  or           s0, a7, sp
                  c.srai       a0, 24
                  slli         t4, a6, 12
                  c.addi16sp   sp, 368
                  lui          s8, 56949
                  lui          a6, 1004200
                  and          a4, a7, sp
                  sra          t6, a7, t1
                  slt          a6, s1, s6
                  andi         s3, s2, -7
1175:             ori          s0, s10, 164
                  addi         a6, t5, 1
                  bge          s9, s2, 1186f
                  slt          s3, t4, a2
                  andi         t4, s4, -1656
                  c.slli       a6, 20
                  c.addi16sp   sp, -16
                  and          t3, t2, a4
                  divu         s1, a5, s7
                  remu         ra, a2, s2
                  c.beqz       a0, 1199f
1186:             c.slli       s10, 21
                  or           gp, t1, a6
                  mulhu        t2, t2, s2
                  sltiu        s0, t3, 512
                  sltu         s10, t2, s4
                  c.xor        a1, a5
                  nop
                  beq          t4, t5, 1207f
                  bne          a6, s3, 1202f
                  c.slli       s8, 10
                  c.or         s0, a4
                  remu         t4, a1, s9
                  c.andi       a3, -1
1199:             slli         a6, t3, 18
                  c.li         t0, 22
                  c.xor        a1, a2
1202:             div          s8, a5, a2
                  xor          s3, a0, t2
                  and          s7, a2, s11
                  slti         a1, s10, -393
                  or           s5, t5, s9
1207:             blt          s11, sp, 1211f
                  nop
                  mul          t3, a6, s1
                  andi         a0, a6, 682
1211:             c.mv         t1, a2
                  sra          a0, t5, s3
                  slti         a7, t3, 120
                  c.lui        s0, 24
                  blt          t4, t3, 1225f
                  slti         s10, s8, -1738
                  lui          s10, 943155
                  slt          s5, t5, t6
                  c.lui        a6, 1
                  c.lui        s1, 28
                  andi         tp, ra, 1402
                  mulhsu       t3, sp, s0
                  c.li         s8, 6
                  add          s0, s9, t1
1225:             sll          s1, s8, gp
                  c.add        a3, t0
                  xori         a4, s6, -1863
                  lui          s8, 899754
                  bge          sp, t5, 1237f
                  nop
                  c.and        a1, s1
                  c.beqz       a3, 1243f
                  c.lui        a3, 25
                  c.lui        t5, 23
                  sra          s11, s7, t2
                  c.beqz       s0, 1251f
1237:             or           t3, s3, tp
                  c.xor        a3, a2
                  auipc        gp, 157983
                  srli         a2, zero, 31
                  and          s8, t2, s8
                  c.xor        s0, a3
1243:             c.add        tp, a1
                  auipc        a2, 1042596
                  xor          t5, a1, t4
                  div          a1, a3, s8
                  slti         s1, s10, 720
                  addi         s7, a2, 258
                  mulhu        a6, a3, a1
                  beq          t0, s0, 1263f
1251:             srai         s5, a3, 26
                  bgeu         s10, t3, 1266f
                  c.addi16sp   sp, -16
                  c.srli       a5, 5
                  bgeu         s3, s11, 1269f
                  c.mv         gp, a0
                  slt          t4, a2, t5
                  c.lui        tp, 4
                  c.srai       a2, 28
                  and          s1, t2, a1
                  nop
                  bne          s5, s9, 1266f
1263:             sra          s7, s7, a1
                  c.and        a2, a1
                  c.andi       s1, 26
1266:             blt          t2, t1, 1281f
                  sll          s7, t2, sp
                  and          t5, a5, gp
1269:             c.lui        t4, 16
                  blt          t4, t6, 1275f
                  and          tp, s6, t1
                  slti         t1, a3, 184
                  divu         a2, s7, a5
                  c.lui        a1, 29
1275:             mulh         s7, t2, t0
                  c.add        s8, s3
                  c.addi4spn   a4, sp, 272
                  c.addi       gp, -1
                  c.mv         a1, s9
                  c.andi       a3, -1
1281:             c.bnez       s1, 1297f
                  ori          a1, tp, 1110
                  remu         s11, t6, zero
                  sub          a1, a6, a7
                  c.andi       a0, -1
                  c.add        a4, a5
                  slli         gp, a5, 5
                  rem          a3, s9, a1
                  c.mv         t3, t1
                  c.beqz       a0, 1296f
                  lui          s7, 604485
                  c.slli       s10, 1
                  slti         gp, a7, 1946
                  addi         a7, t2, 1123
                  c.addi4spn   s1, sp, 272
1296:             srl          s2, t6, a0
1297:             add          t6, a2, gp
                  slti         gp, s3, 213
                  c.beqz       a1, 1304f
                  bge          a2, a0, 1311f
                  slt          t3, s9, ra
                  sll          a1, sp, a6
                  andi         a0, ra, 1762
1304:             c.nop
                  sub          t0, sp, s9
                  mul          s1, s0, t1
                  slti         s2, sp, -823
                  c.mv         s7, a3
                  bltu         s7, t1, 1319f
                  add          t1, sp, t6
1311:             slli         s2, s1, 1
                  c.srli       a2, 28
                  ori          a2, a3, -1490
                  andi         s3, a6, -1484
                  lui          s11, 437843
                  srli         t0, t1, 17
                  auipc        sp, 211732
                  andi         tp, s5, 544
1319:             c.beqz       a0, 1322f
                  c.andi       s1, 6
                  sll          a3, s0, a3
1322:             srai         a4, s9, 24
                  mulhsu       a6, a1, gp
                  srai         t3, t5, 14
                  c.srai       a0, 12
                  c.lui        a1, 12
                  srl          zero, sp, s4
                  xori         a7, a2, 1563
                  andi         s11, t2, 1888
                  sltiu        sp, t4, -99
                  bne          t5, s7, 1339f
                  nop
                  c.sub        a3, s0
                  c.addi       s2, 14
                  slti         s11, tp, 2035
                  c.sub        s0, a2
                  or           a1, s1, a1
                  slt          s0, sp, s4
1339:             add          s10, s9, s7
                  c.srli       a2, 17
                  sra          s2, gp, sp
                  c.li         gp, -1
                  c.sub        a3, s0
                  bne          s3, tp, 1352f
                  c.nop
                  mulhsu       s8, a3, s0
                  c.and        a2, a3
                  slt          s7, s5, t5
                  slti         s11, gp, 1661
                  srli         t1, s3, 9
                  sltiu        t1, tp, -1763
1352:             c.beqz       a1, 1367f
                  divu         zero, s4, tp
                  mulh         s7, a6, s7
                  rem          a1, s2, zero
                  or           t0, t1, a4
                  c.or         a2, s1
                  addi         s3, zero, 286
                  divu         s2, t3, tp
                  mulhsu       s0, t5, a3
                  sltu         ra, s0, s0
                  sub          a7, a4, sp
                  c.srli       a5, 7
                  beq          s0, a2, 1373f
                  add          s10, t3, s4
                  sltu         a4, sp, zero
1367:             c.addi16sp   sp, -16
                  remu         t0, a7, a7
                  c.nop
                  remu         s7, a0, t6
                  lui          tp, 1002112
                  nop
1373:             c.mv         a5, s8
                  c.sub        s1, a3
                  c.bnez       a4, 1394f
                  slti         sp, s5, -1644
                  c.bnez       s0, 1394f
                  c.srai       a1, 3
                  xor          s10, t5, s10
                  xor          a7, s11, s9
                  srai         ra, s0, 10
                  c.li         t3, 7
                  xor          t1, s9, gp
                  sltiu        t1, s8, -292
                  mulhu        a6, t4, zero
                  blt          t3, t3, 1401f
                  c.addi       t2, -1
                  slti         zero, s10, 1144
                  mul          a3, sp, s6
                  mulh         s8, sp, t0
                  auipc        ra, 566475
                  nop
                  c.sub        s1, s1
1394:             c.and        a5, a3
                  c.sub        s0, a4
                  c.srli       a0, 29
                  c.addi4spn   a2, sp, 480
                  xori         tp, t3, -903
                  c.beqz       a0, 1403f
                  c.beqz       s1, 1404f
1401:             mul          a0, s5, a6
                  add          a6, s0, s6
1403:             c.beqz       a3, 1412f
1404:             lui          s5, 127628
                  add          s2, s9, a3
                  nop
                  c.add        a1, a6
                  bge          t6, s9, 1419f
                  lui          a7, 51862
                  rem          a2, ra, a3
                  c.andi       a0, -1
1412:             c.and        a4, a1
                  c.nop
                  c.srli       a3, 12
                  sltiu        a0, s2, 564
                  c.srli       a5, 21
                  and          a7, t4, a2
                  c.andi       a4, 10
1419:             mulh         t4, s2, s6
                  andi         a4, a5, -258
                  c.xor        a3, a4
                  c.and        a3, a2
                  c.li         s0, 24
                  c.addi4spn   a4, sp, 144
                  xor          tp, a7, s1
                  or           t1, a6, s9
                  c.andi       a4, -1
                  sltiu        s10, a0, 1940
                  sub          s7, t0, gp
                  c.nop
                  addi         a4, t2, 616
                  c.slli       t3, 12
                  c.addi16sp   sp, 144
                  srai         t1, s3, 2
                  c.slli       a5, 10
                  c.add        a0, gp
                  c.mv         a2, s3
                  c.bnez       s0, 1452f
                  srl          t4, a0, s10
                  nop
                  bne          t3, t3, 1452f
                  beq          s4, zero, 1459f
                  c.or         s0, a4
                  srl          sp, s2, a7
                  slti         s10, s8, -1894
                  c.xor        s1, a4
                  slti         s3, gp, -48
                  remu         t4, a5, a7
                  xor          s2, zero, a5
                  srl          s2, s2, zero
                  c.sub        s1, s0
1452:             c.sub        s1, a3
                  div          t2, s4, s4
                  c.andi       a0, 23
                  blt          s4, s11, 1471f
                  c.andi       a4, -1
                  c.srai       a3, 1
                  xori         t6, s6, 177
1459:             c.bnez       a5, 1470f
                  add          a0, s0, s10
                  c.and        a3, a3
                  c.nop
                  sltu         s10, t1, t5
                  sub          s5, gp, a7
                  blt          t4, a3, 1473f
                  sltiu        t2, a6, -382
                  mulhsu       gp, a3, s4
                  nop
                  c.andi       a3, -1
1470:             mulhu        a4, gp, s1
1471:             bltu         tp, t5, 1482f
                  c.lui        a6, 26
1473:             andi         a4, t5, -1567
                  mulh         t3, s10, s2
                  lui          t3, 971283
                  or           t3, t4, s7
                  c.add        a0, s11
                  slli         a6, tp, 30
                  srai         s0, s10, 26
                  sll          t1, s3, t5
                  sltu         t2, t6, s11
1482:             divu         a2, a3, s6
                  blt          s7, s10, 1487f
                  sltu         a1, a2, t3
                  srli         zero, a1, 4
                  slti         a5, t4, -1232
                  la           sp, region_1+122 #start riscv_hazard_instr_stream_25
                  div          a2, a2, gp
                  srai         t4, s0, 16
                  sh           a3, 1772(sp)
                  slli         s0, t4, 25
                  sra          s3, a3, s0
                  c.srai       s0, 1
                  lb           a2, 1675(sp)
                  sub          a3, s3, a2
                  slti         gp, a3, 515
                  lhu          a3, -88(sp)
                  lbu          s3, 1193(sp)
                  c.li         a2, 15
                  c.sub        a2, a3
                  lb           a3, 171(sp)
                  lbu          a2, 1672(sp)
                  lbu          s3, 1449(sp)
                  sb           a3, 1179(sp)
                  lw           s3, 274(sp)
                  xor          t4, s0, a2
                  sra          s3, s3, gp
                  slli         s3, s0, 9
                  lhu          s3, 128(sp)
                  lbu          gp, 1171(sp)
                  divu         a2, a2, a2
                  c.slli       a3, 8
                  c.srli       a3, 30
                  ori          a2, s0, -1191
                  c.andi       s0, 21
                  lhu          t4, 68(sp)
                  sb           a3, 1738(sp)
                  lb           gp, 1461(sp)
                  lui          s3, 600250
                  lb           t4, 675(sp)
                  xor          gp, gp, s3
                  lbu          a3, 1464(sp) #end riscv_hazard_instr_stream_25
1487:             c.bnez       a5, 1500f
                  c.xor        a2, a3
                  auipc        s5, 519995
                  div          a0, t4, s11
                  c.nop
                  remu         a3, s1, t2
                  or           t5, sp, a4
                  xori         a0, a0, 916
                  mulhsu       a6, s10, a6
                  or           sp, t0, a2
                  bne          a7, a6, 1502f
                  sra          s10, a6, t5
                  mul          t3, s9, a4
1500:             sub          t0, a2, s0
                  c.slli       a1, 25
1502:             c.mv         s3, t3
                  sll          s0, t5, s6
                  and          a6, a2, s5
                  srai         a6, a7, 5
                  c.slli       t5, 20
                  c.lui        a2, 8
                  rem          a5, a5, a2
                  sll          tp, t2, a0
                  c.xor        a4, a2
                  sra          gp, ra, t0
                  nop
                  c.slli       s7, 2
                  srl          s3, s9, s1
                  c.or         s1, a3
                  mul          a3, s0, s5
                  c.xor        a5, a1
                  bltu         t4, s5, 1526f
                  bgeu         s4, zero, 1527f
                  mulhsu       s0, t5, t1
                  lui          t6, 478887
                  c.addi16sp   sp, -16
                  sltu         a4, a3, s7
                  mulhu        a5, t1, s1
                  srl          tp, gp, sp
                  la           t4, region_0+606 #start riscv_hazard_instr_stream_27
                  andi         t0, a5, 66
                  auipc        a5, 731829
                  c.li         s11, -1
                  c.srai       s1, 22
                  lbu          t0, -66(t4)
                  lb           s7, 1319(t4)
                  lbu          s1, -603(t4)
                  c.nop
                  mulh         a1, t0, s7
                  slt          s7, a5, s1
                  sb           s7, 621(t4)
                  div          t0, s7, t0
                  lb           s11, 117(t4)
                  c.li         a5, 9
                  c.sub        s1, a5
                  lb           s1, 1146(t4)
                  lbu          a1, -352(t4)
                  divu         a1, s11, s1
                  c.srai       a1, 21
                  c.li         s7, 14
                  slli         s11, t0, 23
                  lb           t0, -313(t4)
                  mulhsu       s11, a1, s7
                  sb           a1, 624(t4)
                  and          a1, t0, s7
                  lbu          a1, 335(t4)
                  lh           a5, -436(t4)
                  lbu          t0, -241(t4) #end riscv_hazard_instr_stream_27
1526:             rem          t0, s2, t1
1527:             srli         sp, s2, 5
                  srai         s7, sp, 25
                  c.addi       s10, -1
                  sra          s5, t4, s3
                  srai         sp, a6, 0
                  c.li         t3, 10
                  blt          sp, ra, 1548f
                  mulhsu       s0, t6, t4
                  mul          s5, s1, s9
                  mulhu        s1, a4, t2
                  bge          a7, a7, 1547f
                  and          gp, t4, s11
                  xor          t2, sp, t1
                  and          gp, a2, s8
                  andi         t0, s3, -2040
                  c.addi4spn   a0, sp, 288
                  c.beqz       a5, 1557f
                  c.bnez       a3, 1553f
                  sltiu        a0, t0, 1346
                  bltu         zero, s0, 1549f
1547:             c.or         s0, a3
1548:             andi         t3, s10, -1857
1549:             ori          t2, s8, -1363
                  sltiu        a1, t2, -321
                  nop
                  andi         ra, t6, -340
1553:             c.andi       a2, -1
                  c.or         a0, a2
                  slt          a1, t1, sp
                  c.beqz       s1, 1565f
1557:             add          s5, t1, gp
                  c.lui        a1, 15
                  mulhu        s8, s6, s11
                  bge          s2, a1, 1579f
                  add          s7, s3, t4
                  c.mv         s11, t5
                  auipc        gp, 436682
                  c.and        a4, a5
1565:             srai         a2, s3, 11
                  slt          s5, s10, s1
                  c.bnez       a1, 1578f
                  c.xor        a3, a4
                  sra          s2, s9, s0
                  divu         a0, s1, a1
                  blt          s3, a5, 1588f
                  bgeu         t2, a6, 1586f
                  c.slli       sp, 1
                  sll          s5, a7, t6
                  c.srli       s1, 13
                  sltu         t1, a0, s4
                  c.nop
1578:             c.beqz       a3, 1589f
1579:             beq          t1, t4, 1594f
                  sra          a2, gp, a5
                  c.addi16sp   sp, 384
                  mulhsu       s5, sp, t5
                  blt          sp, a0, 1600f
                  c.addi4spn   a0, sp, 464
                  c.and        a0, a0
1586:             bge          a4, tp, 1596f
                  addi         tp, s8, -890
1588:             sltu         sp, s0, a5
1589:             c.srai       a1, 4
                  mul          zero, s7, zero
                  slli         t5, sp, 30
                  sra          gp, sp, tp
                  sub          tp, s5, ra
1594:             srl          s3, t1, a3
                  ori          s8, a3, 80
1596:             c.sub        s1, a5
                  bne          sp, zero, 1612f
                  bltu         s3, s4, 1612f
                  c.bnez       a0, 1603f
1600:             c.srli       a4, 7
                  srl          s2, sp, a6
                  bne          s7, a6, 1607f
1603:             or           a2, t0, s6
                  xori         s8, s5, -1863
                  bge          t1, s6, 1620f
                  c.andi       a5, -1
1607:             c.mv         t0, s5
                  c.xor        s1, a3
                  or           t3, tp, s9
                  c.addi16sp   sp, -16
                  addi         s11, gp, -629
1612:             rem          t6, s5, a0
                  c.sub        a0, a4
                  bge          s2, t0, 1618f
                  c.srli       a0, 27
                  c.srli       a2, 5
                  bltu         zero, a5, 1623f
1618:             xor          a2, s8, t2
                  and          sp, tp, s9
1620:             nop
                  c.srai       a0, 13
                  xor          t2, s8, s2
1623:             sub          a4, t0, t5
                  mul          s2, s4, t2
                  slti         s8, zero, 1065
                  c.mv         s0, s6
                  slli         a4, a6, 11
                  c.lui        t2, 7
                  slli         s7, s6, 30
                  slli         t2, a2, 1
                  mul          a6, s7, ra
                  blt          s5, t5, 1649f
                  nop
                  blt          a3, s5, 1637f
                  c.lui        s10, 13
                  c.bnez       a1, 1640f
1637:             c.addi       a2, 26
                  c.add        gp, a5
                  sll          sp, zero, sp
1640:             c.nop
                  addi         s5, ra, 849
                  blt          a6, s11, 1661f
                  slt          t1, a1, ra
                  or           a1, s4, s2
                  c.srli       a3, 22
                  c.bnez       a3, 1660f
                  remu         s7, a4, ra
                  srai         ra, t4, 16
1649:             bltu         a4, s0, 1657f
                  sra          s10, a0, tp
                  rem          a7, t2, t5
                  c.mv         a6, a3
                  slt          gp, s5, a6
                  andi         a7, s0, 893
                  beq          t2, s10, 1661f
                  c.li         s1, 13
1657:             bltu         t3, s6, 1668f
                  bne          t5, a2, 1667f
                  bge          a0, s6, 1664f
1660:             c.li         s3, -1
1661:             divu         a2, a5, a7
                  xor          s0, s6, t5
                  bge          t6, s8, 1673f
1664:             mul          a1, tp, zero
                  mulhsu       s8, s3, s5
                  rem          sp, a6, a5
1667:             mulhsu       s2, s8, a0
1668:             srli         s10, s0, 26
                  c.sub        a2, a0
                  bge          a3, t2, 1685f
                  slli         t2, s3, 21
                  c.lui        t3, 23
1673:             bltu         s9, a3, 1677f
                  div          t2, t3, t5
                  c.sub        a4, a0
                  srai         t1, t1, 10
1677:             ori          s10, a1, -786
                  c.lui        a2, 27
                  srai         s7, gp, 13
                  bgeu         a2, s3, 1696f
                  c.li         ra, -1
                  c.addi       t1, 30
                  c.nop
                  slli         s1, t0, 27
1685:             bge          s8, t2, 1696f
                  rem          s5, s9, s10
                  c.li         ra, 2
                  beq          tp, s7, 1698f
                  mulh         a4, t1, t1
                  nop
                  sub          gp, s9, a6
                  or           s10, a1, a5
                  divu         t5, a2, s3
                  sltu         t1, a1, a7
                  ori          a1, s5, 1561
1696:             c.bnez       a2, 1701f
                  c.beqz       s1, 1708f
1698:             xor          s3, a2, a3
                  div          a1, s1, a5
                  slt          a3, t5, t1
1701:             mulhsu       t3, a7, a7
                  c.addi       ra, -1
                  bne          s1, s6, 1717f
                  c.addi       t4, -1
                  bge          t2, s10, 1716f
                  c.add        a1, a0
                  div          a7, s6, a3
1708:             c.bnez       a2, 1723f
                  c.addi16sp   sp, -16
                  beq          t5, t3, 1724f
                  slt          a4, t3, s3
                  slt          s3, zero, s10
                  c.xor        a5, a0
                  xori         s0, a0, 1279
                  c.nop
1716:             add          t3, s7, s10
1717:             bgeu         t0, s1, 1721f
                  mulhsu       t4, a3, t0
                  srli         a4, t5, 10
                  mulhsu       a3, s3, s7
1721:             slli         a6, s10, 3
                  lui          t0, 447333
1723:             c.add        ra, t3
1724:             c.and        a0, a4
                  mul          sp, s7, a4
                  remu         s1, s6, ra
                  blt          s10, gp, 1735f
                  c.bnez       a2, 1741f
                  slt          s1, a3, a1
                  c.srli       a4, 31
                  bltu         a1, s1, 1739f
                  mulh         a3, t2, s8
                  srli         s5, s0, 11
                  div          t4, a0, zero
1735:             sltiu        a1, a6, -906
                  ori          t3, t3, -208
                  c.xor        a4, a2
                  xori         gp, sp, -1658
1739:             ori          s7, tp, -1555
                  c.addi4spn   s1, sp, 800
1741:             auipc        a2, 251974
                  slt          a4, a5, t2
                  bge          s11, s5, 1752f
                  c.xor        s0, a4
                  lui          t1, 322434
                  or           tp, a1, s8
                  c.srli       a5, 25
                  or           s2, s8, s0
                  add          t2, s3, s1
                  c.addi4spn   a3, sp, 128
                  sltiu        t6, t4, -384
1752:             srli         a4, t1, 25
                  sltiu        s3, s1, -1570
                  bgeu         s10, a6, 1769f
                  beq          t6, s2, 1772f
                  lui          t2, 739484
                  slt          t4, a5, t4
                  c.mv         s10, s3
                  bgeu         s11, t2, 1774f
                  c.srli       a5, 23
                  sltiu        t2, s5, -1366
                  c.slli       a6, 2
                  c.srli       a0, 2
                  xor          t4, s8, a4
                  srli         t2, gp, 20
                  and          tp, s5, tp
                  sub          tp, s0, gp
                  c.srai       a2, 14
1769:             ori          s0, s2, -1171
                  sub          s0, a2, a5
                  c.srai       a1, 11
1772:             c.li         s5, -1
                  xor          t2, s1, s6
1774:             srai         a6, s4, 11
                  divu         s10, s0, ra
                  slt          s11, t3, s3
                  c.slli       s0, 20
                  slti         t2, a6, -872
                  addi         t2, a4, 319
                  c.and        a5, a0
                  and          s7, s6, s10
                  sub          s7, a5, gp
                  c.addi       s0, 28
                  lui          s5, 615955
                  c.sub        a1, a5
                  slt          t3, a7, a7
                  c.nop
                  c.slli       a3, 12
                  mulhsu       a0, sp, s10
                  divu         a1, s4, s11
                  mul          s7, a4, a6
                  bltu         s0, a7, 1806f
                  sll          tp, a7, s11
                  c.sub        a1, a3
                  xori         s0, t5, -1571
                  c.andi       s0, -1
                  bne          s7, s10, 1805f
                  c.sub        s0, a1
                  xor          tp, t0, t0
                  sltu         t3, s9, a0
                  c.srli       a0, 28
                  c.bnez       a3, 1806f
                  bltu         t2, ra, 1816f
                  c.nop
                  la           ra, region_0+1256 #start load_store_instr_stream_1
                  la           a6, region_1+499 #start load_store_instr_stream_0
                  sw           t0, -44(ra)
                  sw           t6, -32(ra)
                  lb           s5, -50(ra)
                  sb           s7, 16(a6)
                  lw           t6, 61(a6)
                  lb           t6, -15(ra)
                  lb           a3, -59(a6)
                  lb           a4, -36(a6)
                  lbu          a7, -24(a6)
                  lb           zero, 21(a6)
                  lbu          a5, -2(a6)
                  sb           tp, -43(ra) #end load_store_instr_stream_1
                  sb           a0, 27(a6)
                  lh           s10, -29(a6)
                  lbu          t3, -62(a6) #end load_store_instr_stream_0
1805:             div          a3, zero, t2
1806:             and          s7, a4, s0
                  c.nop
                  c.bnez       a3, 1814f
                  add          a5, t2, a2
                  nop
                  bgeu         t6, s9, 1822f
                  c.andi       a5, -1
                  sltiu        s8, s8, -495
1814:             srli         t6, t0, 9
                  addi         s0, t0, -1429
1816:             sra          s8, a2, a2
                  c.srli       a2, 12
                  auipc        sp, 157300
                  nop
                  ori          s2, zero, -510
                  add          a2, a6, a7
1822:             c.slli       s1, 1
                  mulhsu       a7, tp, gp
                  c.xor        s0, a4
                  c.li         a4, 30
                  andi         s8, t4, 289
                  divu         t4, t2, s6
                  bne          tp, a2, 1831f
                  lui          a6, 439989
                  c.srli       a0, 15
1831:             c.andi       s0, 21
                  sub          s3, zero, s3
                  c.lui        a0, 29
                  c.srli       a0, 15
                  div          a4, s6, s10
                  lui          s10, 317826
                  divu         zero, t0, a2
                  c.mv         t1, s5
                  bgeu         s2, a2, 1853f
                  sll          s3, a5, t4
                  c.addi       s10, 5
                  sll          gp, s8, gp
                  auipc        zero, 219883
                  c.lui        tp, 22
                  c.mv         s2, a1
                  srai         s10, s1, 8
                  c.addi       s8, 18
                  mul          a1, t6, tp
                  mul          t4, s1, gp
                  remu         t4, a6, a4
                  nop
                  srai         t5, a4, 7
1853:             c.or         a0, a4
                  auipc        s5, 784272
                  lui          s5, 352886
                  lui          s11, 821384
                  andi         a2, tp, -1010
                  c.lui        s2, 29
                  c.lui        s1, 3
                  c.slli       a0, 3
                  sra          a0, s1, a2
                  c.or         a5, s1
                  c.sub        s1, a0
                  srl          s10, s6, s11
                  add          s1, t4, s8
                  c.add        s7, a4
                  bge          a4, t2, 1883f
                  bne          ra, gp, 1887f
                  slti         a4, gp, 1676
                  blt          t6, tp, 1884f
                  sltiu        s3, a6, 359
                  bge          s1, a0, 1881f
                  xori         a0, s6, -1138
                  c.slli       gp, 4
                  remu         t5, a4, gp
                  c.nop
                  and          t3, ra, s2
                  mulh         sp, t4, s8
                  divu         s8, tp, gp
                  bgeu         s0, a1, 1897f
1881:             sltu         a3, s9, t5
                  slti         t5, sp, -35
1883:             xor          s2, zero, ra
1884:             mulhu        a2, a4, ra
                  divu         s2, t2, a7
                  c.li         ra, 7
1887:             andi         sp, t3, 378
                  sub          ra, s3, t0
                  xor          s5, a0, s5
                  slti         s2, a1, 1446
                  div          tp, t4, a6
                  c.xor        a3, a1
                  and          gp, tp, t0
                  c.li         t0, 21
                  srl          t1, tp, a5
                  c.bnez       s1, 1901f
1897:             c.or         a1, a4
                  remu         a7, s1, a6
                  bltu         t0, s5, 1903f
                  c.srli       a2, 11
1901:             and          t1, s7, s7
                  div          s7, a4, t4
1903:             mul          a3, t2, s4
                  mulhsu       s7, gp, t6
                  c.sub        s1, a0
                  mul          s0, s10, tp
                  or           zero, s10, t4
                  c.sub        a1, a2
                  addi         a4, t6, 1108
                  sra          s2, a1, a0
                  c.mv         s8, a2
                  add          gp, a0, a2
                  bge          a5, ra, 1917f
                  c.slli       s1, 27
                  xor          s3, t2, s4
                  c.lui        s11, 25
1917:             andi         s1, t0, -643
                  slt          sp, a6, a5
                  bgeu         t5, s5, 1934f
                  sra          t2, s5, s8
                  c.xor        a3, a3
                  c.addi4spn   a0, sp, 576
                  c.lui        t3, 13
                  c.srai       s1, 21
                  mulhu        zero, a5, t4
                  auipc        zero, 916763
                  mul          t5, sp, t2
                  c.xor        a0, s1
                  c.and        s1, s0
                  slli         s8, s0, 29
                  sltiu        ra, t6, 194
                  c.addi       a5, 9
                  slti         gp, s2, -1976
1934:             c.or         a3, s1
                  xor          a3, s1, ra
                  bgeu         s0, sp, 1951f
                  rem          a7, s4, a4
                  c.mv         s7, s9
                  sltu         zero, a0, gp
                  bge          a6, s7, 1945f
                  or           s2, s8, s0
                  mulhu        t3, s10, t2
                  auipc        s5, 293633
                  divu         a5, s6, gp
1945:             c.sub        a3, a0
                  c.addi16sp   sp, 432
                  auipc        s3, 739651
                  c.lui        s8, 15
                  xori         t2, s4, 1140
                  c.mv         s5, s11
1951:             sltu         s5, a4, s10
                  xor          t0, a6, tp
                  c.beqz       s0, 1964f
                  divu         t6, a4, s0
                  c.xor        a0, a3
                  c.and        a0, a5
                  c.nop
                  remu         s2, a5, t2
                  xori         s5, a6, 162
                  c.li         s3, -1
                  sltu         t4, a7, s7
                  c.sub        a5, a5
                  divu         zero, t2, s11
1964:             bltu         s6, s1, 1979f
                  slli         gp, t6, 13
                  mulh         t2, ra, t1
                  lui          t0, 147178
                  c.addi       a4, -1
                  sltiu        a2, s8, -1678
                  divu         sp, t1, s10
                  rem          t3, s2, s8
                  div          gp, s8, s10
                  slli         t1, s10, 17
                  ori          s5, s2, 1383
                  c.add        t4, s7
                  andi         s5, a2, -1375
                  c.lui        s3, 21
                  mulhu        a3, a5, t3
1979:             sll          ra, zero, s0
                  slli         t6, a1, 23
                  c.bnez       a2, 1998f
                  c.bnez       a5, 1992f
                  c.xor        a4, a3
                  mulhu        a0, s10, zero
                  xori         a4, s11, -1023
                  c.andi       a1, -1
                  mulhu        a4, t2, tp
                  bltu         s7, s5, 1998f
                  sll          t2, s10, a0
                  mul          s0, a0, a7
                  rem          s10, a4, a6
1992:             c.srai       a3, 19
                  c.lui        s5, 9
                  bltu         s0, a7, 2003f
                  and          s10, t2, s3
                  c.addi4spn   a4, sp, 16
                  nop
1998:             c.beqz       s1, 2006f
                  c.nop
                  div          t5, a6, s4
                  mul          a3, s4, s6
                  lui          zero, 40136
2003:             slli         s1, s10, 4
                  mul          t5, t2, a1
                  sltiu        a4, sp, -1274
2006:             c.or         a3, a0
                  lui          s2, 481622
                  srl          s3, a1, s2
                  slti         a4, ra, -257
                  mulhu        s7, t4, s3
                  bge          s6, a7, 2026f
                  add          t1, s4, a3
                  mulhsu       zero, zero, a1
                  c.andi       a5, -1
                  blt          ra, s5, 2026f
                  c.addi16sp   sp, 320
                  mulhu        t4, tp, s2
                  or           a2, sp, s11
                  sra          a4, ra, t0
                  srai         a7, t4, 12
                  mulhsu       a5, gp, s11
                  c.lui        t5, 21
                  c.bnez       s1, 2031f
                  c.li         a4, -1
                  c.addi       s7, -1
2026:             slli         t1, a3, 21
                  rem          a7, t6, s5
                  bltu         a7, t3, 2039f
                  auipc        t4, 1019180
                  c.beqz       a4, 2044f
2031:             andi         t1, t1, 1295
                  and          t5, zero, s10
                  sub          s2, s1, t0
                  sltu         s5, zero, s11
                  mulh         sp, tp, a4
                  srli         a5, s8, 15
                  c.add        s11, a4
                  blt          tp, sp, 2042f
2039:             add          t1, a6, a4
                  auipc        a6, 25661
                  c.addi16sp   sp, 256
2042:             and          t6, s3, s9
                  slt          t0, a5, a3
2044:             xori         s10, zero, 78
                  c.addi       tp, -1
                  c.mv         a7, s7
                  c.or         a5, s1
                  bltu         a5, s0, 2051f
                  c.mv         s2, a1
                  srl          zero, s2, s11
2051:             c.mv         sp, sp
                  c.andi       a0, -1
                  c.addi       s0, 16
                  c.sub        a2, a5
                  bne          a1, s9, 2064f
                  srai         a1, a5, 4
                  c.lui        s0, 10
                  remu         a6, gp, s11
                  srli         tp, ra, 12
                  mul          a6, t3, a1
                  add          s5, s0, sp
                  c.bnez       a1, 2070f
                  lui          a4, 448772
2064:             slti         zero, a2, 499
                  c.and        a1, s0
                  srai         a1, a2, 23
                  c.xor        a2, a5
                  rem          s2, s3, a2
                  c.li         a0, -1
2070:             c.nop
                  divu         sp, t5, s5
                  c.li         a2, -1
                  mulhsu       s0, gp, s0
                  mul          ra, t5, s3
                  c.slli       sp, 12
                  remu         s7, gp, t3
                  remu         s3, zero, s3
                  srli         a5, s8, 4
                  sll          tp, a6, a2
                  xor          gp, a0, a7
                  mulh         gp, s7, s0
                  c.xor        s1, a3
                  c.slli       a1, 8
                  lui          t4, 269525
                  c.addi       t1, 15
                  beq          s5, t1, 2103f
                  c.or         a1, a2
                  c.addi16sp   sp, 224
                  sra          a1, s9, tp
                  and          a2, s5, s0
                  bne          a3, t6, 2101f
                  srl          s0, a7, s11
                  beq          s5, t5, 2103f
                  bgeu         s1, s4, 2099f
                  c.mv         s3, a3
                  mul          t2, a5, t0
                  bge          s0, a7, 2108f
                  slli         t5, sp, 25
2099:             slt          sp, s2, s10
                  c.srli       a2, 27
2101:             sltiu        t5, a5, -727
                  c.addi4spn   a0, sp, 96
2103:             add          t6, t3, s0
                  c.nop
                  rem          t5, a5, a4
                  c.srli       a1, 15
                  auipc        t1, 985096
2108:             andi         t4, s0, -1224
                  sltiu        ra, a1, -33
                  c.xor        s0, s1
                  add          s11, a4, t3
                  c.slli       s3, 23
                  blt          a1, s3, 2122f
                  c.addi4spn   a5, sp, 896
                  bltu         t2, a5, 2119f
                  c.add        a1, a5
                  c.nop
                  c.add        t2, sp
2119:             c.and        a1, a2
                  srai         t6, s9, 9
                  c.addi4spn   a4, sp, 656
2122:             remu         a0, a6, s9
                  c.add        t3, a7
                  c.sub        s1, a0
                  beq          a2, t1, 2133f
                  c.or         a1, a2
                  c.sub        a5, a2
                  la           s7, region_0+74 #start load_store_instr_stream_0
                  la           s5, region_0+976 #start load_store_instr_stream_2
                  sb           s0, -12(s7)
                  lbu          t5, -12(s7)
                  la           t3, region_0+1939 #start load_store_instr_stream_1
                  lb           t0, -13(s5)
                  sb           t2, -6(t3)
                  lb           a6, -17(s7)
                  lbu          s1, -8(s7)
                  lw           s0, -7(t3)
                  sb           a2, 1(s5)
                  lb           a4, 4(s5)
                  lbu          t5, 27(s7)
                  sw           t6, -16(s5)
                  sh           a2, -11(t3)
                  lbu          a1, 11(s5)
                  sb           a2, 5(s7)
                  lb           t2, 2(t3)
                  lbu          s11, -13(s5)
                  sb           s8, -35(s7)
                  lbu          t2, 16(t3) #end load_store_instr_stream_1
                  lb           t4, 50(s7)
                  lb           a0, -7(s5) #end load_store_instr_stream_2
                  sh           t5, -44(s7)
                  lw           t0, -50(s7) #end load_store_instr_stream_0
                  auipc        s10, 915922
                  c.addi       a1, -1
                  mulhu        t6, t2, zero
                  c.srli       a3, 13
                  c.srai       s1, 22
2133:             c.mv         s2, s1
                  divu         a6, s5, a2
                  andi         a3, s8, -617
                  div          t1, a6, sp
                  c.li         a3, 8
                  c.bnez       s0, 2155f
                  div          a2, gp, s3
                  c.addi       s0, -1
                  c.beqz       a0, 2156f
                  c.andi       a3, 25
                  c.srli       s0, 9
                  c.srli       s0, 17
                  c.add        s0, s4
                  sltiu        ra, a6, -1670
                  bne          t5, a2, 2158f
                  c.srai       a3, 23
                  srai         a4, s4, 8
                  lui          a5, 510770
                  sltiu        sp, s6, 385
                  c.li         a2, 23
                  c.beqz       a3, 2158f
                  lui          s3, 73322
2155:             bge          a6, a2, 2169f
2156:             c.addi4spn   s0, sp, 1008
                  remu         a0, sp, t3
                  la           t4, amo_0+32 #start riscv_amo_instr_stream_2
                  amomaxu.w.aq  s0, a3, (t4)
                  mulh         a7, t2, a4
                  amoor.w       gp, s7, (t4) #end riscv_amo_instr_stream_2
2158:             or           a0, t3, a7
                  lui          a0, 485334
                  rem          t4, t6, ra
                  andi         s0, a1, -222
                  c.addi16sp   sp, 144
                  mulh         t4, tp, s5
                  mulhu        sp, t2, s9
                  div          s5, t5, a4
                  c.li         t1, 27
                  bgeu         s6, s10, 2186f
                  c.li         s2, -1
2169:             slti         sp, s11, -1022
                  c.li         a4, 28
                  c.srai       s1, 20
                  sra          sp, a2, s6
                  sra          t0, s8, t2
                  c.mv         t1, s1
                  andi         t6, s7, -1247
                  srli         a6, s10, 5
                  andi         a2, s11, 1360
                  bltu         s4, t5, 2191f
                  sltu         tp, s0, tp
                  blt          s6, s11, 2195f
                  c.srai       s1, 21
                  la           s2, amo_0+32 #start riscv_amo_instr_stream_12
                  la           a3, amo_0+44
                  la           s8, amo_0+8
                  srl          tp, a3, s0
                  amomax.w.aq   s5, s6, (s2)
                  c.lui        a5, 4
                  amoor.w.rl    s11, s7, (s8)
                  sll          t0, t3, s2
                  amoswap.w.aq  a6, t0, (a3)
                  c.lui        s5, 28
                  amomaxu.w.rl  t1, s2, (a3)
                  amoxor.w      t2, s6, (a3) #end riscv_amo_instr_stream_12
                  lui          a4, 359111
                  la           t4, region_1+749 #start load_store_instr_stream_1
                  lh           s3, 139(t4)
                  la           t5, region_0+1673 #start load_store_instr_stream_0
                  lb           a5, 53(t4)
                  lb           s10, -132(t4)
                  lb           zero, 2(t4)
                  lbu          t0, -217(t5)
                  lhu          s1, 145(t4)
                  lbu          t1, 125(t5)
                  sb           gp, 174(t4)
                  lbu          ra, -162(t4)
                  lb           s3, 35(t4)
                  sh           a5, 217(t5)
                  lb           s1, 226(t5)
                  lb           a2, -238(t5)
                  sb           s6, 56(t4)
                  sb           zero, -211(t5)
                  sb           s3, 253(t4) #end load_store_instr_stream_1
                  sb           s6, 50(t5) #end load_store_instr_stream_0
                  remu         s11, s7, a4
                  beq          s1, a5, 2190f
                  srai         s1, ra, 3
2186:             bltu         a4, gp, 2201f
                  lui          s1, 523315
                  c.or         a2, a0
                  mulhsu       t2, a7, tp
2190:             add          s2, a4, a6
2191:             c.srai       a4, 15
                  andi         t4, a0, -1773
                  sll          a3, a3, a3
                  div          a1, a2, zero
2195:             sltiu        s10, s10, 1298
                  c.addi16sp   sp, 32
                  slli         a4, gp, 29
                  mulhsu       t3, a0, s8
                  c.li         t3, -1
                  c.sub        a4, a4
2201:             c.nop
                  bltu         s4, a1, 2218f
                  lui          s2, 980853
                  mulhu        t0, a0, t3
                  divu         gp, s7, a1
                  mul          a7, a4, s3
                  bltu         a7, a4, 2215f
                  c.sub        a4, a0
                  rem          s10, t6, zero
                  auipc        t6, 1047719
                  c.xor        a1, a3
                  srl          s1, a5, tp
                  mulhu        t4, t0, s2
                  nop
2215:             c.addi       s3, 6
                  mulhu        zero, t0, s9
                  bgeu         s6, zero, 2228f
2218:             c.srli       a2, 10
                  bltu         s2, a1, 2223f
                  or           t4, s10, s7
                  c.nop
                  mul          t4, sp, a0
2223:             c.beqz       a0, 2237f
                  c.nop
                  sltiu        s5, a2, 1076
                  c.srai       a4, 12
                  sltiu        t1, s4, 865
2228:             c.nop
                  c.addi       a7, -1
                  slti         zero, a1, -6
                  xori         a2, t6, 805
                  c.srli       a3, 1
                  c.addi16sp   sp, 176
                  bltu         a6, tp, 2245f
                  beq          t1, t0, 2250f
                  addi         ra, tp, -33
2237:             c.xor        a2, a3
                  c.addi       t5, 8
                  slt          a0, a2, s0
                  c.beqz       a1, 2255f
                  c.andi       a2, -1
                  c.srai       a3, 3
                  bltu         s7, tp, 2256f
                  c.addi       a4, 17
2245:             c.andi       a3, 31
                  sra          t3, s10, zero
                  mulhsu       sp, s4, s6
                  auipc        t5, 368463
                  sra          a0, a6, s3
2250:             srai         a4, t2, 5
                  xor          t3, s4, a2
                  andi         s11, a2, -1164
                  c.lui        t2, 25
                  slt          s10, t0, a5
2255:             c.srai       a5, 26
2256:             xori         a2, sp, -919
                  c.sub        a1, a2
                  c.li         a1, -1
                  srl          s3, s11, t1
                  c.addi       a6, -1
                  xor          s0, a5, s9
                  c.andi       a3, -1
                  c.slli       s1, 20
                  c.beqz       s1, 2275f
                  rem          a1, s6, s7
                  div          t0, a2, a3
                  lui          t1, 476254
                  slt          t4, a3, s8
                  c.andi       a1, 8
                  c.addi       sp, -1
                  c.mv         s1, s8
                  and          s0, s4, a7
                  bne          t4, s11, 2288f
                  bne          a7, s2, 2284f
2275:             srai         s10, gp, 8
                  c.xor        a2, a4
                  addi         a2, a7, -635
                  lui          tp, 530166
                  mulh         s7, s9, a6
                  divu         t1, s2, s1
                  rem          s8, a7, t6
                  sltiu        t2, a2, 145
                  remu         a4, zero, t2
2284:             c.bnez       a4, 2298f
                  c.li         t1, 22
                  c.xor        a3, s1
                  xori         s5, zero, -581
2288:             c.bnez       a2, 2303f
                  srli         s7, s4, 17
                  mul          s1, t0, a1
                  bne          ra, a0, 2295f
                  c.srli       a1, 25
                  beq          s9, t3, 2307f
                  add          s8, s6, zero
2295:             add          s8, gp, t4
                  slli         a6, s5, 17
                  remu         zero, a4, t6
2298:             slt          t2, a6, t0
                  blt          t1, t6, 2316f
                  sltu         tp, a6, t4
                  c.lui        s7, 25
                  c.addi16sp   sp, -16
2303:             ori          s0, s10, -195
                  slti         t1, t0, 56
                  nop
                  remu         ra, t3, a5
2307:             xori         a0, gp, 1278
                  div          t2, s0, a4
                  srli         sp, s0, 7
                  c.slli       t4, 14
                  sra          tp, s1, s4
                  sltiu        t6, a7, -1576
                  sub          s8, t3, a2
                  mul          a1, a1, s10
                  c.mv         a3, s7
2316:             nop
                  c.beqz       a1, 2328f
                  c.slli       gp, 5
                  or           t5, a0, a2
                  slti         ra, tp, -1164
                  sll          t2, sp, zero
                  c.addi       t5, -1
                  or           s8, t4, sp
                  sltiu        a0, s5, 1332
                  c.addi       s7, -1
                  addi         s1, t4, 1373
                  mulhu        t0, a5, t3
2328:             mul          t0, t6, t3
                  rem          s2, a1, tp
                  lui          a5, 898409
                  slli         a1, sp, 17
                  sra          s8, gp, a4
                  remu         t0, s0, a6
                  slti         a4, t4, 1998
                  bltu         s3, t0, 2344f
                  sll          t6, a5, s1
                  c.slli       tp, 29
                  xor          t4, s0, ra
                  xor          t3, tp, t5
                  bgeu         t3, s9, 2357f
                  sltu         a1, t6, s11
                  c.and        a5, a1
                  srl          t6, tp, a7
2344:             c.addi4spn   a1, sp, 576
                  divu         t0, a4, sp
                  div          a5, ra, s5
                  mulhsu       ra, a7, a6
                  c.addi4spn   a2, sp, 32
                  auipc        s8, 952923
                  mulh         a1, a1, gp
                  addi         s0, t4, -488
                  bne          a6, s0, 2368f
                  sltu         a1, t6, s0
                  c.lui        a0, 1
                  sltu         a6, s5, t5
                  nop
2357:             c.addi4spn   a4, sp, 176
                  c.and        a3, s1
                  c.addi16sp   sp, 128
                  or           t1, a0, s8
                  xor          tp, ra, ra
                  c.add        t0, a2
                  andi         a1, t2, -1948
                  xori         s11, s7, 256
                  sltu         s10, s11, s10
                  c.andi       a2, 10
                  srl          a3, s2, t5
2368:             and          s2, t3, a5
                  ori          a1, t4, 525
                  c.add        tp, a5
                  sltiu        s3, a2, 155
                  slt          t2, a6, s1
                  c.slli       s3, 25
                  c.sub        a4, a3
                  lui          tp, 605071
                  or           a1, a0, s0
                  srli         s8, s6, 30
                  sll          s8, gp, s10
                  remu         t4, zero, a5
                  c.and        a3, s0
                  sra          s5, s8, s4
                  bne          t2, gp, 2397f
                  sll          a7, s5, s1
                  c.xor        a2, s0
                  c.slli       sp, 31
                  bne          s8, a1, 2392f
                  c.sub        a0, a0
                  c.beqz       a3, 2398f
                  blt          a0, a7, 2408f
                  c.and        a4, a2
                  beq          a2, a1, 2405f
2392:             nop
                  c.beqz       s0, 2397f
                  or           ra, a0, s11
                  c.li         t6, -1
                  srai         gp, s5, 20
2397:             c.slli       t6, 10
2398:             addi         gp, s3, -1977
                  xor          zero, a5, sp
                  rem          a6, s7, a5
                  or           s0, a1, s0
                  and          a5, ra, t0
                  andi         s10, a4, -1999
                  div          t4, t3, a2
2405:             mulh         t0, t6, a1
                  sll          t4, t4, s6
                  xor          gp, a2, t5
2408:             slli         t0, a7, 17
                  sub          t6, t2, a7
                  mulh         t2, t5, a4
                  c.nop
                  andi         s5, s3, 1893
                  lui          sp, 48336
                  lui          a2, 765894
                  addi         s2, s11, 1561
                  div          sp, s11, a0
                  c.srli       s1, 3
                  c.or         a4, a2
                  blt          t4, t4, 2427f
                  remu         s3, s11, s3
                  blt          s8, s8, 2426f
                  lui          s3, 803568
                  mulhu        zero, t3, tp
                  c.add        t0, a1
                  bgeu         tp, t3, 2433f
2426:             c.addi16sp   sp, 96
2427:             bge          t2, s7, 2436f
                  c.sub        a2, a1
                  srli         t5, a0, 22
                  bne          zero, s4, 2434f
                  slt          t6, a1, ra
                  divu         t5, t0, s0
2433:             divu         t1, s1, s1
2434:             c.addi16sp   sp, 480
                  mulh         t6, ra, tp
2436:             xor          a7, s2, s5
                  sub          s2, s5, s9
                  div          t2, a7, s11
                  srli         ra, sp, 21
                  srli         t0, sp, 24
                  slti         sp, a7, -404
                  blt          ra, a0, 2445f
                  c.and        s0, a1
                  andi         a4, a5, -789
2445:             slti         s0, zero, -762
                  blt          a3, a0, 2451f
                  lui          a7, 479983
                  c.mv         s5, s5
                  mulh         t3, a5, s1
                  blt          s1, t3, 2461f
2451:             beq          t1, s8, 2462f
                  c.li         s3, -1
                  rem          t2, t1, t6
                  c.add        t3, t5
                  addi         s3, s1, 1493
                  sra          s11, ra, ra
                  c.mv         sp, tp
                  c.or         a0, a5
                  beq          s1, zero, 2467f
                  mul          s8, t3, gp
2461:             c.add        s5, a5
2462:             xor          a7, s6, a3
                  auipc        t4, 713262
                  ori          a6, tp, 1095
                  andi         s2, s10, 1323
                  srai         s1, a2, 12
2467:             divu         a0, a7, s10
                  c.nop
                  sltiu        t3, tp, -753
                  auipc        t0, 720213
                  c.li         s5, -1
                  c.sub        s1, a4
                  and          sp, t0, zero
                  auipc        t6, 341863
                  ori          tp, a1, -1623
                  c.addi4spn   s0, sp, 832
                  add          t1, gp, s6
                  beq          t4, sp, 2492f
                  c.addi4spn   a1, sp, 848
                  bge          a3, a2, 2494f
                  c.mv         sp, a1
                  slti         s1, t5, -1537
                  addi         t2, s11, 432
                  c.mv         s11, t5
                  divu         a2, s8, s5
                  srai         a3, t3, 30
                  srli         a0, s10, 10
                  c.addi4spn   s1, sp, 928
                  bge          t0, t6, 2498f
                  rem          t2, a6, a1
                  andi         t3, t1, -1697
2492:             sltu         s11, sp, s6
                  slt          s8, zero, t6
2494:             auipc        a4, 61005
                  bne          s8, s8, 2512f
                  ori          a1, a4, 1103
                  c.add        a6, a5
2498:             c.xor        s1, a1
                  c.or         s1, s1
                  c.srai       a3, 11
                  srai         s5, t1, 16
                  c.srli       a1, 17
                  c.add        t3, sp
                  c.li         s7, 1
                  c.bnez       a4, 2513f
                  c.lui        s0, 16
                  beq          s2, s2, 2518f
                  and          t5, a5, tp
                  srai         a4, t2, 16
                  xor          t5, gp, s5
                  sra          zero, a1, s7
2512:             beq          t5, t4, 2516f
2513:             bne          s6, a4, 2526f
                  srl          a2, s9, a2
                  ori          s7, s4, -1535
2516:             ori          s2, s3, 2036
                  c.mv         a3, s1
2518:             bge          s0, a6, 2527f
                  c.lui        s2, 14
                  c.beqz       a5, 2535f
                  bne          sp, sp, 2529f
                  c.add        a3, s2
                  bgeu         s3, a3, 2527f
                  nop
                  srli         s8, t0, 1
2526:             srli         s3, a1, 18
2527:             blt          s10, gp, 2546f
                  xor          sp, s8, sp
2529:             and          t4, sp, sp
                  add          s8, s0, t6
                  slt          s11, t0, s5
                  divu         t5, gp, t2
                  and          gp, t6, a7
                  sub          t2, t5, a1
2535:             srli         tp, s10, 7
                  c.addi       t3, -1
                  ori          s0, a0, 207
                  ori          a5, s10, 918
                  auipc        t4, 240275
                  c.addi4spn   s0, sp, 640
                  slli         s5, a5, 0
                  srai         s3, a4, 26
                  slt          a1, s6, t2
                  slt          tp, t5, t5
                  auipc        a7, 411327
2546:             div          s11, s5, t3
                  xor          s8, s9, s3
                  c.mv         t0, a5
                  c.addi       a6, 13
                  remu         s0, t2, gp
                  div          t1, s10, t6
                  sra          sp, t5, t4
                  sll          ra, s5, sp
                  c.or         a0, a1
                  div          a6, s6, tp
                  blt          s2, a5, 2573f
                  c.nop
                  c.addi4spn   s1, sp, 896
                  sub          a1, ra, t1
                  c.addi       t0, 16
                  mulhu        a1, a1, t6
                  sltu         a2, s6, s10
                  slt          ra, t0, s10
                  srli         s10, a0, 19
                  bgeu         s8, s11, 2570f
                  c.li         t2, -1
                  c.nop
                  ori          s0, zero, 45
                  sra          s1, t0, s10
2570:             c.andi       s0, -1
                  c.li         t3, -1
                  ori          t5, a3, 337
2573:             c.or         s0, a1
                  srli         s3, t3, 0
                  srl          t2, sp, t5
                  mul          t3, s11, tp
                  xor          s3, t0, a0
                  c.nop
                  xor          s7, ra, zero
                  bgeu         t3, s11, 2585f
                  ori          tp, s8, -73
                  addi         s8, sp, -1278
                  auipc        a4, 321911
                  c.lui        a5, 20
2585:             c.sub        s1, a2
                  remu         tp, s3, t0
                  remu         s0, a3, s10
                  bltu         sp, gp, 2598f
                  c.addi       s1, 30
                  mulhu        ra, a4, a1
                  xor          s8, s5, a3
                  or           a0, t4, s4
                  auipc        a6, 305736
                  blt          a0, s10, 2609f
                  c.addi4spn   a2, sp, 224
                  lui          t6, 165369
                  sll          a1, s6, zero
2598:             addi         t0, t5, 108
                  xori         s7, s3, -1814
                  bltu         s7, s6, 2611f
                  andi         s11, gp, -1683
                  mulhu        a1, t2, a7
                  sltu         t5, zero, a7
                  add          t3, a7, t3
                  c.add        sp, t2
                  rem          a5, t1, s10
                  c.xor        a2, a5
                  mulhsu       t4, a3, s5
2609:             auipc        a5, 41630
                  bne          s8, a1, 2620f
2611:             xor          s11, s9, s10
                  xori         s0, a7, 1953
                  c.srai       a2, 7
                  slli         s7, s0, 28
                  ori          s2, s10, 320
                  remu         t4, s8, s9
                  xori         a2, a1, 1089
                  c.srli       a0, 22
                  sltiu        s7, s10, 119
2620:             bge          t2, s4, 2624f
                  sra          s1, s9, t2
                  rem          a0, s7, s6
                  sra          a5, s8, a5
2624:             beq          t2, zero, 2632f
                  blt          sp, s10, 2628f
                  slli         t4, s5, 31
                  div          a2, s4, a6
2628:             srl          a0, s0, gp
                  mulhsu       a7, s9, a2
                  remu         s7, zero, s1
                  xori         a7, sp, 803
2632:             sltu         s8, s1, t4
                  slt          t5, t5, s11
                  c.and        a5, a5
                  nop
                  srai         t1, s3, 10
                  xori         t4, a1, 998
                  c.andi       a1, -1
                  c.srai       s1, 11
                  sll          a0, s4, a5
                  and          t1, s0, a4
                  xori         a0, s8, 1941
                  sub          a5, ra, s0
                  sll          a7, s4, t5
                  xori         t3, s2, -590
                  addi         a4, zero, -1406
                  c.li         a2, -1
                  c.addi4spn   a3, sp, 432
                  sub          a5, s3, s6
                  mulhu        s2, s1, s1
                  bltu         s9, a4, 2665f
                  c.li         s5, -1
                  nop
                  srli         sp, s8, 15
                  c.mv         t4, s3
                  nop
                  add          s10, s5, s10
                  c.srai       s1, 18
                  mul          t4, a6, s1
                  rem          zero, t6, s9
                  bne          s7, s8, 2672f
                  div          t0, zero, a0
                  c.addi16sp   sp, 32
                  sub          a2, t5, sp
2665:             or           a4, s4, s1
                  remu         a5, s5, s9
                  bne          a7, t1, 2682f
                  xori         a0, ra, -1814
                  blt          a3, s8, 2680f
                  blt          s3, sp, 2685f
                  c.addi4spn   a4, sp, 464
2672:             add          t2, t4, t5
                  bgeu         a4, s5, 2689f
                  c.xor        a1, a0
                  c.or         a1, s0
                  bge          s4, t0, 2682f
                  remu         ra, s6, s3
                  div          s0, t0, t3
                  xor          s5, zero, tp
2680:             divu         zero, sp, a3
                  blt          s10, t3, 2684f
2682:             slt          a7, s6, a6
                  slli         a5, a5, 22
2684:             bltu         s7, t5, 2688f
2685:             divu         s3, s2, a2
                  andi         t6, a4, -388
                  c.and        a3, a2
2688:             mulhu        a1, ra, s7
2689:             lui          s8, 567997
                  c.and        a5, a2
                  remu         a5, a7, ra
                  c.and        a5, s0
                  or           t3, gp, a6
                  auipc        t4, 803047
                  auipc        gp, 316243
                  slti         a5, t2, -701
                  srli         a1, t5, 25
                  andi         t5, s4, -1456
                  mulhsu       a0, s1, a6
                  add          a0, a1, zero
                  mulh         a1, a4, a3
                  andi         s3, s8, -1853
                  xori         s10, s5, -1043
                  add          sp, t5, s4
                  c.andi       a3, 21
                  srl          s11, gp, s1
                  sra          s5, zero, t1
                  mulhu        a2, s10, s8
                  srli         gp, a1, 21
                  c.srai       a2, 25
                  ori          a5, s6, -1537
                  c.or         s0, a1
                  xor          t2, s8, s11
                  blt          s8, s11, 2720f
                  and          s7, a0, t5
                  bltu         t4, t6, 2730f
                  beq          t5, s1, 2732f
                  srl          ra, a5, s3
                  c.mv         t3, t2
2720:             mulhsu       a2, a6, a7
                  bgeu         t1, s4, 2732f
                  sltiu        s8, s5, -309
                  c.bnez       a1, 2727f
                  c.xor        a5, s0
                  blt          sp, a1, 2730f
                  sltu         gp, s11, a4
2727:             srl          t3, t4, s3
                  addi         a6, t6, -1329
                  mul          t3, t3, t6
2730:             bgeu         s8, s7, 2747f
                  c.and        a4, s1
2732:             c.andi       a4, 26
                  mulhsu       s7, a4, t6
                  nop
                  bne          zero, t0, 2744f
                  slti         a7, s11, 475
                  auipc        tp, 411521
                  c.mv         t1, s11
                  mulh         a0, t0, tp
                  remu         t1, t2, s6
                  bne          a4, sp, 2749f
                  c.srai       s1, 5
                  c.addi4spn   a5, sp, 448
2744:             c.addi4spn   a3, sp, 288
                  mulh         tp, tp, a1
                  c.sub        a5, a5
2747:             c.srli       a0, 25
                  srl          a0, t0, s10
2749:             sltiu        s11, t6, 1462
                  c.lui        a7, 20
                  c.nop
                  bgeu         s3, zero, 2768f
                  lui          t4, 974906
                  mul          a2, t5, t1
                  c.or         a1, a1
                  lui          s7, 184531
                  ori          tp, s3, 1270
                  blt          s8, a3, 2769f
                  c.sub        s0, a4
                  srl          t0, s11, s9
                  beq          a4, s2, 2771f
                  srl          t0, s5, a2
                  sub          ra, gp, t6
                  sltiu        tp, a3, 1768
                  c.xor        a5, s1
                  c.xor        s0, s1
                  mulhsu       t1, s6, t1
2768:             c.srai       a0, 26
2769:             c.andi       a4, 15
                  c.or         a0, a0
2771:             rem          ra, a5, a6
                  mulh         s3, gp, a6
                  bltu         tp, a7, 2787f
                  srai         a4, a2, 27
                  la           t2, region_1+1704 #start riscv_load_store_hazard_instr_stream_2
                  slli         t4, s0, 0
                  mulhsu       s11, t4, s7
                  sb           s6, 13(t2)
                  lw           t0, 8(t2)
                  nop
                  sra          a4, t4, zero
                  sh           a0, 8(t2)
                  lb           a6, 8(t2)
                  lb           t0, 8(t2)
                  c.srli       s1, 24
                  lw           s5, 8(t2)
                  lbu          t4, 8(t2)
                  sb           t3, -11(t2)
                  lbu          s5, 15(t2)
                  sb           s11, 15(t2)
                  sll          s5, a0, s11
                  lbu          ra, 15(t2)
                  lb           gp, 15(t2)
                  lh           t3, -16(t2)
                  lb           s0, 11(t2)
                  sb           t3, -3(t2) #end riscv_load_store_hazard_instr_stream_2
                  mulhsu       s0, a4, s10
                  sra          t6, a6, zero
                  c.bnez       a4, 2785f
                  c.add        t0, sp
                  nop
                  xor          t3, a3, s3
                  xori         gp, s6, 557
                  c.srli       s1, 11
                  c.addi16sp   sp, 480
                  mulhsu       s7, s2, s0
2785:             addi         s1, t6, -124
                  xori         t2, s6, -1781
2787:             mulh         zero, s11, gp
                  slli         s1, t1, 18
                  mulhu        s1, a5, s3
                  bgeu         t1, s9, 2805f
                  c.slli       s8, 14
                  c.addi       s10, -1
                  auipc        s10, 822151
                  srli         a3, a5, 1
                  c.xor        a4, a4
                  mulhu        a1, t2, tp
                  c.xor        a1, a1
                  sltu         a0, a4, s11
                  bge          s4, s8, 2816f
                  div          tp, s5, s3
                  and          a3, s4, s6
                  mulh         a6, zero, a3
                  bltu         s4, s7, 2816f
                  c.sub        a0, a4
2805:             c.lui        s0, 13
                  srli         s1, s8, 30
                  sltu         s11, gp, gp
                  mul          s8, zero, s7
                  sltu         gp, s2, t1
                  c.beqz       a2, 2824f
                  or           s10, t0, s4
                  c.srli       s0, 19
                  sra          t4, s4, t4
                  c.beqz       s1, 2822f
                  c.beqz       s0, 2826f
2816:             and          t4, s11, a3
                  c.srli       a4, 24
                  c.li         a3, 23
                  mulhsu       s11, t2, s3
                  addi         gp, s1, -1160
                  add          t1, s6, t5
2822:             remu         s11, t3, a7
                  c.srai       a1, 28
2824:             c.slli       a5, 25
                  srl          tp, a1, a7
2826:             remu         t2, t6, a6
                  andi         t0, s11, -1935
                  c.nop
                  c.or         a3, s0
                  bltu         a7, tp, 2845f
                  div          a7, s7, gp
                  sltiu        s3, a5, -951
                  divu         s10, s11, s0
                  c.srli       a5, 16
                  srl          s7, t4, t5
                  divu         tp, t6, s10
                  addi         a0, a0, -1112
                  sll          t4, s3, a3
                  auipc        s11, 101611
                  bltu         a5, s2, 2844f
                  addi         a4, s3, 888
                  srai         a7, sp, 17
                  c.addi       s11, 2
                  la           t0, region_0+519 #start riscv_load_store_hazard_instr_stream_11
                  lb           t4, -117(t0)
                  sh           s6, -117(t0)
                  lbu          t3, 231(t0)
                  lh           s7, 231(t0)
                  sh           a5, 231(t0)
                  lbu          s1, -166(t0)
                  lb           zero, -166(t0)
                  sb           zero, 64(t0)
                  lbu          t6, 64(t0)
                  lbu          t2, -145(t0)
                  lbu          s1, -145(t0)
                  lbu          s3, 111(t0)
                  sh           t1, 111(t0)
                  lh           a5, 111(t0)
                  lh           a0, -121(t0)
                  lbu          s3, 233(t0)
                  lb           sp, 233(t0)
                  add          s7, t2, a1
                  lb           gp, -161(t0)
                  sh           s1, -161(t0) #end riscv_load_store_hazard_instr_stream_11
2844:             c.beqz       s0, 2863f
2845:             remu         s7, a4, t2
                  bgeu         s4, a7, 2856f
                  sltiu        t5, a5, -776
                  c.srli       a5, 29
                  add          a4, a1, zero
                  sra          s1, s4, a1
                  sltiu        a1, s2, 1519
                  remu         a4, tp, gp
                  beq          s7, s0, 2862f
                  sub          a4, s4, a0
                  divu         s2, t4, s11
2856:             mulhsu       tp, gp, sp
                  c.xor        a2, a1
                  bltu         s3, t6, 2869f
                  srli         a4, a7, 29
                  lui          zero, 605501
                  c.sub        a3, a3
2862:             c.and        a3, a5
2863:             c.or         a4, a3
                  c.beqz       s1, 2869f
                  nop
                  c.addi16sp   sp, 16
                  mulh         t2, s2, s9
                  slli         s5, s5, 23
2869:             and          a5, ra, a7
                  c.nop
                  c.nop
                  c.srai       a0, 24
                  c.sub        a2, a0
                  or           a4, t0, a5
                  or           t5, zero, s1
                  lui          ra, 1010263
                  addi         tp, s6, 1333
                  andi         s8, tp, -1648
                  c.li         s2, 4
                  c.xor        a1, s1
                  ori          a0, a1, -1021
                  la           t5, region_0+491 #start riscv_hazard_instr_stream_30
                  addi         s1, a6, -1831
                  c.srli       s0, 13
                  lbu          a6, 2(t5)
                  mulhu        s1, s1, a6
                  andi         a0, s0, -999
                  sb           ra, 248(t5)
                  c.add        s1, s0
                  sb           s5, 7(t5)
                  lbu          s5, 130(t5)
                  sh           s0, 49(t5)
                  divu         s5, s1, ra
                  c.srai       s1, 5
                  lb           a6, -256(t5)
                  mulh         s1, a6, ra
                  sb           s0, -122(t5)
                  slti         a6, ra, -1921
                  sb           a0, -158(t5)
                  lh           s1, -77(t5)
                  c.srai       s0, 2
                  lhu          s5, 63(t5)
                  lb           a0, 254(t5)
                  srl          a6, a0, s0
                  sh           ra, -101(t5)
                  sltiu        s5, ra, -1810
                  lbu          s0, 86(t5)
                  sb           ra, 82(t5)
                  lh           a0, 207(t5)
                  lbu          s1, -24(t5)
                  lb           s5, 252(t5) #end riscv_hazard_instr_stream_30
                  mulhu        a5, a5, zero
                  bgeu         a5, t4, 2898f
                  c.beqz       a4, 2901f
                  c.beqz       a4, 2900f
                  c.and        a2, a0
                  c.or         a3, a1
                  ori          t5, s0, -2030
                  c.srli       a3, 31
                  c.nop
                  c.or         a2, a1
                  slti         sp, s7, -460
                  c.addi4spn   s1, sp, 928
                  srai         s1, s4, 2
                  c.slli       s5, 13
                  c.nop
                  lui          s2, 1047641
2898:             sltiu        t5, a7, -1318
                  mulh         t0, s3, t2
2900:             div          s10, t3, a3
2901:             c.or         a4, a5
                  c.add        s3, s10
                  mul          t3, a4, a7
                  lui          t4, 556725
                  sra          t1, a2, t6
                  add          s11, s9, s9
                  c.srli       a3, 8
                  lui          t0, 438731
                  slt          tp, t4, s3
                  nop
                  c.lui        s3, 26
                  mulhsu       sp, s9, sp
                  sltiu        a2, s5, 43
                  c.beqz       s1, 2923f
                  rem          t1, a2, a3
                  c.beqz       s0, 2933f
                  c.add        s11, s4
                  srli         zero, s5, 28
                  c.bnez       a4, 2938f
                  c.addi16sp   sp, 432
                  andi         zero, s1, -299
                  c.addi       s8, 16
2923:             slli         s7, ra, 31
                  c.srli       a2, 17
                  sltiu        a0, t0, 1297
                  sra          tp, s7, a5
                  beq          a5, s8, 2942f
                  addi         a5, a2, -1242
                  c.add        a2, s7
                  bne          s2, zero, 2938f
                  c.srli       a1, 5
                  slt          sp, s0, a0
2933:             addi         sp, a1, -1620
                  xori         s0, s11, 16
                  xori         t6, a0, 257
                  c.and        a3, s1
                  blt          t4, t2, 2945f
2938:             mulh         s2, a3, s7
                  c.and        s0, a1
                  sra          s10, t1, s10
                  c.nop
2942:             xor          a0, t1, a7
                  nop
                  c.addi16sp   sp, 224
2945:             sub          s11, a0, a4
                  andi         s7, a3, 715
                  c.mv         t2, t3
                  c.addi       t5, -1
                  c.andi       s0, -1
                  mulhu        a0, a1, a7
                  nop
                  c.and        s0, s1
                  bgeu         t6, s7, 2957f
                  beq          a0, t6, 2958f
                  ori          sp, a5, -1457
                  slli         s0, s3, 13
2957:             auipc        a1, 455528
2958:             slti         a0, a6, -1849
                  c.or         a0, a3
                  slti         t6, s10, -1124
                  slli         s0, s2, 3
                  c.li         a0, -1
                  c.mv         s2, s3
                  c.lui        a3, 16
                  nop
                  c.beqz       s0, 2969f
                  c.or         s1, a4
                  bne          a4, s7, 2982f
2969:             andi         a0, s3, 826
                  lui          s11, 756584
                  andi         s2, a0, 1981
                  sltu         t1, t4, t2
                  c.lui        t0, 10
                  mulh         t2, a0, a6
                  bge          s2, s5, 2986f
                  xor          a2, t0, s5
                  addi         ra, a4, -469
                  remu         t2, s6, s11
                  bne          s1, zero, 2985f
                  c.xor        s0, a1
                  c.or         a5, s0
2982:             and          sp, a6, tp
                  sub          s2, a2, s5
                  blt          ra, s2, 2988f
2985:             c.beqz       a3, 2994f
2986:             c.and        s1, a1
                  c.lui        t1, 9
2988:             add          s1, a3, a2
                  andi         t5, sp, -828
                  mulhsu       t1, s4, s3
                  add          s11, s3, s3
                  sra          a2, tp, t6
                  c.nop
2994:             slti         s7, t1, 1449
                  mulh         ra, s4, s9
                  blt          t4, a4, 3001f
                  c.sub        a5, a3
                  slli         zero, t2, 2
                  bge          a5, a4, 3013f
                  c.nop
3001:             c.add        a5, t5
                  and          a6, s0, t4
                  addi         a7, a4, 1615
                  c.nop
                  and          t4, s6, a4
                  c.or         a3, s0
                  sub          s1, t1, t4
                  xor          s0, s2, a4
                  c.andi       s0, -1
                  c.andi       s1, 3
                  sll          t2, a1, a1
                  bgeu         tp, t2, 3023f
3013:             c.addi4spn   s0, sp, 288
                  c.addi       sp, 21
                  srl          a5, s5, t0
                  slli         s7, t6, 11
                  ori          a2, gp, -1756
                  c.addi4spn   s1, sp, 32
                  xor          sp, a2, s2
                  bltu         gp, zero, 3036f
                  c.bnez       a1, 3036f
                  mulh         a6, t0, t6
3023:             bltu         t3, s1, 3034f
                  c.li         s11, 22
                  xor          s8, a2, s11
                  div          t4, s3, s11
                  c.and        a3, a0
                  bgeu         t4, s10, 3042f
                  c.addi       gp, -1
                  slti         a5, s8, 1640
                  add          s0, a3, t6
                  c.srli       a4, 6
                  mul          gp, s10, t2
3034:             blt          a0, s4, 3039f
                  c.addi4spn   a2, sp, 96
3036:             c.bnez       a2, 3051f
                  bne          t6, s11, 3047f
                  c.andi       s1, -1
3039:             rem          gp, s2, t1
                  add          gp, s0, s7
                  srl          s0, s3, s7
3042:             addi         s1, a5, -304
                  c.nop
                  c.srai       a3, 30
                  sra          tp, t4, a3
                  srl          a6, a5, a1
3047:             sll          a7, a6, a3
                  lui          s0, 430297
                  c.srli       a5, 20
                  c.mv         a3, a6
3051:             c.srli       a1, 7
                  sll          t2, a0, a3
                  bge          s10, t6, 3064f
                  slt          s10, t1, t2
                  rem          t4, t4, t5
                  c.xor        a3, s0
                  slti         a0, a5, -22
                  slt          a7, s10, s10
                  srli         ra, tp, 31
                  c.addi       a6, 2
                  c.bnez       a5, 3074f
                  c.srli       s0, 13
                  c.srli       a0, 26
3064:             c.beqz       a0, 3074f
                  bgeu         a7, a5, 3073f
                  nop
                  c.beqz       a5, 3075f
                  c.addi4spn   s0, sp, 592
                  c.addi       gp, 8
                  auipc        t3, 1025145
                  rem          s2, t5, a6
                  sll          s11, t5, s10
3073:             srli         a6, t5, 13
3074:             c.xor        s0, a4
3075:             srli         t2, tp, 11
                  mulh         a7, s8, t0
                  c.beqz       a5, 3082f
                  c.addi16sp   sp, 464
                  la           sp, region_1+1638 #start riscv_load_store_rand_instr_stream_4
                  c.srai       a0, 5
                  sw           t1, -226(sp)
                  sh           s9, 242(sp)
                  c.andi       a4, -1
                  c.mv         a0, t2
                  rem          ra, s2, t2
                  addi         s10, s9, 861
                  mulh         tp, a6, s2
                  lbu          s11, 237(sp)
                  c.mv         s3, s2
                  addi         s2, a4, 859
                  lb           t4, 41(sp)
                  c.srli       a2, 2
                  xor          t0, t1, s7
                  sra          t2, s6, gp
                  slt          t5, s6, s0
                  lbu          s10, -145(sp)
                  c.or         a3, a5
                  xor          a2, s8, zero
                  c.nop
                  sub          t4, a2, a1
                  mul          tp, t6, s2
                  lh           zero, 156(sp)
                  lb           a6, 137(sp)
                  c.addi       s8, -1
                  lbu          t3, 230(sp)
                  sb           zero, -12(sp)
                  lbu          gp, -245(sp)
                  sb           a6, -64(sp)
                  c.srai       s0, 10
                  sll          s7, t3, a3
                  lb           t6, 89(sp)
                  lhu          s0, 96(sp) #end riscv_load_store_rand_instr_stream_4
                  c.xor        a2, a0
                  slti         a0, s1, 135
                  c.lui        a5, 30
3082:             c.slli       a5, 22
                  addi         s2, a5, 1003
                  nop
                  bgeu         a3, s5, 3093f
                  c.nop
                  sltiu        t2, s10, -1678
                  sub          s10, a5, t4
                  sll          s8, a5, t6
                  c.addi       s7, 3
                  sub          s10, s8, a2
                  xor          t4, s10, s5
3093:             mulhsu       t0, s3, t5
                  divu         zero, s6, a1
                  c.lui        a1, 29
                  srai         t2, zero, 14
                  xori         a2, tp, 439
                  mulhsu       t2, s11, a6
                  c.and        a4, a2
                  sub          t0, s5, s6
                  blt          t0, s8, 3110f
                  div          t6, a2, a5
                  sll          tp, s2, a2
                  c.andi       s1, 9
                  auipc        a6, 462537
                  mulhsu       t6, s10, sp
                  andi         a2, sp, 1667
                  mul          s7, a0, a3
                  blt          tp, a2, 3124f
3110:             div          s0, s11, s1
                  slli         t2, a6, 29
                  c.addi4spn   a2, sp, 736
                  c.and        a3, a1
                  slli         a1, s1, 29
                  sll          sp, s2, s3
                  c.sub        a1, a3
                  c.and        a4, a3
                  c.li         a0, 21
                  c.lui        s11, 3
                  slti         a3, s6, 472
                  nop
                  c.lui        a7, 20
                  mulh         s0, s6, t1
3124:             c.and        a3, a4
                  mul          sp, zero, a4
                  nop
                  c.bnez       a2, 3138f
                  c.bnez       a1, 3132f
                  c.addi4spn   a1, sp, 880
                  div          t2, s1, ra
                  slli         t5, tp, 14
3132:             addi         ra, t6, -262
                  divu         t6, a6, t0
                  slt          a6, s7, t3
                  c.addi       s10, -1
                  sub          a2, a0, t3
                  c.slli       ra, 10
3138:             sll          t5, gp, tp
                  c.or         a2, a5
                  c.addi       s11, 30
                  bne          s2, s3, 3154f
                  c.li         s2, -1
                  c.bnez       s0, 3157f
                  slli         zero, t6, 23
                  beq          t6, t3, 3148f
                  or           t4, a4, s8
                  sltiu        t5, a0, 1094
3148:             c.srai       a5, 3
                  ori          s0, s6, 471
                  remu         s8, a6, a6
                  c.and        a3, a2
                  c.xor        a2, a4
                  c.mv         t2, a6
3154:             bne          s7, a3, 3169f
                  c.sub        a3, a1
                  remu         s3, a2, a3
3157:             c.and        a5, a3
                  xori         a2, sp, -334
                  slti         s2, s5, 2016
                  c.or         a5, a0
                  c.sub        a5, a0
                  slli         s3, a4, 8
                  beq          s3, s1, 3167f
                  xori         gp, ra, 1407
                  and          a1, s6, t2
                  or           a1, t6, s3
3167:             mulhsu       a6, t5, t1
                  sltiu        s1, a3, -364
3169:             sltu         s1, a0, tp
                  addi         sp, sp, -116
                  blt          s1, zero, 3190f
                  c.addi       tp, -1
                  or           s8, s7, s11
                  c.addi16sp   sp, 64
                  addi         t2, t4, -292
                  c.li         t3, -1
                  beq          gp, a6, 3181f
                  sll          s1, t5, t4
                  sltu         s10, a5, a1
                  c.add        s3, s3
3181:             div          s3, t0, s11
                  mul          gp, a4, a3
                  mulhsu       t1, a3, a7
                  c.srai       a3, 29
                  bgeu         s11, gp, 3195f
                  c.addi       s3, -1
                  slli         s7, a3, 20
                  or           s1, s8, a5
                  addi         s0, s10, 467
3190:             nop
                  c.beqz       a3, 3206f
                  c.srli       s0, 5
                  slti         a4, s2, -278
                  remu         a0, s9, s2
3195:             slli         s10, t6, 31
                  c.mv         t2, a4
                  mulhsu       a7, a2, s0
                  blt          zero, s4, 3207f
                  c.li         t0, 30
                  bge          t5, gp, 3211f
                  c.xor        a0, a2
                  bgeu         a6, t0, 3217f
                  srli         s2, s7, 24
                  c.addi       t6, -1
                  lui          s5, 453920
3206:             slli         sp, s7, 10
3207:             addi         s11, tp, -760
                  c.addi       gp, 28
                  bge          s0, s10, 3223f
                  auipc        t2, 1044911
3211:             mulh         s5, s1, s8
                  sll          ra, s5, a4
                  blt          zero, a1, 3223f
                  mulh         a2, t0, a3
                  c.nop
                  slti         t6, a7, -1418
3217:             bgeu         s0, s4, 3233f
                  mul          a2, a3, s8
                  mulhsu       s2, a3, a1
                  div          t6, tp, s2
                  bgeu         sp, t6, 3227f
                  add          t0, a7, t1
3223:             c.li         s7, 24
                  add          t5, t0, t6
                  c.sub        a0, a1
                  lui          s1, 566433
3227:             mulh         s7, s2, s4
                  mul          sp, s2, s9
                  srl          a3, tp, s7
                  divu         s8, s9, s10
                  mul          t6, tp, s9
                  rem          s11, t0, gp
3233:             auipc        s7, 383594
                  slli         t1, s6, 31
                  add          s8, a6, t2
                  sub          a7, t1, t2
                  sub          a7, t1, a6
                  divu         s1, a6, s0
                  srli         s11, a6, 16
                  nop
                  srl          s7, gp, s10
                  c.nop
                  ori          zero, t1, -587
                  xor          a6, s9, s4
                  mul          a6, gp, a3
                  c.lui        t4, 17
                  sub          t4, s1, a4
                  c.srli       a5, 3
                  div          tp, tp, s11
                  xor          t0, t1, a4
                  ori          t5, s8, -1596
                  and          t0, a4, s11
                  c.srai       a4, 17
                  div          sp, sp, a2
                  xori         t6, gp, 2017
                  slli         t1, a5, 5
                  mulh         t0, ra, a7
                  xori         t2, a1, -1582
                  blt          s7, t0, 3273f
                  andi         gp, a4, -522
                  mul          t5, a7, a5
                  c.xor        a4, a0
                  c.add        t6, t6
                  slt          s0, zero, t0
                  c.bnez       a3, 3282f
                  srli         a3, t5, 14
                  mulhsu       zero, t1, tp
                  sltiu        a7, a7, 504
                  sra          s5, s0, s0
                  c.or         a2, a2
                  c.add        a6, tp
                  c.addi4spn   a4, sp, 240
3273:             lui          s1, 516557
                  remu         s7, s2, s1
                  c.slli       s7, 15
                  c.xor        s0, a2
                  c.mv         a4, a1
                  sltu         t3, s6, t3
                  c.li         t1, 31
                  sub          s11, s9, t3
                  srli         t6, s3, 10
3282:             c.sub        s1, s1
                  sub          s8, ra, a1
                  sll          t5, a2, t3
                  c.sub        a1, s0
                  div          a1, a6, a3
                  div          sp, t6, t5
                  mulhsu       t5, s3, zero
                  c.sub        a5, a0
                  nop
                  c.xor        a3, s1
                  mul          s0, a5, s4
                  add          s2, s0, s8
                  bltu         s9, t2, 3305f
                  or           s10, t1, s0
                  slt          t2, s3, s10
                  c.or         s1, s1
                  xor          t0, s5, s7
                  nop
                  c.xor        a0, a4
                  c.addi4spn   s0, sp, 32
                  c.mv         t2, a6
                  bltu         a0, s9, 3311f
                  slti         ra, s11, 1495
3305:             addi         tp, t0, -1340
                  mulhu        a3, t5, s6
                  addi         s1, a4, 525
                  remu         t0, ra, s0
                  c.mv         a6, s5
                  srl          a3, s9, a0
3311:             beq          s2, s2, 3328f
                  blt          s1, tp, 3323f
                  divu         t5, s5, t1
                  c.nop
                  c.bnez       a3, 3320f
                  auipc        a4, 633491
                  rem          t2, ra, a2
                  ori          a0, a7, -185
                  c.andi       a0, -1
3320:             srli         a1, s6, 6
                  auipc        s7, 1013401
                  c.addi4spn   a3, sp, 928
3323:             srai         sp, s1, 8
                  srl          a4, a3, s1
                  c.nop
                  srai         gp, s11, 20
                  c.xor        a1, a5
3328:             sub          a2, a1, s5
                  c.or         a0, s1
                  sltu         gp, t4, t0
                  sra          zero, a5, gp
                  blt          a2, a6, 3338f
                  c.sub        a2, s1
                  nop
                  blt          a5, t0, 3340f
                  c.srli       s1, 25
                  c.addi16sp   sp, -16
3338:             blt          a0, t6, 3352f
                  remu         t5, s1, s6
3340:             mul          s7, t3, a4
                  srli         s11, t6, 19
                  nop
                  c.addi16sp   sp, -16
                  c.beqz       a0, 3352f
                  xor          gp, s10, s6
                  la           s10, region_0+1925 #start load_store_instr_stream_2
                  la           t1, region_0+21 #start load_store_instr_stream_1
                  la           gp, region_0+425 #start load_store_instr_stream_0
                  lbu          t0, 161(t1)
                  sb           a1, 256(gp)
                  lhu          a7, -3(s10)
                  sh           t6, 223(t1)
                  sh           s4, 3(s10)
                  lbu          s5, -230(gp)
                  la           t3, region_0+905 #start load_store_instr_stream_3
                  lb           s0, 173(t1)
                  lbu          a3, -13(s10)
                  sb           s8, 116(t3)
                  sb           s0, -7(t3)
                  lb           a1, 254(t1)
                  lbu          s7, 104(t1)
                  lbu          a5, 396(gp)
                  lb           a4, 202(t1)
                  lh           s8, 223(t1)
                  sb           s6, -212(t3)
                  sb           t3, 65(gp)
                  lb           s2, 13(t3)
                  lb           t6, 4(s10)
                  lbu          a2, 89(t1)
                  lhu          s3, 945(gp)
                  sb           s9, 329(gp)
                  lh           ra, -149(t3) #end load_store_instr_stream_3
                  sb           s7, -8(s10)
                  sb           s5, 93(t1)
                  lb           s2, -3(s10) #end load_store_instr_stream_2
                  lhu          t4, 245(t1) #end load_store_instr_stream_1
                  lbu          a0, 767(gp) #end load_store_instr_stream_0
                  c.sub        s0, a1
                  slt          a2, s2, s0
                  sub          tp, a5, a1
                  c.nop
                  xor          a4, s10, t1
                  c.or         a5, s1
3352:             slt          ra, t1, t1
                  mul          a3, s3, tp
                  sltiu        t5, t3, -1557
                  beq          t2, a6, 3370f
                  mulhsu       t0, a5, s8
                  auipc        a7, 723934
                  c.or         a2, a1
                  sra          t5, tp, tp
                  bltu         s0, s9, 3364f
                  c.sub        a5, a1
                  rem          s0, s7, sp
                  sra          a3, a3, a0
3364:             add          a5, a0, s10
                  c.sub        a4, s0
                  srl          s7, t6, a4
                  mulh         s8, a0, tp
                  rem          a2, s9, tp
                  bge          s9, ra, 3377f
3370:             lui          t5, 550643
                  bne          t6, s8, 3385f
                  addi         zero, zero, -270
                  c.addi16sp   sp, -16
                  sra          ra, t0, sp
                  c.sub        a3, s1
                  beq          s5, zero, 3379f
3377:             c.nop
                  c.srai       s0, 27
3379:             divu         a4, s1, s5
                  c.bnez       a4, 3395f
                  ori          t4, t1, 84
                  c.mv         a2, s1
                  c.add        a4, gp
                  bltu         s8, s0, 3403f
3385:             nop
                  c.li         s10, -1
                  c.or         a4, s1
                  auipc        s8, 735940
                  nop
                  nop
                  srai         a0, zero, 8
                  sll          t3, a0, a7
                  mulhu        s8, t0, t2
                  bge          t5, s11, 3405f
3395:             c.li         s10, 24
                  c.andi       a2, 2
                  c.slli       gp, 25
                  c.xor        a5, a2
                  slt          t4, tp, t6
                  lui          t0, 14229
                  bne          t3, sp, 3410f
                  c.xor        a1, a5
3403:             mulhsu       s5, t4, t3
                  mulhsu       gp, tp, t1
3405:             c.li         t3, 30
                  remu         t4, s3, s1
                  la           sp, region_0+1910 #start riscv_hazard_instr_stream_19
                  lb           a2, -13(sp)
                  srli         a5, s5, 0
                  c.add        s5, s1
                  xori         s1, s10, -927
                  c.li         s5, 8
                  sh           a2, -6(sp)
                  remu         s10, s1, a5
                  srl          s1, a2, a2
                  lh           a2, -2(sp)
                  lb           t1, -8(sp)
                  lbu          s1, 7(sp)
                  lhu          t1, -12(sp)
                  xori         s5, a5, 45
                  xori         s5, t1, -1989
                  srl          s5, s10, s1
                  lh           s1, -4(sp)
                  lhu          a5, 16(sp)
                  lb           s10, 3(sp)
                  lbu          s5, 6(sp)
                  lw           a2, 10(sp)
                  and          s5, a5, a5
                  c.srli       s1, 3
                  add          s5, s5, s1
                  lw           s10, 2(sp)
                  sb           s10, -5(sp)
                  lb           s10, -1(sp)
                  mul          t1, s5, a5
                  lb           s5, 1(sp)
                  mul          s5, s5, s5
                  lui          a2, 449732
                  lb           a2, 6(sp)
                  sltu         s1, s10, a2
                  lb           s10, -5(sp)
                  c.nop
                  lb           s5, 9(sp)
                  lb           a5, -15(sp)
                  lb           a2, -3(sp)
                  lh           t1, -12(sp) #end riscv_hazard_instr_stream_19
                  mul          t6, t1, a4
                  bgeu         t3, a1, 3412f
                  c.xor        a5, a1
3410:             div          s1, s10, a1
                  ori          t5, s9, -449
3412:             andi         a3, a0, 1778
                  c.srai       a2, 15
                  bne          zero, ra, 3418f
                  divu         a5, sp, zero
                  xor          t1, ra, a5
                  bgeu         a6, s4, 3433f
3418:             divu         a0, s2, s3
                  addi         t4, s6, 656
                  sltu         t3, t1, t4
                  mul          sp, zero, sp
                  c.and        a2, a0
                  c.slli       a6, 19
                  c.slli       s7, 5
                  remu         a2, tp, t0
                  or           zero, t5, ra
                  sltu         a1, a4, s7
                  or           zero, gp, a0
                  c.addi       sp, 25
                  mulhu        s5, t5, t5
                  divu         sp, a3, a6
                  c.sub        s1, s0
3433:             mulhsu       t4, a1, ra
                  c.sub        a5, a1
                  divu         a0, a4, s1
                  and          zero, t6, ra
                  c.addi4spn   s1, sp, 896
                  nop
                  c.addi16sp   sp, 64
                  c.li         s3, 18
                  ori          s3, t6, -153
                  add          ra, s10, s2
                  bne          s11, a6, 3453f
                  bltu         t0, sp, 3455f
                  xori         t1, t5, -1831
                  add          sp, s1, a0
                  c.srli       a1, 13
                  sub          ra, a6, a1
                  mulhsu       t4, a2, zero
                  divu         t5, s7, zero
                  mulh         t2, s4, t2
                  c.andi       a5, -1
3453:             c.and        a1, a0
                  c.slli       sp, 21
3455:             c.bnez       a1, 3470f
                  slti         zero, s8, -2042
                  blt          a6, s5, 3474f
                  c.addi4spn   a2, sp, 784
                  c.addi16sp   sp, -16
                  c.nop
                  blt          s9, sp, 3474f
                  bne          s4, s2, 3470f
                  c.addi       a3, 23
                  c.addi4spn   s0, sp, 864
                  xor          zero, t1, zero
                  mul          zero, a3, s4
                  srli         a3, a1, 27
                  c.and        a3, a4
                  or           s7, tp, s2
3470:             c.mv         t0, t2
                  sub          t0, s2, a2
                  c.addi4spn   s0, sp, 144
                  and          a5, a3, t1
3474:             c.slli       t4, 5
                  mulhsu       t6, a2, a0
                  blt          s3, t6, 3493f
                  c.srli       a1, 7
                  c.or         a3, a5
                  rem          a5, a5, s4
                  ori          s10, s2, 1284
                  nop
                  mulhu        sp, a2, ra
                  nop
                  c.add        s7, s5
                  or           a5, a1, a2
                  c.addi16sp   sp, -16
                  xori         a7, gp, 1854
                  c.lui        t1, 17
                  c.li         gp, 30
                  c.srli       a3, 11
                  srli         ra, a2, 30
                  sltiu        t5, a5, -1128
3493:             addi         zero, s7, -903
                  c.add        t0, ra
                  c.addi4spn   a0, sp, 128
                  remu         s7, s5, s5
                  sra          s0, ra, a6
                  c.mv         tp, s11
                  slti         t1, t1, 464
                  and          a7, s1, t1
                  auipc        t1, 160406
                  c.sub        a3, a5
                  remu         s5, s8, s4
                  srli         gp, t1, 30
                  c.nop
                  sltu         s5, a5, s5
                  remu         t4, t1, s7
                  beq          tp, t6, 3522f
                  c.andi       a0, 13
                  lui          s11, 327975
                  c.or         s1, s1
                  add          t4, s10, a5
                  c.sub        a2, s1
                  c.sub        a3, s1
                  sltiu        tp, s10, -1481
                  sltu         a2, t0, t1
                  mulh         s3, t6, zero
                  c.nop
                  sub          tp, t6, s5
                  auipc        s5, 750317
                  c.lui        s2, 19
3522:             lui          s11, 327025
                  or           s8, s9, t5
                  bgeu         sp, s0, 3533f
                  c.and        a1, a0
                  xori         s11, s4, 1490
                  beq          gp, s3, 3538f
                  bltu         a4, tp, 3538f
                  bne          a7, t4, 3544f
                  slli         a5, a2, 8
                  sll          a7, a5, t2
                  mulhsu       s2, a1, t4
3533:             mulhsu       sp, s4, s2
                  bltu         t6, s4, 3539f
                  c.nop
                  sltiu        sp, a1, 1446
                  mul          s8, sp, t5
3538:             slli         s2, a3, 2
3539:             ori          s1, s1, -1607
                  c.add        t1, a5
                  bge          a7, t4, 3552f
                  bne          s5, gp, 3557f
                  xori         t0, a5, 284
3544:             c.andi       a2, -1
                  mulh         a0, sp, s5
                  sll          s11, s5, t4
                  c.srai       s1, 2
                  addi         t1, s9, 1633
                  sub          t3, sp, a5
                  divu         a5, t0, a2
                  andi         sp, s0, -1836
3552:             sub          s10, a3, ra
                  srl          a0, t6, tp
                  remu         s2, ra, s7
                  c.li         s5, 10
                  xori         t0, s0, -994
3557:             srai         gp, t2, 2
                  remu         s2, s4, sp
                  c.li         gp, 24
                  lui          t3, 150794
                  c.add        tp, t5
                  c.addi       a6, -1
                  div          t6, gp, s1
                  bne          t6, s0, 3572f
                  mul          zero, s7, a1
                  blt          s3, s1, 3574f
                  c.srli       a1, 2
                  mulhsu       s0, a7, zero
                  c.addi       a0, 16
                  c.srai       s1, 31
                  c.sub        s1, a1
3572:             xor          t1, t4, s4
                  slt          gp, a6, t4
3574:             rem          zero, gp, s11
                  c.lui        a6, 7
                  c.lui        t1, 15
                  sub          s8, t2, s9
                  sltiu        t5, sp, 1625
                  srai         a0, s8, 25
                  c.nop
                  sra          a0, t0, s0
                  c.and        s0, s0
                  divu         s7, s4, a7
                  blt          t1, a2, 3588f
                  div          s0, t2, a2
                  c.beqz       s1, 3595f
                  mulh         t4, a0, t2
3588:             c.srli       s0, 30
                  xori         t1, s8, -984
                  sltu         s3, gp, a4
                  c.or         s0, a5
                  rem          s7, gp, tp
                  mulhsu       a0, a4, s6
                  c.addi       s5, 24
3595:             c.addi4spn   a4, sp, 992
                  mul          sp, t5, s11
                  c.srli       a0, 1
                  mulhsu       tp, tp, s4
                  blt          tp, gp, 3604f
                  beq          s11, t1, 3614f
                  mulhu        a3, a7, s8
                  blt          s7, s9, 3606f
                  xor          s2, s10, a0
3604:             c.mv         tp, s10
                  add          sp, t1, s9
3606:             bgeu         a5, a4, 3616f
                  beq          tp, a4, 3622f
                  c.xor        a0, s1
                  mul          a7, t6, sp
                  beq          a4, s9, 3624f
                  bltu         a7, t1, 3627f
                  c.srai       a0, 5
                  addi         a7, s6, -1580
3614:             and          s7, t3, t6
                  srai         s11, a0, 17
3616:             c.lui        s2, 18
                  or           gp, t2, a7
                  c.sub        s1, s1
                  andi         a2, s2, 414
                  c.and        s0, a2
                  c.srai       s0, 30
3622:             slti         t3, t3, -1145
                  mulhsu       tp, sp, a2
3624:             bltu         s6, t1, 3634f
                  slli         a0, t6, 13
                  bltu         a4, t1, 3637f
3627:             bltu         s3, t3, 3638f
                  sub          a1, s9, s3
                  mulhsu       a4, t0, s8
                  c.addi16sp   sp, 16
                  and          s0, gp, t2
                  c.bnez       a2, 3651f
                  bne          t6, a4, 3644f
3634:             c.or         a4, a4
                  nop
                  c.li         s1, -1
3637:             srai         s11, a2, 8
3638:             beq          a3, s0, 3649f
                  or           a2, t6, s5
                  slt          a7, s10, t5
                  sll          zero, a3, zero
                  div          t6, sp, s0
                  bge          t4, s10, 3660f
3644:             c.lui        s2, 3
                  slt          s0, t3, t2
                  c.beqz       a3, 3651f
                  c.beqz       a4, 3661f
                  c.mv         t2, s9
3649:             sub          s10, s3, a5
                  and          s0, tp, s5
3651:             c.or         a1, a4
                  sltiu        a7, s11, 1707
                  c.bnez       a4, 3659f
                  slti         t0, tp, 1614
                  c.addi4spn   a3, sp, 352
                  auipc        t0, 632193
                  sltiu        s5, s11, 1202
                  mulh         s3, a7, s8
3659:             sub          s0, s1, ra
3660:             c.addi16sp   sp, 352
3661:             add          s10, s7, s3
                  c.sub        a2, a1
                  c.slli       a5, 10
                  addi         t4, a0, 1334
                  c.nop
                  c.addi16sp   sp, 304
                  or           gp, s9, s9
                  sub          a4, s6, t2
                  div          s0, t6, t2
                  slt          sp, s3, t6
                  xori         s1, a5, -232
                  c.xor        s0, a5
                  div          a5, a6, zero
                  sra          gp, s8, ra
                  xor          a6, zero, s6
                  c.sub        s0, a3
                  srli         s5, s3, 2
                  xor          s1, t0, s2
                  srai         t4, s0, 9
                  beq          a7, a7, 3695f
                  c.addi16sp   sp, 336
                  auipc        s0, 401551
                  srl          t5, a5, a6
                  andi         s3, s10, -207
                  srl          t6, s8, s11
                  blt          s6, tp, 3701f
                  c.and        a2, a1
                  rem          s8, s8, s8
                  srai         s3, s4, 25
                  c.beqz       s0, 3699f
                  slli         t3, a2, 27
                  beq          a4, a3, 3695f
                  bne          s2, s10, 3701f
                  div          t2, a7, s4
3695:             and          t0, t0, s6
                  srl          s7, s0, s2
                  andi         gp, s11, -1231
                  c.mv         t5, gp
3699:             mul          s3, tp, s6
                  c.slli       s3, 14
3701:             c.addi4spn   a4, sp, 64
                  c.andi       a0, 31
                  or           sp, a4, t0
                  mulh         ra, t3, s0
                  sub          s2, s4, s1
                  c.srli       s0, 31
                  sltiu        t3, s6, -161
                  auipc        s5, 1034767
                  mulh         tp, s9, s10
                  xori         t3, s9, -371
                  c.add        t0, tp
                  div          sp, t1, a0
                  sra          a7, s5, a7
                  mulhsu       t3, t0, s0
                  srai         a6, s1, 30
                  xori         ra, s9, -1463
                  beq          s7, t5, 3734f
                  blt          a7, s6, 3722f
                  divu         s7, t4, a5
                  srl          s11, t0, a1
                  c.li         s3, -1
3722:             bge          t1, t4, 3735f
                  remu         a6, s11, s6
                  sub          a7, t0, s4
                  c.or         a2, a5
                  c.addi4spn   s1, sp, 224
                  slti         a7, t2, 619
                  bgeu         gp, s6, 3743f
                  nop
                  c.xor        s1, a1
                  sub          t0, sp, sp
                  sll          ra, t5, sp
                  divu         s11, s1, a2
3734:             srli         s0, s3, 14
3735:             c.li         a4, 9
                  blt          s7, s5, 3749f
                  c.srai       a5, 2
                  c.nop
                  srli         a2, t6, 17
                  beq          t1, a4, 3744f
                  remu         s10, s7, ra
                  divu         t3, a6, t4
3743:             c.nop
3744:             c.slli       t1, 8
                  sltiu        t1, t1, -1661
                  nop
                  div          a1, s8, a3
                  sltu         s2, s0, a5
3749:             slti         s2, t6, 1370
                  c.beqz       a1, 3767f
                  nop
                  and          gp, s6, s6
                  c.addi4spn   a5, sp, 80
                  sll          a1, a6, t2
                  c.beqz       a4, 3766f
                  slli         gp, s10, 6
                  c.sub        a1, a4
                  c.add        a5, ra
                  rem          s5, t6, s10
                  c.lui        s5, 13
                  xori         t0, a2, -1790
                  divu         t1, s6, sp
                  c.addi16sp   sp, -16
                  srai         s7, s1, 15
                  c.li         s8, -1
3766:             c.andi       s0, -1
3767:             srl          ra, s7, a3
                  sltu         a6, a7, s5
                  andi         ra, s6, 1970
                  sll          s2, a4, s7
                  bgeu         s10, a0, 3782f
                  c.lui        t2, 10
                  bgeu         a2, tp, 3782f
                  slti         a0, t6, 1148
                  srl          gp, s11, a1
                  mul          s11, a2, t4
                  c.sub        s0, s1
                  sra          t5, a1, t2
                  blt          zero, s0, 3787f
                  slti         s10, t2, 759
                  c.li         t6, -1
3782:             nop
                  c.and        a3, a2
                  srai         t5, a4, 13
                  c.li         t1, -1
                  mulhu        a1, t0, a7
3787:             bge          a7, s6, 3802f
                  bge          s4, s1, 3796f
                  c.slli       s10, 2
                  rem          t4, zero, tp
                  bgeu         s2, s9, 3800f
                  xor          a4, s3, s4
                  bltu         a7, a6, 3808f
                  c.addi16sp   sp, -16
                  c.add        tp, a1
3796:             mul          ra, a2, s11
                  c.srli       s0, 31
                  sltu         s0, s10, s10
                  lui          ra, 833323
3800:             sub          a1, sp, s8
                  and          s10, zero, s2
3802:             c.xor        a3, a5
                  srl          t5, t2, s0
                  lui          s7, 391716
                  div          s10, s8, s4
                  c.slli       ra, 19
                  ori          a6, gp, -1422
3808:             bgeu         t3, t1, 3812f
                  c.sub        a1, a3
                  c.mv         a3, s7
                  c.addi4spn   a4, sp, 640
3812:             mul          s10, s3, a0
                  beq          s9, s2, 3818f
                  sltiu        a5, s3, 655
                  sra          s7, s4, s3
                  c.li         t3, 0
                  c.slli       gp, 3
3818:             addi         tp, s10, -1514
                  nop
                  or           zero, s8, a4
                  c.addi16sp   sp, -16
                  rem          t0, s10, t3
                  sltu         t5, t6, s6
                  slt          gp, s10, s2
                  auipc        a7, 316846
                  srli         zero, t5, 26
                  lui          s3, 699814
                  srli         t4, a3, 24
                  slti         s7, s11, 179
                  c.addi4spn   a1, sp, 336
                  c.andi       s0, -1
                  mulhsu       a6, a6, s0
                  c.bnez       a3, 3847f
                  rem          a5, a0, a3
                  remu         gp, s0, tp
                  or           t6, t5, s4
                  sltiu        a5, t5, 952
                  slli         s2, a5, 8
                  and          a3, zero, s5
                  bltu         ra, t3, 3854f
                  div          t0, zero, s9
                  c.add        s5, s4
                  bgeu         a3, s8, 3847f
                  sltu         a7, a1, ra
                  mul          ra, s4, a1
                  remu         s2, s5, s11
3847:             c.or         s1, s1
                  c.beqz       s0, 3859f
                  srli         a1, a0, 4
                  c.beqz       a4, 3856f
                  bltu         s0, sp, 3868f
                  c.sub        a2, a2
                  bne          zero, t2, 3864f
3854:             auipc        a2, 590720
                  c.srli       a0, 29
3856:             rem          t6, t0, t3
                  xori         a7, s0, 1101
                  c.add        gp, s2
3859:             div          t0, t1, a4
                  bgeu         a5, s5, 3865f
                  sub          s1, t5, a2
                  mulh         t4, a5, tp
                  or           tp, t5, a0
3864:             c.bnez       a4, 3880f
3865:             andi         sp, a5, -1355
                  c.bnez       a4, 3881f
                  lui          t3, 296497
3868:             sll          a0, t2, s4
                  slli         s2, a1, 8
                  c.bnez       s1, 3889f
                  c.andi       a1, 15
                  c.add        a1, ra
                  c.add        tp, t3
                  c.nop
                  lui          a7, 142970
                  srl          s8, s4, s11
                  slt          s8, t2, a2
                  add          t4, a6, t1
                  div          a0, s1, s7
3880:             slli         t4, s11, 3
3881:             c.or         a0, s1
                  srli         t6, s4, 7
                  bge          s5, s10, 3891f
                  sltiu        a4, a2, -759
                  ori          t0, t1, -135
                  sltu         a0, s3, t1
                  addi         a0, tp, -308
                  sll          a7, a7, t3
3889:             sltiu        s0, t3, 680
                  c.addi       a4, 26
3891:             remu         zero, a2, t6
                  xori         t0, s1, 622
                  c.add        a1, a6
                  div          zero, ra, s6
                  xor          a0, a6, tp
                  lui          s3, 44061
                  or           gp, sp, a7
                  c.srli       a1, 4
                  srai         s3, t2, 4
                  remu         s7, t1, s7
                  c.srai       s1, 20
                  slt          t3, a5, a1
                  bne          s9, tp, 3913f
                  c.srai       s0, 5
                  c.nop
                  add          a7, ra, a7
                  div          a3, a6, s8
                  lui          sp, 744390
                  srli         a4, zero, 29
                  c.or         a3, a0
                  c.bnez       a3, 3925f
                  c.mv         ra, s7
3913:             c.sub        a0, s1
                  bge          s1, sp, 3924f
                  c.add        ra, s2
                  c.addi       s11, 20
                  mulhsu       sp, s4, s11
                  c.add        s7, s8
                  blt          t5, s8, 3922f
                  c.li         sp, -1
                  bne          a6, ra, 3936f
3922:             c.srli       a4, 22
                  c.srli       a5, 10
3924:             c.nop
3925:             c.lui        a7, 4
                  sltiu        sp, t4, -52
                  slti         a7, s6, -657
                  c.andi       s1, -1
                  ori          zero, s9, -1158
                  srai         s10, t2, 30
                  c.beqz       a2, 3948f
                  sub          s8, s8, t4
                  sltiu        s8, s11, 1557
                  blt          a0, s7, 3938f
                  bltu         t2, t6, 3946f
3936:             c.andi       a5, -1
                  srai         s3, ra, 0
3938:             bne          s7, s11, 3947f
                  sll          t6, ra, t5
                  c.and        s0, s0
                  bgeu         t2, s3, 3949f
                  sltiu        a2, t6, 379
                  c.addi16sp   sp, -16
                  c.bnez       a3, 3957f
                  lui          a2, 755763
3946:             c.li         a5, 0
3947:             bltu         sp, t3, 3961f
3948:             or           s1, gp, s5
3949:             xor          gp, a1, s7
                  srl          a7, t3, t1
                  mulhu        s2, s6, gp
                  addi         a7, a7, 1682
                  c.srli       a1, 24
                  nop
                  bltu         t5, s0, 3969f
                  ori          a0, s8, -1350
3957:             c.sub        a4, s1
                  c.xor        s0, s0
                  addi         s2, s2, 2013
                  c.srai       a0, 2
3961:             sltu         s2, t5, t2
                  nop
                  rem          s0, s1, gp
                  or           t6, t1, s6
                  mulh         t5, s9, a7
                  slli         t5, tp, 22
                  c.or         a4, a2
                  beq          t2, s7, 3983f
3969:             lui          a4, 779073
                  srl          s1, t0, a0
                  sll          a6, s5, s2
                  sltu         s5, t5, t6
                  bgeu         a6, s9, 3987f
                  srl          gp, t4, s10
                  srai         s5, a1, 10
                  sltu         t6, t4, s3
                  nop
                  and          ra, a5, s3
                  c.add        a6, t3
                  auipc        t6, 987756
                  mulh         a2, t1, t5
                  c.mv         s10, s0
3983:             c.add        s1, t5
                  sra          t0, a2, a2
                  c.addi       s2, 27
                  srai         a7, ra, 21
3987:             or           t6, s3, s10
                  c.beqz       a2, 3991f
                  c.beqz       s1, 3997f
                  add          t2, s6, a1
3991:             srl          t2, a0, s0
                  c.and        a2, s0
                  c.li         s11, 4
                  c.nop
                  mul          t6, a6, s3
                  and          t0, a5, s8
3997:             beq          zero, s0, 4007f
                  rem          s8, a4, a4
                  add          a0, t2, zero
                  sltiu        a4, s8, 1310
                  srl          s10, t6, a1
                  c.mv         ra, s4
                  divu         s2, s7, s0
                  sltu         t6, a1, s2
                  c.addi4spn   a4, sp, 864
                  bgeu         t5, s3, 4021f
4007:             c.or         a0, a5
                  c.or         s1, s1
                  addi         a7, s6, 1249
                  sll          s1, a6, s9
                  c.li         s7, -1
                  c.xor        a1, a4
                  slti         s8, s2, 100
                  bgeu         a3, s7, 4018f
                  c.addi4spn   s1, sp, 192
                  auipc        sp, 836683
                  c.srai       a3, 29
4018:             c.bnez       a2, 4028f
                  c.addi       t2, -1
                  c.or         a0, a2
4021:             remu         t3, s4, s8
                  c.li         s7, 18
                  c.add        s11, a2
                  srl          a2, t1, s7
                  c.or         s0, a1
                  c.nop
                  c.nop
4028:             c.and        a3, a1
                  c.xor        a0, s1
                  andi         t4, a2, 1931
                  xori         a7, a3, 44
                  c.addi16sp   sp, 496
                  c.addi       t4, -1
                  nop
                  c.and        s1, a0
                  c.xor        a5, a4
                  c.sub        s1, s1
                  remu         s10, sp, a6
                  andi         a3, gp, 729
                  divu         s0, t2, sp
                  c.add        s10, t4
                  slti         t0, a5, 1595
                  c.addi       gp, -1
                  ori          s8, s4, -586
                  c.sub        a5, a5
                  slli         t0, s1, 25
                  srai         a3, gp, 22
                  blt          a5, t4, 4053f
                  c.andi       a4, 9
                  bge          a5, s0, 4066f
                  ori          s10, a6, 978
                  c.andi       a3, 6
4053:             c.lui        tp, 2
                  c.addi4spn   a5, sp, 160
                  c.srai       s1, 20
                  c.addi16sp   sp, 208
                  srai         s11, a5, 26
                  lui          s2, 514473
                  mul          s11, s1, tp
                  mulhsu       a5, s9, sp
                  beq          s11, s6, 4072f
                  addi         t1, a3, 1741
                  rem          a1, gp, t1
                  c.nop
                  c.xor        a0, s1
4066:             c.bnez       a4, 4071f
                  sltu         tp, t2, t5
                  nop
                  mulhu        a0, t2, gp
                  slti         t0, sp, 1620
4071:             or           a2, t6, s6
4072:             c.srai       a5, 31
                  c.addi       s7, -1
                  or           a2, s11, a5
                  add          gp, a0, t6
                  or           s5, t6, t0
                  srai         t4, ra, 15
                  bltu         t1, a4, 4087f
                  c.srli       a2, 25
                  nop
                  srai         gp, s7, 12
                  c.beqz       s0, 4093f
                  c.andi       a4, -1
                  rem          t5, sp, s1
                  c.andi       a1, -1
                  nop
4087:             c.slli       a2, 6
                  div          s3, tp, t4
                  rem          t5, a5, s11
                  c.add        t3, s1
                  rem          s11, a2, t0
                  or           a6, a4, ra
4093:             beq          a1, s10, 4097f
                  c.slli       a4, 7
                  c.bnez       a0, 4106f
                  nop
4097:             c.srli       s1, 12
                  andi         s0, s10, 1750
                  srli         t6, t0, 16
                  c.lui        t0, 13
                  c.andi       s0, 10
                  sub          s5, s2, a1
sub_3_57:         jal          ra, 0f
0:                c.jal        12f
1:                c.jal        8f
2:                c.jal        11f
3:                c.j          9f
4:                c.jal        14f
5:                c.jal        7f
6:                c.j          5b
7:                jal          a3, 4b
8:                jal          ra, 2b
9:                jal          tp, 13f
10:               c.j          6b
11:               c.jal        3b
12:               jal          ra, 1b
13:               jal          ra, 10b
14:               c.srai       a0, 31
                  ori          t6, a7, 555
                  blt          t0, a7, 4119f
                  c.or         a1, a0
4106:             c.lui        s8, 4
                  beq          ra, s7, 4115f
                  beq          s8, sp, 4114f
                  ori          a1, t5, -1458
                  andi         s11, t5, 129
                  c.or         s0, a3
                  sltiu        s10, s11, -108
                  c.mv         s10, t2
4114:             c.bnez       s1, 4133f
4115:             addi         ra, s0, 112
                  nop
                  bgeu         s10, a3, 4134f
                  lui          a5, 942237
4119:             c.bnez       a2, 4122f
                  div          zero, s1, a5
                  srai         s7, s6, 24
4122:             c.li         ra, 23
                  or           t3, s6, s9
                  add          sp, s0, s5
                  sltu         tp, t2, s1
                  sltiu        t3, s7, -721
                  addi         a2, tp, 1473
                  xori         t0, t5, -207
                  c.sub        a5, a1
                  c.mv         a7, t3
                  add          s3, zero, zero
                  andi         a6, t2, -872
4133:             c.addi       s10, -1
4134:             bge          a0, s6, 4147f
                  remu         t2, s8, a3
                  andi         s10, s10, 878
                  c.andi       a0, -1
                  remu         a0, s4, ra
                  sra          zero, s0, s1
                  sub          s10, a2, s0
                  c.xor        a2, a1
                  sltu         s7, a7, s1
                  xor          tp, zero, a6
                  srai         s1, zero, 13
                  ori          s7, s4, 1538
                  sltiu        tp, a3, -1764
4147:             srl          t5, t1, ra
                  lui          t3, 629819
                  srai         t5, a2, 1
                  div          t0, t1, s11
                  mulhu        t1, a6, zero
                  and          a3, a3, s1
                  bgeu         ra, a6, 4164f
                  c.nop
                  and          s7, t3, t1
                  c.nop
                  c.lui        t1, 5
                  c.add        t6, t2
                  mulhu        ra, a2, a7
                  rem          zero, gp, a7
                  c.mv         a4, tp
                  blt          a7, a1, 4173f
                  sltu         a2, s1, s2
4164:             slt          zero, t3, s5
                  c.andi       a0, 18
                  addi         a4, zero, -1919
                  beq          a4, tp, 4184f
                  srli         t0, s6, 26
                  mulhsu       a1, t4, a4
                  mulh         tp, s2, a5
                  or           ra, a7, a0
                  mul          ra, a0, s3
4173:             auipc        a0, 1020819
                  c.srli       a1, 24
                  nop
                  c.srli       a3, 9
                  remu         s10, s6, tp
                  sub          s10, ra, sp
                  sltiu        t1, a1, -1947
                  rem          ra, t5, s1
                  c.srai       a5, 31
                  addi         a5, t4, 655
                  slti         t1, s11, -1089
4184:             bltu         a7, a7, 4195f
                  andi         a1, t5, -509
                  mulh         s11, t1, s7
                  slt          s11, a6, ra
                  c.and        s1, s1
                  c.addi4spn   a0, sp, 128
                  c.srli       a0, 8
                  slt          a3, s8, s11
                  div          t5, t3, s11
                  mulh         t0, a3, sp
                  auipc        s0, 409639
4195:             xori         a7, s3, 633
                  nop
                  beq          s3, s11, 4202f
                  c.and        a0, a3
                  c.li         a6, -1
                  andi         sp, ra, -57
                  c.srai       a2, 31
4202:             sub          a1, t5, s1
                  mulh         t6, t5, sp
                  nop
                  sub          a3, s1, a7
                  xori         tp, t0, -344
                  ori          t5, sp, 1487
                  c.or         a3, s0
                  addi         s5, tp, -278
                  sra          a5, t0, t1
                  andi         ra, a3, 210
                  lui          t4, 587953
                  add          a7, t6, s6
                  div          t2, a7, s5
                  c.sub        a4, a4
                  divu         a6, a5, gp
                  c.addi4spn   s0, sp, 912
                  addi         a7, s11, 1331
                  and          a1, gp, gp
                  nop
                  bge          zero, a1, 4225f
                  slt          t0, s8, s6
                  andi         a6, t6, -1354
                  c.addi       t5, 26
4225:             sltu         s2, s2, s10
                  sub          tp, s4, s10
                  sra          a0, s9, s8
                  blt          s7, s1, 4238f
                  sltiu        s0, s6, -1849
                  xori         t2, a1, -1025
                  c.xor        s0, a4
                  auipc        t1, 916992
                  srli         s0, tp, 4
                  mulhu        t3, ra, ra
                  andi         a6, gp, -937
                  mulhsu       s2, a6, s0
                  mulh         t0, ra, s2
4238:             c.andi       a1, -1
                  mulhsu       a2, t6, s1
                  add          s2, zero, s1
                  bgeu         t0, tp, 4260f
                  sltu         t6, s11, a5
                  sltiu        t0, t0, 1335
                  xori         s1, a1, -1879
                  nop
                  c.or         a1, s1
                  mulhsu       s0, s3, tp
                  blt          t0, a1, 4263f
                  mulh         s0, s2, t3
                  srai         ra, a3, 15
                  c.srli       s0, 8
                  auipc        gp, 86536
                  slti         a1, a7, -478
                  ori          sp, s5, 501
                  xor          s5, s2, s8
                  bgeu         s8, s4, 4270f
                  or           s8, tp, t3
                  c.beqz       a2, 4267f
                  c.addi4spn   a1, sp, 720
4260:             or           t0, s4, a4
                  c.add        s2, t1
                  lui          s10, 894678
4263:             sub          s3, gp, sp
                  c.srli       s1, 3
                  andi         t6, s6, 1790
                  mulhu        t6, a3, s7
4267:             lui          s5, 420201
                  c.li         s11, 1
                  auipc        a1, 686421
4270:             addi         a5, a5, 814
                  c.sub        a1, a0
                  c.mv         a6, s5
                  c.addi16sp   sp, -16
                  mul          t0, a1, t6
                  bltu         s2, s2, 4285f
                  blt          s7, a7, 4290f
                  add          s5, s10, a6
                  bge          t0, s7, 4284f
                  ori          t4, t1, -778
                  bltu         s8, t1, 4295f
                  bne          a1, t1, 4290f
                  bltu         zero, s10, 4299f
                  mul          s1, s3, ra
4284:             xor          a1, t2, t1
4285:             mulhsu       tp, a6, ra
                  c.mv         ra, t1
                  c.mv         s3, s4
                  rem          s8, t4, s4
                  divu         a0, t2, s4
4290:             srli         a7, a4, 12
                  c.xor        a5, a1
                  nop
                  rem          t4, s4, tp
                  c.add        t4, t6
4295:             c.slli       t2, 17
                  auipc        a6, 736082
                  slti         a2, s10, -172
                  bge          a6, ra, 4314f
4299:             c.slli       tp, 31
                  add          zero, a7, t1
                  sra          tp, gp, a0
                  divu         a3, sp, gp
                  bgeu         a1, a3, 4311f
                  sub          a7, a5, s7
                  mulhsu       s3, t6, t2
                  c.addi16sp   sp, 496
                  and          gp, t0, s7
                  c.slli       gp, 14
                  sltiu        a0, ra, -62
                  xor          a5, s10, t1
4311:             c.bnez       a5, 4326f
                  nop
                  c.addi       t1, 9
4314:             c.beqz       a5, 4318f
                  c.beqz       s1, 4330f
                  c.add        s10, a4
                  sltiu        s11, s3, -1166
4318:             srai         a1, s1, 28
                  sltu         gp, s11, s8
                  andi         t0, tp, 895
                  c.andi       a2, 31
                  add          s10, s4, s7
                  c.srli       a4, 23
                  rem          t4, a2, t2
                  srai         t2, t6, 24
4326:             c.li         s0, -1
                  slti         s3, s7, -1219
                  mul          t4, s10, s2
                  sra          a4, ra, tp
4330:             div          s8, a4, s11
                  div          t3, a0, sp
                  beq          a2, s9, 4340f
                  c.sub        a2, a1
                  remu         s3, sp, s9
                  slli         a7, tp, 8
                  c.andi       a3, 18
                  and          s3, t4, gp
                  beq          t3, gp, 4342f
                  c.bnez       a2, 4347f
4340:             slli         s1, s5, 3
                  lui          s3, 868356
4342:             slt          s10, a6, s11
                  c.sub        s0, s0
                  slti         s0, zero, 1631
                  bge          s3, a0, 4350f
                  andi         s7, a2, -1491
4347:             beq          sp, a3, 4361f
                  srl          s7, t0, a6
                  addi         s5, s11, -566
4350:             sra          s3, a3, t5
                  bltu         t3, sp, 4362f
                  c.srai       a1, 11
                  srli         s7, s2, 21
                  c.srai       a0, 8
                  slt          gp, t3, s11
                  mul          tp, s9, t1
                  blt          s8, tp, 4362f
                  c.addi       t1, 3
                  div          s5, sp, s6
                  c.beqz       a0, 4374f
4361:             slti         ra, gp, 203
4362:             beq          t0, s11, 4366f
                  srai         ra, zero, 11
                  c.srli       a0, 2
                  div          s1, t5, sp
4366:             rem          a5, t1, a6
                  mul          ra, s1, gp
                  sub          s2, s1, s7
                  bge          a4, a0, 4380f
                  c.sub        a2, s1
                  c.beqz       a2, 4382f
                  mul          s3, zero, s9
                  xori         s3, t1, -975
4374:             srli         s10, s1, 24
                  slli         ra, zero, 4
                  addi         tp, s9, 568
                  slti         ra, s2, 592
                  bgeu         gp, a3, 4387f
                  slti         s1, s5, -859
4380:             c.lui        t1, 31
                  sub          a7, t1, sp
4382:             lui          a2, 1893
                  sltu         a6, t5, s8
                  c.addi16sp   sp, 16
                  divu         a7, a0, t3
                  rem          t2, zero, s7
4387:             bltu         a0, s4, 4395f
                  sra          s0, tp, s5
                  sub          t1, s10, tp
                  c.slli       s7, 25
                  divu         a3, t2, s7
                  c.xor        s1, a0
                  mulhu        s3, t2, t5
                  sra          s3, s0, a3
4395:             mulh         a1, s1, s0
                  bne          s4, s7, 4404f
                  beq          s11, t1, 4408f
                  mulhsu       s5, a7, a6
                  beq          s10, s0, 4408f
                  c.mv         a3, ra
                  auipc        t5, 160408
                  c.sub        a2, a5
                  lui          a4, 787175
4404:             lui          s11, 195312
                  sra          gp, a3, s2
                  sub          s2, tp, s10
                  c.nop
4408:             slli         s7, t5, 11
                  sll          a5, a7, zero
                  auipc        s2, 682948
                  auipc        tp, 302620
                  lui          a4, 368941
                  c.and        a0, a3
                  rem          zero, s7, a7
                  blt          ra, a1, 4431f
                  c.addi16sp   sp, -16
                  or           s5, a2, s10
                  srl          s3, sp, zero
                  remu         a1, t3, ra
                  div          a7, a4, s4
                  ori          sp, a7, 1994
                  c.andi       a1, -1
                  xori         a1, t5, 1463
                  mulhu        a3, a4, sp
                  bgeu         s11, a2, 4442f
                  c.addi16sp   sp, -16
                  mul          gp, a5, tp
                  mulh         t1, s8, t6
                  slli         s3, a1, 21
                  andi         gp, s5, 285
4431:             slt          zero, t2, s11
                  lui          gp, 618464
                  c.sub        s1, a0
                  bltu         a0, t6, 4439f
                  c.srai       s1, 30
                  lui          t4, 471376
                  slti         s1, ra, 429
                  slli         a2, a5, 5
4439:             nop
                  sub          a6, s10, sp
                  c.srai       a4, 31
4442:             and          t3, t0, t4
                  auipc        gp, 565340
                  c.add        t1, s2
                  c.addi4spn   s0, sp, 96
                  c.addi16sp   sp, -16
                  c.srli       s0, 3
                  andi         s8, a1, -589
                  c.addi       a1, 31
                  slt          t5, zero, s8
                  nop
                  c.addi16sp   sp, -16
                  sra          a6, s2, ra
                  nop
                  sra          t0, a2, s10
                  divu         ra, zero, t2
                  sltiu        a1, zero, 1568
                  c.nop
                  srai         gp, t6, 25
                  slli         a5, gp, 25
                  c.bnez       a0, 4467f
                  sub          s3, a0, a0
                  c.xor        a0, a2
                  sltu         t4, a1, s2
                  divu         t0, a5, a4
                  sub          s3, t2, t5
4467:             blt          s3, s9, 4477f
                  c.or         a5, a0
                  sltiu        zero, s1, -312
                  c.srli       a5, 25
                  xori         a7, t3, 967
                  beq          gp, s7, 4486f
                  rem          s3, a0, a6
                  c.xor        a0, a4
                  c.lui        tp, 21
                  c.sub        a0, a0
4477:             beq          t1, t5, 4485f
                  sub          a1, a6, sp
                  lui          sp, 506923
                  c.nop
                  srl          tp, s2, s10
                  slti         s3, ra, 1821
                  remu         a3, a2, ra
                  c.andi       a2, -1
4485:             lui          s8, 379138
4486:             mulhu        a2, t6, a4
                  slti         t3, s11, 2038
                  sltu         s1, s8, a0
                  sltu         tp, a1, a7
                  la           t0, region_0+1295 #start riscv_hazard_instr_stream_18
                  lb           s0, -48(t0)
                  c.addi       s0, -1
                  nop
                  c.and        s0, a2
                  lb           a6, -56(t0)
                  lhu          s0, 45(t0)
                  lb           s0, -22(t0)
                  srai         s0, a2, 27
                  add          tp, a5, a2
                  andi         zero, a5, 714
                  sb           s0, -12(t0)
                  c.mv         a5, a6
                  lui          a5, 657803
                  lh           zero, 29(t0)
                  srli         a6, a2, 27
                  lbu          a6, 5(t0)
                  lbu          a6, -26(t0)
                  lui          zero, 366028
                  lw           tp, -31(t0)
                  slti         a2, tp, 57
                  nop
                  lbu          a5, -51(t0)
                  lb           s0, 18(t0)
                  lbu          tp, -3(t0)
                  sb           tp, 52(t0)
                  sltu         s0, a6, s0
                  mul          a5, a2, a2
                  lb           zero, -8(t0)
                  c.srli       s0, 26
                  slt          zero, a5, s0
                  c.srai       a2, 2
                  c.or         a2, a5
                  lb           tp, -52(t0)
                  andi         tp, zero, 362
                  lb           a6, -23(t0)
                  mul          zero, s0, a2
                  lb           tp, 31(t0)
                  lhu          s0, 51(t0)
                  c.li         a5, 25
                  sb           a2, -60(t0) #end riscv_hazard_instr_stream_18
                  c.beqz       a0, 4500f
                  remu         a6, s6, t4
                  addi         a7, a4, -957
                  mulhsu       sp, s4, s0
                  c.lui        s8, 6
                  nop
                  sll          s10, tp, t5
                  c.addi       s2, 31
                  c.xor        a3, a1
                  mul          a5, gp, t5
4500:             rem          s1, s5, a4
                  sub          zero, a1, t0
                  c.and        a0, a5
                  div          t1, s9, a1
                  srai         a2, gp, 4
                  slti         t6, t5, -1510
                  remu         t3, s6, ra
                  sra          t2, ra, s6
                  sub          s2, s0, t4
                  auipc        a5, 814090
                  c.and        a1, a1
                  ori          a6, sp, 1378
                  c.mv         t4, s3
                  xor          s5, a0, a5
                  ori          t3, ra, -1302
                  auipc        s3, 554033
                  c.add        a4, a4
                  divu         s0, a1, gp
                  add          a1, s5, s2
                  or           t5, s3, tp
                  bge          sp, a5, 4524f
                  lui          t5, 34997
                  c.mv         t5, s7
                  bltu         a3, a5, 4527f
4524:             c.xor        s0, a1
                  bgeu         t2, s0, 4536f
                  c.or         a0, a5
4527:             bltu         t5, t6, 4542f
                  c.mv         a7, s5
                  c.and        a1, a1
                  mulh         a6, s8, s8
                  c.addi16sp   sp, -16
                  addi         s11, zero, -9 #init loop 1 counter
                  addi         s5, zero, -18 #init loop 1 limit
sub_3_152_1_t:    auipc        a0, 52215
                  addi         s11, s11, -3 #update loop 1 counter
                  addi         s0, zero, -10 #init loop 0 counter
                  addi         zero, zero, 0 #init loop 0 limit
sub_3_152_0_t:    c.xor        a3, a3
                  addi         s0, s0, 10 #update loop 0 counter
                  c.bnez       s0, sub_3_152_0_t #branch for loop 0
                  beq          s11, s5, sub_3_152_1_t #branch for loop 1
                  mulhu        t4, t0, t3
                  c.srai       a3, 3
                  c.slli       a0, 25
                  xor          zero, s8, a1
                  c.sub        a1, a1
4536:             bge          t0, s9, 4550f
                  bltu         gp, s4, 4554f
                  xori         t3, a5, 361
                  c.and        a1, a2
                  c.xor        s1, a4
                  slt          a1, s7, s10
4542:             bne          a7, a7, 4557f
                  sll          zero, s4, t3
                  srai         a4, t6, 4
                  beq          t4, zero, 4558f
                  xori         zero, t2, 1545
                  bgeu         a0, a7, 4562f
                  or           s3, t0, gp
                  blt          a5, a0, 4552f
4550:             mulh         s0, t0, a5
                  sub          s5, a4, a2
4552:             add          s1, a2, s3
                  c.nop
4554:             remu         t0, s3, s6
                  andi         t1, s9, -1386
                  bne          tp, s10, 4575f
4557:             c.or         a5, a5
4558:             bltu         s6, t2, 4573f
                  remu         a1, s4, s4
                  c.beqz       s0, 4571f
                  srli         a5, s5, 15
4562:             mulhu        t4, zero, a1
                  c.lui        t1, 24
                  c.srli       s1, 23
                  c.addi16sp   sp, -16
                  ori          a0, a2, -1013
                  lui          t0, 269742
                  sltu         s8, sp, tp
                  c.beqz       a3, 4580f
                  c.li         a3, -1
4571:             lui          gp, 580048
                  sltu         s2, a4, gp
4573:             lui          a3, 733087
                  c.addi4spn   a0, sp, 688
4575:             c.addi       a4, 3
                  addi         a6, ra, -24
                  mul          tp, a2, t0
                  mulhu        ra, gp, a2
                  c.addi4spn   s1, sp, 16
4580:             c.addi4spn   a4, sp, 784
                  bltu         a6, gp, 4592f
                  srai         a0, s10, 5
                  c.addi4spn   a0, sp, 928
                  xori         a4, t4, 1622
                  c.add        s1, a5
                  sll          s1, s3, s5
                  or           s3, s6, t1
                  c.addi       a3, -1
                  addi         gp, s7, -1064
                  sll          s3, s11, a7
                  divu         a0, s10, a2
4592:             addi         t5, s6, 990
                  bne          a7, t2, 4603f
                  xor          a2, t4, t0
                  srli         a1, s10, 20
                  addi         s11, a0, 490
                  c.srai       s1, 22
                  c.li         s11, 3
                  slti         a7, s7, -594
                  srl          s2, s3, a0
                  c.sub        a4, a5
                  blt          t0, s9, 4607f
4603:             bne          zero, a4, 4613f
                  c.sub        a2, a4
                  bge          s4, t4, 4619f
                  and          t6, a5, s1
4607:             c.beqz       s0, 4620f
                  slt          t6, s1, a3
                  remu         s11, t1, a0
                  c.lui        s7, 22
                  c.add        t5, s4
                  c.lui        tp, 18
4613:             c.or         s0, s1
                  add          t6, a5, s3
                  mulhu        s11, s2, s6
                  lui          a2, 194833
                  c.lui        a7, 21
                  c.slli       t3, 20
4619:             c.slli       t3, 10
4620:             bge          a2, s8, 4636f
                  mulh         a2, a3, s7
                  remu         s2, s9, tp
                  addi         t4, t1, 1412
                  divu         gp, s3, gp
                  remu         s0, t2, s2
                  sll          gp, a3, a5
                  c.mv         ra, s2
                  divu         s8, zero, s2
                  or           t0, s0, a1
                  slli         a5, a6, 4
                  c.sub        a2, a1
                  blt          s7, tp, 4640f
                  c.and        a4, a2
                  c.srli       s0, 14
                  add          t3, t5, s11
4636:             slli         a2, s9, 1
                  beq          s8, sp, 4641f
                  c.andi       a1, -1
                  c.beqz       s0, 4645f
4640:             c.add        sp, a7
4641:             c.or         a1, a3
                  lui          s10, 447687
                  addi         a6, t1, -557
                  srai         s3, a5, 31
4645:             bge          s10, t6, 4648f
                  blt          tp, t1, 4661f
                  c.li         s3, -1
4648:             c.bnez       a1, 4659f
                  nop
                  la           a5, region_1+1340 #start riscv_load_store_hazard_instr_stream_9
                  slti         a2, t0, -1423
                  lbu          s3, -43(a5)
                  lbu          s2, -43(a5)
                  sb           a3, -43(a5)
                  sra          a2, s9, t0
                  lb           tp, 69(a5)
                  c.srai       a4, 13
                  lb           t6, -239(a5)
                  sh           s7, 138(a5)
                  lbu          t3, -7(a5)
                  c.slli       sp, 7
                  lb           gp, 44(a5)
                  sh           a2, 44(a5)
                  lw           a2, -180(a5)
                  sb           zero, 253(a5)
                  lbu          a6, 253(a5)
                  sb           s3, 253(a5)
                  sw           a5, -160(a5) #end riscv_load_store_hazard_instr_stream_9
                  divu         ra, s7, a3
                  c.xor        a3, a1
                  or           s2, t1, s3
                  c.addi       t4, 6
                  c.srli       a3, 24
                  c.bnez       a5, 4672f
                  c.bnez       s1, 4660f
                  xor          s8, sp, tp
                  bne          s7, t1, 4662f
4659:             slli         a6, a7, 9
4660:             or           t2, s4, a0
4661:             c.bnez       a2, 4676f
4662:             c.addi       a7, 13
                  c.or         s0, a1
                  c.beqz       a0, 4673f
                  bge          s6, t4, 4673f
                  bltu         tp, a2, 4681f
                  or           t6, a5, s3
                  c.mv         sp, s10
                  sub          s3, s5, a7
                  blt          s6, s10, 4689f
                  c.xor        a3, a0
4672:             and          t4, s8, a4
4673:             slti         a2, s5, 2034
                  c.add        a6, a2
                  bge          s5, s10, 4684f
4676:             mulhsu       tp, a5, a7
                  c.xor        a5, a1
                  srl          a3, s6, s0
                  xori         t2, t3, -274
                  rem          s5, t6, tp
4681:             lui          gp, 324938
                  c.slli       t1, 6
                  c.addi4spn   s1, sp, 480
4684:             ori          sp, t5, -1678
                  c.nop
                  srli         a3, a7, 9
                  nop
                  srai         a0, tp, 21
4689:             rem          s11, s1, a4
                  mul          s8, s9, s2
                  xori         s2, t3, -804
                  slli         t0, t5, 11
                  srai         a6, a0, 10
                  xor          s7, a3, s1
                  c.mv         a4, s4
                  mulh         a3, a5, s10
                  c.mv         s3, s0
                  mulhsu       s7, s5, s6
                  remu         t0, s6, s11
                  c.addi4spn   a5, sp, 880
                  slt          s10, s6, s1
                  c.and        a1, a3
                  c.addi4spn   a2, sp, 880
                  bge          a0, s6, 4709f
                  srl          a6, s8, s4
                  addi         a0, a1, -1524
                  c.add        a7, a1
                  slti         a7, a4, 345
4709:             nop
                  c.sub        a3, s0
                  and          a0, a7, gp
                  beq          ra, s10, 4727f
                  div          t1, s0, s3
                  c.slli       a2, 10
                  slt          t2, t2, s7
                  c.addi4spn   s1, sp, 608
                  auipc        zero, 506595
                  slt          s0, t0, a4
                  andi         sp, gp, 333
                  sltiu        a0, s0, -532
                  rem          a2, t4, s8
                  c.addi16sp   sp, -16
                  c.and        a3, a1
                  addi         t6, s9, 1570
                  addi         s10, a2, 178
                  mulh         t1, a2, zero
4727:             c.nop
                  c.andi       a5, -1
                  bltu         a2, zero, 4746f
                  c.and        s0, a4
                  xori         t4, t0, -1297
                  nop
                  ori          a2, s1, 365
                  auipc        s11, 474966
                  c.sub        s0, s1
                  and          a1, zero, t0
                  c.addi4spn   a1, sp, 96
                  srli         a1, t1, 14
                  srli         a3, s11, 25
                  sra          gp, a6, s5
                  slli         t1, a3, 19
                  c.addi4spn   a0, sp, 656
                  blt          s7, t6, 4751f
                  sltu         s0, tp, a1
                  c.add        sp, s10
4746:             c.nop
                  c.and        s1, a5
                  c.or         s0, s0
                  slti         a1, t2, -1835
                  xor          a3, s4, t1
4751:             srli         t5, s8, 17
                  lui          ra, 855286
                  xor          t6, s9, t1
                  or           sp, s4, a6
                  bne          s3, s8, 4769f
                  divu         s11, a2, s6
                  or           t4, s7, a4
                  c.srli       a4, 21
                  c.add        ra, a5
                  nop
                  bge          a6, sp, 4775f
                  c.sub        a4, s0
                  andi         t6, gp, -1157
                  xori         a1, a2, 336
                  c.mv         s0, t2
                  bge          s4, t3, 4774f
                  sltu         t2, a5, s1
                  c.nop
4769:             c.addi4spn   s0, sp, 816
                  bge          s10, a5, 4785f
                  c.xor        s1, a1
                  div          a2, zero, s5
                  rem          s11, a6, tp
4774:             c.sub        a3, a5
4775:             add          a0, t0, a3
                  andi         t6, a4, -1253
                  slli         a0, s9, 19
                  mulh         a5, s6, t0
                  blt          t1, t1, 4796f
                  srli         tp, t6, 21
                  lui          s7, 541163
                  srli         s3, a5, 18
                  bltu         t0, a1, 4793f
                  xor          t2, a7, tp
4785:             c.xor        a1, a5
                  bge          t3, s0, 4802f
                  ori          gp, a0, -1338
                  bne          s8, t3, 4802f
                  c.srai       a5, 22
                  mulh         s5, t3, a4
                  xori         s5, sp, 1816
                  c.sub        a5, a0
4793:             mul          s8, s3, s3
                  beq          a4, s6, 4802f
                  div          t5, s10, s9
4796:             srl          zero, t6, s6
                  srai         gp, s9, 7
                  c.and        a2, a4
                  srai         s0, gp, 14
                  c.srli       a5, 31
                  c.andi       a1, 16
4802:             andi         t1, t0, -235
                  lui          a1, 837434
                  andi         s8, a0, -1316
                  blt          a3, s10, 4820f
                  sll          a3, s0, t4
                  slti         t5, s4, 1393
                  sub          t5, t3, zero
                  srai         t1, zero, 6
                  sll          t4, s0, sp
                  or           a0, t3, s2
                  slti         s1, gp, 405
                  c.mv         t1, t4
                  bne          s1, a4, 4825f
                  remu         a1, a5, a6
                  ori          s3, s6, -1406
                  c.xor        a5, s1
                  mulhu        t1, s9, s9
                  c.li         t4, 27
4820:             c.srli       a3, 4
                  c.lui        t6, 10
                  and          s7, zero, a3
                  add          a4, s8, zero
                  and          s10, s6, t4
4825:             c.andi       s1, -1
                  andi         a6, s1, 406
                  c.lui        s2, 15
                  srai         t2, t0, 31
                  c.li         t4, 12
                  bgeu         sp, t3, 4849f
                  sra          a2, t2, s3
                  and          t2, a0, a1
                  xori         t6, a4, -743
                  c.and        a3, a1
                  mulhu        a7, t0, s11
                  xor          s11, a0, sp
                  add          t1, ra, s6
                  srli         gp, s7, 8
                  slli         t5, s8, 24
                  rem          s1, a6, zero
                  sub          a5, s8, s3
                  beq          tp, s11, 4855f
                  c.bnez       a3, 4851f
                  and          a2, s11, s1
                  srl          a3, s9, a3
                  c.xor        s0, a5
                  or           s1, a6, t3
                  slti         a1, a0, -227
4849:             c.addi4spn   s0, sp, 304
                  addi         a3, a7, -114
4851:             c.or         a0, a3
                  c.addi16sp   sp, -16
                  mulh         s5, t3, a4
                  slti         s10, a2, -291
4855:             xor          a5, s0, a5
                  sltu         t0, t4, a0
                  c.andi       a0, -1
                  c.sub        s1, a2
                  c.and        a3, a4
                  add          s5, s5, t6
                  nop
                  c.and        s1, a4
                  sltu         t1, t6, s6
                  c.addi16sp   sp, -16
                  c.nop
                  srli         a0, s11, 25
                  auipc        a4, 46053
                  slti         s2, a4, 2004
                  and          s0, s10, t6
                  sll          a4, a3, s1
                  ori          t5, t5, -382
                  slt          a6, t2, s5
                  bge          tp, t6, 4879f
                  auipc        s3, 23929
                  sub          a6, s7, s7
                  mulhu        t4, t1, tp
                  c.beqz       s0, 4891f
                  c.srai       a4, 19
4879:             andi         a0, a5, 61
                  c.slli       s0, 24
                  c.slli       sp, 9
                  mul          a7, s6, s1
                  c.addi4spn   a5, sp, 464
                  nop
                  c.addi4spn   s0, sp, 304
                  slli         s7, s1, 3
                  div          a6, s9, t2
                  addi         a2, s8, -1402
                  auipc        tp, 737638
                  sltiu        s7, t4, 1603
4891:             c.li         s0, -1
                  div          a6, tp, sp
                  c.and        s1, a0
                  bne          tp, s1, 4904f
                  c.addi       a0, 7
                  addi         tp, s11, -966
                  div          t2, t3, t1
                  rem          s7, a1, s4
                  sltiu        gp, a5, 694
                  slli         a3, a5, 14
                  c.li         s5, -1
                  c.li         gp, -1
                  srli         s7, t1, 19
4904:             add          a1, gp, t2
                  slti         a0, a7, 1447
                  c.sub        s1, a0
                  srl          a5, t4, s4
                  c.nop
                  sltiu        t6, tp, 1595
                  bne          a0, s2, 4914f
                  srli         a3, t1, 5
                  divu         a5, s5, s2
                  add          s5, t4, sp
4914:             bltu         t2, s4, 4929f
                  bne          a5, a4, 4919f
                  c.add        s10, s11
                  slti         t2, t1, 366
                  c.xor        a4, s0
4919:             remu         ra, s3, a7
                  andi         sp, s3, -109
                  xor          s0, s7, s7
                  c.xor        a5, a2
                  c.or         a2, a1
                  beq          s5, s1, 4928f
                  c.lui        s2, 3
                  c.andi       a0, -1
                  lui          t5, 528823
4928:             rem          gp, t6, gp
4929:             c.addi       s7, 4
                  bne          s4, t6, 4941f
                  bltu         a7, a2, 4942f
                  blt          s6, a6, 4941f
                  la           ra, region_1+450 #start load_store_instr_stream_0
                  la           s10, region_0+1684 #start load_store_instr_stream_1
                  sb           a7, 1523(ra)
                  sw           s3, 48(s10)
                  sb           a7, -61(ra)
                  sh           a3, 940(ra)
                  sh           t3, 50(s10)
                  lbu          t6, 953(ra)
                  lb           s5, 378(ra)
                  sh           tp, 2(s10)
                  lh           t5, -28(s10)
                  lbu          t1, 919(ra)
                  sb           s0, 26(s10)
                  lb           tp, 14(s10)
                  lw           t2, 750(ra)
                  sb           t5, -247(ra)
                  lbu          t3, 29(s10)
                  lbu          a6, 17(s10) #end load_store_instr_stream_1
                  lb           a3, -349(ra)
                  sb           ra, 535(ra) #end load_store_instr_stream_0
                  mul          t1, s2, a2
                  c.andi       a4, 3
                  c.li         tp, -1
                  bltu         s0, s6, 4951f
                  bne          a1, t6, 4942f
                  remu         t0, ra, s5
                  c.addi16sp   sp, -16
                  slt          t0, a1, a3
4941:             c.lui        s3, 31
4942:             or           t0, s6, a7
                  c.lui        gp, 22
                  c.nop
                  c.addi16sp   sp, 16
                  c.addi4spn   a0, sp, 608
                  bge          a6, s1, 4956f
                  c.addi       s11, -1
                  blt          t5, s8, 4954f
                  add          t3, s6, s3
4951:             c.mv         t1, a5
                  c.bnez       a3, 4955f
                  c.mv         a4, s10
4954:             c.beqz       a3, 4965f
4955:             srl          a0, s0, ra
4956:             divu         s0, a2, s7
                  bltu         a7, a3, 4974f
                  xor          a7, s11, s8
                  c.andi       a4, 28
                  bgeu         s11, ra, 4974f
                  srl          t6, ra, s3
                  bge          zero, a6, 4973f
                  slt          t5, t1, t4
                  c.addi16sp   sp, 160
4965:             lui          tp, 443445
                  add          s8, a5, a4
                  bgeu         s9, s2, 4971f
                  sra          s0, t4, a2
                  c.addi       s8, -1
                  lui          ra, 54054
4971:             c.lui        a7, 9
                  c.mv         gp, s2
4973:             sra          a4, t4, t0
4974:             blt          s1, s11, 4979f
                  bne          a6, s9, 4983f
                  c.or         s0, a3
                  ori          s5, t3, -68
                  or           a7, a2, a5
4979:             xor          s2, s4, a3
                  div          s10, sp, s2
                  c.and        a1, a5
                  sra          a3, a5, gp
4983:             divu         s2, ra, s10
                  sra          s10, s0, a6
                  add          s1, s2, s2
                  remu         s10, s0, a3
                  c.srli       a2, 12
                  c.mv         tp, s9
                  c.mv         a0, s8
                  and          s7, zero, gp
                  srl          t6, t3, s3
                  sub          t3, s6, s3
                  c.srli       s0, 19
                  c.andi       a1, 14
                  sub          zero, a3, gp
                  divu         a1, s1, s7
                  divu         ra, a3, s3
                  ori          t6, a5, 1083
                  div          a0, a2, ra
                  auipc        t3, 718274
                  c.bnez       a5, 5009f
                  auipc        s5, 27663
                  mulhu        t3, t0, t0
                  ori          t3, s7, 147
                  c.xor        a0, a2
                  sub          t5, s11, s1
                  mulhu        s2, a7, a2
                  srl          tp, a4, s4
5009:             c.lui        ra, 3
                  xori         s1, s1, 655
                  c.srai       s0, 2
                  c.add        gp, a0
                  blt          gp, s7, 5032f
                  slli         a2, t0, 3
                  andi         a3, s3, 1682
                  c.srli       s0, 1
                  and          t3, a2, s1
                  remu         t5, t5, t6
                  c.mv         t4, a5
                  xori         sp, t2, 775
                  c.xor        a5, s0
                  bne          s8, s0, 5032f
                  srli         ra, s4, 4
                  div          a5, s3, s0
                  slli         t2, a6, 15
                  beq          t2, zero, 5041f
                  c.nop
                  bgeu         t2, gp, 5039f
                  c.lui        a7, 17
                  srl          a3, a2, s2
                  sra          a2, s5, s0
5032:             mulhsu       s7, sp, a0
                  slt          ra, s0, tp
                  lui          a6, 390867
                  c.slli       s7, 28
                  c.srai       a4, 8
                  c.addi       a5, -1
                  c.srai       a2, 5
5039:             rem          a2, a1, t6
                  slti         t3, s9, 872
5041:             c.srli       s0, 3
                  srai         t3, t0, 28
                  mul          a4, ra, t0
                  c.add        t5, gp
                  c.xor        a3, a3
                  sll          t0, ra, a6
                  beq          tp, s10, 5062f
                  c.addi       t3, -1
                  lui          a6, 334954
                  bge          t5, a4, 5064f
                  nop
                  c.addi4spn   a2, sp, 112
                  c.srai       a2, 16
                  or           s11, s10, ra
                  c.or         a5, a1
                  c.xor        a2, a0
                  srai         s5, t1, 9
                  c.or         a2, a4
                  c.nop
                  c.lui        s7, 8
                  c.lui        s7, 26
sub_3_61:         jal          ra, 11f
0:                jal          ra, 15f
1:                c.jal        9f
2:                c.j          0b
3:                c.j          10f
4:                jal          sp, 21f
5:                c.j          14f
6:                c.jal        8f
7:                c.jal        5b
8:                jal          ra, 13f
9:                jal          s0, 17f
10:               jal          s11, 16f
11:               c.j          1b
12:               jal          t1, 7b
13:               c.jal        20f
14:               jal          t1, 4b
15:               jal          s2, 3b
16:               c.jal        6b
17:               c.jal        2b
18:               c.jal        19f
19:               c.jal        12b
20:               c.j          18b
21:               sltiu        s7, s10, 1804
5062:             sltu         a6, tp, s2
                  bne          s5, s0, 5080f
5064:             c.and        a3, a1
                  ori          t0, a2, 1220
                  c.add        s10, t4
                  c.mv         s5, s5
                  c.andi       s0, -1
                  bgeu         tp, t5, 5084f
                  c.sub        a5, a1
                  c.lui        t0, 18
                  sra          t0, t3, s3
                  c.addi16sp   sp, -16
                  xori         a7, a0, -1327
                  c.srli       a4, 13
                  mulhu        s7, tp, ra
                  divu         a6, t2, a6
                  c.add        a3, a2
                  c.bnez       a1, 5083f
5080:             c.nop
                  c.mv         s1, t2
                  c.srai       a2, 18
5083:             c.andi       a0, 3
5084:             sltu         a2, s10, t6
                  c.slli       t0, 11
                  slti         s0, s11, 1191
                  blt          gp, t5, 5102f
                  beq          s0, a6, 5093f
                  srli         t2, ra, 19
                  add          t4, sp, sp
                  slli         sp, t6, 8
                  c.addi4spn   a0, sp, 480
5093:             and          t6, gp, s0
                  mulhu        a5, t1, s5
                  ori          s10, s0, 327
                  c.addi4spn   a0, sp, 368
                  c.slli       a7, 24
                  c.sub        a4, a2
                  srl          s7, t4, a0
                  c.beqz       a1, 5111f
                  c.add        s8, s7
5102:             c.li         t0, 14
                  bne          a4, t4, 5109f
                  div          a3, gp, gp
                  mulhsu       a0, a0, t1
                  c.addi4spn   s0, sp, 464
                  div          gp, s9, s7
                  rem          s0, s11, a6
5109:             mul          a2, a2, t3
                  sltiu        a5, zero, -1850
5111:             ori          t3, ra, 906
                  sll          a7, t4, zero
                  slli         a7, s11, 3
                  c.xor        a0, a3
                  c.sub        a3, a5
                  bge          s8, s7, 5125f
                  sltu         tp, a6, s3
                  xor          t1, gp, s11
                  c.andi       s1, -1
                  slli         zero, t2, 17
                  blt          a0, a7, 5135f
                  c.and        a2, s1
                  c.add        a4, s4
                  add          a4, a2, sp
5125:             c.mv         s5, s8
                  nop
                  add          sp, t3, a2
                  slli         a3, s7, 31
                  sub          a7, s4, a0
                  c.bnez       a3, 5140f
                  c.or         a4, a4
                  beq          gp, s10, 5135f
                  c.lui        s5, 20
                  sub          s0, t6, a1
5135:             xor          zero, a3, s2
                  blt          t0, s5, 5145f
                  srai         t1, s9, 30
                  nop
                  bltu         s8, a3, 5147f
5140:             c.addi16sp   sp, 144
                  srli         t4, a3, 28
                  c.beqz       a4, 5146f
                  c.andi       s0, 4
                  c.add        tp, a5
5145:             sltu         tp, zero, a7
5146:             sltiu        t4, a1, -449
5147:             c.andi       a3, 5
                  andi         sp, s11, -1155
                  beq          t1, s7, 5165f
                  sltiu        a4, sp, -1118
                  andi         s2, t1, -1561
                  slti         zero, t4, 81
                  sra          t3, t2, s10
                  or           s1, t6, t6
                  bne          tp, t3, 5169f
                  rem          gp, s4, s3
                  slt          s0, a7, s10
                  c.nop
                  mul          s10, s7, t0
                  lui          t3, 783230
                  remu         a1, t2, t3
                  srai         a3, zero, 19
                  srli         sp, zero, 27
                  c.li         a4, -1
5165:             bge          s6, t1, 5182f
                  xori         t4, a1, 1683
                  mul          a7, zero, s11
                  c.mv         t5, a5
5169:             bltu         t1, sp, 5180f
                  mul          s0, sp, a5
                  c.addi       a1, 5
                  c.andi       s1, -1
                  addi         t5, a5, -1550
                  bge          gp, s3, 5187f
                  nop
                  srai         ra, sp, 7
                  c.or         a4, a2
                  sltiu        a4, s6, -56
                  divu         t2, a7, sp
5180:             blt          tp, t0, 5189f
                  lui          s10, 445242
5182:             bgeu         s11, t3, 5197f
                  c.xor        a5, s1
                  mulh         s11, s8, t4
                  sll          a3, s9, a1
                  slt          s8, a6, s6
5187:             c.or         a2, a4
                  add          tp, t0, s7
5189:             bgeu         ra, t1, 5192f
                  mulh         tp, s3, sp
                  c.addi16sp   sp, 192
5192:             sub          t6, tp, s9
                  c.addi16sp   sp, 304
                  bge          t3, a1, 5199f
                  c.xor        a5, a5
                  remu         zero, sp, s11
5197:             ori          t1, s8, 551
                  bgeu         a6, zero, 5212f
5199:             nop
                  c.bnez       a1, 5211f
                  c.and        s1, a5
                  bltu         zero, a6, 5210f
                  sltiu        s1, tp, -486
                  c.slli       a1, 11
                  addi         gp, s4, -1200
                  c.andi       s0, 8
                  addi         s1, tp, -1335
                  c.addi4spn   a1, sp, 896
                  divu         t4, s8, a2
5210:             sub          a4, s7, s3
5211:             or           zero, t5, t2
5212:             sltiu        s3, s11, 552
                  c.addi       t1, 9
                  c.li         a3, 17
                  c.srai       a3, 28
                  auipc        t2, 737515
                  c.xor        a3, s1
                  and          s8, s0, zero
                  auipc        t6, 402562
                  slti         a5, ra, -1287
                  c.beqz       a0, 5232f
                  c.srai       a0, 15
                  bge          a7, a2, 5237f
                  xor          t5, a3, a2
                  mulhu        a7, t6, t6
                  sll          ra, s8, s5
                  bgeu         s11, s8, 5237f
                  slti         s7, t0, 2021
                  div          s2, t2, sp
                  srl          t1, s4, a4
                  c.addi4spn   a2, sp, 400
5232:             c.slli       s2, 11
                  mulh         zero, t0, s10
                  sltiu        tp, s7, -249
                  c.mv         gp, ra
                  c.srai       a0, 29
5237:             bgeu         gp, t3, 5245f
                  c.li         tp, 28
                  c.addi16sp   sp, 192
                  srl          t2, t2, t4
                  blt          a6, s4, 5246f
                  or           s1, s3, tp
                  or           a6, t6, s3
                  srai         gp, tp, 0
5245:             slt          s2, s10, s10
5246:             slti         t6, t1, -2011
                  c.and        a4, s0
                  auipc        a2, 206511
                  lui          t6, 986865
                  c.sub        a3, s1
                  c.andi       a5, -1
                  ori          t0, sp, -213
                  bltu         s6, s5, 5267f
                  c.slli       s11, 5
                  sub          a4, a0, a0
                  c.mv         t0, s8
                  xori         zero, a6, 383
                  auipc        t6, 597777
                  add          s3, s1, t6
                  bltu         s6, zero, 5264f
                  c.sub        s0, a1
                  add          a1, t3, s7
                  sltu         gp, a2, s9
5264:             c.addi4spn   s0, sp, 1008
                  c.srai       a2, 12
                  sra          gp, s4, a0
5267:             slt          ra, a6, a3
                  sll          gp, a3, s10
                  mulhu        a0, s4, s10
                  bge          a0, s10, 5289f
                  c.beqz       s1, 5288f
                  mulhu        s7, s0, t5
                  c.bnez       a0, 5289f
                  slt          s3, t2, gp
                  sra          t1, s5, a3
                  sub          s8, s4, zero
                  bge          ra, s8, 5287f
                  c.srli       a5, 31
                  c.bnez       s1, 5288f
                  mul          a6, s5, t1
                  c.nop
                  rem          s8, t6, zero
                  c.srli       a0, 14
                  andi         s1, s2, -692
                  add          s3, s6, t3
                  slti         sp, a4, -1288
5287:             add          t4, s11, a0
5288:             c.nop
5289:             sub          s2, t3, t0
                  bne          zero, s10, 5305f
                  c.and        a2, a2
                  sra          s8, sp, sp
                  srli         ra, a5, 31
                  sll          a2, tp, a1
                  bgeu         t4, s7, 5303f
                  sll          a6, a5, s4
                  sra          tp, t6, s9
                  c.slli       s1, 11
                  bge          a5, a7, 5316f
                  blt          a0, t5, 5315f
                  div          s7, s11, a6
                  mul          t3, sp, tp
5303:             slli         a1, t5, 4
                  slli         a4, tp, 19
5305:             sll          s11, t2, sp
                  and          a3, a2, a4
                  div          s2, tp, s0
                  c.li         s8, -1
                  mul          s3, a5, s5
                  c.addi4spn   a2, sp, 176
                  c.nop
                  auipc        gp, 568432
                  c.andi       a0, 9
                  and          ra, s7, tp
5315:             c.or         a0, a3
5316:             ori          s1, a7, -1878
                  rem          s1, ra, s6
                  c.mv         a7, a6
                  mul          s1, a5, a4
                  mulh         s2, a4, t3
                  c.nop
                  bne          s7, t6, 5335f
                  lui          a6, 345408
                  auipc        a0, 891355
                  mulhsu       t0, s3, a1
                  xor          s1, t5, t0
                  c.xor        a4, a3
                  beq          s0, s7, 5343f
                  rem          t4, a3, t0
                  sll          a2, t5, a5
                  c.sub        a4, a1
                  xori         t6, a5, -539
                  c.beqz       a3, 5337f
                  c.and        a2, s0
5335:             or           s8, s1, s4
                  c.mv         s2, t3
5337:             c.andi       s0, 8
                  mulhu        a0, tp, s10
                  c.addi       sp, -1
                  andi         a6, t4, 1901
                  sltu         t6, a2, a7
                  addi         s8, t5, 283
5343:             lui          s7, 145698
                  c.and        a3, s1
                  ori          t3, s10, -462
                  div          s3, gp, a1
                  lui          t6, 615508
                  c.sub        a3, a0
                  auipc        a2, 667961
                  bltu         a4, t1, 5356f
                  bge          s9, a7, 5362f
                  beq          a3, s5, 5363f
                  c.srai       s0, 4
                  c.mv         a1, a4
                  sltu         s2, sp, a0
5356:             slt          s1, t3, s8
                  mulhsu       a3, t1, a6
                  c.mv         t1, a4
                  and          t0, s1, a1
                  or           s5, t6, a1
                  srl          s11, t2, s10
5362:             srli         s2, s5, 23
5363:             addi         a4, t0, 1136
                  sub          s2, s2, a0
                  c.add        a3, a2
                  and          t3, t1, t0
                  c.xor        s0, a3
                  srli         tp, s6, 2
                  c.lui        s10, 5
                  mulhu        a2, a3, s7
                  and          t4, tp, t2
                  mulhu        s3, a4, a1
                  c.nop
                  sra          s8, a7, zero
                  c.lui        t0, 4
                  rem          t0, s6, s8
                  la           s7, amo_0+40 #start riscv_lr_sc_instr_stream_8
                  srai         s2, a2, 2
                  srli         s0, zero, 30
                  mulh         t2, a3, t1
                  lr.w.rl       t4, (s7)
                  sc.w.aq       t1, a6, (s7) #end riscv_lr_sc_instr_stream_8
                  c.or         a0, a2
                  add          s11, s10, sp
                  divu         s10, ra, t1
                  slt          s0, gp, t2
                  c.nop
                  and          s7, s5, t2
                  srli         gp, s6, 13
                  sra          s11, a1, a2
                  xor          a4, a3, a4
                  rem          a4, s4, a1
                  add          zero, a4, a4
                  c.beqz       a2, 5392f
                  c.bnez       a4, 5403f
                  nop
                  c.srli       a5, 18
5392:             c.srli       s1, 17
                  c.nop
                  srl          a6, gp, s2
                  c.andi       a0, -1
                  c.srai       a5, 18
                  c.lui        t3, 31
                  addi         a5, zero, 527
                  mulhsu       a7, t1, s11
                  slli         s8, a0, 7
                  mulh         s3, a7, a7
                  ori          ra, a3, -1433
5403:             mulhsu       t4, s9, s6
                  xor          t5, s7, zero
                  remu         a6, t4, sp
                  mulh         zero, a7, s8
                  bltu         a2, a2, 5422f
                  sub          a1, s2, a4
                  lui          s8, 141421
                  c.li         s10, 28
                  blt          gp, s8, 5421f
                  c.srai       a3, 17
                  blt          s1, s2, 5430f
                  auipc        s11, 183208
                  sltiu        s8, a1, 1421
                  srl          a2, a1, a5
                  c.beqz       a3, 5432f
                  rem          tp, s8, s11
                  blt          a3, a4, 5428f
                  xor          a6, a1, zero
5421:             c.bnez       a1, 5426f
5422:             c.mv         t3, s1
                  and          a0, a1, a7
                  xor          sp, a1, gp
                  c.or         a5, a2
5426:             mul          s5, a2, a0
                  xor          a7, s8, t6
5428:             bltu         a2, s5, 5445f
                  lui          s11, 313903
5430:             bltu         a1, s4, 5441f
                  c.add        a5, ra
5432:             slti         t4, t0, 1714
                  ori          s8, t1, -1323
                  sra          a5, s8, s1
                  beq          gp, s9, 5454f
                  beq          tp, a3, 5442f
                  mulh         zero, s2, t4
                  ori          t1, s6, -665
                  bne          s1, s4, 5454f
                  c.andi       a5, -1
5441:             andi         a6, t5, -304
5442:             rem          t2, t3, a4
                  sltu         gp, gp, s8
                  sltiu        s3, s11, -217
5445:             c.and        a0, a4
                  c.and        a2, a3
                  c.mv         s5, s1
                  c.bnez       s1, 5458f
                  c.lui        s8, 4
                  c.addi16sp   sp, 32
                  c.lui        a2, 23
                  c.sub        a5, a0
                  c.andi       a1, 27
5454:             slli         a2, s3, 2
                  bltu         s4, s0, 5464f
                  c.or         a5, s1
                  divu         s0, s5, s0
5458:             div          s3, s1, a3
                  andi         a7, s8, 1270
                  div          a5, s0, s2
                  divu         t0, s2, a2
                  rem          s1, a3, s8
                  c.slli       gp, 16
5464:             c.beqz       s1, 5475f
                  sll          a5, s9, ra
                  mulhsu       ra, a7, sp
                  add          t3, a6, s0
                  divu         ra, s1, s0
                  ori          a5, sp, 1948
                  c.or         a3, a3
                  and          s3, s8, t1
                  sra          tp, sp, a4
                  c.lui        ra, 11
                  rem          s2, tp, t3
5475:             c.or         a4, a1
                  xori         ra, t0, -1614
                  andi         s7, s8, -801
                  mulh         sp, t5, t6
                  mulh         s11, s9, ra
                  sltu         sp, a3, s7
                  c.srli       a0, 19
                  and          a7, s9, a1
                  sltiu        a2, t2, -598
                  slti         s8, t6, -1549
                  srl          a0, zero, a4
                  c.addi       s5, 5
                  xori         t4, s4, 223
                  bltu         a7, s2, 5496f
                  c.addi4spn   a2, sp, 288
                  add          s5, a7, s11
                  c.slli       s0, 23
                  c.andi       a2, -1
                  la           sp, region_0+1245 #start riscv_load_store_rand_instr_stream_26
                  sub          s0, tp, a0
                  sb           gp, -371(sp)
                  addi         s7, s8, 986
                  sw           sp, 11(sp)
                  c.andi       s0, -1
                  sltiu        s5, s8, 1125
                  rem          a0, sp, zero
                  sh           ra, -765(sp)
                  c.or         a2, a2
                  and          gp, s10, tp
                  lb           zero, -708(sp)
                  lbu          a5, -187(sp)
                  lb           ra, -281(sp)
                  lhu          t2, 77(sp)
                  lbu          s5, 425(sp)
                  rem          a7, s10, s5
                  or           t4, zero, gp
                  lh           a5, -35(sp)
                  srli         tp, s2, 12
                  sb           t1, 352(sp)
                  slli         a1, a7, 4
                  div          a3, a1, s2
                  slti         s2, ra, 151
                  or           s3, s7, a0
                  c.and        a5, s1
                  slti         a3, t6, -1205
                  lb           t0, 308(sp)
                  sltiu        t3, t5, 863
                  lui          a0, 832386
                  andi         a0, ra, 1830
                  xor          a0, t2, a4
                  xori         t3, a0, -1281
                  mulh         ra, a7, a1
                  c.andi       a0, 3
                  srai         a6, zero, 30
                  lw           s2, 411(sp)
                  sh           t4, -289(sp) #end riscv_load_store_rand_instr_stream_26
                  srl          a4, s9, ra
                  sltiu        s7, s9, -22
                  andi         s5, sp, -434
5496:             c.srai       a4, 3
                  c.or         a0, a4
                  nop
                  c.xor        a3, a2
                  slti         a5, gp, -1461
                  sra          a1, a7, a4
                  bge          t2, s8, 5506f
                  ori          t1, sp, -953
                  mulhu        a1, a3, t3
                  andi         ra, s4, -1313
5506:             auipc        s11, 211139
                  c.lui        t6, 17
                  mul          s7, s6, a4
                  c.and        a2, a5
                  xori         s8, t0, -1080
                  auipc        s1, 474056
                  mulh         s8, a6, s3
                  xori         a6, s9, -688
                  c.andi       a5, 3
                  c.beqz       s0, 5520f
                  c.addi4spn   a4, sp, 864
                  xor          zero, a6, a1
                  rem          s0, t0, s0
                  c.slli       a0, 17
5520:             c.and        a3, a4
                  c.addi4spn   a4, sp, 160
                  srl          t3, s4, t6
                  c.xor        a1, s1
                  sltiu        a0, tp, 473
                  c.xor        a0, a4
                  c.srli       s0, 10
                  c.addi       sp, -1
                  c.addi16sp   sp, 336
                  lui          t6, 555864
                  c.or         a5, a1
                  sltiu        a6, s9, 1397
                  c.addi4spn   a2, sp, 336
                  srl          t1, a7, gp
                  c.bnez       a0, 5547f
                  c.srli       s0, 19
                  xor          s5, gp, a6
                  mulhu        tp, s5, zero
                  c.slli       a6, 7
                  srai         a2, t2, 3
                  c.addi16sp   sp, -16
                  remu         gp, t4, sp
                  slli         t3, s2, 3
                  lui          t4, 968312
                  add          s3, s0, tp
                  c.sub        a4, a5
                  bltu         ra, a4, 5557f
5547:             bne          s0, s11, 5550f
                  mul          t6, a6, s8
                  sltu         sp, ra, s8
5550:             c.add        s0, a7
                  remu         a3, zero, ra
                  xor          sp, a2, a7
                  rem          gp, a4, zero
                  c.li         s3, -1
                  srai         s7, t0, 25
                  c.addi4spn   s0, sp, 752
5557:             srai         a3, a7, 11
                  c.li         sp, 29
                  lui          t6, 1013452
                  c.or         a3, a5
                  xori         zero, a7, -1106
                  c.mv         s5, s7
                  c.li         s2, 6
                  sll          gp, gp, s2
                  sltu         a5, ra, ra
                  xori         s0, a6, 262
                  mulh         s1, t1, s10
                  slti         tp, t2, 1241
                  addi         t6, a4, -1662
                  lui          s2, 83755
                  blt          t6, sp, 5587f
                  sltiu        s11, a5, 389
                  bgeu         a4, a2, 5587f
                  and          t4, s6, a7
                  and          a0, a4, s0
                  c.lui        gp, 30
                  mulhu        t5, s11, s4
                  c.addi       s3, -1
                  mul          tp, t3, t4
                  or           a6, zero, s2
                  addi         t3, ra, -352
                  andi         a5, gp, -442
                  mul          a2, a6, s11
                  div          t0, t3, s0
                  and          t6, s10, s1
                  mulhu        a1, a1, t6
5587:             slli         s11, sp, 1
                  srli         t3, t4, 20
                  sltu         s1, t2, s7
                  rem          tp, a3, s9
                  srai         s7, s0, 22
                  beq          t2, s3, 5596f
                  lui          a6, 841116
                  c.add        t2, a1
                  or           s0, s11, s7
5596:             c.addi       a5, -1
                  mulhsu       s1, s5, t5
                  c.bnez       a1, 5612f
                  sltu         a7, s6, t4
                  addi         ra, a2, -1727
                  mulhu        t3, s6, s7
                  c.bnez       a0, 5606f
                  c.slli       t4, 17
                  sra          a3, s2, t6
                  bgeu         a5, s6, 5613f
5606:             mul          gp, s10, a5
                  c.bnez       a1, 5615f
                  and          tp, zero, s2
                  c.addi4spn   a3, sp, 672
                  srli         s11, gp, 4
                  blt          s2, a7, 5622f
5612:             remu         t6, sp, t2
5613:             andi         ra, ra, -1092
                  c.nop
5615:             c.nop
                  c.bnez       a5, 5631f
                  bltu         s5, s0, 5627f
                  c.srai       a0, 22
                  mul          a1, a2, s5
                  andi         a3, s0, -1049
                  c.lui        tp, 15
5622:             mul          s0, s2, a2
                  c.li         s3, -1
                  and          s8, a7, s6
                  auipc        a6, 198121
                  beq          t6, s10, 5642f
5627:             ori          s10, sp, -1080
                  c.beqz       a5, 5633f
                  c.nop
                  c.srai       a0, 25
5631:             c.addi16sp   sp, -16
                  andi         gp, zero, -1486
5633:             divu         s5, s2, ra
                  beq          s1, t2, 5649f
                  c.andi       s0, -1
                  slli         tp, a5, 21
                  blt          t6, s2, 5651f
                  slti         a4, s0, -1497
                  mulhsu       a7, s3, s11
                  addi         s2, ra, 347
                  sra          t2, gp, s5
5642:             c.addi4spn   a1, sp, 288
                  c.andi       s1, -1
                  bge          s0, s0, 5655f
                  bgeu         s10, s1, 5660f
                  c.addi4spn   a4, sp, 272
                  blt          a2, s11, 5655f
                  lui          s3, 843476
5649:             c.mv         s1, t3
                  beq          t2, a3, 5654f
5651:             c.lui        s8, 18
                  sltu         s11, a7, s7
                  c.addi       a5, 25
5654:             c.li         a7, 11
5655:             mulh         sp, t3, a0
                  slt          s1, zero, s10
                  c.add        t3, t4
                  mulhu        tp, s3, s2
                  remu         a2, sp, a5
5660:             slti         sp, t4, -1482
                  sub          a3, s10, t6
                  andi         t6, a4, 265
                  c.addi16sp   sp, 448
                  srl          a5, s11, s0
                  bge          s4, a2, 5668f
                  c.addi16sp   sp, -16
                  srli         sp, a7, 27
5668:             c.li         s7, -1
                  divu         a6, a0, s8
                  c.slli       a5, 13
                  andi         a2, t0, 534
                  sub          gp, t0, s9
                  mulhsu       t4, t1, ra
                  auipc        s0, 520425
                  c.and        a4, a4
                  c.xor        a4, a4
                  c.beqz       s0, 5687f
                  c.addi       a2, 3
                  c.mv         t5, a2
                  c.addi16sp   sp, 384
                  c.xor        a4, s0
                  bge          s7, s9, 5701f
                  add          t5, t0, a0
                  rem          s1, ra, s4
                  sltiu        s3, a7, -638
                  and          s7, t6, s2
5687:             mulh         s0, t5, t3
                  blt          a6, gp, 5705f
                  and          s5, t3, s3
                  beq          s4, s11, 5703f
                  sltu         sp, sp, sp
                  xor          s1, a0, s2
                  xor          t4, s6, t6
                  rem          gp, a7, s2
                  c.xor        s0, a1
                  beq          zero, s2, 5710f
                  mulh         ra, s6, s8
                  bge          t4, a1, 5709f
                  auipc        a5, 248610
                  c.mv         t3, a7
5701:             c.or         a5, a4
                  sub          t5, s4, a6
5703:             lui          t1, 543767
                  auipc        a6, 51384
5705:             c.lui        s7, 26
                  c.addi       s8, 18
                  srai         s3, a2, 16
                  sll          t3, s1, t2
5709:             blt          a3, t6, 5717f
5710:             sll          a0, t5, s5
                  sra          ra, t4, t5
                  blt          s5, t3, 5721f
                  sra          ra, a3, s11
                  sra          zero, s4, t2
                  divu         t0, a5, ra
                  c.andi       a4, 19
5717:             srl          s0, ra, s5
                  c.bnez       a1, 5732f
                  auipc        sp, 535106
                  sll          t1, t2, s1
5721:             c.li         a3, -1
                  c.li         t6, 22
                  sltiu        t0, t6, 1484
                  bge          ra, s10, 5728f
                  auipc        a5, 803532
                  sub          a3, s11, gp
                  c.and        a5, a1
5728:             add          tp, t6, s0
                  c.add        a3, t2
                  c.bnez       a5, 5736f
                  c.xor        a0, s0
5732:             mulhu        s1, t3, a1
                  slti         sp, a7, -1856
                  c.or         a2, a1
                  divu         t5, t1, t6
5736:             bne          zero, a3, 5753f
                  slli         t5, s9, 19
                  srli         s10, s0, 21
                  mul          t0, t3, t5
                  srai         a3, a1, 31
                  and          s10, s7, a0
                  sra          a2, s4, t3
                  c.andi       a3, -1
                  bne          a0, a3, 5755f
                  c.and        s1, a2
                  sltiu        s11, a4, -1082
                  div          s11, t1, s8
                  mulhsu       t5, t2, a0
                  xori         a6, t5, 327
                  srli         t4, zero, 14
                  auipc        a0, 381820
                  div          t2, t4, a1
5753:             c.beqz       a1, 5762f
                  c.slli       a0, 27
5755:             rem          ra, t4, s11
                  c.and        a5, a2
                  bltu         t6, s4, 5765f
                  divu         a2, s1, t5
                  sltiu        a5, t4, -1296
                  or           t5, a6, s6
                  srai         t2, a3, 23
5762:             c.addi16sp   sp, -16
                  bne          t2, a1, 5778f
                  rem          s7, a2, a7
5765:             sub          s1, gp, t2
                  auipc        s8, 678869
                  sltu         s1, zero, s1
                  sub          t4, a6, s6
                  c.bnez       s1, 5780f
                  bge          s7, s6, 5785f
                  bltu         a1, t1, 5775f
                  sltiu        tp, t5, 232
                  blt          t5, a5, 5778f
                  c.bnez       a3, 5778f
5775:             slti         a1, s9, -1726
                  andi         ra, s0, -1969
                  bgeu         s1, s10, 5794f
5778:             slti         tp, s2, 770
                  c.srai       s1, 6
5780:             auipc        a6, 87648
                  mulh         s8, a5, t3
                  sll          tp, gp, t5
                  c.bnez       a5, 5791f
                  nop
5785:             c.nop
                  div          s3, gp, s1
                  mulh         s2, s9, a0
                  mulhu        s2, a0, s8
                  bne          t3, a7, 5798f
                  div          a6, t0, s1
5791:             c.and        a0, a4
                  xor          a3, s3, t2
                  and          a7, a3, ra
5794:             bgeu         t2, s10, 5810f
                  ori          s11, s7, -408
                  c.slli       s0, 18
                  c.li         t4, 5
5798:             mulhu        a1, s9, s7
                  c.and        a4, s0
                  mul          s0, t5, gp
                  lui          s5, 386997
                  c.srli       a2, 25
                  or           a5, a1, t1
                  or           a4, a1, s1
                  xori         tp, tp, -1333
                  divu         t2, s6, t3
                  c.or         a2, a1
                  mulh         s11, a0, a0
                  sltiu        t2, s2, -1272
5810:             or           ra, sp, t2
                  xori         t4, t1, 424
                  ori          a7, s4, -1599
                  slli         s7, t3, 3
                  c.beqz       s0, 5818f
                  c.add        a5, a5
                  c.beqz       s1, 5821f
                  blt          a0, s1, 5834f
5818:             c.sub        a4, a0
                  c.addi16sp   sp, 176
                  c.mv         ra, t6
5821:             c.add        a0, s0
                  bne          t5, t3, 5837f
                  mul          s5, a1, a5
                  c.sub        a2, a1
                  mulh         s8, s9, a1
                  c.or         a1, a5
                  slt          t5, t0, s11
                  auipc        t4, 902218
                  or           a3, a0, zero
                  sra          a3, sp, gp
                  c.lui        s11, 3
                  c.bnez       s0, 5846f
                  andi         a1, s3, 1660
5834:             bge          s3, s0, 5844f
                  nop
                  mulhsu       a4, tp, s7
5837:             xori         t6, s7, 1104
                  nop
                  c.nop
                  c.bnez       a3, 5848f
                  sll          s1, s6, s11
                  nop
                  c.bnez       a5, 5862f
5844:             c.bnez       a2, 5848f
                  c.mv         a5, t0
5846:             add          t4, s7, sp
                  xor          t0, t3, t3
5848:             mulhsu       a6, s2, s2
                  div          a0, tp, a7
                  slti         s7, s0, 1257
                  nop
                  slli         ra, a0, 4
                  sltiu        a1, s8, 865
                  c.or         a0, s0
                  and          s2, a1, s4
                  sll          t1, a4, a0
                  c.add        s0, a5
                  c.srai       a2, 3
                  srl          a6, gp, tp
                  c.add        s5, a0
                  srl          s5, a5, tp
5862:             auipc        s3, 427724
                  mulhu        t3, t3, s1
                  blt          s10, a7, 5869f
                  c.sub        a3, a4
                  lui          a7, 745755
                  c.add        s5, a7
                  and          tp, gp, s6
5869:             andi         s3, t4, -1765
                  xor          t1, t5, s9
                  c.or         s0, a3
                  sltu         t1, t3, t5
                  slt          a5, a3, s11
                  c.beqz       a1, 5885f
                  sll          s11, t6, s0
                  c.srai       a4, 14
                  c.andi       s1, 2
                  c.srai       a2, 1
                  c.addi16sp   sp, -16
                  mulhu        t2, s8, a0
                  srli         a4, s0, 10
                  slt          a0, s3, t4
                  c.lui        t0, 26
                  c.srai       a5, 18
5885:             c.addi       s3, 15
                  xor          a3, t2, s5
                  srli         s5, sp, 15
                  rem          a3, s2, t5
                  sra          s0, s7, s5
                  bgeu         a3, a1, 5899f
                  c.or         a4, a5
                  c.addi4spn   a1, sp, 624
                  c.addi16sp   sp, 496
                  div          t0, sp, a7
                  or           s8, a5, a2
                  c.srai       s1, 15
                  srl          tp, t3, s1
                  mul          s3, t5, t0
5899:             c.addi4spn   s0, sp, 224
                  c.beqz       a5, 5913f
                  bltu         s8, s2, 5912f
                  c.li         a7, 20
                  rem          a0, s0, t3
                  c.sub        a5, a3
                  mul          a1, s11, t3
                  srai         s0, t3, 8
                  bgeu         s10, t4, 5922f
                  slt          a0, t0, zero
                  sra          s3, a6, s3
                  add          s0, s0, sp
                  c.lui        a2, 10
5912:             sltu         t2, a1, tp
5913:             c.lui        t1, 11
                  sltiu        t4, a0, -1683
                  c.bnez       a3, 5918f
                  mulhsu       s8, t3, a3
                  c.slli       a5, 24
5918:             bge          s1, t0, 5926f
                  slli         s2, gp, 5
                  add          t6, s1, s9
                  auipc        t2, 246375
5922:             sll          s0, s2, sp
                  slli         a2, s4, 18
                  add          gp, s9, s3
                  c.andi       a3, -1
5926:             c.lui        s1, 9
                  addi         t4, s0, -1440
                  bgeu         s8, s2, 5939f
                  c.xor        a3, a3
                  mulhu        a0, s5, s5
                  c.addi       sp, -1
                  auipc        s1, 845508
                  c.nop
                  sltiu        s5, s7, -1730
                  auipc        a0, 251588
                  auipc        t2, 682964
                  xor          s7, t5, s9
                  beq          s9, zero, 5944f
5939:             c.or         a1, s0
                  c.sub        s1, a5
                  srli         a5, s9, 5
                  mul          t1, a6, t0
                  srai         a5, a3, 8
5944:             c.lui        t6, 7
                  sra          s0, a0, zero
                  srli         t4, s9, 8
                  add          s11, s10, t6
                  srai         a3, s9, 9
                  addi         s11, sp, 152
                  c.mv         s8, t6
                  and          t5, t3, tp
                  srl          s3, s1, ra
                  c.add        s0, s1
                  c.and        a1, a4
                  sub          ra, s2, gp
                  nop
                  c.srai       s0, 28
                  bltu         t5, t6, 5972f
                  c.bnez       a1, 5974f
                  lui          t5, 653489
                  divu         s3, t5, a6
                  sra          s2, a5, t6
                  sub          s8, t6, s5
                  bne          a2, a0, 5979f
                  mulhsu       s10, s1, s11
                  slti         s7, tp, -1795
                  ori          s2, s2, 1534
                  andi         t0, s2, -1101
                  sub          a4, s7, a2
                  c.slli       a1, 4
                  slli         a6, s7, 21
5972:             add          t6, t3, a4
                  lui          sp, 321822
5974:             c.bnez       a5, 5988f
                  c.xor        a3, a4
                  add          a4, s7, s6
                  mulh         a0, s6, t1
                  beq          a2, a5, 5989f
5979:             c.addi16sp   sp, -16
                  sll          sp, t2, s3
                  addi         t0, s8, 1638
                  rem          zero, a5, t3
                  andi         a4, a1, -1304
                  lui          a7, 125741
                  slti         a7, zero, -1536
                  and          s0, s10, zero
                  and          s11, t4, s2
5988:             bne          tp, t4, 5998f
5989:             srai         t3, t0, 24
                  div          t3, tp, a2
                  c.or         s0, s1
                  c.bnez       s1, 6006f
                  remu         a0, s6, gp
                  addi         s0, t6, -922
                  or           s3, t3, a3
                  sltiu        a6, s5, 582
                  c.addi4spn   a0, sp, 592
5998:             c.beqz       a0, 6007f
                  c.andi       s1, 8
                  slt          s2, a6, a3
                  ori          t0, a2, 1377
                  c.srli       s0, 31
                  mulhu        a5, a7, s10
                  c.addi       t2, -1
                  c.mv         t2, t1
6006:             c.nop
6007:             andi         s1, s1, -1711
                  xori         sp, s3, -296
                  and          t6, t4, t3
                  c.sub        s1, s1
                  c.bnez       s1, 6030f
                  blt          gp, s3, 6022f
                  sra          s5, a7, a4
                  and          a3, s6, s1
                  mulh         s10, t0, ra
                  auipc        tp, 899389
                  slti         zero, s5, -651
                  div          t1, t4, ra
                  xor          t3, s10, a4
                  add          s3, t2, s2
                  c.addi       a6, 8
6022:             or           sp, gp, tp
                  c.and        a5, a5
                  bge          a4, t4, 6038f
                  sltu         t2, s8, t1
                  sra          s10, s6, s11
                  bne          t2, a2, 6038f
                  xor          t3, gp, t1
                  mulhu        zero, s10, a5
6030:             c.xor        a0, a1
                  bgeu         ra, t0, 6039f
                  srai         t2, a3, 26
                  rem          sp, s11, a2
                  c.bnez       a0, 6039f
                  addi         t0, t4, -822
                  bge          a6, a3, 6049f
                  mulh         ra, a0, s7
6038:             sll          zero, a5, tp
6039:             srl          sp, s6, t6
                  sltiu        t0, a0, -696
                  sll          s2, s9, t2
                  slti         t0, tp, 1784
                  c.sub        a3, a5
                  srai         t2, s10, 0
                  bgeu         t2, s7, 6056f
                  auipc        t4, 873235
                  bltu         s3, s0, 6051f
                  sll          a5, a4, t5
6049:             c.addi       s3, -1
                  c.nop
6051:             sub          t2, s4, s9
                  bltu         s5, s5, 6056f
                  c.or         a3, a3
                  rem          t2, ra, s0
                  srli         t1, a1, 18
6056:             add          s1, s6, ra
                  divu         s10, t1, gp
                  sltiu        s11, sp, 651
                  blt          a4, s5, 6062f
                  mulhsu       ra, s8, s5
                  c.beqz       s0, 6072f
6062:             beq          t3, s2, 6077f
                  srl          t4, sp, s6
                  bltu         zero, s11, 6073f
                  auipc        gp, 249113
                  nop
                  c.add        t5, t6
                  xor          s5, a5, t5
                  c.lui        t6, 5
                  c.srli       s1, 2
                  bgeu         ra, gp, 6081f
6072:             slli         t5, s2, 11
6073:             c.or         a3, s0
                  sra          ra, s9, s11
                  beq          a2, s1, 6083f
                  c.srai       a2, 4
6077:             and          t6, s2, t5
                  c.srli       s0, 29
                  beq          s8, s7, 6085f
                  mulhsu       s0, a7, t5
6081:             nop
                  ori          t2, a4, -1505
6083:             c.srli       a5, 6
                  c.lui        s11, 27
6085:             c.li         s2, 3
                  sltu         t4, gp, s1
                  divu         a3, s0, t4
                  c.nop
                  c.or         a5, a5
                  c.nop
                  add          s7, s10, zero
                  c.xor        a0, a0
                  c.add        ra, t2
                  c.li         t2, 3
                  mulhu        t4, s5, a1
                  c.li         s8, 29
                  sub          a2, zero, t2
                  c.addi       t6, 23
                  add          t0, sp, t6
                  lui          a0, 128330
                  and          a7, s7, t0
                  bne          t2, s11, 6116f
                  slli         t4, t6, 13
                  slli         gp, t4, 20
                  c.xor        a2, a1
                  c.srai       s0, 25
                  beq          sp, t1, 6122f
                  srai         zero, s1, 21
                  xor          t3, a2, s9
                  c.srli       s1, 9
                  nop
                  c.nop
                  ori          ra, s8, -379
                  c.andi       a5, 25
                  c.beqz       a2, 6131f
6116:             remu         a7, t2, a5
                  addi         a6, zero, 939
                  rem          a5, s8, s5
                  mulhu        s1, a6, a3
                  bge          a4, a7, 6131f
                  c.bnez       s0, 6138f
6122:             ori          a3, t2, 1373
                  or           a1, s3, s6
                  c.lui        t5, 12
                  xor          ra, s1, s0
                  c.slli       ra, 11
                  slli         t3, a7, 23
                  bltu         s2, a4, 6132f
                  div          t2, a5, a0
                  ori          a7, s10, 132
6131:             c.andi       a5, 9
6132:             add          zero, s5, s2
                  c.li         sp, -1
                  mulh         a7, ra, s7
                  xor          s7, zero, s1
                  c.addi16sp   sp, 112
                  c.or         a3, a5
6138:             mulh         s5, a1, ra
                  c.nop
                  div          s11, t2, zero
                  c.li         ra, 25
                  andi         zero, t6, 1803
                  bne          sp, s10, 6151f
                  divu         a0, s4, s1
                  or           a2, s1, t5
                  c.lui        a3, 18
                  nop
                  addi         tp, s1, -377
                  mul          s11, t5, s11
                  or           t6, s10, s9
6151:             c.srai       a3, 4
                  beq          sp, a0, 6167f
                  andi         a1, a2, 989
                  c.mv         ra, s0
                  bge          tp, s2, 6172f
                  c.li         s10, 28
                  and          a0, zero, s9
                  lui          t4, 218482
                  auipc        zero, 416725
                  c.addi       t6, 24
                  sltu         t6, s10, ra
                  addi         sp, t5, -870
                  rem          a6, s8, a2
                  c.mv         a4, s8
                  and          sp, sp, ra
                  beq          t1, s10, 6171f
6167:             nop
                  c.mv         s3, gp
                  c.beqz       s0, 6184f
                  c.lui        a4, 16
6171:             c.nop
6172:             c.sub        a3, a3
                  bltu         s11, t1, 6192f
                  c.addi       a5, -1
                  srai         s7, t2, 25
                  divu         s5, a7, t2
                  auipc        s7, 371218
                  sra          t6, ra, t5
                  c.srli       a3, 4
                  mulhsu       a6, s7, tp
                  c.mv         a2, s0
                  lui          a7, 707337
                  remu         a3, a6, t0
6184:             mulh         t1, t5, a3
                  c.li         t0, -1
                  c.addi16sp   sp, 80
                  sub          t2, zero, t3
                  c.addi16sp   sp, -16
                  c.and        a4, a5
                  add          a1, a6, s4
                  add          a0, s4, a0
6192:             lui          t1, 228810
                  rem          a7, s10, s9
                  c.nop
                  c.srli       a1, 20
                  xori         t2, t0, 1194
                  c.srai       a5, 13
                  c.addi       a5, -1
                  c.addi       t0, 29
                  lui          s0, 699539
                  mulhsu       t4, s7, s8
                  bltu         s2, s2, 6212f
                  sub          s2, zero, sp
                  bltu         s7, sp, 6209f
                  c.li         s1, -1
                  bltu         t6, a1, 6212f
                  blt          a5, a5, 6221f
                  lui          t1, 854126
6209:             srai         ra, s5, 16
                  bne          zero, a0, 6225f
                  add          s3, s11, a2
6212:             nop
                  xor          s3, s0, sp
                  c.srai       a5, 6
                  beq          s3, tp, 6232f
                  auipc        a2, 864453
                  xor          a2, a1, t2
                  mulh         a3, ra, t5
                  srli         s10, a4, 17
                  div          a4, t0, a7
6221:             andi         a5, t3, -350
                  mulhsu       t3, s11, a3
                  mulhsu       t2, s10, t4
                  remu         s11, s1, s11
6225:             c.and        a2, a4
                  c.srli       a2, 26
                  mulhu        t1, a0, tp
                  lui          a6, 636949
                  c.lui        s5, 16
                  slli         t1, a3, 28
                  bne          a7, a7, 6239f
6232:             c.addi4spn   a1, sp, 688
                  xori         s2, a0, -795
                  bltu         t6, s11, 6238f
                  xor          a3, gp, a6
                  c.or         a1, s0
                  nop
6238:             c.nop
6239:             addi         s5, t5, 159
                  c.li         a6, -1
                  mul          t2, a1, a3
                  sltu         s5, s7, t6
                  addi         s5, a7, 1334
                  c.add        s7, t0
                  mulhu        a2, s6, tp
                  rem          s0, s3, t2
                  div          sp, a1, t6
                  c.li         t3, -1
                  c.srai       a5, 29
                  c.li         s7, 20
                  c.and        a1, a3
                  mul          a5, s8, s0
                  xori         sp, s9, 957
                  c.mv         s10, gp
                  bne          s10, t3, 6260f
                  srai         t6, s2, 28
                  c.slli       a2, 13
                  c.addi16sp   sp, -16
                  addi         a1, t6, -1020
6260:             c.sub        a1, s0
                  c.and        a5, a4
                  c.mv         a1, s0
                  beq          s4, sp, 6271f
                  lui          zero, 939152
                  c.andi       s1, 11
                  c.srli       a4, 1
                  c.addi       s11, 23
                  or           s3, a5, s10
                  c.addi16sp   sp, -16
                  sra          s11, s10, s3
6271:             mulhsu       s8, t5, a1
                  c.andi       s0, -1
                  divu         t4, zero, a3
                  remu         s7, t1, a0
                  c.addi4spn   a4, sp, 400
                  c.bnez       s1, 6279f
                  c.bnez       a4, 6281f
                  c.addi4spn   s0, sp, 960
6279:             bgeu         t6, t4, 6290f
                  auipc        t4, 194527
6281:             bne          t5, gp, 6292f
                  slli         a7, a1, 15
                  and          t3, a0, s9
                  sll          s3, a0, s2
                  ori          a1, t6, 1434
                  c.addi16sp   sp, 112
                  c.xor        s0, a3
                  c.beqz       a1, 6304f
                  slti         a0, s8, 1676
6290:             lui          a0, 484311
                  xor          a1, s9, a2
6292:             bgeu         t5, s10, 6306f
                  c.nop
                  nop
                  divu         t4, a3, t3
                  c.add        s1, tp
                  divu         zero, sp, tp
                  c.beqz       s1, 6307f
                  c.li         s2, -1
                  remu         sp, s11, tp
                  mulhsu       t0, t3, s2
                  slti         t6, a1, -1713
                  mulhu        t3, a7, a6
6304:             c.addi16sp   sp, 176
                  lui          s10, 720087
6306:             srl          t5, t6, a1
6307:             c.slli       s1, 9
                  c.xor        a1, a5
                  c.lui        a7, 7
                  c.slli       s10, 7
                  bltu         t4, s10, 6328f
                  xori         t5, a1, 1207
                  rem          ra, t3, t1
                  divu         s10, s4, s3
                  nop
                  auipc        s2, 44444
                  srai         a4, s6, 19
                  c.addi       s11, 20
                  srl          s3, s6, sp
                  slt          a2, t2, s1
                  c.nop
                  and          sp, t3, s5
                  c.sub        a0, a4
                  c.nop
                  c.slli       a4, 17
                  mulhu        s3, a2, zero
                  sltu         s0, a5, s0
6328:             or           tp, s8, s11
                  c.bnez       a2, 6344f
                  slt          ra, s2, s4
                  c.bnez       a2, 6340f
                  c.slli       s2, 2
                  sltu         a3, a7, s7
                  c.srai       s0, 28
                  xori         sp, a4, -741
                  c.slli       s5, 29
                  sltu         s10, s6, a2
                  c.nop
                  bltu         s6, s10, 6354f
6340:             divu         s2, a5, a4
                  ori          t1, s6, 542
                  c.andi       a2, -1
                  add          t2, a7, s2
6344:             slt          t1, s3, t6
                  bgeu         t2, s9, 6358f
                  add          a0, a5, a5
                  mulhsu       s5, s10, a0
                  c.addi       s1, -1
                  bgeu         s0, a3, 6360f
                  lui          s11, 117073
                  nop
                  mul          t2, s3, a6
                  ori          s0, s4, -235
6354:             xor          ra, s6, a1
                  c.add        s3, t0
                  addi         a2, t6, -1888
                  c.lui        s0, 18
6358:             c.xor        s1, a2
                  or           a4, s11, a7
6360:             slt          s7, ra, s2
                  ori          s1, s0, 2041
                  srai         t1, t5, 24
                  ori          ra, s4, 1013
                  bgeu         s1, t1, 6374f
                  andi         t0, s6, 309
                  sll          s1, t5, t6
                  c.addi       s0, 3
                  div          s11, s4, s8
                  c.srli       a1, 9
                  c.addi16sp   sp, -16
                  slt          s2, s4, s0
                  mulh         ra, s4, s3
                  sll          t4, s3, s9
6374:             lui          t4, 247574
                  sub          a5, sp, t2
                  bge          s4, t2, 6387f
                  remu         t4, s1, sp
                  c.addi       tp, 20
                  divu         t1, a1, s6
                  c.bnez       a2, 6395f
                  slt          s11, gp, a7
                  nop
                  c.andi       a0, -1
                  mulhu        zero, t6, a2
                  bltu         s4, s2, 6389f
                  c.or         a3, a4
6387:             slt          ra, s9, t4
sub_3_64:         jal          ra, 3f
0:                jal          ra, 4f
1:                c.j          2f
2:                jal          ra, 11f
3:                c.jal        9f
4:                c.j          5f
5:                c.j          10f
6:                c.j          7f
7:                c.j          0b
8:                c.j          1b
9:                c.j          8b
10:               jal          t1, 12f
11:               c.j          6b
12:               c.nop
                  divu         t3, s7, s3
6389:             c.or         a3, a1
                  c.li         a0, -1
                  c.lui        s2, 5
                  bne          t0, s7, 6400f
                  sll          s5, t2, t3
                  blt          t1, s3, 6408f
6395:             slli         a5, s11, 10
                  c.addi4spn   a5, sp, 16
                  c.mv         ra, a2
                  c.xor        a3, a5
                  bltu         a0, a0, 6413f
6400:             c.andi       a1, -1
                  andi         sp, zero, 1798
                  c.beqz       a5, 6410f
                  c.srli       a1, 19
                  mul          t1, zero, tp
                  sra          a4, s11, sp
                  c.addi       s11, -1
                  c.bnez       a1, 6424f
6408:             auipc        t1, 339344
                  remu         t0, s1, t0
6410:             c.sub        a5, s0
                  c.addi4spn   a3, sp, 384
                  bgeu         s2, s2, 6416f
6413:             sltu         gp, a7, s1
                  sra          t1, a0, s1
                  mulh         a3, zero, s10
6416:             bne          zero, t0, 6422f
                  xori         t2, s0, -953
                  div          a4, s3, a2
                  slt          a6, t0, t2
                  sra          s3, s7, s3
                  divu         s8, a0, s2
6422:             sll          a5, s4, t1
                  mul          a3, sp, s0
6424:             nop
                  c.li         s10, 16
                  bge          t5, a0, 6436f
                  mulhsu       a7, tp, t4
                  remu         t1, t2, s5
                  c.andi       s1, 8
                  addi         a0, zero, 9 #init loop 0 counter
                  c.nop
                  addi         s0, zero, 18 #init loop 0 limit
sub_3_172_0_t:    c.or         a2, a3
                  c.and        a4, a5
                  sltu         a6, a5, s4
                  c.slli       t3, 17
                  addi         a0, a0, 9 #update loop 0 counter
                  andi         s1, t5, 1686
                  c.srli       a5, 19
                  slli         t6, ra, 19
                  bne          a0, s0, sub_3_172_0_t #branch for loop 0
                  c.addi4spn   s1, sp, 560
                  ori          s10, t4, -1559
                  c.beqz       a4, 6444f
                  bge          t6, a7, 6435f
                  xori         t0, a2, -220
                  c.slli       t4, 9
6435:             or           s3, s0, s1
6436:             addi         t0, ra, 1264
                  sub          t1, s9, a7
                  c.beqz       s1, 6449f
                  slt          s10, t3, t1
                  sub          t3, ra, s10
                  c.mv         s0, s9
                  c.addi4spn   a4, sp, 32
                  c.beqz       a0, 6452f
6444:             srl          t6, t5, t5
                  remu         s11, t1, a7
                  c.mv         a6, a3
                  c.xor        s1, s0
                  c.lui        a6, 8
6449:             mul          t1, a7, t6
                  c.li         t3, -1
                  c.add        ra, t1
6452:             div          s11, a6, gp
                  c.nop
                  slti         s5, s2, -1671
                  c.srai       a4, 5
                  blt          s2, s10, 6471f
                  xori         tp, s11, 1720
                  c.add        a3, a7
                  mul          a1, t0, t3
                  sltu         t5, s6, t6
                  sub          sp, t3, t6
                  and          s11, zero, s1
                  ori          s3, t0, 649
                  sll          s3, s9, s1
                  srai         a0, s4, 15
                  xor          a3, gp, t2
                  mulh         a0, gp, s2
                  xor          tp, s11, a6
                  mul          t0, t3, t0
                  add          ra, t4, zero
6471:             srl          t6, s2, a0
                  andi         t0, t1, -1802
                  c.sub        a0, a0
                  c.li         s11, -1
                  slli         s2, s11, 15
                  beq          a3, a4, 6480f
                  sra          t5, s8, s1
                  c.beqz       a1, 6486f
                  xor          s7, s7, ra
6480:             sll          a1, a3, t6
                  c.li         tp, -1
                  auipc        a0, 796399
                  c.and        a3, s0
                  c.sub        a5, s0
                  andi         a4, t5, -687
6486:             srli         a2, s10, 9
                  c.slli       s8, 22
                  bgeu         a2, a5, 6503f
                  beq          a3, ra, 6504f
                  c.li         a4, -1
                  sra          a3, a1, s11
                  sll          sp, a2, a5
                  nop
                  andi         a1, a6, -1390
                  divu         s5, zero, ra
                  sltiu        s5, a5, -1303
                  slti         ra, a7, 544
                  rem          a6, s11, s5
                  c.addi16sp   sp, 288
                  c.lui        s0, 3
                  divu         ra, t1, s2
                  srl          t1, t4, s7
6503:             srl          t5, tp, s11
6504:             blt          a2, a5, 6523f
                  addi         ra, s8, 1671
                  slli         t1, zero, 14
                  sra          s3, tp, t0
                  sltu         a0, a4, zero
                  add          a6, s7, t0
                  sra          t1, a3, t1
                  bgeu         a5, t6, 6521f
                  div          a0, s2, ra
                  c.bnez       a1, 6524f
                  andi         zero, gp, -87
                  c.addi16sp   sp, -16
                  bge          a0, a1, 6524f
                  bgeu         t2, gp, 6521f
                  add          a7, t5, sp
                  sra          s8, a2, gp
                  sll          a6, gp, s5
6521:             mul          t6, a4, a0
                  bgeu         tp, t6, 6538f
6523:             ori          s2, a3, -1072
6524:             srli         a1, s9, 4
                  c.or         a1, s1
                  c.nop
                  sltiu        t1, a0, 2046
                  c.add        a7, s3
                  ori          s0, a1, 601
                  c.or         a3, a3
                  andi         s1, s5, -770
                  srl          s8, a2, a1
                  sub          s8, t0, a2
                  slt          sp, t4, s3
                  sltiu        t4, s7, -1723
                  mul          a0, a3, gp
                  mulhu        ra, a3, a5
6538:             div          s8, t4, gp
                  srl          t4, gp, s8
                  rem          a6, t1, s4
                  mulhsu       s8, t1, ra
                  blt          t1, t2, 6557f
                  srli         a7, zero, 31
                  sra          s3, t6, t6
                  c.add        t5, tp
                  mulhsu       t2, s1, s3
                  divu         a4, t1, a5
                  ori          ra, a7, 1151
                  c.nop
                  beq          t0, s8, 6561f
                  divu         a2, t4, a6
                  xori         s10, t1, 2012
                  rem          tp, s7, a4
                  sub          s11, ra, a3
                  mul          s2, a6, a7
                  or           a1, t2, zero
6557:             c.xor        a2, a5
                  c.addi4spn   a5, sp, 288
                  c.add        t6, a7
                  c.slli       t5, 21
6561:             srli         s11, t0, 22
                  c.nop
                  mulhu        s11, t2, a2
                  blt          tp, s7, 6578f
                  remu         t3, sp, a3
                  sra          ra, t0, a2
                  c.andi       a2, 20
                  sll          t3, a7, s4
                  c.addi4spn   a1, sp, 544
                  sub          sp, a2, s7
                  c.srai       a1, 8
                  sltu         t4, s9, t4
                  c.addi16sp   sp, -16
                  xor          s10, a6, s2
                  srai         a3, a0, 24
                  sub          s2, s7, t2
                  c.addi4spn   s1, sp, 416
6578:             mul          t2, a5, t1
                  c.li         s2, 16
                  nop
                  c.bnez       a4, 6590f
                  srai         t5, s11, 24
                  c.andi       s0, -1
                  c.srli       a5, 19
                  srli         t0, t5, 16
                  or           a3, s1, t4
                  mulhu        a7, a7, s9
                  c.li         a0, -1
                  c.add        t2, a1
6590:             andi         a1, s6, -1983
                  bne          ra, s11, 6596f
                  c.or         a2, a1
                  bltu         a0, a3, 6610f
                  c.addi16sp   sp, -16
                  c.addi       gp, -1
6596:             c.and        s0, a0
                  mulhu        s11, t2, zero
                  c.andi       a0, -1
                  beq          a0, zero, 6604f
                  bgeu         s2, s2, 6614f
                  xori         a6, s6, 1201
                  c.add        t3, t2
                  divu         t0, t3, s5
6604:             srl          t1, tp, t1
                  beq          sp, sp, 6616f
                  auipc        s0, 810033
                  c.addi4spn   a2, sp, 928
                  beq          t0, a1, 6613f
                  addi         sp, t3, -1724
6610:             c.lui        a7, 9
                  mulh         t4, a7, s5
                  slli         t6, s11, 26
6613:             c.slli       s3, 25
6614:             slti         gp, a6, -601
                  c.srli       a0, 31
6616:             c.bnez       a1, 6620f
                  bltu         a6, sp, 6621f
                  c.li         a1, 0
                  andi         s11, t1, 422
6620:             c.or         s1, a3
6621:             mulh         s0, t2, s4
                  sltu         t1, s0, sp
                  xori         t5, s11, 550
                  c.or         s1, s0
                  c.srai       a3, 20
                  blt          zero, s5, 6636f
                  bne          t3, a3, 6635f
                  sll          tp, a5, sp
                  beq          s0, s4, 6633f
                  add          a4, s4, t4
                  divu         zero, s11, t6
                  c.addi16sp   sp, -16
6633:             slti         s3, a7, 398
                  mulh         a3, s8, s5
6635:             lui          a5, 806906
6636:             addi         s0, a2, -1169
                  add          s7, sp, s11
                  sll          a0, s6, t0
                  srai         s3, s5, 29
                  c.addi4spn   a5, sp, 368
                  lui          t3, 718912
                  c.slli       tp, 5
                  c.mv         a7, s1
                  and          s1, t3, s1
                  slt          t4, s5, a1
                  c.srli       s0, 22
                  c.slli       a0, 22
                  auipc        t0, 720134
                  beq          s1, a3, 6660f
                  bne          zero, s1, 6656f
                  c.srli       s0, 10
                  bge          a3, a0, 6666f
                  bge          s6, s4, 6661f
                  bgeu         t5, t3, 6668f
                  mul          s11, s0, t1
6656:             ori          ra, s2, -454
                  c.and        a4, a4
                  c.sub        s0, a0
                  nop
6660:             c.xor        a2, a3
6661:             xor          s11, a4, t6
                  sra          a4, t2, a2
                  c.beqz       a4, 6678f
                  c.srai       s0, 30
                  srl          gp, t5, zero
6666:             bne          s3, a2, 6676f
                  div          gp, s5, s6
6668:             lui          a7, 232447
                  c.sub        s0, a1
                  lui          s8, 971550
                  c.andi       a2, 31
                  beq          s3, s9, 6689f
                  mulh         t2, t5, a3
                  lui          t5, 1001131
                  div          a2, s2, s3
6676:             sll          a1, s6, tp
                  and          t3, t4, t1
6678:             c.slli       s7, 23
                  srai         a5, t0, 21
                  bge          s7, t2, 6695f
                  c.andi       a0, -1
                  c.beqz       s0, 6696f
                  bne          s10, a1, 6692f
                  c.addi       t2, -1
                  c.addi4spn   s0, sp, 368
                  bltu         zero, s8, 6699f
                  c.add        s7, s11
                  divu         s0, s1, s4
6689:             bne          a2, a5, 6698f
                  srl          s8, s10, t5
                  mulh         s0, t4, t2
6692:             c.and        a1, a4
                  slti         sp, t4, 348
                  srli         a4, s9, 10
6695:             bgeu         a3, s2, 6700f
6696:             c.or         a1, a1
                  sll          s5, a2, t4
6698:             c.andi       a2, -1
6699:             c.li         t4, 2
6700:             c.addi4spn   a0, sp, 64
                  c.add        t0, t3
                  slti         s1, zero, 1490
                  sltiu        a4, s2, 1387
                  slt          t0, s7, a3
                  sltiu        s1, tp, -823
                  c.lui        a5, 19
                  addi         s5, s5, 2043
                  or           sp, s7, a2
                  bgeu         zero, s5, 6725f
                  slti         tp, a1, -1247
                  slti         t3, s11, -526
                  bge          s11, t0, 6723f
                  mulhu        zero, a2, s6
                  blt          sp, zero, 6729f
                  slti         s2, t1, -397
                  mulh         t1, t1, s7
                  mul          a7, a4, a0
                  c.bnez       s0, 6733f
                  lui          s1, 846099
                  divu         t5, s2, gp
                  c.beqz       a2, 6724f
                  slt          a3, t2, t6
6723:             remu         t3, s8, s9
6724:             c.srli       s0, 19
6725:             c.srai       a2, 25
                  sll          tp, a7, t1
                  bgeu         s7, gp, 6746f
                  c.addi       s3, -1
6729:             c.add        t0, a2
                  srai         s7, s9, 18
                  mul          a5, t4, s9
                  add          sp, zero, zero
6733:             srai         zero, s3, 12
                  c.or         a2, a3
                  c.srai       s1, 5
                  nop
                  c.addi4spn   a0, sp, 192
                  add          t0, s8, sp
                  nop
                  c.li         t2, -1
                  sll          a6, t1, a3
                  mulhsu       t5, s4, a1
                  xor          s10, t0, s8
                  nop
                  c.and        a0, a5
6746:             blt          t3, a6, 6757f
                  div          s10, sp, s4
                  mulhu        s7, a7, a2
                  sll          t1, a0, s11
                  sra          s7, t6, s10
                  c.bnez       a2, 6762f
                  sll          a4, a0, a7
                  bgeu         s8, t0, 6770f
                  sra          s5, s3, t6
                  bltu         t4, t2, 6763f
                  c.bnez       a3, 6770f
6757:             c.slli       s0, 17
                  blt          a6, t1, 6773f
                  sltiu        a7, a7, -1196
                  srl          a1, sp, a2
                  c.srai       a0, 4
6762:             c.srli       a5, 2
6763:             mul          t5, sp, sp
                  srli         a7, t2, 18
                  c.srai       a1, 8
                  srli         s3, zero, 11
                  beq          t4, t5, 6775f
                  srl          t0, a1, s2
                  xori         gp, s2, -1484
6770:             mulhu        s0, sp, a0
                  remu         ra, s2, a3
                  c.addi4spn   a1, sp, 496
6773:             divu         s2, s6, s6
                  bne          a7, s2, 6788f
6775:             and          s3, s8, s3
                  andi         tp, a1, -961
                  c.beqz       a3, 6783f
                  sub          s8, s3, s5
                  mulhsu       gp, gp, t3
                  add          a4, s6, s0
                  divu         t2, s4, a4
                  mul          t1, sp, a6
6783:             c.lui        s11, 8
                  c.add        a7, s0
                  xor          gp, tp, zero
                  xori         t4, ra, 1303
                  c.beqz       a3, 6802f
6788:             bltu         zero, tp, 6802f
                  c.mv         a5, s2
                  slli         s11, zero, 26
                  bltu         zero, zero, 6800f
                  rem          s3, s2, t2
                  c.bnez       a1, 6804f
                  bgeu         s3, tp, 6809f
                  ori          a5, t1, -349
                  blt          s0, gp, 6805f
                  mul          a3, s3, s6
                  remu         a1, s10, t4
                  lui          zero, 329070
6800:             srai         a6, a0, 13
                  c.addi16sp   sp, -16
6802:             c.li         t4, 26
                  divu         t4, t3, a5
6804:             auipc        t0, 519033
6805:             rem          tp, a3, gp
                  c.beqz       a4, 6822f
                  and          a1, ra, sp
                  bltu         s11, t2, 6823f
6809:             sub          s11, tp, a6
                  add          a6, s3, a2
                  sltu         a4, s1, a6
                  c.sub        a3, a4
                  sra          a7, a2, a6
                  auipc        sp, 983512
                  mulhsu       t3, a2, ra
                  beq          s5, tp, 6829f
                  add          a2, tp, zero
                  rem          t2, a2, s11
                  bltu         a0, tp, 6824f
                  ori          t6, s3, -325
                  mulh         s3, gp, t0
6822:             sll          t6, gp, a4
6823:             or           s7, t2, t4
6824:             and          s11, s4, a2
                  bgeu         a4, s10, 6830f
                  div          a4, a4, s5
                  rem          a4, t6, a2
                  blt          zero, s6, 6839f
6829:             andi         t1, a7, -296
6830:             bgeu         s1, zero, 6847f
                  andi         s7, a6, 191
                  c.addi16sp   sp, -16
                  c.or         a4, a3
                  sub          s3, tp, sp
                  mul          t3, s5, s3
                  c.addi16sp   sp, 48
                  mulhu        a2, t3, s10
                  c.and        s0, s1
6839:             c.andi       a2, -1
                  nop
                  sltiu        ra, a6, -141
                  c.nop
                  mulh         t2, zero, t0
                  sra          gp, t2, s2
                  lui          t0, 285034
                  c.lui        s2, 24
6847:             mulh         t3, s1, s2
                  c.xor        a4, a2
                  slt          a0, ra, a7
                  bne          a7, t4, 6858f
                  srli         s8, s3, 23
                  bge          s10, s5, 6862f
                  c.mv         a7, s8
                  c.bnez       s1, 6871f
                  bgeu         t4, a3, 6874f
sub_3_70:         jal          ra, 10f
0:                c.j          11f
1:                jal          sp, 9f
2:                c.jal        7f
3:                c.j          1b
4:                c.j          19f
5:                c.j          8f
6:                c.j          4b
7:                c.jal        15f
8:                jal          t3, 16f
9:                c.jal        12f
10:               jal          ra, 5b
11:               c.j          2b
12:               c.j          18f
13:               c.jal        0b
14:               c.j          13b
15:               c.j          3b
16:               c.jal        17f
17:               c.jal        14b
18:               jal          t4, 6b
19:               c.mv         s11, tp
                  c.nop
                  srli         s11, s11, 7
6858:             rem          t0, s8, a1
                  mul          a5, s3, t5
                  la           sp, region_1+724 #start riscv_load_store_rand_instr_stream_12
                  slt          t4, s1, s2
                  c.lwsp       a2, 0(sp)
                  xor          s10, s1, s5
                  sb           s11, -32(sp)
                  lb           zero, 220(sp)
                  c.srli       a2, 1
                  c.addi       t0, 3
                  slti         gp, a0, -829
                  sb           a6, 169(sp)
                  c.addi       a1, -1
                  lhu          a5, -190(sp)
                  sw           a3, -228(sp)
                  lb           a6, 55(sp)
                  add          gp, s5, t2
                  lui          s1, 897195
                  c.nop
                  lw           s3, 132(sp)
                  divu         s7, a2, t1
                  lbu          s11, -68(sp)
                  or           a2, t1, t3
                  lbu          a3, 237(sp)
                  c.andi       a2, -1
                  lbu          t2, 157(sp)
                  c.sub        a4, s0
                  sh           a7, -182(sp)
                  lbu          a4, -89(sp)
                  sra          tp, s8, t1
                  sh           a7, 106(sp)
                  lb           s10, 229(sp)
                  slti         a0, t4, 1109
                  sb           a3, -243(sp)
                  lbu          zero, 219(sp)
                  c.add        a0, a0
                  lbu          a5, -3(sp)
                  slti         zero, s9, 1960
                  sh           t0, -226(sp)
                  slli         a0, s9, 4
                  addi         tp, a2, 1653
                  lbu          s0, 255(sp)
                  srli         s2, s1, 3
                  auipc        t0, 146743
                  lb           a3, -131(sp)
                  sb           s9, 77(sp)
                  divu         a5, a5, s5
                  lb           t5, 159(sp)
                  lb           a6, 110(sp)
                  c.srai       a0, 18
                  sb           ra, 159(sp)
                  c.add        a7, s3
                  srl          t1, s9, s8
                  lh           s0, -138(sp)
                  sub          a7, t0, tp
                  lb           s3, 85(sp) #end riscv_load_store_rand_instr_stream_12
                  mulhu        a3, a2, s9
                  c.srai       a4, 20
6862:             ori          s5, s10, 417
                  c.addi4spn   a4, sp, 400
                  c.nop
                  mulhsu       s11, s7, t1
                  mulhu        t3, a0, s1
                  divu         t6, s1, tp
                  c.sub        a5, s1
                  bne          s2, a5, 6872f
                  slti         a3, a1, -1269
6871:             rem          t3, s9, a3
6872:             c.li         a5, 8
                  c.xor        s0, s1
6874:             srai         s11, a2, 8
                  c.addi       ra, -1
                  remu         zero, ra, a4
                  div          s7, s11, a1
                  c.xor        a5, s0
                  mulh         t6, s10, t3
                  and          ra, s5, s4
                  remu         t1, s4, s10
                  beq          s1, s1, 6893f
                  sltu         s11, t3, s10
                  srai         a6, a7, 13
                  mul          s2, s5, zero
                  c.addi4spn   a0, sp, 672
                  bne          zero, tp, 6891f
                  andi         gp, t4, 566
                  c.add        s7, sp
                  sub          a7, zero, t6
6891:             c.nop
                  mulh         t3, t0, zero
6893:             slti         a0, s4, -339
                  c.beqz       a3, 6905f
                  sll          s5, t3, a4
                  mulhsu       t4, a6, s7
                  lui          t5, 352423
                  srai         t6, a0, 24
                  c.beqz       a1, 6907f
                  c.lui        a5, 18
                  c.and        s1, a2
                  bgeu         a5, s1, 6912f
                  c.addi       ra, -1
                  c.addi16sp   sp, -16
6905:             c.srai       a5, 10
                  bge          t0, t3, 6910f
6907:             or           t1, t3, a7
                  sltu         t6, s6, t2
                  la           t6, region_0+636 #start riscv_hazard_instr_stream_10
                  sltiu        ra, s3, 1101
                  lb           s3, -16(t6)
                  lbu          ra, 16(t6)
                  divu         a6, a2, ra
                  remu         ra, s3, ra
                  c.lui        s7, 12
                  slt          a6, a2, a2
                  lbu          ra, -13(t6)
                  sb           a2, -11(t6)
                  addi         s7, s3, -209
                  c.lui        s5, 17
                  mulhu        a6, ra, s7
                  sb           ra, 16(t6)
                  lb           s5, 15(t6)
                  mulh         s7, s3, s5
                  lbu          s5, -9(t6)
                  sll          a6, s7, ra
                  lbu          a2, -14(t6)
                  sh           s5, -12(t6)
                  lb           s5, 8(t6)
                  mulh         ra, a6, a2
                  sb           s3, -9(t6)
                  slli         s3, ra, 28
                  lb           s3, -5(t6)
                  addi         s7, a6, 153
                  lhu          a2, -10(t6)
                  sb           s7, -11(t6)
                  c.nop
                  c.add        a6, a6
                  c.mv         a2, s7
                  mul          s7, s3, ra
                  lbu          s5, -3(t6)
                  lbu          s7, -13(t6)
                  sh           a6, -6(t6)
                  sw           a6, -16(t6)
                  lb           s5, 14(t6)
                  lbu          a2, 12(t6)
                  sh           s7, 14(t6)
                  mulhsu       s5, s3, s3
                  sb           s3, -7(t6)
                  auipc        a6, 241802
                  xori         a2, s5, 467
                  lbu          a2, -6(t6) #end riscv_hazard_instr_stream_10
                  sltiu        a1, a5, -1233
6910:             srli         t0, t2, 26
                  c.bnez       a3, 6915f
6912:             div          s11, s5, s2
                  ori          t5, a1, 1991
                  blt          s9, s6, 6920f
6915:             rem          t2, s6, a2
                  auipc        s0, 618973
                  andi         s1, t6, 1370
                  xori         t3, s3, 569
                  c.addi4spn   a5, sp, 480
6920:             c.addi       s11, 3
                  blt          a0, ra, 6926f
                  sub          a5, t0, s0
                  c.beqz       a3, 6940f
                  divu         s3, a0, a5
                  bgeu         a7, tp, 6929f
6926:             sub          t6, zero, t6
                  sra          gp, a0, s7
                  mulh         a1, a4, a7
6929:             c.beqz       a5, 6937f
                  c.and        a4, a5
                  xori         sp, a0, -4
                  andi         zero, a3, 1388
                  mul          s8, ra, s4
                  c.addi4spn   a1, sp, 160
                  bltu         a1, t2, 6938f
                  c.srai       a3, 20
6937:             slli         s3, s5, 5
6938:             c.li         s0, -1
                  bltu         s0, t4, 6953f
6940:             c.andi       a1, 5
                  slli         ra, t4, 16
                  c.addi4spn   a4, sp, 480
                  and          a4, zero, tp
                  c.sub        s0, a1
                  c.srai       a1, 11
                  ori          sp, t2, 153
                  c.or         s1, s1
                  bge          s1, s9, 6956f
                  beq          s6, t6, 6960f
                  ori          a6, t5, 1959
                  div          s0, s5, t3
                  srl          s0, t0, t6
6953:             mulhsu       s1, t6, a6
                  or           s8, a2, a6
                  or           a0, s5, t6
6956:             xor          s1, t2, t6
                  lui          t2, 1030321
                  c.mv         t5, tp
                  c.li         s10, 0
6960:             c.andi       a2, -1
                  mulhsu       zero, s4, s8
                  sra          a7, s8, sp
                  c.srai       s0, 10
                  or           s11, a1, a4
                  slti         a5, zero, -702
                  mul          a6, s7, a3
                  c.addi16sp   sp, 176
                  srai         ra, s3, 7
                  slt          s8, s11, s6
                  add          a0, s11, a0
                  divu         t5, tp, a0
                  sltiu        ra, tp, 13
                  c.li         s3, 27
                  c.xor        s0, a0
                  c.beqz       a0, 6986f
                  lui          zero, 65045
                  c.slli       a4, 16
                  sltiu        t3, t4, -231
                  la           sp, region_0+127 #start riscv_load_store_rand_instr_stream_5
                  slti         t1, s6, -1292
                  lh           s1, -5(sp)
                  lbu          s7, -13(sp)
                  sub          zero, a2, ra
                  lb           a7, 10(sp)
                  c.andi       s0, -1
                  c.sub        a0, a2
                  lbu          s1, 14(sp)
                  lbu          tp, -8(sp)
                  slt          t5, a0, s10
                  slli         a0, a2, 0
                  mulh         s2, s3, a3
                  slt          t0, ra, t3
                  lbu          t1, 6(sp)
                  mul          a3, s5, s8
                  sll          s3, a5, s2
                  mulhsu       zero, s6, s3
                  add          s3, a2, s5
                  mulhsu       t0, s4, s7
                  c.or         a0, a5
                  sb           s5, 11(sp)
                  lui          t2, 325024
                  xori         t3, t6, -476
                  srli         t5, s1, 31
                  srai         a3, gp, 15
                  c.mv         s0, s1
                  sb           s8, 14(sp)
                  c.nop
                  c.add        s1, tp
                  sb           t1, -14(sp)
                  lb           a5, 7(sp)
                  lb           a5, -6(sp)
                  lbu          t3, -4(sp) #end riscv_load_store_rand_instr_stream_5
                  sll          gp, t2, s9
                  lui          a4, 633229
                  c.li         s7, 31
                  or           s3, ra, s6
                  andi         gp, s11, -1583
                  c.addi       a3, 8
                  bgeu         s0, s4, 6990f
6986:             c.srai       a2, 3
                  slt          t4, t5, a3
                  sub          s3, s3, s8
                  bgeu         a6, a6, 7003f
6990:             divu         t1, t0, a4
                  c.addi       ra, -1
                  c.or         a4, s0
                  sltu         zero, a4, tp
                  c.xor        a5, a2
                  divu         t1, s8, t6
                  srl          t6, t3, s8
                  rem          t5, a6, t0
                  slti         t3, sp, -936
                  mulhu        a7, s3, s8
                  andi         s8, gp, 968
                  bltu         s7, ra, 7011f
                  divu         a6, t3, s9
7003:             sll          s11, sp, t5
                  bne          t1, s4, 7015f
                  sltiu        t2, a6, -739
                  andi         t2, s11, 1424
                  c.addi4spn   a2, sp, 416
                  and          zero, s9, s6
                  c.beqz       a3, 7024f
                  c.addi       a0, -1
7011:             c.srli       s1, 18
                  nop
                  sub          t0, t4, t5
                  rem          t0, tp, s0
7015:             mulh         a0, t0, t0
                  sll          a4, s2, s2
                  sltiu        a7, t2, -952
                  c.sub        a4, a3
                  c.add        a7, a7
                  nop
                  c.addi16sp   sp, 16
                  srai         s8, tp, 12
                  c.addi       a2, -1
7024:             mulhsu       tp, gp, s4
                  c.mv         tp, gp
                  c.mv         s3, gp
                  c.bnez       s1, 7046f
                  c.addi16sp   sp, 144
                  sub          s11, s0, s3
                  mulhu        gp, t1, s10
                  slt          tp, t4, a3
                  and          t5, t2, a5
                  srli         a1, s7, 2
                  ori          s8, s10, -1645
                  c.beqz       a0, 7044f
                  c.li         a6, 9
                  bne          a3, tp, 7052f
                  beq          gp, t5, 7042f
                  c.beqz       a5, 7053f
                  c.lui        t1, 27
                  addi         sp, s1, 362
7042:             sll          s5, s1, a0
                  c.addi16sp   sp, 160
7044:             rem          s0, s6, t6
                  add          s10, zero, t0
7046:             sub          gp, s2, t0
                  c.lui        a7, 16
                  blt          ra, s4, 7056f
                  c.sub        s0, a3
                  c.sub        a3, a1
                  c.add        a1, s10
7052:             div          t2, t3, t1
7053:             xori         gp, s3, 1729
                  mulhsu       t5, t4, t2
                  c.and        a3, a2
7056:             sub          gp, s5, t4
                  ori          t6, zero, 64
                  add          t0, s11, zero
                  sltiu        s3, s3, 1966
                  add          s5, s7, zero
                  lui          t3, 550228
                  c.andi       s0, -1
                  bne          t3, s9, 7073f
                  sra          gp, s5, gp
                  mulh         t2, sp, a3
                  c.beqz       a4, 7083f
                  c.srli       a1, 3
                  c.srli       a0, 24
                  xori         a4, a6, -1475
                  c.bnez       s1, 7085f
                  xori         s11, gp, 1854
                  c.srai       a0, 18
7073:             slti         sp, a5, 1434
                  mulhu        s11, s7, tp
                  mul          a1, gp, s9
                  slti         t0, a0, 1270
                  bgeu         s4, t6, 7092f
                  c.li         a1, 0
                  blt          t0, s8, 7092f
                  mulhu        s7, s0, t0
                  c.andi       a3, -1
                  slti         t0, t4, -229
7083:             mulhsu       t3, s6, s2
                  c.beqz       s0, 7100f
7085:             sra          t4, ra, s10
                  sltu         ra, t6, s6
                  sltu         t2, t3, s0
                  blt          t3, s8, 7099f
                  c.lui        a3, 27
                  c.addi16sp   sp, -16
                  div          tp, a4, t2
7092:             div          a4, s11, t6
                  srli         s5, s6, 28
                  c.bnez       a5, 7098f
                  c.or         a3, a0
                  c.addi16sp   sp, -16
                  sltiu        s0, s8, -1709
7098:             c.andi       a3, -1
7099:             slli         s1, tp, 4
7100:             srai         t6, t2, 31
                  blt          s7, a1, 7110f
                  xori         s5, s1, -1824
                  mulhsu       gp, s1, s10
                  sra          t0, a6, t2
                  c.mv         a2, a0
                  remu         t2, sp, s2
                  divu         s7, s8, s0
                  ori          gp, a3, 752
                  sub          s5, ra, ra
7110:             ori          s3, s6, 1300
                  c.srli       a1, 1
                  bne          a6, zero, 7125f
                  srai         s10, s0, 3
                  c.srai       s1, 31
                  remu         s5, a0, t6
                  auipc        s0, 996271
                  beq          a0, s4, 7121f
                  lui          a4, 44708
                  or           s5, tp, a3
                  blt          s2, s7, 7139f
7121:             nop
                  lui          t1, 674716
                  beq          sp, s2, 7131f
                  andi         a1, tp, -781
7125:             add          s1, t3, s10
                  div          t3, a4, t5
                  andi         s7, a1, 838
                  bgeu         t3, zero, 7138f
                  c.lui        s10, 3
                  c.li         a0, -1
7131:             c.mv         s3, t5
                  c.add        gp, a3
                  nop
                  c.nop
                  sltiu        t6, t6, -1971
                  xor          a2, s4, s6
                  add          t6, a6, s3
7138:             auipc        t2, 323748
7139:             beq          s5, ra, 7150f
                  sra          tp, a0, gp
                  mulhsu       t4, sp, s4
                  c.srli       a0, 31
                  c.srli       a3, 31
                  xori         a7, a7, -1375
                  mulhsu       sp, s3, s5
                  lui          a3, 783534
                  bne          ra, t4, 7161f
                  nop
                  slli         a5, a2, 27
7150:             c.and        a5, s1
                  slli         s11, a1, 22
                  srl          gp, s8, a0
                  auipc        t1, 673967
                  addi         a3, ra, -1030
                  srai         t4, t1, 14
                  sltiu        tp, s0, -8
                  bltu         s5, zero, 7163f
                  slli         a7, gp, 12
                  div          a7, ra, zero
                  blt          s9, a2, 7171f
7161:             c.sub        a5, s1
                  c.slli       t1, 23
7163:             c.beqz       a3, 7177f
                  lui          sp, 816989
                  c.mv         a6, a3
                  srai         gp, s0, 3
                  auipc        gp, 655825
                  c.lui        t0, 18
                  sltu         t0, t3, s11
                  ori          s7, s4, -194
7171:             c.srli       s0, 21
                  c.beqz       a1, 7181f
                  c.mv         s7, t0
                  c.beqz       s0, 7179f
                  c.addi16sp   sp, -16
                  c.lui        s5, 21
7177:             lui          zero, 427252
                  bltu         ra, a7, 7181f
7179:             c.li         sp, 5
                  c.beqz       a5, 7197f
7181:             c.add        s3, s9
                  la           t4, region_0+154 #start riscv_hazard_instr_stream_17
                  lbu          a1, 97(t4)
                  c.li         a0, -1
                  lbu          t1, -140(t4)
                  lbu          a1, 1794(t4)
                  srli         t5, t1, 6
                  c.and        a1, a0
                  lui          t1, 200282
                  or           t1, a0, s5
                  slt          t1, t5, t5
                  nop
                  mulh         a0, a1, t5
                  lbu          s5, 1823(t4)
                  srai         t5, a0, 7
                  divu         s11, t1, t5
                  c.sub        a1, a1
                  c.andi       a1, -1
                  sb           s5, 251(t4)
                  sltiu        s5, a1, -1502
                  sb           t5, 1019(t4)
                  lb           s5, 1553(t4)
                  lbu          s5, 59(t4)
                  c.lui        t5, 2
                  remu         t1, s5, s11
                  sw           a0, -74(t4)
                  sh           t1, 270(t4)
                  lw           s11, -30(t4)
                  lb           a1, 1627(t4)
                  divu         t5, t1, a1
                  lb           a1, 513(t4)
                  sb           t5, 699(t4)
                  c.nop
                  sb           s5, 1465(t4)
                  sh           s11, 748(t4)
                  lb           t5, 71(t4)
                  sh           s5, 522(t4)
                  c.mv         s5, a1
                  c.mv         a0, a0
                  lb           s11, 1040(t4)
                  lb           a0, 1477(t4) #end riscv_hazard_instr_stream_17
                  sltu         ra, s4, t6
                  srl          a5, sp, a1
                  mulhu        t5, s1, a6
                  slt          s0, tp, gp
                  addi         a3, a6, -352
                  sltiu        a3, s0, -270
                  nop
                  lui          s3, 185936
                  beq          s6, t6, 7200f
                  c.nop
                  andi         s2, s8, -1053
                  c.add        s10, a4
                  c.addi4spn   a0, sp, 1008
                  c.addi16sp   sp, 128
                  and          s7, t0, s8
7197:             mulhu        a7, s9, s9
                  slti         t1, t6, 1377
                  c.bnez       a4, 7214f
7200:             blt          gp, a6, 7211f
                  slt          a2, ra, a5
                  c.or         s1, a1
                  xori         a1, zero, -1435
                  bltu         s6, s10, 7209f
                  xor          sp, a0, s9
                  srl          s1, t3, a2
                  beq          t5, ra, 7221f
                  bge          gp, s11, 7225f
7209:             c.andi       s1, 2
                  srai         s1, ra, 22
7211:             c.srli       s1, 29
                  slt          a4, s5, s2
                  andi         a7, tp, -871
7214:             srl          s10, a5, a5
                  sub          s7, t6, s1
                  c.or         a2, a5
                  divu         a1, t0, t1
                  srli         a4, s8, 16
                  srli         ra, a4, 23
                  divu         t1, t0, t0
7221:             andi         s3, t0, -266
                  bne          s2, tp, 7237f
                  mulhsu       a6, s7, tp
                  c.nop
7225:             blt          a7, a0, 7241f
                  mulh         zero, s7, s1
                  xori         t4, s8, -417
                  ori          sp, sp, 1927
                  addi         t5, ra, 883
                  c.addi16sp   sp, -16
                  auipc        a4, 860938
                  c.beqz       a4, 7240f
                  c.andi       a2, -1
                  c.and        a0, a0
                  nop
                  addi         s7, a4, -982
7237:             blt          s0, s6, 7252f
                  sll          a6, s9, t1
                  sub          t0, s9, a0
7240:             lui          s3, 746928
7241:             slt          tp, s9, a6
                  lui          s0, 542265
                  mulh         t3, t2, t6
                  auipc        t2, 304472
                  c.addi4spn   a0, sp, 752
                  c.addi4spn   s1, sp, 496
                  bgeu         s11, a4, 7258f
                  slli         t2, s9, 17
                  c.beqz       s1, 7253f
                  c.or         s0, a5
                  c.beqz       s1, 7259f
7252:             c.li         t2, -1
7253:             beq          s2, zero, 7262f
                  mulhu        ra, s8, s8
                  slti         a2, s9, -195
                  slli         zero, s11, 18
                  sll          t3, a3, a5
7258:             c.srai       a3, 29
7259:             xor          s7, tp, s6
                  slt          tp, a0, a7
                  sub          s11, a3, t5
7262:             div          zero, t3, sp
                  srli         s0, a5, 19
                  slli         t0, t2, 6
                  divu         s1, a5, sp
                  bge          s3, t3, 7281f
                  c.addi4spn   a3, sp, 336
                  lui          t6, 649445
                  bltu         a0, tp, 7273f
                  sll          t2, ra, s6
                  bltu         s9, s5, 7287f
                  div          t1, a4, zero
7273:             c.srai       a4, 31
                  sub          t4, t3, t3
                  slt          a2, t6, t4
                  sll          t4, s1, a3
                  srli         t4, a1, 19
                  c.li         s5, -1
                  sltu         a4, t0, t2
                  mul          s5, gp, s2
7281:             c.andi       a2, 25
                  c.addi4spn   a1, sp, 848
                  mulh         t3, s8, a5
                  mulhu        s1, a1, s8
                  c.addi16sp   sp, -16
                  c.or         s1, a0
7287:             lui          a6, 324644
                  c.addi       s3, -1
                  c.li         s7, -1
                  c.andi       a1, -1
                  addi         t1, tp, -761
                  c.or         a3, s1
                  srai         a3, s2, 25
                  c.beqz       a0, 7298f
                  c.addi       sp, -1
                  divu         ra, a0, a2
                  c.or         a1, s0
7298:             c.xor        s0, a3
                  add          s0, a1, a2
                  slti         s1, gp, -1554
                  xor          t3, t3, sp
                  ori          a3, a7, 1919
                  div          t1, a5, a6
                  slt          s7, a7, a6
                  sll          s11, s3, s8
                  c.li         s10, -1
                  srli         t6, t5, 18
                  sra          s8, t0, a2
                  sra          t2, s3, gp
                  slli         s10, t0, 17
                  xor          a2, a6, t4
                  and          a2, t1, ra
                  bne          tp, a0, 7319f
                  remu         gp, s10, s9
                  srl          a1, a5, a3
                  c.mv         a0, a2
                  c.nop
                  ori          s8, t2, -774
7319:             c.addi4spn   a4, sp, 352
                  srai         t5, s8, 5
                  c.beqz       a5, 7326f
                  bgeu         s1, t1, 7333f
                  add          s10, s3, s9
                  slti         s1, t5, 762
                  slt          a6, t1, a1
7326:             div          zero, sp, s10
                  nop
                  sub          a1, t1, s11
                  rem          t6, a6, a2
                  c.srli       a0, 2
                  bltu         s1, gp, 7345f
                  bgeu         s1, s0, 7336f
7333:             c.add        t2, a5
                  sltu         s5, a7, a7
                  c.add        s11, a7
7336:             addi         sp, a1, 1120
                  blt          s4, s0, 7351f
                  xori         t4, s2, -280
                  mulhsu       a6, a6, t1
                  srai         s2, sp, 0
                  mulh         a5, s8, s0
                  c.li         tp, 21
                  c.addi16sp   sp, 384
                  c.xor        s1, s0
7345:             ori          s0, s9, -987
                  srl          a7, a0, s2
                  add          a2, s1, s5
                  rem          s10, t3, s0
                  divu         s11, a4, s0
                  srli         s5, s11, 29
7351:             c.lui        t4, 7
                  ori          a2, s7, 1848
                  c.andi       a0, -1
                  slt          a0, ra, tp
                  blt          s3, t5, 7360f
                  xori         s10, s0, 681
                  rem          t2, a6, a7
                  c.or         a5, a1
                  c.bnez       s1, 7374f
7360:             sltu         s11, a3, a7
                  c.mv         a4, s9
                  sltiu        a7, s4, -72
                  c.andi       a3, -1
                  andi         gp, t3, -1804
                  c.andi       a4, -1
                  c.sub        a0, a5
                  div          s0, zero, sp
                  xori         a3, a4, -292
                  srli         s0, s9, 26
                  divu         t2, ra, s0
                  div          s5, s3, s4
                  ori          t6, zero, -1472
                  c.beqz       s0, 7382f
7374:             sll          s8, s5, s3
                  srli         zero, t2, 6
                  srl          s5, a5, s11
                  remu         s1, s5, a5
                  mul          a5, t6, s5
                  lui          a7, 860521
                  c.slli       s2, 12
                  sll          a5, a4, s0
7382:             mulh         s2, s8, a5
                  xor          ra, gp, sp
                  add          ra, s3, a0
                  mulhu        a0, s10, s11
                  c.andi       a1, -1
                  xor          sp, tp, s2
                  srli         t4, t5, 8
                  div          a1, a5, s5
                  c.sub        a4, a3
                  c.addi16sp   sp, -16
                  slli         s8, zero, 28
                  c.addi16sp   sp, -16
                  slt          t4, a1, t1
                  add          t0, s5, s7
                  srl          a0, a4, s7
                  xor          a4, s8, a7
                  c.srli       a2, 3
                  auipc        a7, 161466
                  c.or         a3, a4
                  or           a2, t2, a2
                  mulhu        s1, sp, s10
                  c.srli       a2, 13
                  divu         a6, s8, a6
                  srai         s2, t6, 14
                  xor          t4, t5, s3
                  c.xor        a1, a4
                  c.add        s3, a0
                  mulh         a1, s3, a5
                  sub          s11, a3, s7
                  c.addi16sp   sp, 208
                  slli         s1, zero, 14
                  c.sub        a4, s1
                  andi         s5, t4, -817
                  sub          a6, t2, s7
                  bgeu         zero, t4, 7424f
                  mulh         s2, s6, s9
                  srai         t4, t4, 3
                  c.addi16sp   sp, 128
                  nop
                  bne          zero, s7, 7436f
                  slt          zero, sp, t2
                  and          t4, a0, a2
7424:             c.bnez       a2, 7435f
                  c.xor        a0, a1
                  srli         t4, a6, 3
                  div          a4, s3, a6
                  c.addi       t0, 24
                  c.add        a5, s1
                  sltu         s7, a6, a7
                  rem          t4, zero, a1
                  slti         a5, ra, -864
                  slt          t1, t3, a1
                  mul          a1, a4, a1
7435:             c.and        s0, a2
7436:             sltiu        s11, ra, 1676
                  add          s11, s7, t0
                  c.sub        a0, a1
                  or           s1, a0, t1
                  ori          s7, s1, 1444
                  blt          t1, a1, 7452f
                  c.bnez       a4, 7451f
                  c.or         a1, a1
                  bgeu         zero, s5, 7461f
                  sll          s1, s0, s6
                  c.addi4spn   a4, sp, 16
                  c.andi       a3, 13
                  add          a5, s4, zero
                  lui          t3, 807349
                  srli         t0, s7, 3
7451:             sub          t4, a0, a6
7452:             c.li         t0, -1
                  xor          s0, s0, a7
                  lui          a2, 273583
                  slti         s10, a2, -758
                  sra          a1, a0, t6
                  mulh         s2, t3, sp
                  c.beqz       a5, 7471f
                  add          a0, t4, gp
                  auipc        sp, 598523
7461:             c.add        a7, a5
                  slt          tp, s8, s1
                  sltu         t1, a3, a1
                  c.srli       a1, 30
                  nop
                  slli         t6, s6, 7
                  c.slli       gp, 6
                  c.li         gp, 21
                  srl          t3, t4, t3
                  ori          s5, s8, -757
7471:             slt          s5, ra, s9
                  and          a7, t3, t1
                  c.or         a2, s1
                  c.addi       t0, -1
                  bltu         a6, s5, 7479f
                  c.and        s0, a3
                  div          a4, a2, t5
                  and          s1, s1, s10
7479:             c.add        t6, t2
                  sltiu        s3, t0, 725
                  c.bnez       a5, 7489f
                  c.bnez       a2, 7485f
                  andi         t6, s1, -1491
                  c.nop
7485:             c.nop
                  sltu         t6, s3, s7
                  nop
                  addi         a4, a1, 1645
7489:             sub          a1, s7, s5
                  c.li         s5, 14
                  bne          a0, s0, 7502f
                  c.mv         a3, t2
                  addi         s5, zero, 1170
                  c.andi       s0, -1
                  mulhu        t0, s8, sp
                  bltu         a0, s2, 7510f
                  c.addi       t1, 28
                  c.lui        a5, 6
                  beq          t6, a4, 7516f
                  nop
                  xori         a4, tp, -1752
7502:             ori          t6, t5, -157
                  div          a2, s3, a5
                  lui          t1, 510296
                  slt          ra, t5, ra
                  c.or         a4, a0
                  c.lui        t1, 11
                  c.or         a1, s0
                  c.and        a3, a4
7510:             xori         gp, sp, 749
                  c.sub        a4, a5
                  slli         a1, s2, 26
                  srl          a3, s11, ra
                  xor          t6, a2, a5
                  c.li         tp, 29
7516:             srai         s8, a0, 25
                  c.add        s8, s11
                  srai         s3, t0, 16
                  c.srai       a1, 14
                  c.addi4spn   a4, sp, 960
                  beq          s7, s8, 7531f
                  c.and        s0, s0
                  c.bnez       a2, 7542f
                  or           zero, s3, a6
                  bge          sp, s7, 7540f
                  c.nop
                  c.and        a0, s1
                  c.xor        a5, s1
                  mul          s11, a7, t6
                  ori          a4, s11, -510
7531:             srai         s7, s11, 22
                  mulhsu       t5, s3, a1
                  c.lui        a5, 5
                  c.mv         gp, t6
                  mulhu        a4, a0, a7
                  remu         a6, tp, a6
                  c.bnez       a5, 7552f
                  auipc        a4, 951198
                  mulhsu       t0, t1, t1
7540:             c.bnez       s0, 7548f
                  andi         a1, tp, 732
7542:             mulh         s0, s8, a2
                  c.andi       a1, -1
                  beq          s9, t2, 7554f
                  c.li         a6, -1
                  c.addi16sp   sp, 224
                  xor          ra, a2, s9
7548:             beq          t0, a0, 7556f
                  mulh         a1, a6, gp
                  bgeu         s6, gp, 7564f
                  c.addi       t6, 2
7552:             sll          s10, a2, s7
                  xor          s5, ra, t4
7554:             c.xor        a5, a2
                  c.srli       a2, 8
7556:             or           a7, t0, s9
                  bne          t1, s4, 7565f
                  slli         ra, a4, 19
                  and          a0, sp, gp
                  srli         a6, t4, 9
                  c.srli       a3, 3
                  or           a5, s0, a1
                  bltu         a6, s0, 7576f
7564:             xor          tp, t3, t6
7565:             and          s7, a0, s7
                  mulhsu       tp, a3, t6
                  auipc        s7, 429088
                  lui          a7, 349590
                  c.nop
                  c.srli       a1, 11
                  slli         ra, s5, 14
                  c.addi       a6, -1
                  srl          a5, s1, s6
                  c.and        a2, s0
                  beq          a1, ra, 7591f
7576:             c.bnez       a2, 7582f
                  sra          zero, t0, s0
                  srai         t3, t4, 30
                  mul          gp, t6, a5
                  sltu         tp, a3, s4
                  c.srli       a0, 30
7582:             slt          s10, gp, s11
                  c.nop
                  c.bnez       a5, 7589f
                  c.add        t1, t0
                  bltu         a5, s9, 7596f
                  c.srli       a4, 4
                  c.xor        a3, a1
7589:             c.sub        a0, a4
                  blt          ra, a4, 7594f
7591:             and          a6, t5, a0
                  bne          t4, a0, 7611f
                  mulhsu       zero, s2, t5
7594:             xori         s1, sp, -1027
                  mulhsu       t5, t5, a6
7596:             mulhsu       s8, t2, t5
                  c.and        s1, s1
                  c.li         t6, 13
                  sltu         sp, s1, a2
                  or           s5, s8, s8
                  slt          s3, a1, a1
                  xori         s11, t6, 2038
                  rem          a6, a7, sp
                  c.nop
                  xor          a4, s0, a2
                  c.lui        t1, 29
                  andi         a4, a6, 103
                  addi         s5, s5, 316
                  mulhsu       t1, t2, s11
                  slt          s5, s1, t1
7611:             sub          t4, s7, t2
                  beq          tp, a6, 7616f
                  c.sub        a3, a1
                  c.beqz       a5, 7629f
                  beq          s9, a1, 7632f
7616:             mulhu        s3, a4, t5
                  mul          t2, s2, s7
                  mulhu        s0, sp, s1
                  c.add        t0, t3
                  mul          gp, t0, sp
                  ori          a2, s11, -1226
                  sra          s7, s3, a4
                  remu         a1, a0, t6
                  c.sub        s1, a5
                  sltiu        ra, a6, -1273
                  c.srli       a0, 15
                  mulhu        tp, t0, s1
                  divu         zero, ra, s6
7629:             and          t5, a5, a2
                  srl          t6, a1, s10
                  slti         a5, a2, -1165
7632:             bge          t6, t0, 7647f
                  blt          s2, s7, 7650f
                  ori          a5, a6, 1492
                  rem          a2, s0, s11
                  bne          t6, s7, 7646f
                  c.addi       a1, -1
                  sltiu        s5, zero, 1532
                  slt          a0, t4, a4
                  la           sp, region_0+354 #start riscv_load_store_rand_instr_stream_20
                  c.srli       a1, 2
                  c.xor        a2, a0
                  add          t6, s3, s10
                  lh           a1, 1642(sp)
                  c.li         a2, 8
                  lb           a6, 1508(sp)
                  c.sub        a1, a3
                  lbu          a7, 1041(sp)
                  sh           s11, 1320(sp)
                  mulh         s8, s6, t2
                  sltu         zero, a4, s10
                  ori          a0, a0, 1018
                  sb           t5, 53(sp)
                  lb           zero, -35(sp)
                  sb           s4, 1163(sp)
                  lw           a2, 1126(sp)
                  lbu          zero, 913(sp)
                  lb           s5, 1129(sp)
                  lh           a6, 276(sp)
                  lbu          s7, 551(sp)
                  lbu          a4, 371(sp)
                  lbu          t5, 1419(sp)
                  lb           t0, 605(sp)
                  c.add        t0, a2
                  sh           s8, 1276(sp)
                  c.addi       a5, -1
                  lbu          t1, 455(sp) #end riscv_load_store_rand_instr_stream_20
                  beq          s11, t6, 7645f
                  rem          gp, s2, a1
                  c.mv         t4, a7
                  mulhu        a3, a6, t6
                  andi         gp, s0, -352
7645:             addi         s0, t6, -865
7646:             rem          zero, s6, a2
7647:             add          s10, a5, s8
                  srli         a2, t3, 20
                  bgeu         s4, a5, 7663f
7650:             c.lui        s1, 1
                  srl          t1, tp, t5
                  c.nop
                  c.addi16sp   sp, -16
                  divu         s1, zero, s6
                  c.addi       s5, 25
                  xori         t6, s8, -1341
                  c.slli       t0, 14
                  c.mv         a7, s1
                  c.sub        s0, s0
                  c.lui        t1, 30
                  div          s7, s6, s10
                  slli         a7, t5, 20
7663:             divu         t2, gp, a3
                  auipc        t3, 344504
                  c.xor        a0, a5
                  div          a2, a3, ra
                  auipc        s3, 275497
                  c.slli       a2, 23
                  sll          gp, t6, t2
                  beq          t3, t0, 7673f
                  c.nop
                  bgeu         s8, a3, 7686f
7673:             nop
                  sll          s5, s0, s5
                  slli         s7, s6, 23
                  c.mv         s10, t5
                  ori          s0, ra, -1425
                  sltiu        a3, a6, 1252
                  c.srli       s0, 29
                  c.xor        a1, a5
                  c.beqz       a1, 7685f
                  c.srli       s0, 27
                  c.xor        a2, a3
                  xor          s5, s11, s8
7685:             auipc        gp, 79360
7686:             andi         a7, s1, 370
                  c.bnez       a4, 7696f
                  srai         a2, t1, 29
                  xori         s7, gp, -1133
                  c.beqz       a4, 7699f
                  and          s2, s8, zero
                  sll          a5, s0, s0
                  sra          t2, s9, zero
                  sll          a7, t1, s1
                  slti         a0, ra, -764
7696:             bne          t6, tp, 7707f
                  blt          a4, s9, 7712f
                  bne          a6, t2, 7713f
7699:             c.nop
                  add          ra, a4, t3
                  c.srai       a0, 14
                  c.srai       a4, 3
                  c.slli       t1, 8
                  rem          s3, zero, s7
                  c.addi4spn   s0, sp, 384
                  c.or         s0, a4
7707:             c.andi       a0, -1
                  div          gp, t0, t3
                  bne          gp, a6, 7720f
                  c.addi       a5, -1
                  beq          a2, gp, 7722f
7712:             c.addi4spn   a2, sp, 160
7713:             slt          t6, s8, s5
                  bgeu         s10, t2, 7722f
                  slti         zero, sp, 377
                  nop
                  beq          s0, s2, 7728f
                  srli         s7, s1, 28
                  rem          t1, a0, t5
7720:             mulhu        s11, ra, t3
                  c.srli       s0, 29
7722:             c.sub        a0, s0
                  slti         zero, t0, -306
                  c.li         a4, -1
                  remu         s11, t1, s0
                  xor          s8, t5, s0
                  bge          s10, s1, 7731f
7728:             addi         a2, t2, -1963
                  c.andi       a4, -1
                  mulhu        s8, a4, a7
7731:             sll          a2, a3, ra
                  c.srai       a1, 13
                  add          s2, s9, a3
                  sltiu        a5, s4, -498
                  bgeu         s9, t3, 7746f
                  c.slli       gp, 23
                  c.addi       s10, 30
                  auipc        ra, 936273
                  sll          zero, s8, a2
                  andi         t0, t4, 1061
                  add          a2, t3, s6
                  c.sub        a2, a5
                  mulhsu       a3, a7, s7
                  beq          ra, s7, 7755f
                  mulhu        t5, t2, a5
7746:             sltiu        s11, a4, -663
                  c.srai       a3, 16
                  c.slli       a4, 2
                  c.addi4spn   a5, sp, 416
                  mulh         s11, s1, tp
                  srl          s11, gp, s1
                  c.lui        a5, 13
                  c.andi       a4, -1
                  c.xor        a3, a3
7755:             slt          a4, s7, a3
                  sltiu        t1, a2, -773
                  lui          a5, 702217
                  srl          a2, a5, s6
                  c.addi       ra, -1
                  c.mv         s5, a0
                  add          t1, a2, ra
                  div          t1, a1, t6
                  c.beqz       a5, 7774f
                  bge          t1, s7, 7775f
                  c.slli       a0, 15
                  add          a0, a4, s7
                  divu         t3, a5, s7
                  sltu         t3, t0, s2
                  xor          s5, gp, s1
                  sltu         a3, s11, s10
                  c.and        a2, a4
                  c.lui        s0, 10
                  xori         s2, t3, 1882
7774:             mulhu        s8, a3, s4
7775:             c.beqz       a0, 7791f
                  c.addi4spn   a0, sp, 464
                  andi         a2, s1, -1210
                  rem          t4, a4, a6
                  slli         tp, s0, 11
                  mul          s0, s9, s5
                  c.bnez       a3, 7800f
                  c.nop
                  c.srli       s0, 8
                  andi         t1, s10, -1718
                  sra          tp, s10, s5
                  c.srai       a0, 3
                  and          a1, t3, t5
                  or           a2, s2, s11
                  mulhsu       t2, a3, t5
                  c.addi16sp   sp, 144
7791:             divu         s10, s11, a0
                  c.xor        a4, s1
                  bltu         s3, ra, 7808f
                  c.add        s2, s6
                  srl          s7, t1, t3
                  c.add        t1, t5
                  bne          s0, s6, 7801f
                  c.andi       a4, -1
                  mulh         a1, t4, tp
7800:             add          s5, ra, t5
7801:             c.sub        a0, s1
                  c.addi16sp   sp, 208
                  divu         t5, t3, s3
                  div          zero, ra, a1
                  and          a4, zero, s1
                  mulh         t1, ra, s9
                  mulh         s7, sp, t6
7808:             c.li         a7, -1
                  auipc        t1, 1014831
                  srl          t6, s6, s9
                  mulh         s11, zero, a5
                  slt          a3, s10, t3
                  mulh         ra, a2, tp
                  c.li         t1, -1
                  xori         a2, t5, 170
                  or           tp, a6, a0
                  c.sub        s1, a0
                  and          s8, t6, a3
                  c.slli       a0, 11
                  c.li         a0, 17
                  c.beqz       a0, 7831f
                  c.addi16sp   sp, 256
                  c.lui        s11, 18
                  beq          t4, t4, 7838f
                  sltiu        s1, s8, 1277
                  c.andi       a5, 24
                  andi         sp, t5, 42
                  bne          s3, a1, 7837f
                  sltu         t6, t3, t2
                  sltu         t0, s5, s6
7831:             rem          s10, a6, t3
                  c.srli       a5, 10
                  ori          t2, s5, -264
                  c.li         t6, -1
                  and          gp, a4, a2
                  c.beqz       a0, 7841f
7837:             c.and        a0, a3
7838:             c.add        t4, a4
                  slt          s7, s6, s3
                  add          sp, t3, s3
7841:             slti         a7, zero, -246
                  c.addi16sp   sp, 96
                  bge          zero, a7, 7851f
                  bgeu         s3, tp, 7859f
                  addi         s1, s6, 230
                  c.addi4spn   a3, sp, 80
                  c.add        a6, t1
                  sub          s0, s9, t6
                  sltu         s5, ra, s1
                  c.li         a2, -1
7851:             slti         s10, s9, -374
                  c.beqz       a5, 7856f
                  mulhsu       gp, a3, s3
                  slt          a0, sp, a2
                  sll          a3, s3, gp
7856:             c.nop
                  or           a5, s10, t6
                  mulhu        t1, s7, s11
7859:             c.add        t4, s2
                  mulhu        tp, a2, s6
                  srai         zero, a4, 1
                  c.srli       a1, 25
                  xor          a6, sp, zero
                  c.sub        a4, a2
                  and          t1, a1, t3
                  c.addi4spn   a4, sp, 192
                  xori         s2, a5, 1571
                  auipc        a7, 491838
                  srli         s10, t0, 30
                  c.srli       a2, 27
                  sll          s0, a2, s10
                  andi         a1, s11, -225
                  c.and        a1, a1
                  mulh         t3, a1, t4
                  c.sub        s0, s0
                  c.nop
                  divu         t6, s3, tp
                  bltu         a3, s8, 7892f
                  remu         a4, s9, t0
                  c.and        a3, a1
                  mulhu        s10, s9, a7
                  mulhsu       gp, s4, t5
                  beq          a6, s4, 7886f
                  mulhu        zero, s4, a4
                  or           t5, t0, t6
7886:             c.srai       a3, 30
                  c.and        a1, a2
                  lui          a6, 721148
                  slt          a3, a7, t0
                  and          zero, t1, a4
                  c.addi16sp   sp, 480
7892:             c.or         a2, s0
                  div          s0, s9, ra
                  auipc        s10, 714452
                  c.nop
                  srai         sp, a0, 22
                  bltu         a1, t6, 7906f
                  c.nop
                  c.li         t2, -1
                  c.or         a0, a0
                  c.addi16sp   sp, 224
                  c.mv         s7, s9
                  c.andi       a1, -1
                  srai         t4, s9, 31
                  c.addi       a6, -1
7906:             c.xor        a0, s1
                  andi         s7, a6, 1086
                  c.andi       a5, 26
                  c.srai       a3, 24
                  bne          ra, a1, 7916f
                  c.addi4spn   a2, sp, 304
                  div          s7, t1, t5
                  sltu         a5, t3, s11
                  mulh         s8, t4, a0
                  c.sub        a3, s0
7916:             addi         s5, t3, -529
                  c.slli       ra, 31
                  c.addi16sp   sp, -16
                  sra          a4, s4, a4
                  sltiu        a1, t5, 452
                  div          s11, s2, s5
                  bltu         s6, zero, 7935f
                  bgeu         a0, s1, 7928f
                  sltiu        s0, s6, 99
                  c.mv         s0, s3
                  mulhu        tp, s3, sp
                  srai         s3, a1, 10
7928:             c.beqz       s0, 7936f
                  beq          s5, tp, 7943f
                  sra          s3, a4, sp
                  add          a2, a3, ra
                  nop
                  divu         t6, s1, s6
                  slt          a0, t3, s6
7935:             add          s5, a6, a1
7936:             mulhsu       zero, a2, s5
                  slti         a0, t1, 723
                  srli         a6, s7, 1
                  sub          t2, t4, s2
                  and          a3, t5, a3
                  mulhu        tp, s4, s7
                  bne          ra, s8, 7957f
7943:             c.xor        s1, s0
                  xori         a1, sp, -29
                  c.srai       a2, 13
                  mul          s11, a4, a7
                  auipc        a2, 799985
                  c.add        t0, s5
                  bne          s0, s8, 7957f
                  blt          s3, t0, 7965f
                  slli         s0, tp, 29
                  addi         t1, s9, -856
                  divu         t2, a2, s4
                  c.srai       a4, 1
                  divu         tp, t4, s7
                  c.xor        a5, s0
7957:             bltu         a1, a4, 7974f
                  add          tp, s0, t0
                  sra          a3, s2, a6
                  mul          ra, s7, t6
                  bge          s0, t1, 7971f
                  and          a1, s8, s2
                  srai         t6, a3, 17
                  slti         s0, s9, 872
7965:             rem          t0, s4, s8
                  c.slli       s7, 11
                  bne          s1, t2, 7984f
                  bgeu         a5, ra, 7979f
                  srl          a7, s5, s1
                  c.beqz       a0, 7978f
7971:             sll          s5, s0, s2
                  remu         t3, zero, s0
                  sub          s1, ra, t4
7974:             bge          a7, zero, 7990f
                  c.addi       t5, 12
                  lui          a5, 296153
                  mulhu        s2, s1, s8
7978:             c.li         t0, 1
7979:             slti         t0, ra, -1894
                  bne          s1, a5, 7997f
                  c.mv         a7, s2
                  c.addi16sp   sp, 272
                  c.and        a3, a1
7984:             lui          ra, 247723
                  bltu         s1, a0, 7996f
                  c.slli       a1, 2
                  c.or         s1, a5
                  bgeu         tp, s3, 7996f
                  xor          s8, sp, t2
7990:             c.mv         a6, a6
                  c.srli       s0, 12
                  c.nop
                  and          s2, a5, gp
                  c.li         s3, -1
                  slt          s7, s0, s9
7996:             sll          zero, t5, s2
7997:             c.bnez       a0, 8008f
                  mulhu        zero, t5, s3
                  c.slli       a3, 29
                  bne          a2, s3, 8005f
                  c.addi16sp   sp, -16
                  slli         a5, s2, 28
                  slt          s5, t5, ra
                  bne          t4, tp, 8018f
8005:             sltu         ra, a7, s2
                  c.addi16sp   sp, 16
                  bge          gp, a0, 8024f
8008:             slli         s2, s10, 0
                  blt          t1, ra, 8017f
                  sll          s7, s5, s10
                  c.addi       a3, -1
                  c.addi4spn   a1, sp, 688
                  sltiu        s2, a3, 1107
                  srli         s3, s9, 28
                  andi         a1, s10, -557
                  div          a4, a5, a0
8017:             c.bnez       a5, 8031f
8018:             blt          s9, s11, 8027f
                  xori         s3, sp, -591
                  mulh         t3, s11, s2
                  srl          s3, s2, s8
                  beq          t4, s4, 8025f
                  c.srai       a3, 7
8024:             c.addi       t6, 8
8025:             srl          s7, a0, s6
                  bltu         sp, s11, 8030f
                  addi         t2, zero, 0 #init loop 0 counter
                  addi         t4, zero, 14 #init loop 0 limit
                  mul          s8, a2, t2
sub_3_170_0_t:    c.add        s1, a6
                  slti         sp, ra, 1756
                  addi         t2, t2, 3 #update loop 0 counter
                  xori         tp, s4, -1375
                  sll          s2, s11, a0
                  slti         s3, t3, -1972
                  sra          a1, s2, s10
                  c.lui        ra, 3
                  c.mv         tp, s9
                  sll          t6, s0, a3
                  c.addi4spn   a3, sp, 864
                  div          a0, s10, tp
                  or           t6, t1, a5
                  c.addi       t3, 7
                  bltu         t2, t4, sub_3_170_0_t #branch for loop 0
                  c.srli       a3, 2
8027:             c.nop
                  sll          s8, s7, a2
                  addi         a0, t3, 1555
8030:             srl          s2, ra, t1
8031:             srli         gp, a5, 3
                  srli         s7, a3, 11
                  bgeu         s10, t4, 8039f
                  blt          a7, a6, 8044f
                  c.addi       s11, 2
                  slli         tp, ra, 26
                  remu         a1, s9, a6
                  c.mv         a1, s10
8039:             or           ra, gp, a2
                  rem          a2, s3, a7
                  beq          t0, s6, 8052f
                  beq          zero, a4, 8046f
                  sltu         tp, sp, s9
8044:             sll          s8, s2, t6
                  srl          a3, s1, t4
8046:             srl          tp, t2, tp
                  c.andi       a4, 18
                  c.nop
                  c.mv         a1, s11
                  blt          t4, t1, 8054f
                  sub          t4, s3, s9
8052:             c.sub        a5, a3
                  sltu         s10, s6, zero
8054:             blt          s6, a4, 8063f
                  blt          s7, s1, 8068f
                  srli         sp, ra, 4
                  rem          a5, a6, tp
                  c.xor        a2, s1
                  c.srli       a4, 4
                  div          s5, a5, s0
                  rem          t1, gp, s1
                  sll          s10, a0, a6
8063:             srl          s10, s6, t1
                  and          zero, t2, gp
                  c.mv         t2, s9
                  c.addi       a0, 17
                  c.add        s3, s5
8068:             sra          tp, a6, s11
                  c.addi       s0, -1
                  and          s11, t0, s2
                  bltu         s9, t0, 8081f
                  c.li         t0, 0
                  and          s10, a4, zero
                  xor          t3, a0, s1
                  c.srli       s0, 8
                  c.addi16sp   sp, 48
                  c.addi16sp   sp, -16
                  c.lui        tp, 15
                  bgeu         t1, t6, 8098f
                  c.xor        a0, a5
8081:             srl          s10, a1, t4
                  auipc        s10, 875819
                  mulhsu       a2, s9, a4
                  bge          s7, zero, 8099f
                  bne          s1, t2, 8100f
                  sltu         t5, a7, s7
                  nop
                  mulhsu       s2, a0, s1
                  srai         t2, t3, 30
                  xori         gp, s9, -1197
                  addi         s0, a1, 1406
                  divu         t4, a7, a5
                  c.sub        a2, a2
                  slt          a5, a3, ra
                  slt          a6, sp, t2
                  ori          a1, s4, -1116
                  c.xor        a3, a3
8098:             add          s2, a7, s6
8099:             sltiu        a4, gp, -1977
8100:             nop
                  blt          a5, t3, 8106f
                  mul          t6, s7, s11
                  c.mv         s11, gp
                  c.sub        s0, a4
                  xor          a1, t2, s11
8106:             mulh         s5, a5, zero
                  c.xor        s0, a1
                  add          a6, t6, a5
                  c.beqz       a1, 8124f
                  c.and        a3, a0
                  c.beqz       a3, 8126f
                  sltiu        a0, a4, 532
                  c.sub        s0, s1
                  c.addi4spn   a4, sp, 480
                  bne          t6, a4, 8129f
                  c.or         a3, a1
                  divu         s3, s4, t0
                  c.lui        s0, 23
                  sub          a0, t0, t4
                  c.nop
                  bgeu         s2, t6, 8136f
                  rem          a5, s11, a1
                  addi         a5, s0, -405
8124:             sub          s1, s0, a3
                  c.srli       a3, 16
8126:             sltiu        s1, s0, 1776
                  c.srli       s1, 9
                  div          a3, a6, gp
8129:             c.slli       tp, 12
                  la           s0, region_1+54 #start load_store_instr_stream_1
                  la           sp, region_1+1046 #start load_store_instr_stream_2
                  la           a0, region_1+1710 #start load_store_instr_stream_3
                  sw           tp, 62(s0)
                  la           a1, region_1+1641 #start load_store_instr_stream_0
                  lbu          s3, 59(sp)
                  lbu          s8, -4(a0)
                  sb           t4, 58(sp)
                  sw           a2, -42(sp)
                  lhu          t0, 4(sp)
                  sb           gp, 45(s0)
                  sh           s2, -16(a0)
                  lb           t0, 33(s0)
                  lb           s3, 51(sp)
                  lbu          a7, 6(a1)
                  sb           a0, 1(a1)
                  lb           t5, 29(sp)
                  lw           t2, -5(a1)
                  lb           t0, -15(a0)
                  sh           t4, 14(a0)
                  lw           t0, 58(sp)
                  lh           a4, 10(a0)
                  lbu          a7, -14(a0)
                  lbu          t4, -11(a1)
                  lb           a4, -41(s0)
                  sw           a5, 58(s0)
                  lh           a4, 10(sp)
                  lbu          a7, -13(a0)
                  sb           s0, 55(s0)
                  lbu          a3, 59(sp) #end load_store_instr_stream_2
                  lb           t0, -7(a1)
                  lbu          s7, -3(a0) #end load_store_instr_stream_3
                  lh           a7, 14(s0)
                  sb           s5, 47(s0)
                  lbu          a5, -8(a1)
                  lw           s7, 34(s0) #end load_store_instr_stream_1
                  lb           a2, 7(a1) #end load_store_instr_stream_0
                  c.mv         gp, s3
                  sll          t0, t5, s1
                  bltu         s9, a7, 8140f
                  c.and        a5, a1
                  c.addi4spn   a1, sp, 624
                  sub          zero, a4, a5
8136:             c.addi4spn   s0, sp, 608
                  rem          sp, s6, t3
                  c.sub        a2, s0
                  add          t5, tp, s7
8140:             sll          s8, s2, s10
                  and          s2, a6, s0
                  c.li         a2, -1
                  mulhsu       a3, s7, t1
                  add          a2, a2, a1
                  c.slli       a0, 26
                  c.slli       sp, 9
                  or           gp, t0, s5
                  rem          s3, s5, a5
                  c.srai       a5, 7
                  c.li         t3, -1
                  bgeu         tp, ra, 8165f
                  c.bnez       a0, 8163f
                  mulh         ra, t6, a0
                  xor          t3, a0, t1
                  lui          s8, 830958
                  c.mv         a6, a5
                  add          a0, a5, t2
                  c.xor        a5, s1
                  bgeu         t1, a0, 8162f
                  ori          tp, s2, -1277
                  c.li         tp, 3
8162:             sub          s3, a4, s1
8163:             c.sub        a5, a0
                  slt          a4, s6, t0
8165:             c.mv         s2, s6
                  mul          tp, a2, s9
                  mul          a4, zero, a0
                  sltu         s3, t6, s0
                  c.srai       s0, 30
                  sra          a7, s11, tp
                  sltiu        t5, tp, 822
                  mulh         t0, s0, gp
                  lw           ra, 4(s6)
                  srli         t1, s9, 10
                  addi         s6, s6, 40
                  or           a0, s8, a2
                  xori         tp, ra, 572
14798:            addi x8, x1, 0
14798:            c.jr x8
sub_2:            blt          ra, a2, sub_2_stack_p
                  slti         t2, a3, 1362
sub_2_stack_p:    addi         s6, s6, -12
                  sw           ra, 4(s6)
                  srai         t4, t6, 14
                  c.addi       t4, 25
                  la           sp, region_0+386 #start riscv_load_store_rand_instr_stream_3
                  auipc        t2, 114316
                  lbu          s1, -133(sp)
                  lh           a4, -126(sp)
                  lbu          a4, -154(sp)
                  c.add        a7, sp
                  sh           sp, 80(sp)
                  lb           s10, 57(sp)
                  lbu          ra, -85(sp)
                  sb           a4, 195(sp)
                  and          s2, s2, t4
                  c.add        t2, a0
                  lbu          s7, 78(sp)
                  lb           gp, 242(sp)
                  lb           s10, -137(sp)
                  lb           t6, -204(sp)
                  sb           t5, -173(sp)
                  sltu         zero, a2, t4
                  lb           s8, 26(sp)
                  lb           t1, 101(sp)
                  srai         a3, tp, 13
                  addi         t2, t6, -505
                  c.nop
                  sra          a0, t0, s3
                  lh           a0, 72(sp)
                  sh           s11, 174(sp)
                  or           t1, ra, s8
                  lbu          a3, 181(sp)
                  divu         s2, a1, s0
                  sub          ra, a1, s8
                  lui          t4, 583012
                  sw           s6, -246(sp)
                  sll          t1, a2, s6
                  sb           s8, 70(sp)
                  lb           a2, 24(sp)
                  mulhu        s1, s2, s11
                  lbu          s0, 24(sp)
                  c.srai       s1, 10
                  c.srai       a0, 23
                  lh           t0, -42(sp)
                  xori         s11, a4, -1760
                  c.andi       a4, -1
                  rem          s7, s3, a1
                  sra          t6, gp, s9
                  sh           tp, 118(sp) #end riscv_load_store_rand_instr_stream_3
                  la           s3, amo_0+28 #start riscv_lr_sc_instr_stream_2
                  c.sub        a0, a5
                  auipc        t5, 836386
                  nop
                  xori         s1, ra, 30
                  c.addi16sp   sp, 224
                  c.lui        a4, 20
                  rem          t0, a6, gp
                  auipc        t1, 204420
                  nop
                  c.srli       a4, 12
                  lr.w.rl       s5, (s3)
                  c.sub        a3, a2
                  addi         s10, s11, -1992
                  slli         t6, ra, 16
                  sc.w.aq       a2, t5, (s3) #end riscv_lr_sc_instr_stream_2
                  la           s1, region_1+580 #start riscv_load_store_hazard_instr_stream_3
                  lb           a2, 211(s1)
                  lbu          a1, 211(s1)
                  lbu          a4, 211(s1)
                  lb           a4, 211(s1)
                  auipc        t3, 692247
                  lb           a1, 211(s1)
                  sb           t1, 211(s1)
                  lbu          a4, 211(s1)
                  lb           a5, 211(s1)
                  c.nop
                  lb           a4, 211(s1)
                  lbu          tp, 211(s1)
                  sb           s8, 211(s1)
                  lbu          s3, 211(s1) #end riscv_load_store_hazard_instr_stream_3
                  addi         t4, zero, 6 #init loop 1 counter
                  sltu         s5, a3, zero
                  c.addi       s7, 21
                  addi         s11, zero, 6 #init loop 1 limit
sub_2_21_1_t:     c.addi       ra, -1
                  auipc        a0, 341937
                  addi         t4, t4, -3 #update loop 1 counter
                  nop
                  addi         s0, zero, 10 #init loop 0 counter
                  mulhu        gp, s1, a3
                  addi         s1, zero, 10 #init loop 0 limit
                  sltiu        t1, t0, 1165
                  mul          ra, a6, s10
                  c.mv         t1, tp
                  c.add        a5, s10
sub_2_21_0_t:     c.add        t5, s9
                  addi         s0, s0, -9 #update loop 0 counter
                  lui          t6, 538003
                  mulhsu       s5, gp, s0
                  bgeu         s0, s1, sub_2_21_0_t #branch for loop 0
                  mulh         zero, a5, t3
                  bgeu         t4, s11, sub_2_21_1_t #branch for loop 1
                  sra          s3, t4, s11
                  la           s5, region_1+924 #start load_store_instr_stream_1
                  lb           t2, -49(s5)
                  lb           zero, 36(s5)
                  la           a4, region_0+1269 #start load_store_instr_stream_0
                  sb           s5, 35(s5)
                  lbu          a6, -34(s5)
                  lw           s2, 147(a4)
                  lb           a7, -35(a4)
                  sb           a0, 108(a4)
                  lhu          t4, 31(a4)
                  sh           s0, 33(a4)
                  lb           s11, 19(s5)
                  lbu          a3, -5(s5)
                  sb           s2, -40(a4)
                  lb           a2, -34(s5) #end load_store_instr_stream_1
                  lhu          s2, -195(a4)
                  lb           s11, 154(a4) #end load_store_instr_stream_0
sub_2_7:          jal          ra, 3f
0:                c.j          2f
1:                c.j          12f
2:                jal          ra, 1b
3:                c.jal        10f
4:                c.j          5f
5:                c.j          6f
6:                c.jal        8f
7:                c.jal        9f
8:                c.j          7b
9:                c.j          11f
10:               c.jal        4b
11:               c.jal        0b
12:               ori          s10, s4, -2037
                  la           sp, region_1+1412 #start load_store_instr_stream_1
                  la           t3, region_1+278 #start load_store_instr_stream_0
                  lhu          s7, 6(sp)
                  lb           a2, 4(t3)
                  lbu          s5, -9(t3)
                  sb           s4, 9(sp)
                  sb           t0, 7(sp)
                  lb           a5, -15(sp)
                  lbu          t0, 16(t3)
                  sb           t5, -3(sp)
                  sb           s6, 1(sp) #end load_store_instr_stream_1
                  sb           s9, -16(t3)
                  lbu          t6, 9(t3) #end load_store_instr_stream_0
sub_2_8:          jal          ra, 1f
0:                jal          s10, 23f
1:                jal          t1, 19f
2:                c.jal        18f
3:                jal          t1, 17f
4:                c.j          2b
5:                c.j          24f
6:                c.jal        26f
7:                jal          t1, 22f
8:                jal          ra, 21f
9:                c.jal        7b
10:               jal          s1, 14f
11:               c.jal        5b
12:               c.jal        10b
13:               c.j          9b
14:               c.j          13b
15:               c.j          8b
16:               jal          ra, 4b
17:               c.j          16b
18:               c.jal        20f
19:               jal          ra, 0b
20:               jal          t1, 25f
21:               jal          ra, 6b
22:               c.j          11b
23:               c.j          3b
24:               c.j          15b
25:               c.jal        12b
26:               andi         s7, gp, -1831
                  la           t1, region_0+1932 #start load_store_instr_stream_1
                  lh           tp, -246(t1)
                  la           s3, region_1+1832 #start load_store_instr_stream_0
                  lbu          a2, -113(t1)
                  sb           s3, 15(s3)
                  lh           ra, -214(t1)
                  sb           a2, -180(t1)
                  lb           a1, 49(s3)
                  sb           s9, 31(s3)
                  lb           zero, 32(s3)
                  lh           s11, -54(t1) #end load_store_instr_stream_1
                  lb           a6, -57(s3) #end load_store_instr_stream_0
                  la           s8, region_1+1970 #start load_store_instr_stream_2
                  la           t5, region_1+568 #start load_store_instr_stream_0
                  la           s11, region_1+237 #start load_store_instr_stream_1
                  lhu          zero, -1744(s8)
                  la           t0, region_1+1106 #start load_store_instr_stream_3
                  lw           ra, -237(s11)
                  lbu          ra, -1659(s8)
                  lb           tp, -3(t0)
                  lb           a0, -22(t0)
                  lb           s2, 78(s11)
                  lhu          s2, 1303(s11)
                  lw           t4, -40(t5)
                  lhu          ra, 823(s11)
                  lbu          gp, -1645(s8)
                  lbu          a1, -159(t5)
                  lbu          s2, 206(s11)
                  sb           a0, 1179(t5)
                  sb           a1, -14(t0)
                  lhu          t3, -866(s8)
                  sb           a0, -201(s8)
                  lb           a1, 417(t5)
                  lbu          a5, 49(t0)
                  lbu          t3, 1175(s11)
                  sb           t0, -1949(s8)
                  sb           s7, -45(t0)
                  lb           t3, -374(t5)
                  lbu          a7, -7(s8)
                  sh           s10, -32(t0)
                  sb           t0, -649(s8)
                  sh           a2, 16(t0)
                  sh           t4, -162(t5)
                  sb           a1, 1492(s11)
                  lh           zero, -1960(s8) #end load_store_instr_stream_2
                  sb           a5, -16(t0) #end load_store_instr_stream_3
                  sh           a6, 515(s11) #end load_store_instr_stream_1
                  lbu          zero, 1322(t5) #end load_store_instr_stream_0
                  la           sp, region_1+1874 #start riscv_load_store_rand_instr_stream_2
                  sb           a0, 15(sp)
                  sh           s7, -1344(sp)
                  lbu          a3, -676(sp)
                  sb           s3, -1623(sp)
                  lbu          a7, -576(sp)
                  lb           s1, -97(sp)
                  lui          s10, 48067
                  sb           a5, -473(sp)
                  sb           t5, -881(sp)
                  sb           s10, -993(sp)
                  sb           s10, -1531(sp)
                  lb           s7, -391(sp)
                  sb           t2, -338(sp)
                  mulhsu       s1, s6, s10
                  sb           ra, -1705(sp)
                  lb           s0, -1165(sp)
                  sb           s2, -1287(sp)
                  div          s10, a7, s11
                  sb           s1, -818(sp)
                  sub          t1, gp, s7
                  rem          s5, t5, a4
                  mul          t5, tp, ra
                  andi         s7, a1, -1725
                  lbu          gp, -164(sp)
                  sb           a0, -1492(sp)
                  lb           tp, -881(sp)
                  c.add        s11, s6
                  lb           s11, -461(sp)
                  div          zero, t6, t3
                  sw           a6, -1230(sp)
                  lb           a7, -1830(sp)
                  c.srli       a1, 7
                  lb           a7, -1705(sp)
                  lbu          tp, -1591(sp)
                  c.add        a2, s10
                  sb           s2, -293(sp) #end riscv_load_store_rand_instr_stream_2
                  la           s11, region_0+1895 #start riscv_hazard_instr_stream_2
                  sh           s3, 7(s11)
                  lbu          s0, 9(s11)
                  divu         s3, t5, s0
                  c.andi       s1, -1
                  lbu          s3, -8(s11)
                  lhu          zero, 7(s11)
                  auipc        s0, 97199
                  sb           t5, -14(s11)
                  c.srai       s0, 17
                  c.andi       s0, 25
                  div          s3, zero, s0
                  c.or         s0, s0
                  c.li         s3, -1
                  lh           s3, -11(s11)
                  mulhu        ra, s1, s3
                  c.srli       s0, 13
                  sh           ra, -7(s11)
                  sb           s1, 8(s11)
                  c.and        s1, s1
                  ori          zero, s1, 1637
                  sll          zero, t5, zero
                  lbu          s0, 6(s11)
                  c.slli       t5, 11
                  c.xor        s0, s1
                  c.mv         s1, s0
                  lb           t5, -14(s11)
                  c.or         s1, s0
                  slt          zero, zero, t5
                  slli         s3, s3, 7
                  c.addi       s1, 14
                  c.and        s1, s0
                  lb           t5, 3(s11)
                  slli         s0, s1, 28
                  sb           zero, -10(s11)
                  xor          t5, zero, s1
                  lb           t5, -16(s11)
                  c.and        s0, s0
                  lh           zero, 7(s11)
                  lbu          s1, 4(s11) #end riscv_hazard_instr_stream_2
                  la           a6, amo_0+16 #start riscv_amo_instr_stream_0
                  amoadd.w.aq   a1, s11, (a6)
                  c.srai       a2, 21
                  amoadd.w      ra, t5, (a6)
                  c.addi       ra, -1
                  c.addi16sp   sp, 384
                  amoxor.w      s8, s7, (a6)
                  sra          gp, s8, t4
                  amomaxu.w.rl  a0, s11, (a6)
                  amoand.w.aq   s7, t6, (a6)
                  c.addi16sp   sp, -16
                  amoswap.w.aq  s1, t1, (a6)
                  slt          a0, gp, a7
                  amomax.w.rl   s5, gp, (a6)
                  c.li         sp, 23
                  or           a0, s8, a5
                  amoxor.w.rl   ra, a6, (a6)
                  div          s10, s5, tp
                  amominu.w.aq  s1, a5, (a6) #end riscv_amo_instr_stream_0
sub_2_9:          jal          ra, 6f
0:                c.jal        7f
1:                c.j          2f
2:                c.j          10f
3:                c.jal        18f
4:                jal          s5, 23f
5:                c.jal        19f
6:                jal          t1, 21f
7:                jal          ra, 16f
8:                c.j          11f
9:                jal          a3, 20f
10:               c.jal        0b
11:               c.jal        24f
12:               jal          ra, 14f
13:               c.jal        27f
14:               jal          t1, 22f
15:               c.jal        3b
16:               c.j          12b
17:               c.j          26f
18:               c.j          8b
19:               c.jal        13b
20:               c.j          1b
21:               jal          t1, 17b
22:               jal          sp, 25f
23:               jal          ra, 9b
24:               c.j          5b
25:               jal          ra, 15b
26:               c.jal        4b
27:               c.j          28f
28:               sll          tp, sp, zero
                  la           gp, region_1+1478 #start riscv_load_store_rand_instr_stream_1
                  c.and        s1, s1
                  lbu          s2, 41(gp)
                  c.xor        a5, a1
                  lw           zero, 50(gp)
                  lb           s8, 61(gp)
                  sb           t6, 55(gp)
                  andi         s11, s3, -390
                  lbu          s8, 27(gp)
                  c.addi4spn   a3, sp, 128
                  c.li         t6, 21
                  sb           s3, 41(gp)
                  div          sp, sp, a0
                  lbu          t6, -4(gp)
                  c.slli       sp, 17
                  lbu          s2, -31(gp)
                  lbu          a1, -59(gp)
                  lw           t6, -14(gp)
                  c.addi       t4, -1
                  lbu          s2, -13(gp)
                  lb           s7, -47(gp)
                  lbu          a0, 11(gp)
                  divu         s7, t0, s0
                  sw           t0, -14(gp)
                  sb           s2, -8(gp)
                  c.andi       a0, -1
                  lbu          a6, 61(gp)
                  div          s3, a4, a3
                  lhu          a5, 0(gp)
                  sh           a6, -44(gp)
                  lbu          t3, -63(gp) #end riscv_load_store_rand_instr_stream_1
                  la           t3, region_0+1888 #start load_store_instr_stream_2
                  la           a3, region_0+1780 #start load_store_instr_stream_1
                  la           s11, region_0+656 #start load_store_instr_stream_0
                  lh           sp, 2(t3)
                  lhu          s1, -8(s11)
                  lb           s2, -291(a3)
                  lbu          t4, -2(s11)
                  sb           a2, 15(t3)
                  lb           s7, -7(s11)
                  sb           t6, -231(t3)
                  lbu          s8, -13(s11)
                  lb           s3, -1218(a3)
                  lh           a7, -4(s11)
                  lbu          s1, 13(s11)
                  lh           ra, -386(a3)
                  lhu          a6, 10(s11)
                  lbu          a0, -14(t3)
                  lhu          a4, 10(a3)
                  lbu          s3, -23(t3)
                  sb           a4, 10(s11)
                  lb           s10, -98(t3) #end load_store_instr_stream_2
                  sb           s7, -226(a3) #end load_store_instr_stream_1
                  sb           ra, -8(s11)
                  lb           s1, 15(s11) #end load_store_instr_stream_0
                  la           sp, region_0+832 #start riscv_load_store_hazard_instr_stream_0
                  sb           a1, -338(sp)
                  c.addi       a4, 5
                  sll          s8, ra, gp
                  lhu          t5, 358(sp)
                  lb           a4, 358(sp)
                  sb           t3, 358(sp)
                  lhu          s8, 650(sp)
                  lhu          a6, 650(sp)
                  sb           s4, 566(sp)
                  lbu          t2, -764(sp)
                  sb           ra, -439(sp)
                  sb           s10, -461(sp)
                  slti         gp, a7, 1533
                  sw           s10, 1064(sp)
                  lb           a6, 279(sp)
                  lbu          t4, -715(sp)
                  c.nop
                  lhu          s7, -350(sp)
                  lbu          t0, 885(sp)
                  rem          s11, zero, a1
                  c.swsp       a3, 72(sp) #end riscv_load_store_hazard_instr_stream_0
                  la           s5, region_1+15 #start load_store_instr_stream_0
                  lhu          s10, -13(s5)
                  la           a7, region_0+302 #start load_store_instr_stream_1
                  lb           t4, -15(a7)
                  lhu          a5, 83(s5)
                  lb           t0, 29(a7)
                  lbu          t0, 88(s5)
                  sw           s11, 58(a7)
                  lh           a4, -36(a7)
                  lw           a1, 45(s5)
                  lw           a6, -62(a7)
                  lb           gp, 3(a7)
                  lb           s11, 158(s5)
                  lh           a6, 43(s5)
                  lb           t2, 140(s5)
                  sb           s6, -51(a7)
                  lbu          s11, 150(s5)
                  sh           s11, 16(a7)
                  lbu          t2, 214(s5)
                  lb           a6, 21(a7) #end load_store_instr_stream_1
                  sb           s4, 236(s5) #end load_store_instr_stream_0
                  la           ra, region_0+1777 #start load_store_instr_stream_2
                  la           s7, region_0+1365 #start load_store_instr_stream_1
                  la           s1, region_0+1637 #start load_store_instr_stream_4
                  sb           t2, 37(s1)
                  la           s8, region_0+1291 #start load_store_instr_stream_0
                  lb           a6, 13(s1)
                  lb           a1, -18(s7)
                  lhu          tp, -17(s1)
                  lbu          t1, 57(s1)
                  sb           t1, -88(ra)
                  lb           t5, 62(s7)
                  la           a3, region_0+1648 #start load_store_instr_stream_3
                  sh           t2, -63(s8)
                  sh           s9, -31(s8)
                  lbu          a1, 19(ra)
                  lbu          tp, 220(ra)
                  sb           t5, -18(s7)
                  lhu          a7, -47(s8)
                  lb           t3, -209(a3)
                  sh           a0, -37(s1)
                  lb           gp, 60(s8)
                  lb           a7, 0(ra)
                  lb           t3, 20(s1)
                  lb           a4, -104(a3)
                  lbu          t1, -47(s7)
                  sh           gp, -37(s1)
                  sw           t5, -1(s1)
                  sb           s1, -171(ra)
                  lhu          s2, -159(ra)
                  sb           ra, 64(s1)
                  sb           t1, -69(a3)
                  sb           s6, -24(s7)
                  lb           a5, -40(a3)
                  lbu          zero, -213(ra)
                  lbu          zero, -242(a3) #end load_store_instr_stream_3
                  lbu          sp, 62(s1) #end load_store_instr_stream_4
                  lbu          s3, 58(s7)
                  lbu          s0, 58(s7) #end load_store_instr_stream_1
                  lb           a2, -183(ra)
                  sh           a0, -49(s8)
                  sb           s6, 46(s8)
                  sw           s0, 151(ra)
                  sb           t4, -42(ra) #end load_store_instr_stream_2
                  lb           t5, -62(s8) #end load_store_instr_stream_0
                  la           sp, region_0+1196 #start riscv_load_store_hazard_instr_stream_1
                  sb           t0, -1(sp)
                  lb           a2, -1(sp)
                  sb           a4, -1(sp)
                  sb           t1, -1(sp)
                  sb           t5, -1(sp)
                  lb           zero, 13(sp)
                  lb           s1, 13(sp)
                  sb           s5, 13(sp)
                  lbu          s0, 13(sp)
                  lb           a0, 13(sp)
                  lbu          a7, 13(sp)
                  c.xor        a4, a0
                  lb           ra, 13(sp)
                  c.srai       s0, 24
                  sb           a5, -4(sp)
                  lbu          a7, -4(sp)
                  lh           a6, -4(sp)
                  sw           s0, -4(sp)
                  sh           t1, -4(sp)
                  sb           t6, -4(sp) #end riscv_load_store_hazard_instr_stream_1
                  la           t2, region_0+1183 #start load_store_instr_stream_0
                  lbu          s7, -44(t2)
                  la           s2, region_1+1163 #start load_store_instr_stream_1
                  lb           gp, -10(t2)
                  sb           s11, -984(s2)
                  lhu          a4, 17(t2)
                  sw           a0, 113(s2)
                  lb           s8, -972(s2)
                  sh           s4, -33(t2)
                  sb           s3, 36(t2)
                  lb           zero, 51(t2)
                  lw           a0, 253(s2)
                  lbu          a1, -866(s2) #end load_store_instr_stream_1
                  lh           a1, -59(t2) #end load_store_instr_stream_0
                  la           sp, region_0+1838 #start riscv_hazard_instr_stream_0
                  lw           s7, -14(sp)
                  mulh         s7, s7, a4
                  div          s7, s11, a0
                  slli         a0, t0, 20
                  sb           s11, 10(sp)
                  ori          s0, s0, 454
                  srl          t0, s0, t0
                  lhu          t0, -16(sp)
                  lb           s0, 11(sp)
                  lbu          s7, -4(sp)
                  lhu          s0, -2(sp)
                  lb           s0, -9(sp)
                  lb           a0, -10(sp)
                  lui          t0, 854773
                  lbu          a0, 11(sp)
                  lh           a0, -16(sp)
                  lw           s11, -2(sp)
                  mulhsu       a4, a4, t0
                  andi         a0, s11, -1413
                  c.li         t0, 18
                  lbu          t0, 15(sp)
                  lb           s7, 3(sp)
                  sb           a0, 3(sp)
                  c.srli       a4, 26
                  lbu          s0, 11(sp)
                  sw           a4, -2(sp)
                  div          t0, s0, s11
                  c.sub        a4, a0
                  c.srai       a0, 29
                  addi         s0, a4, 79
                  rem          a0, s11, a4
                  lb           s11, 0(sp)
                  sll          a4, a4, s11
                  c.lui        a4, 18
                  nop
                  lb           s7, 5(sp)
                  srai         a0, t0, 9
                  nop
                  sb           s7, -9(sp)
                  add          t0, s0, s11
                  nop
                  c.or         a4, a0
                  sub          t0, a4, t0
                  nop
                  sll          t0, s7, t0
                  lb           t0, 12(sp)
                  or           t0, a0, s7
                  lbu          t0, 3(sp)
                  c.sub        a4, a4
                  srl          s11, t0, s7
                  lbu          s0, -2(sp)
                  sb           s11, 13(sp) #end riscv_hazard_instr_stream_0
                  la           s7, region_1+488 #start riscv_load_store_rand_instr_stream_0
                  sb           sp, 1(s7)
                  sw           t4, 16(s7)
                  xori         t3, a7, 410
                  lbu          tp, 11(s7)
                  lhu          s1, 2(s7)
                  lb           t5, 2(s7)
                  mulhsu       a5, gp, a6
                  sw           zero, 8(s7)
                  slt          t5, s6, t2
                  c.or         s1, s1
                  ori          t4, zero, -1424
                  lh           zero, 10(s7)
                  c.xor        a1, a3
                  lb           a3, -7(s7)
                  sb           gp, -1(s7)
                  lhu          s10, -4(s7)
                  lb           a4, -7(s7)
                  lw           gp, 0(s7)
                  lb           s3, 11(s7)
                  c.li         a7, 1
                  lb           s1, -8(s7)
                  sh           s10, -6(s7)
                  auipc        t1, 802186
                  sb           a2, -3(s7)
                  c.nop
                  sb           a4, 11(s7)
                  lb           t6, -13(s7)
                  lh           gp, 12(s7)
                  lb           s5, -3(s7)
                  sb           s11, -8(s7)
                  sw           tp, 12(s7)
                  nop
                  c.li         s1, 12
                  sb           s0, -1(s7)
                  lw           a3, -16(s7)
                  lbu          a7, 13(s7)
                  lbu          a7, 5(s7)
                  lb           a6, -5(s7)
                  sb           zero, 1(s7)
                  srai         t0, a5, 11
                  lb           tp, -11(s7) #end riscv_load_store_rand_instr_stream_0
                  la           tp, region_1+27 #start riscv_hazard_instr_stream_1
                  lbu          s2, 358(tp)
                  sb           t6, 1534(tp)
                  lb           s3, 1854(tp)
                  slt          s2, s3, t6
                  xor          t6, a2, s2
                  c.xor        a0, a0
                  mulhsu       s1, a2, a2
                  mulhsu       a0, t6, a2
                  sb           a0, 1064(tp)
                  sb           t6, 1925(tp)
                  mul          a2, s1, a0
                  slt          s2, a2, s1
                  xor          s1, t6, s2
                  lb           a0, 411(tp)
                  lhu          s2, 729(tp)
                  slli         a0, s2, 14
                  lbu          t6, 827(tp)
                  sll          a2, s1, s1
                  sb           a2, 1604(tp)
                  xor          s1, s1, s2
                  add          a2, s1, s3
                  xori         s2, a2, -348
                  ori          t6, s1, 1468
                  lui          s2, 599323
                  c.srai       a0, 8
                  sb           s2, 1717(tp)
                  sb           a0, 1536(tp)
                  lbu          t6, 1903(tp)
                  slli         a2, a2, 25
                  lw           a2, 993(tp)
                  mulhu        a2, s1, t6
                  srl          s1, s1, s1
                  lb           s3, 1122(tp)
                  lb           a2, 1526(tp)
                  sb           s2, 1143(tp) #end riscv_hazard_instr_stream_1
                  la           s5, amo_0+40 #start riscv_amo_instr_stream_2
                  la           gp, amo_0+4
                  amoand.w.aq   s2, t0, (s5)
                  amomaxu.w.aq  a7, s5, (gp)
                  amoor.w       a3, a1, (gp)
                  amoadd.w.rl   a4, s2, (gp) #end riscv_amo_instr_stream_2
                  addi         t5, zero, 8 #init loop 1 counter
                  remu         t2, a2, s10
                  addi         ra, zero, 17 #init loop 1 limit
sub_2_19_1_t:     c.nop
                  c.nop
                  addi         t5, t5, 3 #update loop 1 counter
                  addi         s0, zero, -6 #init loop 0 counter
                  lui          s8, 559263
                  nop
                  addi         s1, zero, -19 #init loop 0 limit
sub_2_19_0_t:     c.addi       s8, 20
                  srai         a6, s1, 2
                  addi         s0, s0, -7 #update loop 0 counter
                  bge          s0, s1, sub_2_19_0_t #branch for loop 0
                  mulhsu       s11, s9, t0
                  div          a2, s5, sp
                  mulhu        a7, t5, zero
                  divu         a7, s1, s5
                  blt          t5, ra, sub_2_19_1_t #branch for loop 1
                  c.sub        a2, a1
                  la           t1, amo_0+8 #start riscv_lr_sc_instr_stream_1
                  lr.w.aq       s10, (t1)
                  c.and        a2, s0
                  and          t0, a2, a3
                  nop
                  c.li         s11, -1
                  div          s0, a2, t6
                  sc.w          s0, s5, (t1) #end riscv_lr_sc_instr_stream_1
                  bgeu         s10, a6, 19f
                  c.beqz       a4, 9f
                  slt          s11, gp, t1
                  mul          t4, zero, tp
                  sub          t5, sp, s0
                  addi         t6, s5, -1791
                  c.or         a5, s0
                  or           a0, t2, a2
                  and          s2, s8, s8
9:                c.srai       a1, 24
                  srli         s8, t3, 10
                  beq          s11, s7, 29f
                  sll          t3, s11, s4
                  c.addi16sp   sp, 448
                  bgeu         sp, t0, 30f
                  c.slli       gp, 23
                  c.add        s1, t4
                  c.xor        s1, a2
                  c.mv         t3, a5
19:               sra          a2, t1, a3
                  bltu         t0, a0, 34f
                  div          s5, a6, tp
                  bne          a1, t1, 42f
                  mulhu        s10, t3, a2
                  bltu         a3, s3, 34f
                  bltu         a0, t2, 38f
                  xori         t5, a1, -1990
                  andi         t4, s0, -2009
                  ori          a7, s6, -1485
29:               c.mv         s1, a4
30:               div          a2, a1, a2
                  c.or         a0, s1
                  c.addi16sp   sp, 208
                  mul          a3, t4, a0
34:               andi         tp, ra, 2012
                  remu         ra, gp, s1
                  div          t5, s0, t3
                  c.srli       a2, 2
38:               xor          t6, s8, a6
                  sltu         t2, a0, a0
                  mulhu        s0, a3, s5
                  c.bnez       a5, 59f
42:               addi         t1, a5, -1247
                  add          a2, a0, ra
                  c.andi       a2, 31
                  andi         s5, a6, -1686
                  c.addi16sp   sp, -16
                  div          a7, t0, a1
                  c.addi16sp   sp, -16
                  c.addi4spn   a3, sp, 128
                  c.slli       a1, 6
                  xori         t2, t3, -1095
                  c.slli       s1, 11
                  c.or         s0, a3
                  remu         a7, s0, tp
                  nop
                  c.mv         a6, s10
                  srli         a2, t3, 4
                  c.srai       a1, 11
59:               lui          s7, 505841
                  bge          ra, a2, 80f
                  xor          s1, s10, t6
                  nop
                  c.addi16sp   sp, 304
                  c.addi16sp   sp, 160
                  rem          gp, a2, a2
                  mulh         t5, zero, t4
                  mulhu        s2, gp, s4
                  or           ra, t3, s4
                  srai         gp, s4, 11
                  div          t2, t2, ra
                  sra          a0, t4, s6
                  sltu         a5, t2, sp
                  slti         a4, t1, 1105
                  bgeu         a3, a4, 76f
                  auipc        t0, 476961
76:               c.add        s5, a0
                  c.addi       tp, 7
                  bltu         a5, tp, 97f
                  remu         s10, gp, t3
80:               auipc        t2, 519792
                  sub          zero, t0, s11
                  remu         s2, a3, t4
                  divu         a1, s0, t5
                  c.xor        a0, a4
                  c.andi       s0, 28
                  c.slli       gp, 19
                  c.mv         s2, s4
                  c.slli       s8, 26
                  c.addi16sp   sp, 256
                  c.mv         tp, s10
                  sra          s11, s11, s11
                  beq          ra, t4, 109f
                  or           s10, ra, s0
                  sub          s8, a2, zero
                  c.slli       gp, 24
                  sll          s2, a3, a0
97:               c.add        a7, s6
                  ori          a4, t0, -977
                  c.or         a0, s0
                  lui          s3, 638665
                  auipc        s7, 909885
                  c.xor        a2, s0
                  c.srli       a0, 7
                  bgeu         a3, zero, 108f
                  mulh         s1, zero, ra
                  slti         sp, zero, 460
                  c.xor        a1, a4
108:              sub          s11, t3, a4
109:              c.li         s7, -1
                  slt          a5, s3, a1
                  rem          a3, t6, s9
                  addi         tp, s5, -1754
                  sll          t2, t3, a7
                  nop
                  c.or         a1, a1
                  sltiu        a2, ra, -1469
                  blt          a0, a1, 120f
                  beq          tp, a5, 124f
                  sll          a1, s2, s2
120:              c.sub        a4, s1
                  or           t5, s6, s10
                  c.and        a1, s1
                  and          t3, tp, a6
124:              c.bnez       s1, 134f
                  xor          t0, s1, s2
                  mulh         a2, ra, t6
                  slli         s1, s4, 25
                  andi         s3, gp, -1737
                  mul          tp, gp, t1
                  mul          zero, t0, s6
                  srli         t5, s11, 23
                  xori         t1, s6, -248
                  slti         a4, t2, 364
134:              beq          a3, s0, 152f
                  or           t2, a2, t4
                  c.bnez       a0, 153f
                  c.andi       a4, 10
                  slti         t1, s10, 930
                  bgeu         s5, t5, 151f
                  sll          ra, s7, a7
                  c.andi       s1, 0
                  add          ra, t2, tp
                  divu         s7, tp, s3
                  slli         s7, s1, 0
                  srai         s7, a0, 29
                  beq          s5, t3, 151f
                  c.nop
                  c.addi16sp   sp, -16
                  c.li         sp, 6
                  c.and        a0, s1
151:              xori         sp, s4, 1811
152:              c.mv         t6, a6
153:              c.add        t1, t3
                  c.add        s8, a2
                  slti         t2, a1, -495
                  c.beqz       a4, 167f
                  auipc        s3, 775955
                  mul          a5, a5, s9
                  mulhu        a7, s5, t3
                  mulhu        ra, gp, a1
                  sub          s0, a4, ra
                  c.beqz       a1, 171f
                  c.li         s11, -1
                  blt          s2, t4, 179f
                  bne          s7, t6, 180f
                  sll          t2, tp, s8
167:              c.addi       a4, -1
                  srl          a0, zero, s10
                  beq          t1, t1, 173f
                  bltu         t6, s6, 173f
171:              c.addi       a3, 29
                  c.or         s1, s1
173:              slli         a0, s4, 4
                  xori         t1, a4, -508
                  xor          t6, s11, s3
                  c.sub        a1, a1
                  sltu         s1, t0, s6
                  div          s10, a3, t3
179:              srai         sp, zero, 8
180:              sll          t1, s0, s4
                  sll          a0, s7, s11
                  mulh         a1, s0, t3
                  srl          t4, s4, a2
                  divu         a4, ra, s10
                  srl          a0, s4, tp
                  xori         tp, s9, 172
                  c.nop
                  sub          s5, a6, a3
                  c.nop
                  slli         t4, t0, 9
                  andi         zero, a0, 427
                  srl          t1, tp, tp
                  add          s3, t4, a0
                  c.nop
                  c.or         a3, a4
                  c.addi4spn   s0, sp, 416
                  slt          tp, a4, ra
                  ori          t3, tp, -240
                  xor          s3, s3, a0
                  add          ra, a7, s5
                  c.mv         s1, s9
                  c.slli       s1, 4
                  c.li         a1, 31
                  mulhsu       s0, a2, a7
                  remu         t3, tp, t6
                  bltu         s6, s2, 224f
                  mulhsu       s10, t3, s8
                  c.lui        t4, 2
                  c.addi16sp   sp, -16
                  c.addi16sp   sp, -16
                  mulhsu       s7, t2, t5
                  c.lui        s0, 22
                  bge          zero, s7, 223f
                  divu         a6, sp, s1
                  slli         a7, t4, 8
                  div          zero, t4, s1
                  c.beqz       a1, 222f
                  lui          a3, 82452
                  add          s2, a4, s8
                  auipc        ra, 913686
                  div          a0, a5, t0
222:              bgeu         sp, s4, 237f
223:              c.slli       t0, 5
224:              beq          tp, a1, 234f
                  addi         a2, s9, 1171
                  srli         sp, s6, 0
                  beq          t1, zero, 244f
                  sltu         a0, a1, s6
                  xor          ra, t4, s10
                  or           gp, ra, t2
                  beq          a7, a0, 251f
                  c.beqz       a2, 250f
                  nop
234:              ori          a6, a2, 83
                  blt          tp, a7, 253f
                  sub          t3, a4, a6
237:              mulhu        a5, t1, t5
                  sll          t2, s1, a5
                  c.or         a1, a2
                  nop
                  c.bnez       a0, 261f
                  c.mv         t5, s2
                  c.and        a1, a0
244:              lui          t6, 764689
                  and          s7, a4, sp
                  xor          sp, a5, t4
                  bltu         t5, s9, 250f
                  sll          t1, sp, t4
                  c.li         gp, -1
250:              auipc        a0, 991010
251:              slli         s3, t0, 21
                  sll          a6, a0, zero
253:              bgeu         s0, s11, 268f
                  c.xor        a1, a3
                  xori         t6, s5, -948
                  divu         s10, a4, s6
                  srai         a4, s5, 3
                  ori          a3, a1, -530
                  c.addi4spn   a3, sp, 464
                  ori          s8, t4, -1033
261:              slli         t6, s6, 25
                  srai         s11, t2, 13
                  mulhu        t1, a3, s3
                  beq          a3, t1, 270f
                  lui          a2, 673276
                  c.beqz       a4, 268f
                  mulhu        gp, ra, s5
268:              srl          t1, sp, s3
                  c.mv         a2, a2
270:              mulh         a6, ra, s2
                  c.xor        a5, a5
                  auipc        t6, 475490
                  srli         s0, t6, 6
                  divu         t6, s0, s8
                  slli         s2, s11, 31
                  c.srai       s0, 28
                  slti         a0, a2, -534
                  div          t6, t1, s10
                  div          s3, a0, s3
                  remu         t3, s4, a4
                  slli         s8, t2, 15
                  blt          tp, t3, 299f
                  slti         a7, t5, -268
                  sltu         a1, s11, s6
                  and          s2, t2, t1
                  srli         s3, s6, 1
                  addi         t0, zero, -7 #init loop 1 counter
                  addi         a4, zero, -14 #init loop 1 limit
sub_2_20_1_t:     c.addi4spn   a5, sp, 544
                  xori         t1, t2, 1722
                  addi         t0, t0, -7 #update loop 1 counter
                  addi         s1, zero, 2 #init loop 0 counter
                  sub          a1, t3, t1
                  sltu         ra, t4, a1
                  sra          s0, s4, s5
                  addi         a7, zero, -19 #init loop 0 limit
                  xor          a1, sp, s0
sub_2_20_0_t:     c.nop
                  c.xor        s0, s1
                  addi         s1, s1, -7 #update loop 0 counter
                  divu         a0, t4, s0
                  bne          s1, a7, sub_2_20_0_t #branch for loop 0
                  remu         s0, t5, t5
                  bne          t0, a4, sub_2_20_1_t #branch for loop 1
                  nop
                  slt          a1, s4, s2
                  xori         s2, s2, 680
                  slti         ra, t0, -1670
                  rem          t0, t1, s1
                  c.lui        a2, 28
                  add          sp, t6, sp
                  c.beqz       s0, 303f
                  bltu         s1, ra, 304f
                  c.andi       a4, -1
                  c.addi       s7, 14
                  sltiu        t2, s9, -1351
                  sub          sp, a6, zero
299:              srli         t0, t4, 11
                  ori          s11, a7, 646
                  lui          t6, 795241
                  sra          t0, a4, a3
303:              rem          a7, a0, ra
304:              divu         s11, a1, s11
                  bgeu         a2, s1, 324f
                  addi         t6, s8, -983
                  c.sub        s1, a4
                  c.addi       a2, -1
                  slt          a7, a2, s8
                  sltu         gp, s9, zero
                  sll          s0, s2, tp
                  c.srai       a2, 28
                  blt          s3, s2, 331f
                  c.add        t1, s8
                  sltiu        s10, s5, 1666
                  andi         t3, t2, -1068
                  xor          t1, ra, gp
                  xor          a2, s4, s2
                  c.addi4spn   a1, sp, 720
                  remu         t6, zero, t0
                  bgeu         s9, zero, 325f
                  c.slli       tp, 17
                  c.beqz       s0, 336f
324:              srai         gp, a5, 23
325:              mulhu        t1, a4, sp
                  bltu         a6, a5, 340f
                  addi         s3, t3, -457
                  sll          s10, a6, s10
                  slt          a0, ra, s9
                  bge          a0, s1, 348f
331:              bge          s7, s9, 336f
                  c.addi       t1, -1
                  lui          a4, 637621
                  andi         a0, t1, 474
                  c.sub        a4, s1
336:              auipc        s1, 887730
sub_2_10:         jal          ra, 8f
0:                c.jal        11f
1:                jal          a2, 10f
2:                jal          gp, 5f
3:                c.jal        6f
4:                c.j          12f
5:                jal          t1, 7f
6:                c.j          0b
7:                jal          t4, 4b
8:                c.jal        1b
9:                c.jal        3b
10:               jal          ra, 9b
11:               c.j          2b
12:               divu         s7, a5, a6
                  mulhsu       s1, s6, t3
                  bltu         a3, a6, 347f
                  c.srli       s1, 1
340:              auipc        s2, 633548
                  c.addi16sp   sp, -16
                  c.and        a3, a1
                  bgeu         a5, a1, 346f
                  sltu         t6, gp, sp
                  c.and        a1, a1
346:              c.addi16sp   sp, 80
347:              c.addi16sp   sp, -16
348:              mulh         s10, s6, s4
                  andi         sp, a6, -195
                  c.beqz       a3, 358f
                  c.sub        a2, a1
                  xor          a2, s1, s9
                  c.beqz       a2, 364f
                  bgeu         ra, zero, 358f
                  remu         a3, a2, t5
                  srli         tp, s8, 1
                  c.add        s3, t1
358:              remu         a6, t1, t0
                  c.and        a1, a4
                  c.sub        a2, a4
                  beq          s9, s3, 373f
                  c.lui        ra, 19
                  sltu         s1, a2, zero
364:              c.slli       sp, 26
                  nop
                  or           s3, s4, s9
                  c.sub        a2, a2
                  la           tp, region_0+1624 #start riscv_load_store_hazard_instr_stream_2
                  srl          s7, s8, a7
                  lw           zero, 68(tp)
                  mul          a6, t0, s3
                  sltiu        s2, s11, -1396
                  sb           s0, 68(tp)
                  lh           a2, 68(tp)
                  lbu          ra, 219(tp)
                  lb           t0, 165(tp)
                  lbu          a6, 122(tp)
                  srl          ra, s9, t3
                  lbu          a2, 122(tp)
                  sh           s4, -76(tp)
                  lhu          s10, -76(tp)
                  lbu          t0, -76(tp)
                  sw           s1, -76(tp)
                  c.and        a2, s0
                  andi         a4, s6, 1559
                  sb           ra, -83(tp)
                  sra          s2, s9, a5
                  lbu          s10, -83(tp) #end riscv_load_store_hazard_instr_stream_2
                  c.addi16sp   sp, 32
                  xori         t2, t5, -716
                  c.nop
                  slt          zero, s2, a1
                  c.andi       a1, 5
373:              c.mv         a3, a2
                  rem          t6, s10, s11
                  auipc        t4, 416357
                  c.nop
                  c.slli       a2, 18
                  bltu         a6, s9, 383f
                  c.srli       s0, 24
                  nop
                  srli         t6, t3, 5
                  auipc        s11, 468957
383:              bgeu         a2, a5, 402f
                  xor          s2, t1, s7
                  sra          t3, t5, s2
                  sll          a6, s7, gp
                  mul          a3, a7, ra
                  c.andi       a4, -1
                  c.xor        a3, a4
                  and          t5, s9, t6
                  bne          s1, s8, 407f
                  andi         s8, s7, -1870
                  c.andi       a3, -1
                  mulhsu       s5, s7, sp
                  sltiu        sp, t1, 1278
                  c.li         s10, -1
                  blt          t2, a2, 413f
                  blt          a5, zero, 417f
                  nop
                  andi         s7, a4, -1909
                  sra          s2, sp, s11
402:              remu         s0, s6, t5
                  c.nop
                  srl          tp, t5, tp
                  c.beqz       a4, 411f
                  srli         a5, t6, 14
407:              xor          s1, a6, a4
                  slt          a6, s2, a5
                  c.srai       s0, 19
                  mulhu        t4, s5, s3
411:              rem          a3, t5, sp
                  or           s1, a3, s9
413:              auipc        s10, 55499
                  lui          ra, 598277
                  remu         s8, tp, a1
                  c.mv         ra, t5
417:              sltu         t2, a6, a5
                  mulhu        s7, s7, tp
                  xori         a3, zero, -1633
                  nop
                  c.srai       s0, 17
                  bgeu         t0, s9, 440f
                  c.srai       a3, 5
                  blt          a7, t3, 444f
                  sra          t5, s10, s1
                  xori         t1, s7, 1196
                  srai         a6, t4, 14
                  mulhu        s11, zero, t3
                  mul          s10, a2, s3
                  c.slli       a1, 16
                  nop
                  ori          a1, a3, 1426
                  c.addi16sp   sp, -16
                  c.slli       s5, 27
                  mulh         s0, s10, t6
                  or           s3, gp, t2
                  srai         a3, t5, 19
                  rem          s5, a4, a4
                  c.and        a3, s0
440:              c.lui        tp, 14
                  c.mv         s5, a7
                  slt          t0, s8, s10
                  c.slli       gp, 17
444:              c.sub        s0, a4
                  c.lui        a1, 1
                  sub          a4, s2, s0
                  c.or         a1, s1
                  c.nop
                  beq          s11, s11, 461f
                  bltu         t5, t4, 468f
                  c.beqz       a1, 471f
                  c.beqz       a5, 461f
                  lui          a4, 138031
                  sltiu        a7, a2, 5
                  c.add        t4, a2
                  xor          t3, a7, s8
                  sra          s2, t6, s2
                  remu         s10, tp, t4
                  c.bnez       a0, 467f
                  mulh         s0, s8, a7
461:              sra          s8, zero, s0
                  sll          a0, sp, t4
                  bne          t3, a7, 477f
                  slt          a3, zero, a2
                  beq          t6, s0, 468f
                  c.beqz       s1, 470f
467:              bltu         s8, gp, 477f
468:              c.add        a3, ra
                  c.lui        tp, 30
470:              bltu         s4, s9, 474f
471:              c.srai       a3, 14
                  blt          t1, a0, 489f
                  divu         a6, t3, s8
474:              slti         a5, tp, 84
                  c.xor        a4, s0
                  nop
477:              nop
                  mulhsu       s1, t6, s2
                  slli         s5, t2, 25
                  c.li         a6, 2
                  slli         s5, a1, 17
                  nop
                  xori         tp, a6, 2023
                  or           s1, s8, s7
                  srl          s8, gp, t6
                  sltiu        a5, t2, 418
                  lui          s5, 453153
                  slli         zero, a7, 21
489:              c.add        s7, s7
                  c.beqz       a5, 505f
                  c.srai       a3, 18
                  slt          a2, s11, t1
                  lui          t4, 223452
                  c.li         tp, -1
                  mulhu        s7, s0, s9
                  or           a1, a6, ra
                  c.srli       a2, 13
                  slli         tp, s5, 29
                  c.nop
                  slti         a7, s6, -1558
                  srai         s11, s9, 0
                  beq          a2, t1, 504f
                  auipc        t2, 473552
504:              c.slli       t0, 1
505:              nop
                  c.li         a5, 5
                  c.bnez       a2, 520f
                  c.nop
                  addi         t0, s5, -1311
                  c.addi       a2, -1
                  andi         s5, a1, 1095
                  slt          a1, gp, a0
                  slti         s10, t6, 1124
                  xor          s7, a0, a1
                  sra          tp, s1, s0
                  sub          s2, a7, t5
                  c.beqz       a3, 522f
                  slti         sp, a3, 118
                  c.andi       a3, 6
520:              div          tp, a2, a5
                  c.slli       a7, 28
522:              bne          gp, s6, 537f
                  sra          s10, t2, sp
                  andi         a1, a1, 1893
                  ori          ra, a7, 977
                  srli         s10, tp, 26
                  sltiu        s3, ra, 283
                  andi         a2, s7, -371
                  c.li         gp, 23
                  c.nop
                  bne          s10, s0, 550f
                  sltu         s3, sp, t5
                  mulhsu       s11, a4, a7
                  andi         a1, t2, 807
                  c.lui        a2, 22
                  c.andi       a4, 18
537:              c.and        a3, a0
                  c.nop
                  bltu         s10, a2, 557f
                  and          t2, a1, sp
                  mul          a2, s10, t6
                  mulhsu       t6, sp, a3
                  c.add        s3, a0
                  or           a7, gp, a3
                  sra          a1, s3, a2
                  bne          s11, s6, 556f
                  remu         a2, gp, t2
                  beq          sp, s9, 551f
                  srl          t6, s8, a2
550:              add          t5, s2, tp
551:              c.bnez       s0, 568f
                  c.andi       a5, -1
                  ori          s5, t5, -455
                  c.andi       a3, 28
                  c.sub        a2, s1
556:              xori         s3, s6, 1669
557:              c.addi16sp   sp, 352
                  c.and        a5, a3
                  c.sub        a3, a0
                  c.add        t1, t3
                  mulhsu       a7, a0, s0
                  c.sub        a1, a4
                  xor          ra, s6, a3
                  c.sub        a3, a0
                  slti         a7, s11, 688
                  c.or         a3, s1
                  rem          a7, s0, t3
568:              sub          t2, a0, t1
                  ori          s5, s0, -2038
                  and          t6, tp, s0
                  auipc        a2, 283896
                  c.sub        a4, s1
                  bltu         sp, s6, 591f
                  c.addi4spn   a1, sp, 800
                  bge          s1, s4, 586f
                  remu         t1, a4, zero
                  blt          s10, s10, 587f
                  xor          a7, t5, ra
                  blt          s6, sp, 584f
                  srai         tp, a6, 11
                  c.addi       a5, 5
                  mulhsu       zero, ra, t0
                  srl          zero, t6, t2
584:              c.sub        a5, a3
                  bgeu         t4, s3, 603f
586:              c.srai       s0, 4
587:              c.addi4spn   a1, sp, 288
                  srli         t5, a0, 13
                  slt          sp, s8, s5
                  add          t3, a3, a7
591:              srai         s0, a5, 22
                  c.addi16sp   sp, 144
                  c.bnez       a4, 602f
                  c.andi       a0, -1
                  bge          t2, t0, 601f
                  c.or         s0, a5
                  c.beqz       s1, 600f
                  slt          a4, s4, s5
                  srl          sp, s6, a2
600:              bgeu         a5, a5, 604f
601:              c.mv         s2, a3
602:              blt          s0, s0, 606f
603:              srl          zero, t4, s1
604:              ori          t1, a0, 1528
                  c.addi16sp   sp, 368
606:              c.xor        a4, a3
                  c.lui        a2, 19
                  c.xor        a1, s1
                  sll          t4, s9, t3
                  c.addi4spn   a1, sp, 816
                  c.nop
                  mul          s10, ra, s4
                  sub          a4, sp, t0
                  c.add        t4, a1
                  xor          a7, s8, s3
                  auipc        a2, 135239
                  la           s11, sub_3
                  addi         s11, s11, 432
                  bge          tp, s7, sub_2_j5 #branch to jump instr
                  and          s2, s5, s3
sub_2_j5:         jalr         ra, s11, -431 #jump sub_2 -> sub_3
                  c.andi       a0, -1
                  mulh         s0, tp, ra
                  or           s10, s8, s0
                  rem          s5, t3, sp
                  mulhsu       s7, a6, a2
                  c.add        s5, s9
                  c.andi       a3, 16
                  c.li         a0, -1
                  rem          a7, s1, s1
                  blt          tp, t5, 635f
                  mulhsu       a4, tp, a7
                  addi         s5, s4, 1304
                  div          t2, t4, ra
                  c.addi16sp   sp, -16
                  add          s0, a5, s0
                  bltu         a6, a2, 644f
                  bltu         a2, a3, 644f
                  c.srai       a3, 30
                  remu         a4, s3, t0
                  c.beqz       a0, 644f
                  remu         t6, a7, s2
                  c.addi       s8, -1
                  c.or         s1, a5
                  c.srli       a5, 23
                  srli         s2, s7, 6
635:              c.mv         t4, s6
                  slti         s10, s11, 1603
                  sub          zero, t5, s8
                  div          a2, s11, a3
                  c.xor        a1, a1
                  addi         sp, a1, 121
                  c.andi       a1, 30
                  c.or         a1, a1
                  bgeu         s8, a7, 653f
644:              c.lui        gp, 31
                  c.li         s7, 12
                  c.bnez       a2, 651f
                  xori         s3, a4, -817
                  xor          t3, a7, s0
                  c.li         s10, -1
                  bgeu         tp, s7, 665f
651:              sltiu        sp, s10, 1342
                  nop
653:              slt          a6, s0, s3
                  divu         t5, a6, t3
                  blt          s8, tp, 673f
                  sltu         t1, t1, a5
                  srli         s11, s3, 6
                  xor          s5, s10, s1
                  c.add        t6, s1
                  beq          s9, ra, 677f
                  sltiu        tp, tp, 1185
                  bgeu         sp, t5, 676f
                  bltu         zero, a1, 673f
                  sub          s5, a0, a6
665:              c.lui        s5, 27
                  c.add        sp, a7
                  ori          t5, s3, -1586
                  divu         s8, zero, zero
                  c.xor        a2, a4
                  c.bnez       a3, 680f
                  c.lui        t2, 9
                  c.addi4spn   a0, sp, 1008
673:              rem          a0, a6, ra
                  c.li         s2, -1
                  sltiu        t4, a6, -1361
676:              xor          s2, t4, s8
677:              nop
                  c.slli       s3, 14
                  xor          t1, t3, a7
680:              c.andi       s0, -1
                  andi         t3, a3, 314
                  sll          ra, sp, t3
                  c.and        s1, a5
                  divu         t0, s5, t2
                  add          a1, a2, t3
                  mulh         t5, s8, s4
                  ori          s3, t5, -447
                  c.addi4spn   a1, sp, 816
                  srai         a3, s0, 18
                  beq          t5, s11, 703f
                  andi         s0, t0, 1691
                  c.srai       a3, 26
                  div          s3, a7, a4
                  sltiu        s5, t2, -1866
                  mulhsu       t5, a0, s5
                  div          zero, ra, s4
                  and          a5, a6, s7
                  mulhu        a1, s7, s5
                  c.addi       a3, 2
                  beq          s3, a6, sub_2_j4 #branch to jump instr
                  c.srli       a3, 9
                  c.add        a3, t4
                  c.srai       s0, 15
sub_2_j4:         jal          ra, sub_3 #jump sub_2 -> sub_3
                  c.add        t1, s0
                  la           s8, amo_0+44 #start riscv_lr_sc_instr_stream_0
                  c.slli       s2, 14
                  sra          s11, s4, tp
                  mulh         t5, s10, s8
                  lr.w.aq       a5, (s8)
                  sc.w.aq       a6, sp, (s8) #end riscv_lr_sc_instr_stream_0
                  c.addi       s7, 19
                  c.and        a3, a0
                  c.srai       a3, 1
                  c.addi16sp   sp, -16
                  lui          t4, 399488
                  mulhu        a7, t0, a5
703:              ori          t1, s4, 538
                  c.lui        a4, 14
                  mul          s1, tp, s11
                  c.slli       t3, 1
                  bne          s10, s11, 718f
                  c.xor        a4, a1
                  rem          s8, a0, t1
                  ori          t1, s7, -799
                  c.addi       a2, 7
                  c.nop
                  and          t5, s9, ra
                  div          s3, a2, s1
                  xori         zero, s3, 1265
                  c.and        s1, s0
                  xor          s7, t3, s5
718:              mulhu        gp, a6, t3
                  c.sub        s1, a1
                  c.lui        a3, 20
                  slli         a1, s8, 28
                  rem          a1, t4, a5
                  c.bnez       a4, 742f
                  ori          s8, sp, -393
                  slli         sp, s5, 21
                  xor          t1, a7, a1
                  c.srli       a5, 13
                  beq          a1, zero, 746f
                  xor          t4, a6, sp
                  beq          t6, s1, 750f
                  bgeu         zero, a4, 739f
                  auipc        t6, 751913
                  mulhsu       s8, s5, s1
                  c.sub        s0, s0
                  divu         s10, zero, s7
                  c.addi16sp   sp, -16
                  divu         t6, a5, gp
                  andi         a1, a1, 1207
739:              srli         a6, a1, 23
                  c.andi       s1, 9
                  mul          zero, s3, t5
742:              mulh         a7, a3, t2
                  c.mv         t1, s3
                  remu         t2, a1, s6
                  lui          ra, 340168
746:              blt          s0, a1, 763f
                  c.andi       a0, 23
                  div          t1, t6, s3
                  rem          a5, t1, s10
750:              add          a1, ra, s6
                  c.addi4spn   a1, sp, 848
                  c.srai       s1, 25
                  div          t2, a1, s7
                  srai         t0, zero, 10
                  or           s7, s11, zero
                  c.xor        a4, s0
                  c.xor        s1, a5
                  mul          sp, s3, a7
                  lui          s3, 256665
                  xori         a1, t3, -736
                  sll          tp, ra, a2
                  c.slli       sp, 2
763:              or           a3, a7, t3
                  sub          zero, a0, t0
                  add          t5, t2, sp
                  la           t5, region_0+319 #start riscv_hazard_instr_stream_3
                  lb           a0, 2(t5)
                  xori         t4, zero, 103
                  slli         s1, zero, 25
                  div          zero, a0, t4
                  c.or         a0, a0
                  sll          gp, a0, zero
                  sw           zero, -7(t5)
                  srli         s1, t4, 6
                  c.sub        s1, a0
                  lw           t4, 5(t5)
                  c.mv         s1, gp
                  c.srai       s1, 29
                  sll          t4, a0, a0
                  lh           a0, -3(t5)
                  mulhu        gp, t4, a0
                  lbu          gp, -8(t5)
                  lhu          t4, 3(t5)
                  lb           s8, 14(t5)
                  srli         gp, zero, 19
                  nop
                  xor          gp, a0, t4
                  c.srli       a0, 30
                  div          gp, t4, gp
                  lhu          zero, -15(t5)
                  c.addi       t4, 16
                  lb           a0, 4(t5)
                  lbu          s8, 4(t5)
                  or           gp, t4, t4
                  lb           s1, 7(t5)
                  srai         s8, zero, 29
                  lbu          s1, 8(t5)
                  sra          t4, s1, t4
                  sb           a0, 0(t5)
                  mulhsu       a0, a0, t4
                  c.or         a0, a0
                  ori          a0, gp, -1506
                  srai         s8, s8, 1
                  lbu          a0, -2(t5)
                  sra          s8, s1, gp
                  lbu          s1, 16(t5)
                  mulhsu       s8, s1, gp
                  addi         a0, s8, 95
                  lb           zero, -12(t5)
                  lh           gp, 5(t5) #end riscv_hazard_instr_stream_3
                  bltu         s8, s4, 768f
                  c.beqz       s1, 772f
768:              mul          t1, zero, sp
                  divu         s3, a4, a4
                  bgeu         ra, t2, 782f
                  mulhsu       a7, gp, t5
772:              mulh         t2, s6, t1
                  lui          t5, 85749
                  c.slli       s1, 28
                  remu         sp, a0, a0
                  blt          s2, a7, 779f
                  mulhu        s11, t5, s0
                  srli         s8, s4, 30
779:              slt          a5, s6, s3
                  mulh         s10, s9, zero
                  xori         s11, a5, -1314
782:              mul          s1, s11, a1
                  srl          gp, s1, s5
                  xor          a2, t1, t3
                  lui          s0, 174524
                  c.xor        a1, s0
                  ori          t4, a7, 646
                  sll          s5, s3, a6
                  c.nop
                  auipc        a1, 110594
                  c.sub        a0, a2
                  slti         t6, s4, -947
                  sltu         t2, a7, a1
                  mulhu        t3, a5, zero
                  c.sub        s1, s0
                  andi         a3, t6, -331
                  bne          s8, s8, 817f
                  c.add        s11, sp
                  c.li         a3, -1
                  andi         a6, zero, 355
                  c.srli       s1, 28
                  c.srli       a3, 10
                  bgeu         s3, a6, 808f
                  or           a4, s0, s5
                  c.andi       s1, 27
                  slt          a4, s1, a6
                  c.lui        s10, 9
808:              mul          t5, t6, a5
                  c.li         gp, 28
                  c.add        a6, s1
                  c.nop
                  nop
                  c.sub        a4, a0
                  mulhsu       a0, a0, tp
                  remu         s10, s5, t2
                  c.andi       a0, -1
817:              c.add        a6, sp
                  addi         t5, t1, 1141
                  mulhsu       a3, a4, a5
                  c.nop
                  andi         tp, t5, 1220
                  or           t4, a1, s9
                  rem          s5, a1, s7
                  c.addi16sp   sp, -16
                  c.beqz       s1, 827f
                  slt          sp, s6, t6
827:              c.beqz       s1, 830f
                  srli         t5, s5, 5
                  sra          a6, s8, t2
830:              c.and        a2, a5
                  sra          s5, a4, zero
                  andi         a6, t0, 1361
                  c.addi16sp   sp, -16
                  c.or         a1, s1
                  srli         s8, s0, 27
                  mulhu        t1, gp, s4
                  mulh         s5, a2, t0
                  remu         a4, t2, zero
                  addi         t3, s4, 813
                  c.xor        a4, a2
                  or           t3, a3, a5
                  c.andi       a0, 26
                  bgeu         s1, tp, 860f
                  c.srai       s0, 6
                  nop
                  c.beqz       s1, 856f
                  slti         zero, t4, -1488
                  mul          zero, t4, s3
                  divu         s1, t5, a5
                  mul          s5, ra, s6
                  addi         s3, s9, 1041
                  mulhsu       s1, s2, t5
                  blt          s4, s6, 872f
                  srai         t6, a5, 28
                  and          ra, tp, t4
856:              c.or         a2, s0
                  c.sub        s0, a2
                  bltu         s8, s6, 873f
                  mulh         t4, s3, s10
860:              sub          s3, s0, a2
                  auipc        a2, 885049
                  slli         tp, a3, 5
                  c.srli       a5, 27
                  c.nop
                  sltiu        a0, t2, -1253
                  nop
                  xor          s5, gp, t5
                  mulh         a4, a3, a1
                  c.nop
                  mulh         s0, a5, a7
                  srl          s8, t0, t4
872:              bgeu         s8, a2, 887f
873:              sll          a0, s11, s0
                  srl          t2, a5, t3
                  c.and        s0, a5
                  slli         gp, sp, 9
                  sra          t1, s4, gp
                  c.srai       a4, 13
                  sll          s2, s1, s4
                  slti         zero, s0, -1047
                  bgeu         zero, a3, 899f
                  and          sp, s2, s0
                  ori          a7, s7, 1871
                  c.addi       t3, -1
                  srai         s8, gp, 13
                  c.addi16sp   sp, -16
887:              srli         a4, gp, 20
                  bne          s4, s6, 904f
                  add          zero, a1, a5
                  mulhu        a4, a6, t4
                  and          a5, t5, t0
                  sltiu        zero, a7, -882
                  mulhu        t2, gp, a2
                  srai         tp, ra, 1
                  andi         s1, s5, -622
                  bge          a5, t6, 901f
                  slli         s3, t3, 26
                  auipc        s2, 83693
899:              c.andi       s0, -1
                  bge          a7, a5, 908f
901:              addi         zero, a1, -712
                  or           a2, s11, gp
                  auipc        t4, 180696
904:              c.mv         s11, ra
                  c.srai       s1, 2
                  and          a2, s5, tp
                  c.or         s0, a4
908:              c.addi16sp   sp, -16
                  c.li         a4, -1
                  c.and        a2, a2
                  mul          gp, a7, t2
                  slli         tp, s8, 16
                  sub          a6, t6, a0
                  c.andi       a4, 14
                  blt          sp, zero, 927f
                  beq          a4, a5, 934f
                  slti         s0, s5, -1644
                  bltu         a1, sp, 938f
                  rem          t6, sp, s3
                  c.or         a0, a4
                  bgeu         s7, t1, 932f
                  div          t3, t5, a1
                  bne          a0, s2, 941f
                  beq          t5, a4, 927f
                  or           a2, t1, t4
                  slt          s8, s0, tp
927:              mulhu        a3, t6, t4
                  bgeu         t6, s1, 946f
                  c.and        a3, s0
                  c.srai       a0, 20
                  c.li         s2, 28
932:              and          a4, a4, a3
                  c.add        s7, s10
934:              xori         ra, zero, -1944
                  c.mv         s5, a7
                  mulhu        tp, a7, a4
                  add          gp, t0, t5
938:              c.bnez       s1, 948f
                  sra          s3, s11, zero
                  c.addi4spn   a4, sp, 864
941:              c.li         s1, 26
                  c.add        s8, s8
                  srai         s0, t1, 26
                  slt          a2, t0, a0
                  rem          s7, sp, ra
946:              ori          a5, a5, -1438
                  bge          s6, s0, 951f
948:              c.slli       tp, 5
                  remu         a5, zero, a6
                  lui          a2, 608621
951:              bgeu         s8, t6, 968f
                  c.addi       a7, 5
                  mulhsu       a5, t5, tp
                  mul          s2, a2, zero
                  sltu         a7, s5, a0
                  srli         a4, a5, 7
                  c.addi16sp   sp, -16
                  c.slli       s5, 2
                  sltu         s3, a1, s2
                  c.lui        a3, 29
                  srai         t0, a4, 3
                  auipc        s7, 782689
                  srai         s8, a2, 22
                  c.mv         sp, t4
                  xor          s5, s5, t0
                  srai         ra, t6, 7
                  mul          zero, t2, a7
968:              c.bnez       a3, 981f
                  c.andi       a0, 29
                  c.addi16sp   sp, -16
                  bltu         a1, a2, 975f
                  c.addi       t3, -1
                  c.addi       t2, -1
                  auipc        t3, 425603
975:              slti         a7, a0, 1329
                  addi         t5, s9, 1127
                  c.mv         t6, a0
                  xori         s1, s6, -102
                  c.add        gp, t6
                  and          tp, s9, s2
981:              c.add        a7, ra
                  divu         s5, t1, t0
                  sub          gp, a0, s2
                  mulhu        t5, a1, t6
                  ori          tp, a5, 1205
                  auipc        s2, 958379
                  srai         t0, s0, 27
                  divu         a6, s0, t0
                  sra          ra, a7, t6
                  c.sub        a2, a0
                  c.and        a3, a3
                  mul          sp, s1, a3
                  c.or         a4, s1
                  xor          s10, a1, s5
                  blt          zero, s5, 1004f
                  add          s10, a0, t1
                  or           s8, t5, s10
                  remu         t3, t1, t0
                  sltiu        a3, a2, -1019
                  sltu         a3, a5, s7
                  xori         a1, s6, -869
                  bltu         a2, s10, 1022f
                  xor          a7, s0, gp
1004:             slti         t5, a6, 882
                  mulhsu       a1, sp, zero
                  c.slli       a7, 18
                  nop
                  lui          t3, 1006130
                  c.beqz       a3, 1028f
                  sltiu        tp, s6, -47
                  mul          s1, a0, a1
                  slli         s11, a3, 9
                  c.srai       a2, 21
                  c.or         s0, a2
                  slli         a2, a1, 15
                  slt          s3, a4, zero
                  c.add        a5, a1
                  c.beqz       a2, 1032f
                  remu         s10, s10, s2
                  c.addi       a4, -1
                  nop
1022:             lui          s1, 928579
                  c.srli       a0, 1
                  c.andi       a1, 28
                  c.beqz       a1, 1035f
                  srli         a0, a7, 8
                  beq          a0, tp, 1033f
1028:             div          a3, s9, t4
                  ori          t2, sp, 1412
                  mulhu        a4, s7, s1
                  c.slli       a6, 11
1032:             c.srai       a0, 3
1033:             ori          a4, a2, -294
                  xori         s0, t4, 877
1035:             mul          t5, s4, zero
                  sltu         a5, t1, sp
                  and          a4, sp, s1
                  bge          a5, t6, 1053f
                  andi         a7, a5, 1081
                  andi         s3, s4, 772
                  xor          s0, s4, s8
                  ori          gp, s3, 1345
                  c.li         a7, 21
                  addi         a4, a1, -1995
                  c.li         s3, 8
                  nop
                  bltu         gp, t2, 1053f
                  c.nop
                  srai         a2, ra, 17
                  addi         s8, s5, 969
                  c.slli       t3, 26
                  c.mv         t0, t4
1053:             c.li         s5, -1
                  c.addi16sp   sp, 64
                  xori         t1, gp, 355
                  beq          ra, t1, 1074f
                  c.li         gp, -1
                  and          gp, t3, a1
                  c.and        s1, a2
                  c.beqz       a1, 1080f
                  and          t6, a3, a2
                  srli         a7, t4, 2
                  nop
                  c.mv         a5, a3
                  sub          s7, sp, zero
                  srli         a2, s6, 27
                  mulhu        gp, zero, a2
                  c.bnez       a1, 1078f
                  add          a6, sp, ra
                  srai         s8, ra, 23
                  slti         gp, t4, 508
                  sltiu        a4, s0, -1505
                  sll          t4, t0, a2
1074:             c.li         s10, 5
                  sll          a6, tp, t0
                  auipc        zero, 895314
                  srl          a2, sp, a3
1078:             c.li         s11, 12
                  lui          t3, 175807
1080:             or           a7, a3, s8
                  lui          t1, 256076
                  slli         a2, s0, 14
                  auipc        a5, 434696
                  c.andi       a0, 9
                  divu         s5, ra, gp
                  c.or         a4, a2
                  c.srli       a1, 15
                  la           sp, amo_0+24 #start riscv_amo_instr_stream_1
                  la           t1, amo_0+36
                  la           gp, amo_0+40
                  amomaxu.w.rl  s8, t6, (gp)
                  amoor.w.aq    s3, ra, (gp)
                  amominu.w.rl  s11, sp, (t1)
                  amoadd.w      t3, s7, (t1)
                  amominu.w.aq  a5, s1, (sp)
                  amoand.w.aq   s7, s8, (sp)
                  amoxor.w      t2, sp, (gp) #end riscv_amo_instr_stream_1
                  sub          t5, s2, s1
                  c.and        a4, a1
                  c.nop
                  slti         tp, t4, -562
                  srai         s2, t3, 12
                  mulh         gp, a0, t6
                  slli         t2, a4, 22
                  sltu         t5, t1, s5
                  div          a7, s3, a2
                  andi         t2, t0, -608
                  addi         s0, a2, -292
                  c.li         a6, 6
                  xori         sp, t0, 729
                  c.lui        s11, 1
                  xor          t5, ra, s5
                  mulh         a7, a1, t5
                  bltu         t1, t3, 1108f
                  c.sub        a1, s1
                  sll          a4, s7, s5
                  c.addi4spn   a5, sp, 672
1108:             c.add        ra, s6
                  c.slli       a2, 1
                  srl          gp, s1, t3
                  c.addi       s0, -1
                  and          s3, t6, s5
                  rem          s3, s11, s11
                  sltiu        s0, s8, -654
                  remu         gp, s9, zero
                  ori          t0, t3, 1051
                  c.srai       s1, 12
                  mul          a2, s11, s2
                  srai         s8, s8, 12
                  slli         a4, t2, 6
                  bne          s8, tp, 1124f
                  c.li         a2, -1
                  srl          zero, s4, t4
1124:             and          gp, s2, s0
                  c.sub        a1, a1
                  bne          a5, s8, 1128f
                  div          t5, s5, s4
1128:             andi         t3, s10, -231
                  slt          a2, t3, s9
                  slt          tp, s8, a6
                  sra          s1, gp, s4
                  srli         s3, t1, 23
                  bne          s10, ra, 1151f
                  and          a4, t4, s1
                  c.addi16sp   sp, 384
                  slt          ra, sp, a6
                  divu         ra, s8, t0
                  mulhsu       sp, tp, t1
                  slt          t4, zero, t2
                  c.add        s5, a3
                  addi         s10, t0, 224
                  mulhsu       s2, t6, t1
                  blt          t1, s10, 1160f
                  mulh         t1, s7, s11
                  nop
                  sltu         t3, a0, t5
                  xori         s8, s1, -892
                  mulh         s5, a7, s7
                  ori          a1, a2, 1916
                  c.or         a0, a0
1151:             auipc        a1, 459010
                  mul          ra, a6, s2
                  remu         t1, a5, t3
                  auipc        s3, 719821
                  bltu         s5, t2, 1158f
                  rem          s1, t5, s3
                  add          t1, a7, sp
1158:             sra          tp, t1, a7
                  c.lui        t3, 4
1160:             mulhsu       a2, ra, t3
                  c.andi       a2, -1
                  lui          t4, 141495
                  srli         t6, t4, 24
                  sltiu        t5, s1, 1890
                  div          a2, t6, s0
                  mulhsu       s10, s3, t6
                  div          gp, a5, ra
                  srli         a1, s8, 2
                  beq          a2, s6, 1179f
                  srl          s8, a0, s8
                  slt          s11, a1, a0
                  c.sub        a0, s1
                  divu         s10, a2, t5
                  c.srli       a5, 11
                  sltiu        s1, t4, 342
                  sll          t6, t3, s4
                  c.add        s5, s8
                  sll          gp, t6, s0
1179:             c.beqz       a5, 1185f
                  c.slli       t0, 7
                  slt          a4, t1, t5
                  mulhu        a5, t5, s5
                  c.addi       a4, 14
                  ori          zero, a5, 188
1185:             sltiu        t6, a4, -1767
                  lw           ra, 4(s6)
                  c.srai       s0, 8
                  addi         s6, s6, 12
                  c.sub        s0, a3
                  srl          t2, s6, a2
                  or           t2, t2, ra
                  slli         s5, ra, 11
                  ori          t0, zero, 1471
                  c.slli       t5, 26
                  or           a3, t4, s5
                  ori          t6, s1, 1018
                  c.addi16sp   sp, -16
2027:             addi x29, x1, 1
2027:             jalr x29, x29, 0
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
.word 0x3d471478, 0x1e7f03ac, 0xc54a6c20, 0xfa9cdf8c, 0x014c035f, 0x05aac793, 0xd3b38bd4, 0xc56405c5
.word 0xbb7b99f4, 0x994ad512, 0x1c7e7769, 0x83d5969a, 0x21d7b688, 0x02061f14, 0xedb7cb5a, 0xff1f4883
.word 0x0846813f, 0xebc485f4, 0xc3bfff0e, 0xf2c54b99, 0x964386dd, 0x0db72a50, 0x39bc582f, 0xa29fb524
.word 0x66e9e7a0, 0x3f709ae0, 0x93ffb438, 0x0bca6397, 0x551a43d5, 0xacd76b2f, 0xdc5f4114, 0x44694308
.word 0x211792f4, 0xf4ec2944, 0xe099a64c, 0xf0c71dcb, 0x173b1db4, 0xd3580116, 0xf72e4cc3, 0x9d7e6528
.word 0xe782163a, 0xa8d47161, 0xa068fec5, 0x90968022, 0xd457376a, 0xf319f999, 0xfdf6c99b, 0x0cf675bd
.word 0x377106e6, 0xa78d57ff, 0xe763c30e, 0xa668f002, 0x7e3a40b0, 0xcfe78d6e, 0x538a11bd, 0xbac9d11e
.word 0x8835fdc1, 0xc00757b3, 0xcaf88c27, 0x4fc32198, 0xf99fab2f, 0x24ff2e88, 0xbf962d19, 0xfc6d3b1f
.word 0x210e5caf, 0x9408f6a1, 0x6e83e86d, 0x6e62b44c, 0x56392256, 0x48ec2634, 0xfbabd363, 0x112141e9
.word 0xa291de6b, 0x51ed6336, 0x0682efd5, 0x32d82977, 0x7c924302, 0x158c308c, 0x48b0e49d, 0x1d885344
.word 0xef6961be, 0x12b22209, 0x28bcebec, 0x1e67c2c8, 0x867637d3, 0x524cc5e6, 0x9096b380, 0xb32f4bac
.word 0x183388cd, 0xa4bf5e2c, 0xd29a4542, 0x9bee371a, 0x76be4eac, 0xbc50f2e7, 0xe511a753, 0x9eaae655
.word 0x9989548b, 0xa911cc7d, 0x224c45f6, 0x6ff36e43, 0x7ec7ff41, 0xbd8033eb, 0x419bca07, 0x64b79fa4
.word 0x12ef2b39, 0x8d2f6ac3, 0x449cd78c, 0xd561f5d8, 0x338c66c4, 0x648dc39d, 0x046467c9, 0x591e99be
.word 0x83ede247, 0x5f387c18, 0x8dbb8cd2, 0xed458049, 0x0a89e290, 0x4acbfcff, 0x85001e78, 0xf403c58f
.word 0x0e52eeff, 0x45d14e3e, 0xa2288b80, 0x96de9d81, 0xb4eaed91, 0x7dc6c00f, 0xeb9d8936, 0x5a2f230b
.word 0xafd4d0d9, 0x52ae57bc, 0x40a18a65, 0xc2e6e40d, 0x4e43e5c9, 0xbd0c2dba, 0x4e04f606, 0x8eaf0bc5
.word 0xc34534ce, 0x690df8e4, 0x5e60b5a5, 0xa347cc87, 0xfffdcf40, 0xc3f0e6f7, 0x7c9af472, 0xc5ef2995
.word 0xb9c70cb6, 0xc9029c10, 0x3a291497, 0xfea8ee9a, 0xcbd2a974, 0xea371c65, 0xb75b4b6d, 0x7117a016
.word 0x97051ffe, 0x59511894, 0xb839b6b6, 0xb66b9145, 0x51c16773, 0x1ecbe9d7, 0x7478d36c, 0xf1d5ebf7
.word 0x93ca4564, 0x7e7cb64b, 0x24d151da, 0x387d2ef9, 0x32f0b7e7, 0xdf6916c4, 0x2bccbc65, 0x154d483f
.word 0x0d0da49d, 0xe6e8cf33, 0x4d8a4686, 0x10a5abb3, 0x9abc654b, 0x4280db57, 0x859f0213, 0xa7fbaf1d
.word 0xecc4f4b2, 0xc65cfd80, 0xf6c9fe83, 0xdd5ba164, 0x0029e347, 0xac95069f, 0x8163f360, 0x572fb734
.word 0x498e6588, 0xaad5a7c9, 0xed7c1da4, 0x5b2d38d1, 0x017f6fd6, 0x85c9939f, 0x070acce3, 0x647f5658
.word 0x66533abc, 0xe765ddb1, 0x96b8444b, 0xe9b106ba, 0x3883af7e, 0x61900562, 0xa0dc34f3, 0xdd9b2dff
.word 0x4a4dc753, 0x7ab47c25, 0xc1ea4699, 0xef2027c9, 0x7112b8b1, 0x83fc6922, 0xfb6df3eb, 0xe8889b59
.word 0xd070a7e7, 0xb53ea2c3, 0xca7577b0, 0x0583a79d, 0x25237d43, 0x81878c3b, 0x805b1a08, 0x526152b2
.word 0xb691e07a, 0x90db1543, 0x3b77b797, 0x0b715383, 0x0cdceeb7, 0x06584269, 0xe781ee42, 0xd0e1295e
.word 0x9b5286ae, 0xb997a5d0, 0xeb993619, 0x900007e5, 0x57ee9ec2, 0x77d1b1f3, 0x6b44af1d, 0xd5a05e63
.word 0x6982ef5a, 0xcf70f15b, 0x1f82c72b, 0xd68ad4a2, 0xf0f5dd7c, 0x99accef4, 0x794376ee, 0x871742ad
.word 0x2712439c, 0xb0ddf82d, 0x02c759bc, 0x20bf8873, 0x605337db, 0x606f32d0, 0x58c90323, 0x9f0c5988
.word 0xa449ac63, 0xed7ab835, 0x59688502, 0xb412c3ef, 0x750b8d18, 0x7926457a, 0xe9f4b043, 0xba5aa38b
.word 0x38c0a9cf, 0x6507caa7, 0xf9128075, 0x9d5e451c, 0x59e4918f, 0x4f17bd4f, 0x2a3a4b5d, 0xcb7e6c30
.word 0x94745d81, 0xb1215227, 0x6562a30a, 0xaefe0678, 0xa5348ae9, 0xf8732d6b, 0x4cbe0b77, 0xd86f5860
.word 0xf5a14a12, 0xb9dda529, 0xa997d4ce, 0xa3b2407d, 0x4629abfc, 0x8645c0d2, 0xef7cc207, 0xb5099f4e
.word 0xaf417b6b, 0x2020bd92, 0xd54f09e1, 0xb57e8bf9, 0x9e541207, 0x1c44c43d, 0x2d4cc889, 0x9085aa95
.word 0xcb52b717, 0x95d97197, 0xe34240a1, 0x7db4a658, 0x75d07e4d, 0x80b1e7db, 0x8cb3543a, 0x4465f9c3
.word 0x526c34d2, 0xd7b9759f, 0xc2f3cc3f, 0x3e2216d8, 0x8c3fc443, 0xd2288b1c, 0x1ae1f4fa, 0xfcb977d9
.word 0x56a07f42, 0x9d841e8b, 0xf3653c7e, 0x3a2d7db0, 0x2b412698, 0x1f3ad7f9, 0xbe488027, 0x3891422f
.word 0xbb89bfa7, 0x3e979eee, 0xde8f32e3, 0x2371f0db, 0x2458a7ce, 0xac97bbd2, 0xa09c0e9a, 0xd63f0a53
.word 0xd742562a, 0x6a999cde, 0xfe979743, 0x2f9c317d, 0x581f9ea1, 0xd29e55c2, 0xcbbdf9ce, 0x8c757c9c
.word 0xe648d225, 0xf3503978, 0xed3dc4fb, 0x3917ed9c, 0x4162d834, 0x0c8131d2, 0x83228bf3, 0x3c7fa4b5
.word 0x737e63e9, 0x1d145e5b, 0xc84dc3dc, 0x7410486c, 0x8526c2cc, 0x1bfb46fe, 0x8cef9be0, 0xc87c47f6
.word 0x7d8a3142, 0x47efaf16, 0xb9ab1d93, 0x993da5a1, 0x822acadd, 0x5caeb0d2, 0xb5596dc4, 0x7b7cf886
.word 0xd8ee1141, 0xe7548fe5, 0x40d90fcc, 0x564c76af, 0x4eb85bd8, 0xb08b3744, 0xe196eb68, 0x7fd0e5b8
.word 0xaa450cb7, 0x3f599e16, 0xd235c47d, 0xf7d98052, 0xac513e92, 0x11bb7ef6, 0x9b4945aa, 0x2a0cd765
.word 0xb98ab9f6, 0xdeecd221, 0x9efd305d, 0x911d6f11, 0x7c51941d, 0x9b01c1fc, 0x9dfece7e, 0xdbae95e4
.word 0xfe280d1a, 0xc96158ef, 0x3c6b9879, 0x9d983516, 0xcfaf082d, 0x17b67392, 0x7423ef4f, 0x95a1a5ff
.word 0x54d164f6, 0x9ec3b05e, 0xeccacb82, 0x917d379a, 0x8d8f8c50, 0xd1170df4, 0x848907a0, 0xf8efeebb
.word 0xeacaa0b3, 0x5d81ffdf, 0x631bf433, 0x35029d3c, 0x3165d15d, 0x130d0df4, 0xc18e9786, 0x5d8bd09c
.word 0x4a5dc346, 0x08497657, 0xef29b482, 0x223b85d4, 0x8e11714a, 0xdc17b9f1, 0xe234c9e2, 0x3686448b
.word 0xc0071159, 0xf58cab1d, 0x01d8620b, 0xf818de13, 0x442722ce, 0x7d1f66b4, 0x36f08ce3, 0x10bb31af
.word 0x82dcb4d3, 0x5fc1870e, 0x89d22afc, 0xf311e54f, 0xe4e54707, 0x61ecc1ac, 0x7a60d0a5, 0xd57554c5
.word 0xd872886a, 0xa73b6f4b, 0x3ec9db7b, 0xa51a29e1, 0xb5b08cfa, 0xdf802c1f, 0x01e2cfca, 0x4aa7583c
.word 0xe22b35c8, 0x0880ddfe, 0x6da80ff2, 0x4d054e37, 0x68ababfe, 0x4de29dd4, 0x3dd0c3fc, 0x866dd135
.word 0x501363c9, 0xaf4271eb, 0xadfebeba, 0xacf40a04, 0x9beab8d6, 0xa0f28690, 0x72c57754, 0xe7815ee5
.word 0x85f38ede, 0x8c0ae726, 0x76181ece, 0x36b36e50, 0xfff5af1d, 0x35be068a, 0x995f5836, 0x9d4af036
.word 0x6e4c38f8, 0x45c6d5cb, 0x6782c39f, 0x1c6772eb, 0xabe3590f, 0x297aabfc, 0x058dd064, 0xe363a09a
.word 0x357d377f, 0x12c1a0df, 0x41f6e5e9, 0x1890ce03, 0xb2444996, 0xe2458c88, 0x9795d7f9, 0x87071a8a
.word 0x1742777f, 0xb4c2fbf9, 0x82517085, 0x93d5dfec, 0x046526bb, 0x6b47661e, 0x6411cf9a, 0xb039b7b7
.word 0xe2a6166a, 0x316ac7b2, 0x6eaba769, 0x0b08a923, 0xd589624c, 0xc8d20c38, 0xf17cb045, 0x2542f6c3
.word 0x16b3dd6c, 0xf0b5224c, 0xaea225c4, 0xfb93039b, 0x7faaa46d, 0x25fddd5d, 0xdd5cef73, 0x0d81b6ab
.word 0xafa6db57, 0x5dd268c8, 0xb14735ee, 0x0e6d5cdb
.section .region_1,"aw",@progbits;
region_1:
.word 0x312a6f9b, 0x493ddbe5, 0x86637ed4, 0xfbd15c37, 0xe0d79802, 0xc442afc1, 0x50155f78, 0xcf8fa152
.word 0x5fb7d51f, 0x5045c5e4, 0x66562d67, 0x28453fcc, 0x545edf87, 0xf704dcd2, 0xbcd9bc51, 0x569a1dcf
.word 0x8a6deaf1, 0x45f9f788, 0x47fa51de, 0x326a1f9d, 0xd575afc8, 0xa9a6162e, 0xaed8fd7f, 0x9844485b
.word 0x5e90fff1, 0xc38c1eb3, 0x17d1ebc6, 0x3cdedfdd, 0x59750cac, 0x8a5412ca, 0xa0fd8e13, 0x12b14614
.word 0x04c51b9b, 0xaef70cc0, 0xdd0910fa, 0x2c95ef2d, 0x01538d49, 0x6cf1c7aa, 0x9510157b, 0xd245ac23
.word 0xd42b7205, 0x66c180dc, 0x7864f7d5, 0xd5ea72ba, 0x3ba9f7a6, 0xb59266b5, 0xd6e85577, 0x40de484e
.word 0x101b1170, 0x6ab93224, 0xcb935a8e, 0x1ef7e2a7, 0x62657bc3, 0x083adbce, 0xbbc8aeb2, 0x30a5c4f5
.word 0x9e809572, 0xf94fb9aa, 0x6f14a364, 0xf515b9b5, 0x2eaa3634, 0x30302515, 0x05d63364, 0xf6614530
.word 0xfa85c738, 0x6a43407a, 0xf2ebfe91, 0x4d62e085, 0xeac142d1, 0xcac4d486, 0x3bbdeca2, 0x25ca403a
.word 0x835b2c71, 0xfb5779dc, 0x63acb649, 0xf564a4b8, 0x5ca5ba86, 0x79dc9ad8, 0xb353a83f, 0xb78bb8fe
.word 0xcff82634, 0x87412887, 0x7547599f, 0x4486c8d1, 0x997c79dc, 0xeb0ced44, 0x67dd42f5, 0x2fdf4de1
.word 0x3d570a25, 0x84acfa90, 0xf8c56002, 0xbee9ddf6, 0x62df4193, 0xc5ff850f, 0x21bae591, 0xaef3bf79
.word 0xdaeb5c66, 0x96bfc414, 0x5eeaaf72, 0x745c8183, 0x936e21eb, 0x0cabd461, 0xc8844a19, 0xdce59955
.word 0xf175d62a, 0xfb99b5e2, 0x63266995, 0x0c92e022, 0x0d1141be, 0x8e904861, 0xc0410100, 0x93e713cd
.word 0x348926fe, 0x8e802dd6, 0x6990d728, 0xc78485ea, 0x85e0b987, 0x4d9d6d33, 0xddf9b9fa, 0x06d3abcf
.word 0x888ecc04, 0xa2be7a05, 0x8fc02971, 0xbef87a37, 0x1e3c776e, 0xc43c8872, 0x685a1169, 0x56ddaa9d
.word 0xfd6ebaf7, 0x4496d3c7, 0xeb3868ff, 0xedaef355, 0xc48c13ab, 0x3b35b755, 0xecb0296c, 0xd6c4b302
.word 0xb9dc067e, 0x5daf93a6, 0xce231ff9, 0x5dce4ff7, 0x0366fe88, 0x0705cbcf, 0x8e8886db, 0xc18b42ce
.word 0x3c39d2e3, 0x6edadba4, 0x306370de, 0xa9442f6a, 0xec4902e4, 0xa32486b1, 0x54bfd054, 0xda5fca2a
.word 0x36b0e765, 0x5f5cbfb2, 0x2ba51adc, 0x201f01b5, 0x90450cd0, 0xfdc7a6b8, 0xba83038c, 0x9617f5b3
.word 0x86462c14, 0x9ec8c488, 0x1312bbc3, 0x98dbebf2, 0x36ad29f2, 0xb7e931a5, 0xf6feac7c, 0xfe3b0e2f
.word 0xde48aaba, 0x6aa3acaa, 0x9511a1c4, 0x97b93dec, 0xf61edf8d, 0x9783b9d0, 0x560c14cf, 0xd6ef5c67
.word 0x6eb400d6, 0x4b7aefba, 0x827d17f2, 0x0aef004a, 0xc9081c61, 0x8221aae2, 0xf70b6d99, 0xe0b75297
.word 0xa1388976, 0x550f4ee8, 0xa8a737ba, 0x954af131, 0xfc5f04be, 0xedb051f6, 0xf8d841e9, 0xd0945704
.word 0x6197e648, 0x1df78a2c, 0x109bd4e6, 0x5c532d8c, 0x8312e700, 0xde232fcd, 0x8d02550e, 0xd671a2f7
.word 0xa5eff5cd, 0xa6bce629, 0xa0723f9a, 0xc58baaff, 0x498eb94f, 0xcd3d2414, 0xef507053, 0xd2ac9c8f
.word 0x931c7e54, 0x42e3d547, 0x1b04ecd9, 0x880afa6e, 0xe408d25c, 0xdb0104e9, 0xa6b9b143, 0xc70f8df0
.word 0x9177c995, 0x62f11d97, 0x96f90ade, 0x23cf72ff, 0x8208ca4f, 0x509964b4, 0x853d0a90, 0xf80cc6be
.word 0x6ae3bbf2, 0x0b628ff0, 0x5b90f6f5, 0x7fdc2541, 0x2fb51bba, 0x9fc4d6c3, 0x8a26e9ec, 0xadfba55e
.word 0x2f65a845, 0xd8df70e1, 0x5cc36000, 0x11e7bfac, 0xbe897d32, 0xfb241e80, 0x8c790e20, 0xfdc4ce74
.word 0xa1d6b494, 0x87ce17c3, 0x272a1951, 0x2a1665e8, 0x1d03cd1b, 0x5306b9d5, 0x34f019a8, 0x1d601368
.word 0xca32f1fd, 0xf0b75b25, 0x8feaf70a, 0x3db8d048, 0x4dd39d4b, 0xb9badd88, 0xe0a7fc91, 0x5fb393aa
.word 0xe36faa39, 0x9258b2b5, 0xcb5aa6f7, 0x59ff66f5, 0x64e0ae2d, 0x714b30e3, 0x31aa3f4a, 0x742a8efb
.word 0x335224a7, 0x1aed2d94, 0x14c6a08a, 0x54ab9e62, 0x86019e2b, 0xb91be8ea, 0x10fcde92, 0x2a3266eb
.word 0x8f73d7f1, 0x0ef37187, 0xad78555a, 0xea620707, 0x1b75fc0c, 0xf1006b8a, 0xeddc9382, 0xba440374
.word 0xae5b0fd2, 0x636dd820, 0x10c81f54, 0x9f75bbf6, 0x0169efaf, 0xee267966, 0x958279e3, 0x9f0a44c9
.word 0xfe3ea7ed, 0xa23600ce, 0x977e03cf, 0x29036f38, 0x7cfaedcc, 0x2d6f1e7e, 0x360074f0, 0x18fe85fb
.word 0xd61adc10, 0xbd87f8ce, 0x0613e26e, 0x842544f4, 0xca0ccf88, 0xf4214510, 0x6d163415, 0xc963b586
.word 0x15c9ac13, 0xbe1a6a79, 0x97ccb0e7, 0x1376a4ce, 0x671ec94e, 0x16d8c271, 0xc0087c01, 0x8e024e2c
.word 0xfcc8358d, 0x810f5e96, 0x20e01603, 0x4f2f93c7, 0x23bd62fe, 0xd5bf5d60, 0xc2eff543, 0x3e3d129b
.word 0xc01cf747, 0xf8f29b36, 0x52502dd7, 0x508f8ca4, 0x5e29bacc, 0xd68b2922, 0x15f13f16, 0x00b85460
.word 0xf983a789, 0x87d8072f, 0x8d2d99d0, 0x26dfbd8b, 0x51716770, 0xe3574bd2, 0xbc392435, 0xd205bf25
.word 0x67e09022, 0xc11dc369, 0xf120307b, 0xcc9b0f33, 0x1c9a3f7a, 0x20d2d4d1, 0x5bacd098, 0x011ae5d6
.word 0x065716a4, 0xcd199f01, 0x62ae4549, 0x6cb4b381, 0x4861084f, 0x24233957, 0xadf3f9b8, 0xce4a01aa
.word 0x9dcef2df, 0x5eaaae32, 0x968e2de5, 0x386e21a4, 0x8af203fa, 0x9b036074, 0xf5d68af1, 0x8f8386a1
.word 0x4e5ee141, 0x07b82ddd, 0xbdaaef20, 0x4ccd8973, 0x6bb011c1, 0x6cec36ea, 0x98e34fd6, 0x8b47a915
.word 0x5a821d74, 0xc0135caa, 0xead12013, 0xb9d18838, 0xfaee2e4c, 0xa0d98e9c, 0xe68237b4, 0x8e0f0aa5
.word 0xa7fb8f1a, 0xc2b41e85, 0x3769a560, 0xefa47e10, 0x69701f45, 0xf5315eb8, 0x8078b1dd, 0x09b25671
.word 0x95c23fca, 0x1f727bbc, 0xe0bdacc6, 0xfa965e82, 0x57953d2a, 0x565c36a7, 0x9dd2546a, 0x87fe3115
.word 0xdd3e4979, 0xbcb894ea, 0x2e37b21f, 0xbcb11d7d, 0x27843097, 0xe2382f32, 0xce84ac00, 0xe109d318
.word 0x5100ac43, 0x3b73e156, 0xdafd84a6, 0xae35850d, 0x5e8b1877, 0xd46a7647, 0x9650c9ca, 0xe9bcff36
.word 0x71f4cfd7, 0x13d86e3b, 0x3ba6630d, 0xea4faf31, 0xc5b367e5, 0x977d22c9, 0xbabf703f, 0x70ee4f9f
.word 0xe99366b9, 0xd07eb3dc, 0xdf683283, 0xe451bc90, 0x47dcb030, 0x3eb52d99, 0x95cc05eb, 0xaf9855ea
.word 0x9e3edd38, 0xcbd0fef3, 0x83e57ada, 0xab36377f, 0x65b81e66, 0x84321bfc, 0xb4203ea1, 0xe047f9b5
.word 0x48ea89e2, 0x0987a7b8, 0x6fb258b5, 0x3cd74fbb, 0xa8acb126, 0xe8a5f6dd, 0x64d5a45e, 0xfe41f485
.word 0xe8b1cbf9, 0x0c56b576, 0x99c874fc, 0x0d7b3bad, 0xb953eacc, 0xe049eb51, 0xf20c3b63, 0x7246ee38
.word 0xf14e52b4, 0x4b9e497b, 0x50ec1065, 0xca616b9c, 0x3642b707, 0xcf27f8eb, 0xf3b47374, 0xe4f0c60a
.word 0x0339b93d, 0x6d4d1402, 0xd66b5af8, 0x3048a7c9, 0x5fa6ef63, 0x51846751, 0xb32ffa55, 0xeec9da7e
.word 0x1e6a460f, 0xd43c128c, 0x526b3cd7, 0x14683876, 0x044fe138, 0x4160217d, 0x2b24ed08, 0x108a0e14
.word 0xfa6ef9a0, 0x05641613, 0xb3dbbef7, 0xd3158195, 0x4f2b262e, 0x15656398, 0x75abc5f8, 0xb9dffced
.word 0x730b97c8, 0xcd78357b, 0x2d54f61f, 0x4a7ca10c, 0x060319cb, 0x16720b4a, 0x220f00d1, 0x5bea5e2e
.word 0xcbac4f1b, 0x9f67618a, 0xa3ba2925, 0x72995517, 0x4b225ce9, 0xf9063156, 0x4c4b79fc, 0xcf941a24
.word 0xe8f6201c, 0xb88d5f7f, 0x04fc75a2, 0xb24ead6b
.section .amo_0,"aw",@progbits;
amo_0:
.word 0xe0cd0dc7, 0x7eec5fa7, 0x8e396d4c, 0xbe547723, 0x2ec491df, 0x62eae032, 0x5d61ff25, 0xb60110f9
.word 0x220f38b3, 0x612a0fc4, 0x85adf7e3, 0xbcba045f, 0x5d78801a, 0xd4a7d113, 0x60a8e8ba, 0x3ec006fe
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
                  addi x25, x25, -4
                  sw  x22, (x25)
                  add x22, x25, zero
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
                  add x25, x22, zero
                  csrr x30, 0x300 # MSTATUS
                  csrr x30, 0x342 # MCAUSE
                  srli x30, x30, 31
                  bne x30, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x30, 0x341 # MEPC
                  csrr x30, 0x342 # MCAUSE
                  li x29, 0x3 # BREAKPOINT
                  beq x30, x29, ebreak_handler
                  li x29, 0x8 # ECALL_UMODE
                  beq x30, x29, ecall_handler
                  li x29, 0x9 # ECALL_SMODE
                  beq x30, x29, ecall_handler
                  li x29, 0xb # ECALL_MMODE
                  beq x30, x29, ecall_handler
                  li x29, 0x1
                  beq x30, x29, instr_fault_handler
                  li x29, 0x5
                  beq x30, x29, load_fault_handler
                  li x29, 0x7
                  beq x30, x29, store_fault_handler
                  li x29, 0xc
                  beq x30, x29, pt_fault_handler
                  li x29, 0xd
                  beq x30, x29, pt_fault_handler
                  li x29, 0xf
                  beq x30, x29, pt_fault_handler
                  li x29, 0x2 # ILLEGAL_INSTRUCTION
                  beq x30, x29, illegal_instr_handler
                  csrr x29, 0x343 # MTVAL
                  1: la x20, test_done
                  jalr x1, x20, 0

ecall_handler:    
                  la x30, _start
                  sw x0, 0(x30)
                  sw x1, 4(x30)
                  sw x2, 8(x30)
                  sw x3, 12(x30)
                  sw x4, 16(x30)
                  sw x5, 20(x30)
                  sw x6, 24(x30)
                  sw x7, 28(x30)
                  sw x8, 32(x30)
                  sw x9, 36(x30)
                  sw x10, 40(x30)
                  sw x11, 44(x30)
                  sw x12, 48(x30)
                  sw x13, 52(x30)
                  sw x14, 56(x30)
                  sw x15, 60(x30)
                  sw x16, 64(x30)
                  sw x17, 68(x30)
                  sw x18, 72(x30)
                  sw x19, 76(x30)
                  sw x20, 80(x30)
                  sw x21, 84(x30)
                  sw x22, 88(x30)
                  sw x23, 92(x30)
                  sw x24, 96(x30)
                  sw x25, 100(x30)
                  sw x26, 104(x30)
                  sw x27, 108(x30)
                  sw x28, 112(x30)
                  sw x29, 116(x30)
                  sw x30, 120(x30)
                  sw x31, 124(x30)
                  la x20, write_tohost
                  jalr x0, x20, 0

instr_fault_handler:
                  add x22, x25, zero
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
                  add x25, x22, zero
                  lw  x22, (x25)
                  addi x25, x25, 4
                  mret

load_fault_handler:
                  add x22, x25, zero
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
                  add x25, x22, zero
                  lw  x22, (x25)
                  addi x25, x25, 4
                  mret

store_fault_handler:
                  add x22, x25, zero
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
                  add x25, x22, zero
                  lw  x22, (x25)
                  addi x25, x25, 4
                  mret

ebreak_handler:   
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  csrw  0x341, x30
                  add x22, x25, zero
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
                  add x25, x22, zero
                  lw  x22, (x25)
                  addi x25, x25, 4
                  mret

illegal_instr_handler:
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  csrw  0x341, x30
                  add x22, x25, zero
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
                  add x25, x22, zero
                  lw  x22, (x25)
                  addi x25, x25, 4
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x30, 0x300 # MSTATUS;
                  csrr  x30, 0x304 # MIE;
                  csrr  x30, 0x344 # MIP;
                  csrrc x30, 0x344, x30 # MIP;
                  add x22, x25, zero
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
                  add x25, x22, zero
                  lw  x22, (x25)
                  addi x25, x25, 4
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
