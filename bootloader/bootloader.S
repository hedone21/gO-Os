#define MSG(x)	movw $x, %si; call print_message

.org 0x00
.code16

.text
.global _start
_start:
	cld
	movw $reading_hd_s, %si
	call print_message
	hlt

read_hd:
	movw $0x0800, %ax
	movw %ax, %es
	movw $0, %bx

	movb $2, %ah
	movb $1, %al
	movb $0, %ch
	movb $2, %cl
	movb $0, %dh
	movb $0x80, %dl

	int $0x13
	jc read_hd

	cld
	movw $reading_hd_okay_s, %si
	call print_message
	hlt

jmp 0x8000

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

.org 0x01fe, 0
.word 0xaa55
