.org 0x00
.code16
.text

xorw %ax, %ax
lgdt gdtr
cli
movl %cr0, %eax
orl $1, %eax
movl %eax, %cr0

jmp .+2
nop
nop

ljmp $0x0008, $_entry32

_entry32:
.code32

movw _data_descriptor, %bx
movw %bx, %ds
movw %bx, %es
movw %bx, %fs
movw %bx, %gs
movw %bx, %ss
xorl %esp, %esp
movl $0x9FFFF, %esp

movw $0x18, %ax
movw %ax, %es

movb $0x09, %ah
movb $'P', %al
movw %ax, %es:0x0000

jmp .

gdtr:
.word gdt_end - gdt - 1
.long gdt

gdt:
.set _null_descriptor, 0x00
	.word 0
	.word 0
	.byte 0
	.byte 0
	.byte 0
	.byte 0

.set _code_descriptor, 0x08	
	.word 0xFFFF
	.word 0x0000
	.byte 0x00
	.byte 0x9A
	.byte 0xCF
	.byte 0x00

.set _data_descriptor, 0x10
	.word 0xFFFF
	.word 0x0000
	.byte 0x00
	.byte 0x92
	.byte 0xCF
	.byte 0x00

.set _video_descriptor, 0x18
	.word 0xFFFF
	.word 0x8000
	.byte 0x0B
	.byte 0x92
	.byte 0xCF
	.byte 0x00
gdt_end:

jmp .

reading_hd_s:	.asciz "Reading hard disk... "
reading_hd_okay_s:	.asciz "OK\n "

1:
	movw	$0x0001, %bx
	movb	$0xe, %ah
	int	$0x10		/* display a byte */
print_message:
	lodsb
	cmpb	$0, %al
	jne	1b	/* if not end of string, jmp to display */
	ret

.org 0x01ff, 0
.byte 0x00
