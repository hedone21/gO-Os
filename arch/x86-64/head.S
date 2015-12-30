org 0x8000

xor ax, ax
lgdt [gdtr]
cli
mov eax, cr0
or eax, 1
mov cr0, eax

jmp $+2
nop
nop

jmp 0x08:Entry32

[bits   32]
Entry32:
; Init segment register
mov     bx, dataDescriptor
mov     ds, bx
mov     es, bx
mov     fs, bx
mov     gs, bx
mov     ss, bx
xor     esp, esp
mov     esp, 0x9FFFF

; Save video discriptor to es
mov     ax, 0x18
mov     es, ax

; Print word
mov     ah, 0x09
mov     al, 'P'
mov     [es:0x0000], ax
mov     al, 'r'
mov     [es:0x0002], ax
mov     al, 'o'
mov     [es:0x0004], ax
mov     al, 't'
mov     [es:0x0006], ax
mov     al, 'e'
mov     [es:0x0008], ax
mov     al, 'c'
mov     [es:0x000A], ax
mov     al, 't'
mov     [es:0x000C], ax

jmp     $

; GDT region
gdtr:
dw gdt_end - gdt - 1    ; GDT limit
dd gdt                  ; GDT bas address

gdt:
; NULL descriptor
nullDescriptor  equ 0x00
	dw 0
	dw 0
	db 0
	db 0
	db 0
	db 0

; Code descriptor
codeDescriptor  equ 0x08
	dw 0xFFFF               ; limit:0xFFFF
	dw 0x0000               ; base 0~15 : 0
	db 0x00                 ; base 16~23: 0
	db 0x9A                 ; P:1, DPL:0, Code, non-conforming, readable
	db 0xCF                 ; G:1, D:1, limit:0xF
	db 0x00                 ; base 24~32: 0

; Data discriptor
dataDescriptor  equ 0x10
	dw 0xFFFF               ; limit 0xFFFF
	dw 0x0000               ; base 0~15 : 0
	db 0x00                 ; base 16~23: 0
	db 0x92                 ; P:1, DPL:0, data, readable, writable
	db 0xCF                 ; G:1, D:1, limit:0xF
	db 0x00                 ; base 24~32: 0

; Video discriptor
videoDescriptor equ 0x18
	dw 0xFFFF               ; limit 0xFFFF
	dw 0x8000               ; base 0~15 : 0x8000
	db 0x0B                 ; base 16~23: 0x0B
	db 0x92                 ; P:1, DPL:0, data, readable, writable
	db 0xCF                 ; G:1, D:1, limit:0xF
	db 0x00                 ; base 24~32: 0
gdt_end:

jmp $

times 512-($-$$) db 0x00
