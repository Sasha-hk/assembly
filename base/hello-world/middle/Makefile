.PHONY: main
all: main

main: ./main.s
	nasm -f elf64 -o main.o main.s
	ld -s -o main main.o
