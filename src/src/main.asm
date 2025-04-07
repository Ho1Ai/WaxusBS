org 0x7C00
bits 16


start:
	jmp main

puts:
	push si
	push ax

.loop:
	lodsb
	or al, al
	jz .done

	mov ah, 0x0e
	mov bh, 0
	
	int 0x10

	jmp .loop

.done:
	pop si
	pop ax
	ret

main:
	mov ax, ax
	mov ds, ax
	mov es, ax
	
	mov ss, ax
	mov sp, 0x7C00	

	mov si, msg
	call puts
	
	hlt
.halt:
	jmp .halt

msg db "Hello, World!", 0x0A

times 510-($-$$) db 0
dw 0xAA55
