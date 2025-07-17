# === File: Makefile ===

# Toolchain
CC       = riscv64-unknown-elf-gcc
OBJCOPY  = riscv64-unknown-elf-objcopy
OBJDUMP  = riscv64-unknown-elf-objdump


# Flags
CFLAGS   = -march=rv32imac_zicsr -mabi=ilp32 -Wall -Wextra -nostdlib -g
LDSCRIPT = linker.ld
OBJCOPY_FLAGS = -O verilog -j .text 


# Source and target
TARGET   = boot
SRC      = boot1_ver2.S spi.S uart.S adler32.S
ROM      = ../../../soc/rom/rom.mem

# Default rule
all: $(TARGET).elf $(TARGET).dis inst.hex data.hex 

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
	cp machine.hex ../../inst_formatted.hex

# Data memory
data.hex: $(TARGET).elf
	$(OBJCOPY) -O verilog -j .data -j .rodata -j .bss $< data.hex
	./convert_hex data.hex data.hex
	cp data.hex ../../data_formatted.hex

# Clean
clean:
	rm -f *.o *.elf *.dis *.hex machine.hex

.PHONY: all clean
