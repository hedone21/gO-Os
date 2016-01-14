all: Ready Bootloader OS default

Ready:
	mkdir -p result

Bootloader:
	make -C bootloader
	mv bootloader/bootloader result/

OS:
	make -C arch/x86-64
	mv arch/x86-64/os.bin result/

default:
	cat result/bootloader result/os.bin > result/disk.img

clean:
	make -C bootloader clean
	make -C arch/x86-64 clean
	rm -rf result/*
