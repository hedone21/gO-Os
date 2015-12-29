org 0x8000

mov ax, 0xB800
mov es, ax

mov ah, 0x0A
mov al, 'H'
mov [es:0000], ax
mov al, 'i'
mov [es:0002], ax

jmp $

times 512-($-$$) db 0x00
