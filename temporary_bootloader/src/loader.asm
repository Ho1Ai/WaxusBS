org 0x7c00
bits 16



%define ENDL 0x0D, 0x0A


start:
	jmp main

screen_clean:
	push ax
	push si
	push bx
	push dx
	push cx
.do:
	mov ah, 0x06
	mov al, 0
	mov bh, 0x07
	mov cx, 0x0000
	mov dx, 0x184F
	int 0x10
	mov ah, 0x02
	mov bh, 0x00
	mov dh, 0x00
	mov dl, 0x00
	int 0x10	
	jmp .end
.end:
	pop ax
	pop si
	pop bx
	pop dx
	pop cx
	ret


puts:
	push ax
	push si
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
	call screen_clean
	mov ax, 0
	mov ds, ax
	mov es, ax
	
	mov ss, ax
	mov sp, 0x7c00
	
	mov si, startup
	call puts

	mov si, loading
	call puts

	hlt
.halt:
	jmp .halt

startup db "Toast has been loaded!", ENDL, ENDL, 0 ; 2 endls just to keep distance here	

loading db "Loading WaxusBS...", ENDL, 0

times 510-($-$$) db 0
dw 0AA55h
