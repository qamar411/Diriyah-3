.section .text
.globl main

    .equ MAGIC_NUM,        0xC1C1C1C1
    .equ FLASH_BL_ADDR,    0x00000000    # bootloader at 0×0
    .equ FLASH_BL_SIZE,    0x00000400    # 1 KB secondary BL
    .equ FLASH_APP_ADDR,   0x00010000    # app at 64 KB boundary
    .equ FLASH_APP_SIZE,   0x0000A000    # 40 KB (adjust if needed)
    .equ RAM_LOAD_ADDR,    0x80000000

    .equ CMD_REQ_APP,      0x04
    .equ CMD_REQ_BL2,      0x05
    .equ CMD_READY,        0x43  # 'C'
    .equ CMD_START,        0x53  # 'S'
    .equ CMD_FLASH_APP,    0x46  # 'F'
    .equ CMD_FLASH_BL,     0x47  # 'G'
    .equ CMD_RUN_APP,      0x52  # 'R'
    .equ CMD_RUN_BL,       0x51  # 'Q'
    .equ STATUS_OK,        0x4F  # 'O'
    .equ STATUS_NAK,       0x4E  # 'N'
    
main:
    la sp, _stack_top           # Setup stack pointer

    # --- Initialize SPI ---
    call spiInit
    call uart_init

    # gpio pin 31, if zero copy secondhary boat loader from flash,
    # otherwise reprogram the secondhary boot loader in the flash it self and boot the chip with that code 
    li t0, 0x20000100
    lw a0, 0(t0)
    li a1, 0x80000000
    and  a0, a0, a1
    bnez a0, prog_using_uart


    # check if applicatin is in the flash if not? go back to uart method
    li a0, 0x400
    li a1, MAGIC_NUM
    call check_magic
    bnez a0, copy_flash_boot_loader


    # program using uart
prog_using_uart:

    # 1) handshake ’C’
handshake:
    call uart_getc
    li   t0, CMD_READY
    bne  a0, t0, handshake
    call uart_putc

    # 2) request secondary BL
    li   a0, CMD_REQ_BL2
    call uart_putc

    # 3) wait for ’S’
wait_start:
    call uart_getc
    li   t0, CMD_START
    bne  a0, t0, wait_start

    # 4) get command
    call uart_getc
    mv s1, a0
    
    # 5) get length
    call uart_getc 
    mv s0, a0 
    call uart_getc 
    slli a0, a0, 8
    or s0, s0, a0



    li   t0, CMD_FLASH_BL
    beq  s1, t0, do_flash_bl
    li   t0, CMD_FLASH_APP
    beq  s1, t0, do_flash_app
    li   t0, CMD_RUN_APP
    beq  s1, t0, do_run_app
    li   t0, CMD_RUN_BL
    beq  s1, t0, do_run_bl

    # unknown (send back the NACK for unsupported commands)
    li   a0, STATUS_NAK
    call uart_putc
    j    handshake



do_flash_bl:

    li a0, 0     # address in flash 
    mv a1, s0    # size of payload
    li a2, 0x400 # size of whole bl2 in flash
    call prog_flash

copy_flash_boot_loader:
    li a0, 0           # copy from flash address 0
    li a1, 0x80000000  # to the sram at addres 0x80000000
    li a2, 0x400       # 1024 bytes
    call copy_flash_2_sram
    
    li t0, 0x80000000
    la ra, boot_app_from_flash
    jr t0              # jump to start of sram (secondhary bootloader)

    j .                # should never reach here


.section .rom_helpers, "ax"
.globl boot_app_from_flash
boot_app_from_flash:

    li a0, 0x01a000
    li a1, MAGIC_NUM
    call check_magic
    bnez a0, copy_app_from_flash

copy_app_to__flash:


    li a0, 0x010000
    li a1, 0x00a000
    call prog_flash


copy_app_from_flash:



    li a0, 0x010000   # copy from flash address 0x010000
    li a1, 0x80000000 # to the insturciton memory 
    li a2, 0x8000     # 32k bytes
    call copy_flash_2_sram


    li a0, 0x018000   # copy from flash address 0x018000
    li a1, 0x80040000 # to the data memory
    li a2, 0x2000     # 8k bytes
    call copy_flash_2_sram


    li t0, 0x80000000 # jump to start of sram (application)
    jr t0

    j .                # should never reach here 




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

    addi sp, sp, -12 # creating space for three words ra, s0, s1
    sw ra, 0(sp)
    sw s0, 4(sp)
    sw s1, 8(sp)

    mv s0, a0
    mv s1, a1

    call spiCSDown
    li a0, 0x03             # Read command
    call spiSendGetData
    srli  a0, s0, 16; call spiSendGetData
    srli  a0, s0,  8; call spiSendGetData
    srli  a0, s0,  0; call spiSendGetData

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
    call spiCSUp # end the read command

    beq  s1, s0, magic_is_there
    li a0, 0
    j skip_magic
magic_is_there:
    li a0, 1
skip_magic:

    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    addi sp, sp, 12 # relaasing space for three words ra, s0, s1

    ret



# ====================================================== # 
#              Copy Block from Flash to SRAM             #
# ====================================================== #

# arguments 
# - a0 = flash base address of block
# - a1 = sram base address where to copy the block
# - a2 = size of block in bytes
# returns
# - nothing
# destroyes
# - t0 
# - t1
# - t2
# this method does not use stack, instead uses Saved registers

copy_flash_2_sram:


    mv s0, a0
    mv s1, a1
    mv s2, a2
    mv s3, ra


    call spiCSDown
    li a0, 0x03             # Read command
    call spiSendGetData
    srli  a0, s0, 16; call spiSendGetData
    srli  a0, s0,  8; call spiSendGetData
    srli  a0, s0,  0; call spiSendGetData

copy_another_byte_from_flash:
    beqz s2, copy_from_flash_done
    call spiSendGetData
    sb a0, 0(s1)
    addi s2, s2, -1
    addi s1, s1, 1
    j copy_another_byte_from_flash


copy_from_flash_done:
    call spiCSUp

    mv ra, s3
    ret


# ====================================================== # 
#                   Program Flash Block                  #
# ====================================================== #

# arguments 
# - a0 = flash base address of block
# - a1 = size in bytes of the block that is required to be programmed
# - a2 = size in byte upto which flash is required to be filled with zeros
# returns
# - nothing
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
    mv s3, a2

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
    srli  a0, s0, 16; call spiSendGetData
    srli  a0, s0,  8; call spiSendGetData
    srli  a0, s0,  0; call spiSendGetData
    call spiCSUp


    call wait_busy

    addi s3, s3, 4

program_next_page:
    call spiCSUp    
    call wait_busy

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
    srli  a0, s0, 16; call spiSendGetData
    srli  a0, s0,  8; call spiSendGetData
    srli  a0, s0,  0; call spiSendGetData

    # CHECK IF payload ended
    li t0, 4
    bgt s3, t0, skip_magic_word
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
    call uart_putc
    addi s0, s0, -1
    bnez s0, get_next_checksum_byte

    j page_prog_done

skip_magic_word:
    li s2, 256
    addi s0, s0, 256 
page_program:
    li a0, 0
    beqz s3, page_prog_done # redundent? 
    beqz s2, program_next_page
    beqz s1, skip_0
    call uart_getc
    addi s1, s1, -1
skip_0:
    call spiSendGetData
    addi s2, s2, -1
    addi s3, s3, -1
    j page_program
page_prog_done:
    call spiCSUp
    call wait_busy


# calculate checksum 
    lw a0, 16(sp) # get address from stack 
    lw a1, 20(sp) # get lenght from stack 
    li a2, 1      # take data from flash 
    call adler32   # return checksum in a0



    lw ra, 0(sp)
    lw s0, 4(sp)
    lw s1, 8(sp)
    lw s2, 12(sp)
    addi sp, sp, 24 # releasing space for three words ra, s0, s1

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
    li t0, 3666667 # total 1666667*6 cycles = 10000000 cycles which is 20% of 1sec, so 0.2 sec
add_more_delay:    # 6 cycles every iteration
    addi t0, t0, -1
    bnez t0, add_more_delay
    ret




# ====================================================== # 
#                       Flash Read Word                  #
# ====================================================== #

# argumetns 
# -a0 
flash_read_word:
    addi sp, sp, -8 # creating space for three words ra, s0, s1
    sw ra, 0(sp)
    sw s0, 4(sp)

    mv s0, a0

    call spiCSDown
    li a0, 0x03             # Read command
    call spiSendGetData
    srli  a0, s0, 16; call spiSendGetData
    srli  a0, s0,  8; call spiSendGetData
    srli  a0, s0,  0; call spiSendGetData

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


