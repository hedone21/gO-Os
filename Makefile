all: Bootloader

Bootloader:
	make -C bootloader
	mv bootloader/bootloader.bin result/disk.img

clean:
	rm -rf result/*
