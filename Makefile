all: Bootloader OS default

Bootloader:
	make -C bootloader
	mv bootloader/bootloader.bin result/

OS:
	make -C virtualos
	mv virtualos/os.bin result/

default:
	mkdir -p result
	cat result/bootloader.bin result/os.bin > result/disk.img

clean:
	rm -rf result/*
