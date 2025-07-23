ENTRY(_start)

MEMORY
{
    DMEM (rwx) : ORIGIN = 0x80040000, LENGTH = 8K
    IMEM (rx)  : ORIGIN = 0x80000000, LENGTH = 16K
    ROM  (rx)  : ORIGIN = 0x00000000, LENGTH = 4K
}

_stack_top = ORIGIN(DMEM) + LENGTH(DMEM);

SECTIONS
{
    .text : ALIGN(4) {
        KEEP(*(.init))
        *(.text*)
    } > ROM

  /* Ensure end of memory */
  . = 0x00001000;

    

    .rodata : { *(.rodata*) } > DMEM
    .data   : { *(.data*) } > DMEM
    .bss    : { *(.bss*) *(.sbss*) *(COMMON) } > DMEM
}
