TARGET=bootloader.bin

all: bootloader

bootloader: bootloader.S
	nasm -o $(TARGET) bootloader.S

clean:
	rm -rf $(TARGET)

