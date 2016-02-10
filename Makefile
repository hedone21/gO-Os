VERSION=0
PATCHLEVEL=0
SUBLEVEL=1
PWD=$(shell pwd)

export KERNELDIR=$(PWD)

include $(KERNELDIR)/Kconfig

CFLAGS:=$(CFLAGS) $(ARCH_CFLAGS)
LDFLAGS:=$(LDFLAGS) $(ARCH_LDFLAGS)
LIBS:=$(LIBS) $(ARCH_LIBS)

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
