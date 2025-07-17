    .section .text
    .globl main
    .global delay

    #-------------------------------------------------------------------------
    # Constant definitions
    #-------------------------------------------------------------------------
    .equ MAGIC_NUM,        0xC1C1C1C1
    .equ FLASH_APP_ADDR,   0x00010000    # default app at 64 KB
    .equ IMEM_ADDR,        0x80000000    # instruction SRAM
    .equ IMEM_SIZE,        0x00008000    # 32 KB
    .equ DMEM_ADDR,        0x80040000    # data    SRAM
    .equ DMEM_SIZE,        0x00002000    #  8 KB

    .equ GPIO_IN,        0x20000100    # GPIO register for switches

    .equ CMD_READY,        0x43          # 'C'
    .equ CMD_START,        0x53          # 'S'
    .equ CMD_FLASH,        0x46          # 'F'
    .equ CMD_EXEC,         0x58          # 'X'
    .equ CMD_UPLOAD,       0x55          # 'U'
    .equ CMD_RUN,          0x52          # 'R'
    .equ STATUS_OK,        0x4F          # 'O'
    .equ STATUS_NAK,       0x4E          # 'N'

.text

main:

    la   sp, _stack_top

   
    li a0, 0x80000000 # base addr imem
    li a1, 0x8000         # number of bytes
    li a2, 0
    call  adler32
    mv a1, a0


j . 
