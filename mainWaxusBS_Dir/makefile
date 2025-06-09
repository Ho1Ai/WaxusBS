KERNEL = iso/kernel.elf

CC = gcc
LD = ld
ASSEMBLER = nasm
NASMFLAGS = -f bin ./tmp_loader/bootloader.asm -o ./tmp_compile/stage1.bin
CFLAGS = -m32 -nostdlib -ffreestanding -c ./kernel/kernel.c -o ./tmp_compile/kernel.o
LDFLAGS = -m elf_i386 -T linker.ld -o ./tmp_compile/stage2.bin ./tmp_compile/kernel.o
CONCAT = cat ./tmp_compile/stage1.bin ./tmp_compile/stage2.bin > ./build/os-img.bin

SRC = kernel/kernel.c
OBJ = kernel/kernel.o

FINAL = build/os-img.bin

$(FINAL):$(SRC)
	$(ASSEMBLER) $(NASMFLAGS)
	truncate -s 1024k ./tmp_compile/stage1.bin
	$(CC) $(CFLAGS)
	$(LD) $(LDFLAGS)
	$(CONCAT)

