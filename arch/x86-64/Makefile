TARGET=os.bin

all: os

os: head.S
	nasm -o $(TARGET) head.S

clean:
	rm -rf $(TARGET)

