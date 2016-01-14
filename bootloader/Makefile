TARGET=bootloader.o
BINARY=bootloader

all: bootloader

bootloader: bootloader.S
	as -o $(TARGET) bootloader.S
	ld --oformat binary -T bootloader.ld -o $(BINARY) $(TARGET)

clean:
	rm -rf $(TARGET) $(BINARY)
