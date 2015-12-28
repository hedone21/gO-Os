TARGET=bootloader.bin

all: bootloader

bootloader: bootloader.asm
	nasm -o $(TARGET) bootloader.asm

clean:
	rm -rf $(TARGET)

