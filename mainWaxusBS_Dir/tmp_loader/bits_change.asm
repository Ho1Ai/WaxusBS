bits 32
extern kernel_main

section .text
	align 4
	dd 0x1BADB002
	dd 0x00
	dd - (0x1BADB002+0x00)

mov_carrette:
	mov ah, 0x06
	mov al, 0
	mov bh, 0x07
	mov cx, 0x0000
	mov dx, 0x184F
	int 0x10
	ret

start:
	call mov_carrette
	cli
	call kernel_main
	hlt

section .bss
	resb 8192
stack_space:
