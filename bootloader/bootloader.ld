ENTRY(_start)

SECTIONS
{
	. = 0x0000;
	.text 0x7C00 : { *(.text) }
	.data : { *(.data) }
	.bss : { *(.bss) }
}
