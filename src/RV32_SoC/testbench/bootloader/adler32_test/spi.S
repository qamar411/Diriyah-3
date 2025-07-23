# spi.S – SPI HAL for SPI Flash Interface
.globl spiInit
.globl spiCS
.globl spiCSUp
.globl spiCSDown
.globl spiSendGetData

.equ SPCR,  0x20000200
.equ SPSR,  0x20000204
.equ SPDR,  0x20000208
.equ SPER,  0x2000020c
.equ SPCS,  0x20000210

# ---------------------------------------
# spiInit: Initialize SPI peripheral
# ---------------------------------------
spiInit:
    li t1, SPCR
    li t0, 0x53
    sb t0, 0(t1)

    li t1, SPER
    li t0, 0x00
    sb t0, 0(t1)

    ret

# ---------------------------------------
# spiCS: Set CS line to a0 (0=low, 1=high)
# ---------------------------------------
spiCS:
    li t0, SPCS
    sb a0, 0(t0)
    ret

spiCSUp:
    li a0, 0x00
    j spiCS

spiCSDown:
    li a0, 0xFF
    j spiCS

# ---------------------------------------
# spiSendGetData: Send a0, return received byte in a0
# ---------------------------------------
spiSendGetData:
    li t1, SPSR
    lb t0, 0(t1)
    ori t0, t0, 0x80
    sb t0, 0(t1)

    li t0, SPDR
    sb a0, 0(t0)

wait_transfer:
    li t1, SPSR
    lb t0, 0(t1)
    andi t0, t0, 0x80
    beqz t0, wait_transfer

    li t0, SPDR
    lbu a0, 0(t0)
    ret
