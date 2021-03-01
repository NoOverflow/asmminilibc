##
## EPITECH PROJECT, 2021
## malloc [SSH: 192.168.0.28]
## File description:
## Makefile
##

CASM = nasm

CC = gcc

NAME = libasm.so

TEST_NAME = tests_bin

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
	./src/strcspn.asm \

TEST_SRC = \
	./tests/strcmp.c \
	./tests/strcasecmp.c \
	./tests/strncmp.c \
	./tests/rindex.c \

OBJ = $(SRC:.asm=.o)
TEST_OBJ = $(TEST_SRC:.c=.o)

AFLAGS = -g -F dwarf -f elf64

CFLAGS = -Wall -Wextra -fno-builtin

LDFLAGS = -Wl,-rpath '-Wl,.'

.PHONY: all
all: $(NAME)

.PHONY: clean
clean:
	rm -f $(OBJ)
	rm -f $(TEST_OBJ)

.PHONY: fclean
fclean: clean
	rm -f $(NAME)
	rm -f $(TEST_NAME)

.PHONY: re
re: fclean all

test_bin: all
	rm -f ./a.out
	gcc $(CFLAGS) $(LDFLAGS) -L./ src/tester.c -lasm

tests_run: fclean $(NAME) $(TEST_NAME)
	./$(TEST_NAME)

.PHONY: run
run: $(NAME)
	@./$(NAME) $(ARGS)

%.o: %.c
	$(CC) $(CFLAGS) -c  -L./ -lasm -o $@ $<

%.o: %.asm
	$(CASM) $(AFLAGS) -o $@ $<

$(NAME): $(OBJ)
	ld -shared $(OBJ) -o $@

$(TEST_NAME): CFLAGS += -lcriterion
$(TEST_NAME): $(TEST_OBJ)
	$(CC) $(LDFLAGS) $(TEST_OBJ) -lcriterion -L./ -lasm -o $@
