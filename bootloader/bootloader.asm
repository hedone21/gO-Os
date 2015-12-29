; Start in boot sector
org 0x7C00

; Assign video buffer to es
mov ax, 0xB800
mov es, ax

; Clear Screen
mov ax, [Background]
mov bx, 0
mov cx, 80*25*2
CLEAR_SCREEN:
	mov [es:bx], ax
	add bx, 1
	loop CLEAR_SCREEN

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

Background: db 0x00

; Fill other area
times 510-($-$$) db 0x00
dw 0xAA55
