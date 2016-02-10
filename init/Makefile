include $(KERNELDIR)/Kconfig

CFLAGS_C:=$(CFLAGS) -fbuiltin -std=gnu99
CFLAGS_LD:=$(CFLAGS) -nostdlib
LDFLAGS:=
LIBS:=

SRC=main.c
OBJ=main.o
BIN=kernel.o
BOOT_OBJ=$(ARCHDIR)/boot.o $(SRCDIR)/*.o
LINKER=$(ARCHDIR)/main.ld

all: $(OBJ) $(BIN)

%.o: %.c
	$(CC) -c $(SRC) -o $(OBJ) $(CFLAGS_C)

$(BIN): $(LINKER)
	$(CC) -T $(LINKER) -o $(BIN) $(CFLAGS_LD) $(OBJ) $(BOOT_OBJ) $(LDFLAGS) $(LIBS)

clean:
	rm -rf $(OBJ) $(BOOT_OBJ) $(BIN)
