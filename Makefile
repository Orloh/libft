# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: orhernan <ohercelli@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/03 12:45:24 by orhernan          #+#    #+#              #
#    Updated: 2025/10/22 00:18:50 by orhernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Compiler
CC = gcc

# Compiler flags
CFLAGS = -Wall -Werror -Wextra

# Archiver
AR = ar

# Archiver flags
ARFLAGS = rcs

# Include directory
INC_DIR = .

# Preprocessor flags
CPPFLAGS = -I$(INC_DIR)

# Detect operating system to select file deleting program
ifeq ($(OS),Windows_NT)
    # Windows: Use del /Q
    RM = del /Q
    TARGET_EXTENSION = exe
else
    # Linux/Unix: Use rm -f
    RM = rm -f
    TARGET_EXTENSION = out
endif

PATHU = ./.tests/unity/src
PATHS = ./
PATHT = ./.tests/
PATHB = ./build/
PATHD = ./build/depends/
PATHO = ./build/objs/
PATHR = ./build/results/

BUILD_PATHS = $(PATHB) $(PATHD) $(PATHO) $(PATHR)

# Testing Toolchain
COMPILE = gcc -c
LINK = gcc
DEPEND = gcc -MM -MG -MF
TEST_CFLAGS = -I$(INC_DIR) -I$(PATHU) -I$(PATHS) -DTEST

# Test Source files
SRC_TEST = $(wildcard $(PATHT)*.c)

# Results Summary
test: $(BUILD_PATHS) $(RESULTS)
	@echo "---\nIGNORES: \n---"
	@echo `grep -s IGNORE $(PATHR)*.txt`
	@echo "---\nIGNORES: \n---"
	@echo `grep -s FAIL $(PATHR)*.txt`
	@echo "\nDONE"

# Creating Results
RESULTS = $(patsubst $(PATHT)test_%.c, $(PATHR)test_%.txt, $(SRCT))

# Pipes the stderror and stdout to a result text file of the performed test
$(PATHR)%.txt: $(PATHB).$(TARGET_EXTENSION)
	-./$< > $@ 2>&1

# Creating Executables
$(PATHB)test_%.$(TARGET_EXTENSION): $(PATHO)test_%.o $(PATHO).o $(PATHO)unity.o $(PATHD)Test%.d
	$(LINK) -o $@ $^

# Creating Object Files
$(PATHO)%.o::$(PATHT)%.c
	$(COMPILE) $(TEST_CFLAGS) $< -o $@

$(PATHO)%.o::$(PATHS)%.c
	$(COMPILE) $(TEST_CFLAGS) $< -o $@

$(PATHO)%.o::$(PATHU)%.c $(PATHU)%.h
	$(COMPILE) $(TEST_CFLAGS) $< -o $@

# Creating Dependencies
$(PATHD)%.d::$(PATHT)%.c
	$(DEPEND) $@ $<

# Source files
SOURCES =	ft_atoi.c	ft_bzero.c	ft_calloc.c	ft_isalnum.c	\
		ft_isalpha.c	ft_isascii.c	ft_isdigit.c	ft_isprint.c	\
		ft_itoa.c	ft_memchr.c	ft_memcmp.c	ft_memcpy.c	\
		ft_memmove.c	ft_memset.c	ft_putchar_fd.c	ft_putendl_fd.c	\
		ft_putnbr_fd.c	ft_putstr_fd.c	ft_split.c	ft_strchr.c	\
		ft_strdup.c	ft_striteri.c	ft_strjoin.c	ft_strlcat.c	\
		ft_strlcpy.c	ft_strlen.c	ft_strmapi.c	ft_strncmp.c	\
		ft_strnstr.c	ft_strrchr.c	ft_substr.c	ft_strtrim.c	\
		ft_tolower.c	ft_toupper.c

# Bonus Source files
BONUS_SRCS =	ft_lstnew_bonus.c	ft_lstadd_front_bonus.c	ft_lstadd_back_bonus.c	\
		ft_lstsize_bonus.c	ft_lstlast_bonus.c	ft_lstdelone_bonus.c	\
		ft_lstclear_bonus.c	ft_lstiter_bonus.c	ft_lstmap_bonus.c	

# Name of the static library
NAME = libft.a

# Object files
OBJECTS := $(SOURCES:%.c=%.o)

# Bonus object files
BONUS_OBJS := $(BONUS_SRCS:%.c=%.o)

# All Objects + Bonus Objects
ALL_OBJS = $(OBJECTS) $(BONUS_OBJS)

# Header files
HEADERS = libft.h

# Compilation rule for object files
%.o: %.c $(HEADERS) 
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# Build rule
$(NAME): $(OBJECTS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJECTS)

# Default target to build project
all: $(NAME)

# Clean up generated object files 
clean:
	$(RM) $(ALL_OBJS)

# Clean up object files and the library
fclean: clean
	$(RM) $(NAME)

# Rebuild project
re: fclean all

# Target to build project with bonus functions
bonus: $(ALL_OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(ALL_OBJS)

# Phony targets
.PHONY: all clean fclean re
