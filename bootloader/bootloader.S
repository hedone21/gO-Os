/* Start in boot sector */
.org 0x7C00

/* Assign video buffer to es */
movw $0xB800, %ax
movw %ax, %es

/* Clear Screen */
movw $0, %ax
movw $0, %bx
movw $80*25*2, %cx
clear_screen:
	movw %ax, %es:%
	add bx, 1
	loop clear_screen

; Read 1st hard drisk
READ:
	mov ax, 0x0800
	mov es, ax
	mov bx, 0

	mov ah, 2
	mov al, 1
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov dl, 0x80

	int 0x13
	jc READ

jmp 0x8000

jmp $

; Fill other area
times 510-($-$$) db 0x00
dw 0xAA55
