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


main:
    # Setup stack & peripherals
    la   sp, _stack_top
    call spiInit
    call uart_init


    # Auto-boot if SW31==0 and magic valid
    li   t0, GPIO_IN
    lw   t1, 0(t0)
    srli t1, t1, 31        # t1 = switch-31
    bnez t1, uart_console  # if switch=1, skip auto-boot

    # Magic check @ FLASH_APP_ADDR
    li   a0, FLASH_APP_ADDR+IMEM_SIZE+DMEM_SIZE
    li   a1, MAGIC_NUM
    call check_magic       # returns a0=1 if match
    beqz a0, uart_console  # if no match, go to console

exec_flash:
    # load IMEM then DMEM from flash → SRAM, then jump
    li   a0, FLASH_APP_ADDR
    li   a1, IMEM_ADDR
    li   a2, IMEM_SIZE
    li   a3, 0             # mode=0 → flash
    call prog_sram

    li   a0, FLASH_APP_ADDR+IMEM_SIZE
    li   a1, DMEM_ADDR
    li   a2, DMEM_SIZE
    li   a3, 0
    call prog_sram


    li   t0, IMEM_ADDR
    jr   t0

uart_console:
    # Handshake: wait for 'C'
handshake:
    call uart_getc         # a0 = recv byte
    li   t0, CMD_READY
    bne  a0, t0, handshake
    call uart_putc         # echo 'C'

command_loop:
    # Wait for 'S'
wait_S:
    call uart_getc
    li   t0, CMD_START
    bne  a0, t0, wait_S

    # 1) Read CMD → s2
    call uart_getc
    mv   s2, a0

    # 2) Read 4-byte base addr → s0
    call uart_getc         # B3
    slli a0, a0, 24
    mv   s0, a0
    call uart_getc         # B2
    slli a0, a0, 16
    or   s0, s0, a0
    call uart_getc         # B1
    slli a0, a0, 8
    or   s0, s0, a0
    call uart_getc         # B0
    or   s0, s0, a0

    # 3) Read 2-byte length → s1
    call uart_getc
    mv   s1, a0
    call uart_getc
    slli a0, a0, 8
    or   s1, s1, a0

    # 4) Check the command 
    li   t0, CMD_FLASH
    beq  s2, t0, do_flash
    li   t0, CMD_EXEC
    beq  s2, t0, do_exec
    li   t0, CMD_UPLOAD
    beq  s2, t0, do_upload
    li   t0, CMD_RUN
    beq  s2, t0, do_run

    # Unknown → NAK & restart
    li   a0, STATUS_NAK
    call uart_putc
    j    handshake

do_flash:


    # F: flash [s0, s1]
    mv   a0, s0
    mv   a1, s1
    call prog_flash       # must send OK/NAK itself

    j  handshake

do_exec:
    j exec_flash

do_upload:
    # U: upload via UART to SRAM at s0
    mv   a1, s0           # SRAM base
    mv   a2, s1           # length
    li   a3, 1            # mode=1 → UART

    call prog_sram        # sends OK/NAK
    j    handshake

do_run:
    # R: run the application from this address in imem
    li   a0, STATUS_OK
    call uart_putc
    jr   s0


.section .text

# ====================================================== # 
#                    Check Magic Number                  #
# ====================================================== #

# arguments 
# - a0 = flash address where magic number is stored (lower 24bit)
# - a1 = the magic number value (32-bit)
# returns
# - a0 = 1 if magic number is present 
# - a0 = 0 if magic number is not present 
# destroyes
# - t0 
# - t1
# - t2

check_magic:

    addi sp, sp, -8 # creating space
    sw ra, 0(sp)
    sw s0, 4(sp)

    mv s0, a1
    call flash_read_word
    beq  s0, a0, magic_is_there
    
    li a0, 0
    j skip_magic
magic_is_there:
    li a0, 1
skip_magic:

    lw ra, 0(sp)
    lw s0, 4(sp)
    addi sp, sp, 8 # relaasing space

    ret



# ====================================================== # 
#          Copy Block from Flash/UART to SRAM            #
# ====================================================== #

# arguments 
# - a0 = flash base address of block
# - a1 = sram base address where to move the block
# - a2 = size of block in bytes
# - a3 = 0 take from flash/ 1 take from uart
# returns
# - nothing
# destroyes
# - t0 
# - t1
# - t2
# this method does not use stack, instead uses Saved registers

prog_sram:


    mv s0, a0
    mv s1, a1
    mv s2, a2
    mv s4, a1
    mv s5, a2
    mv s6, ra

# always read the flash unconditionaly
    call spiCSDown
    li a0, 0x03             # Read command
    call spiSendGetData
    call flash_send_addr


prog_next_sram_byte:
    beqz s2, checksum_check
    call spiSendGetData
    beqz a3, skip_uart
    call uart_getc
skip_uart:
    sb a0, 0(s1)
    addi s2, s2, -1
    addi s1, s1, 1
    j prog_next_sram_byte



# li s3, 256
# prog_next_sram_byte:
#     beqz s2, checksum_check
#     call spiSendGetData
#     beqz a3, skip_uart
#     bnez s3, skip_send_ready
# sram_send_ready:
#     li a0, STATUS_OK
#     call uart_putc
#     li s3, 256
# skip_send_ready:
#     call uart_getc
#     addi s3, s3, -1
# skip_uart:
#     sb a0, 0(s1)
#     addi s2, s2, -1
#     addi s1, s1, 1
#     j prog_next_sram_byte




checksum_check:


# take four bytes of checksum from uart 

li a0, 1
beqz a3, skip_checksum # not checking the checksum in case of flash to sram copy
    call uart_getc
    mv s0, a0 
    call uart_getc
    slli a0, a0, 8
    or   s0, s0,a0
    call uart_getc
    slli a0, a0, 16
    or   s0, s0,a0
    call uart_getc
    slli a0, a0, 24
    or   s0, s0,a0


    mv a0, s4  # base address  
    mv a1, s5  # size in bytes  
    li a2, 0   # take data from sram for checksum
    call  adler32
    mv a1, a0
    
    # compare 
    li a0, STATUS_NAK
    # li a0, STATUS_OK   // shouldn't send okay for mismtatch, need to be modificied
    bne s0, a1, checksum_mismatch_
skip_checksum:
    li a0, STATUS_OK
checksum_mismatch_:
    call uart_putc

    # store checksums in reg for debug
    mv s10, a1
    mv s11, s0


    call spiCSUp

    mv a0, s1
    mv ra, s6
    ret


# ====================================================== # 
#                   Program Flash Block                  #
# ====================================================== #

# arguments 
# - a0 = flash base address of block
# - a1 = size in bytes of the block that is required to be programmed
# returns
# - a0 = 1 success, 0 failed (to try it again )
# transfers 
# - the status (ok/nak) to the host thorugh uart
# destroyes
# - t0 
# - t1
# - t2

# take data from the uart, calculate the adler32 checksum

prog_flash:

    addi sp, sp, -24
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)
    sw s2, 12(sp)
    sw a0, 16(sp)
    sw a1, 20(sp)

    mv s0, a0
    mv s1, a1


erase_flash_block:

    call spiCSDown
    li a0, 0x06                   # Write Enable
    call spiSendGetData
    call spiCSUp


    call spiCSDown

    # erase command
    li a0, 0xd8                  
    call spiSendGetData

    # address 24bit
    call flash_send_addr
    call spiCSUp



    call wait_busy


# send the ready command 
    li a0, CMD_READY
    call uart_putc


    addi s1, s1, 4
    li s2, -1

program_next_page:

    # SET WRITE ENABLE
    call spiCSDown
    li a0, 0x06                   
    call spiSendGetData
    call spiCSUp

    # PAGE PROGRAM 
    call spiCSDown
    li a0, 0x02                   
    call spiSendGetData

    # ADDRESS 24bit
    call flash_send_addr

    # CHECK IF payload ended
    li t0, 4
    bgt s1, t0, skip_magic_word
    li a0, 0xc1 # the magic word 
    call spiSendGetData
    li a0, 0xc1 # the magic word 
    call spiSendGetData
    li a0, 0xc1 # the magic word 
    call spiSendGetData
    li a0, 0xc1 # the magic word
    call spiSendGetData

    li s0, 4
get_next_checksum_byte:
    call uart_getc
    call spiSendGetData
    addi s0, s0, -1
    bnez s0, get_next_checksum_byte

    j page_prog_done

skip_magic_word:
    li s2, 256
    addi s0, s0, 256 
page_program:
    beqz s1, page_prog_done # redundent? 
    beqz s2, send_ready
    mv a0, s1
    call uart_getc
    call spiSendGetData
    addi s1, s1, -1
    addi s2, s2, -1
    j page_program

send_ready:
    call spiCSUp    
    call wait_busy
    li a0, CMD_READY
    call   uart_putc
    j program_next_page

    
page_prog_done:
    call spiCSUp
    call wait_busy





# calculate checksum 
    lw a0, 16(sp) # get address from stack 
    lw a1, 20(sp) # get lenght from stack 
    li a2, 1      # take data from flash 
    call adler32   # return checksum in a0
    mv s0, a0


# read the checksum from flash (the one came throgh uart)
    lw a0, 16(sp) # get address from stack 
    lw a1, 20(sp) # get the lenght of block from stack 
    add a0, a0, a1
    addi a0, a0, 4 # after the block, four bytes are for magic word, then next four are the checksum
    call flash_read_word
    mv a1, a0
# compare 
    li a0, STATUS_NAK
    # li a0, STATUS_OK   // shouldn't send okay for mismtatch, need to be modificied
    bne s0, a1, checksum_mismatch
    li a0, STATUS_OK
checksum_mismatch:
    call uart_putc

    # store checksums for debug
    mv s10, a1 
    mv s11, s10


ret_flash_prog:
    mv a0, s1
    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    addi sp, sp, 24 # releasing space

    ret






# ====================================================== # 
#                          Wait Busy                     #
# ====================================================== #

# arguments 
# - NOTHIN
# returns
# - NOTHING
# destroyes
# - t0 
# - t1
# - t2

# Waits until the flash get's from from current operation

wait_busy:
    add sp, sp, -4
    sw ra, 0(sp)

    call spiCSDown
    li a0, 0x05                   # Read Status
    call spiSendGetData
wait_busy_:
    call spiSendGetData
    andi a0, a0, 1
    bnez a0, wait_busy_
    call spiCSUp

    lw ra, 0(sp)
    add sp, sp, 4
    ret



# ====================================================== # 
#                         Delay (200ms)                  #
# ====================================================== #
tiny_delay:
    li t0, 100000
    j add_more_delay
delay:
    li t0, 9666667 # total 1666667*6 cycles = 10000000 cycles which is 20% of 1sec, so 0.2 sec
add_more_delay:    # 6 cycles every iteration
    addi t0, t0, -1
    bnez t0, add_more_delay
    ret




# ====================================================== # 
#                       Flash Read Word                  #
# ====================================================== #

# argumetns 
# -a0 address
# output 
# -a0 4 bytes little endian
flash_read_word:
    addi sp, sp, -8 # creating space for three words ra, s0, s1
    sw ra, 0(sp)
    sw s0, 4(sp)

    mv s0, a0

    call spiCSDown
    li a0, 0x03             # Read command
    call spiSendGetData
    call flash_send_addr

    call spiSendGetData
    mv s0, a0 
    call spiSendGetData
    slli a0, a0, 8
    or   s0, s0,a0
    call spiSendGetData
    slli a0, a0, 16
    or   s0, s0,a0
    call spiSendGetData
    slli a0, a0, 24
    or   s0, s0,a0
    call spiCSUp


    mv a0, s0
    lw ra, 0(sp)
    lw s0, 4(sp)
    add sp, sp, 8
    ret




trap_handler:
    li a0, 0xdeadbeef
    j trap_handler



# ====================================================== # 
#                       Flash Send Addr                  #
# ====================================================== #

flash_send_addr:
    addi sp, sp, -4
    sw ra, 0(sp)
    srli  a0, s0, 16; call spiSendGetData
    srli  a0, s0,  8; call spiSendGetData
    srli  a0, s0,  0; call spiSendGetData
    lw ra, 0(sp)
    addi sp, sp, 4
    ret
