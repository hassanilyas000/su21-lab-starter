

OUTPUT_ARCH("riscv")

MEMORY
{
    /* Code section */
    CODE (rx) : ORIGIN = 0x80000000, LENGTH = 0x1000
    /* Data section */
    DATA (rw) : ORIGIN = 0x80001000, LENGTH = 0x10000000
}

SECTIONS
{
    . = ORIGIN(CODE);
    .text :
    {
        *(.text)
    } > CODE

    . = ORIGIN(DATA);
    .data :
    {
        *(.data)
    } > DATA
}

