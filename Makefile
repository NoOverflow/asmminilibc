##
## EPITECH PROJECT, 2021
## malloc [SSH: 192.168.0.28]
## File description:
## Makefile
##

CASM = nasm

NAME = libasm.so

SRC = \
	./src/strlen.asm \
	./src/strchr.asm \
	./src/memset.asm \
	./src/memcpy.asm \
	./src/strcmp.asm \
	./src/strncmp.asm \
	./src/memmove.asm \
	./src/strcasecmp.asm \
	./src/rindex.asm \

OBJ = $(SRC:.asm=.o)

AFLAGS = -g -F dwarf -f elf64

CFLAGS = $(if DEBUG,-g3) -Wall -Wextra

LDFLAGS = -Wl,-rpath '-Wl,.'

.PHONY: all
all: $(NAME)

.PHONY: clean
clean:
	rm -f $(OBJ)

.PHONY: fclean
fclean: clean
	rm -f $(NAME)

.PHONY: re
re: fclean all

test_bin: all
	rm -f ./a.out
	gcc $(CFLAGS) $(LDFLAGS) -L./ src/tester.c -lasm

.PHONY: run
run: $(NAME)
	gcc  test
	@./$(NAME) $(ARGS)

%.o: %.asm
	$(CASM) $(AFLAGS) -o $@ $<

$(NAME): $(OBJ)
	ld -shared $(OBJ) -o $@
