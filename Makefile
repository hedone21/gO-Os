VERSION=0
PATCHLEVEL=0
SUBLEVEL=1
PWD=$(shell pwd)

export KERNELDIR=$(PWD)

HOST?=$(ARCH)
CROSS-COMPILE=$(ARCH)-elf-
CC=$(CROSS-COMPILE)gcc

CFLAGS?=-O2
LDFLAGS?=
LIBS?=

ARCHDIR?=$(KERNELDIR)/arch/$(HOST)
DESTDIR?=$(KERNELDIR)/iso/boot
INITTDIR?=$(KERNELDIR)/init
INCLUDEDIR?=$(KERNELDIR)/include
SRCDIR?=$(KERNELDIR)/kernel

include $(KERNELDIR)/Kconfig
include $(ARCHDIR)/Kconfig
include $(INITTDIR)/Kconfig
include $(SRCDIR)/Kconfig

#CFLAGS:=-I $(INCLUDEDIR)

CFLAGS:=$(CFLAGS) -ffreestanding -fbuiltin -Wall -Wextra -isystem $(INCLUDEDIR) 
LDFLAGS:=$(LDFLAGS)
LIBS:=$(LIBS) -nostdlib -lgcc -lk

CFLAGS:=$(CFLAGS) $(ARCH_CFLAGS)
LDFLAGS:=$(LDFLAGS) $(ARCH_LDFLAGS)
LIBS:=$(LIBS) $(ARCH_LIBS)

export CC
export ARCHDIR
export DESTDIR
export INITTDIR
export INCLUDEDIR
export SRCDIR
export CFLAGS
export LDFLAGS
export LIBS

all: default

default:
	make -C $(SRCDIR)
	make -C $(ARCHDIR)
	make -C $(INITTDIR)
	#make -C $(INCLUDEDIR)
	mkdir -p $(DESTDIR)/grub
	cp $(INITTDIR)/*.o $(ARCHDIR)/*.ld $(ARCHDIR)/*.o $(DESTDIR)
	cp grub.cfg $(DESTDIR)/grub
	grub-mkrescue -o kernel.iso iso

clean:
	make -C arch/i686 clean
	make -C init clean
	rm -rf iso *.iso
