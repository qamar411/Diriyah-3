.section .text
.globl uart_init
.globl uart_getc
.globl uart_putc
.globl uart_write
.globl uart_read

# UART base address and offsets
.equ UART_BASE,     0x20000000
.equ REG_THR,       0x00  # Transmit Holding Register (write)
.equ REG_RBR,       0x00  # Receiver Buffer Register (read)
.equ REG_IER,       0x04
.equ REG_FCR,       0x08
.equ REG_LCR,       0x0C
.equ REG_LSR,       0x14

# Config values
.equ LCR_DLAB,      0x80
.equ LCR_8N1,       0x03
.equ LSR_THRE,      0x20
.equ LSR_DATA_RDY,  0x01
.equ FCR_CONF,      0x87  # FIFO enable + reset RX/TX

# ---------------------------------------------------
# void uart_init()
# ---------------------------------------------------
uart_init:
    li t0, UART_BASE

    # Enable DLAB
    li t1, LCR_DLAB
    sb t1, REG_LCR(t0)

    # Set baud rate divisor low byte (BRDL = 27 → 115200 @ 50 MHz)
    li t1, 27
    sb t1, REG_THR(t0)

    # Disable DLAB, set 8N1 format
    li t1, LCR_8N1
    sb t1, REG_LCR(t0)

    # Enable FIFO, clear RX/TX
    li t1, FCR_CONF
    sb t1, REG_FCR(t0)

    # Disable interrupts
    sb zero, REG_IER(t0)

    ret

# ---------------------------------------------------
# void uart_putc(uint8_t a0)
# Sends one byte in a0
# ---------------------------------------------------
uart_putc:
    li t1, UART_BASE
.wait_tx:
    lbu t2, REG_LSR(t1)
    andi t2, t2, LSR_THRE
    beqz t2, .wait_tx
    sb a0, REG_THR(t1)
    ret

# ---------------------------------------------------
# uint8_t uart_getc()
# Returns one byte in a0
# ---------------------------------------------------
uart_getc:
    li t1, UART_BASE
.wait_rx:
    lbu t2, REG_LSR(t1)
    andi t2, t2, LSR_DATA_RDY
    beqz t2, .wait_rx
    lbu a0, REG_RBR(t1)
    ret
