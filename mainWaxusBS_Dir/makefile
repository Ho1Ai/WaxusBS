KERNEL = iso/kernel.elf

CC = gcc
LD = ld
ASSEMBLER = nasm
NASMFLAGS = -f bin ./tmp_loader/bootloader.asm -o ./tmp_compile/stage1.bin
CFLAGS = -m32 -Wall -Wextra -nostdlib -ffreestanding -c ./kernel/kernel.c -o ./tmp_compile/kernel.o
#LDFLAGS = -m elf_i386 -T linker.ld -o ./tmp_compile/stage2.bin ./tmp_compile/kernel.o
CONCAT = cat ./tmp_compile/stage1.bin ./tmp_compile/stage2.bin > ./build/os-img.bin
BITS_CHANGE = -f elf32 tmp_loader/bits_change.asm -o tmp_compile/btchng.o
LDFLAGS = -m elf_i386 -T linker.ld -o exec_kernel tmp_compile/btchng.o tmp_compile/kernel.o

SRC = kernel/kernel.c
OBJ = kernel/kernel.o

FINAL = build/os-img.bin

$(FINAL):$(SRC)
	$(ASSEMBLER) $(NASMFLAGS)
	$(ASSEMBLER) $(BITS_CHANGE)
	truncate -s 1024k ./tmp_compile/stage1.bin
	$(CC) $(CFLAGS)
	$(LD) $(LDFLAGS)
	$(CONCAT)

