org 0x7C00
bits 16


extern kernel_main

start:
	jmp main

outputl:
	push ax
	push si
.do:
	lodsb
	or al, al
	jz .done
	mov ah, 0x0E
	mov bh, 0
	int 0x80
	jmp .do
.done:
	pop ax
	pop si
	ret

bootpanic:
	mov si, err
	call outputl
.panic:
	jmp .panic


startkernel:
	mov ah, 0x02
	mov al, 4
	mov ch, 0
	mov cl, 2
	mov dh, 0
	mov dl, 0x00
	mov bx, 0x1000
	int 0x13

	jc bootpanic

	jmp 0x1000





main:
	mov ax, 0
	mov ds, ax
	mov es, ax
	mov sp, 0x7C00
	mov ss, ax

	mov si, loading
	call outputl

	call startkernel

	;mov si, err
	;call outputl
	hlt
.halt:
	jmp .halt

loading db "Booting into kernel...", 0x0A, 0x0D, 0x00
err db "Error while loading OS...", 0x0A, 0x0D, 0x00

times 510-($-$$) db 0
dw 0xAA55

