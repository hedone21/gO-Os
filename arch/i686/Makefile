include $(KERNELDIR)/Kconfig

SRC=boot.S
OBJ=boot.o

all: $(OBJ)

%.o: %.S
	$(CROSS-COMPILE)as $(SRC) -o $(OBJ)

clean:
	rm -rf $(OBJ)
