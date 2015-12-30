all: Ready Bootloader OS default

Ready:
	mkdir -p result

Bootloader:
	make -C bootloader
	mv bootloader/bootloader.bin result/

OS:
	make -C arch/x86-64
	mv arch/x86-64/os.bin result/

default:
	cat result/bootloader.bin result/os.bin > result/disk.img

clean:
	rm -rf result/*
