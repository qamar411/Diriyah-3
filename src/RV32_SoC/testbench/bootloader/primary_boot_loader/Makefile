# === File: Makefile ===

# Toolchain
CC       = riscv64-unknown-elf-gcc
OBJCOPY  = riscv64-unknown-elf-objcopy
OBJDUMP  = riscv64-unknown-elf-objdump


# Flags
CFLAGS   = -march=rv32im -mabi=ilp32 -Wall -Wextra -nostdlib -g
LDSCRIPT = linker.ld
OBJCOPY_FLAGS = -O verilog -j .text --pad-to=0x00001000 


# Source and target
TARGET   = boot
SRC      = boot1_ver2.S spi.S uart.S adler32.S
ROM      = ../../../modules/rtl_team/rv32imf/soc/rom/rom.mem 

# Default rule
all: $(TARGET).elf $(TARGET).dis inst.hex data.hex gen_rom

# Link
$(TARGET).elf: $(SRC)
	$(CC) $(CFLAGS) -T $(LDSCRIPT) -o $@ $^

# Disassembly
$(TARGET).dis: $(TARGET).elf
	$(OBJDUMP) -d -M no-aliases $< > $@

# Instruction memory
inst.hex: $(TARGET).elf
	$(OBJCOPY) $(OBJCOPY_FLAGS) $< inst.hex
	./convert_hex inst.hex machine.hex
	cp machine.hex ../inst_formatted.hex

gen_rom: machine.hex
	cp machine.hex $(ROM) 

# Data memory
data.hex: $(TARGET).elf
	$(OBJCOPY) -O verilog -j .data -j .rodata -j .bss $< data.hex
	./convert_hex data.hex data.hex

# Clean
clean:
	rm -f *.o *.elf *.dis *.hex machine.hex

.PHONY: all clean
