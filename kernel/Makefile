include $(KERNELDIR)/Kconfig

CFLAGS:=$(CFLAGS) -std=gnu99
LDFLAGS:=
LIBS:=

SRC=string.c tty.c debug.c
OBJ=string.o tty.o debug.o

all: $(OBJ)

%.o: %.c
	$(CC) -o $@ -c $< $(CFLAGS)

clean:
	rm -rf $(OBJ)
