# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: orhernan <ohercelli@gmail.com>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/10/03 12:45:24 by orhernan          #+#    #+#              #
#    Updated: 2025/10/03 16:01:54 by orhernan         ###   ########.fr        #
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

# Detect operating system to select file deleting program
ifeq ($(OS),Windows_NT)
    # Windows: Use del /Q
    RM = del /Q
else
    # Linux/Unix: Use rm -f
    RM = rm -f
endif

# Source files
SOURCES	= ft_bzero.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c  ft_memcpy.c  ft_memset.c  ft_strlen.c  ft_tolower.c  ft_toupper.c

# Name of the static library
NAME = libft.a

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Header files
HEADERS = libft.h

# Test directory and files
TEST_DIR = tests/
TEST_SRC = $(TEST_DIR)test_ft_bzero.c
TEST_OBJ = $(TEST_SRC: .c=.o)
UNITY_PATH = $(TEST_DIR)unity/src/
UNITY_SRC = $(UNITY_PATH)unity.c
UNITY_OBJ = $(UNITY_SRC: .c=.o)
TEST_EXEC = test_ft_bzero

# Compilation rule for object files
%.o: %.c $(HEADERS) 
	$(CC) $(CFLAGS) -c $< -o $@

# Compilation rule for test objects (includig Unity headers)
$(TEST_DIR)/%.o: $(TEST_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@ -I$(UNITY_SRC) -I./

# Compilation rule for Unity object
$(UNITY_OBJ): $(UNITY_SRC)
	$(CC) $(CFLAGS) -c $< -o $@ -I$(UNITY_PATH) -I./

# Build rule
$(NAME): $(OBJECTS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJECTS)

# Build rule for test executable
$(TEST_EXEC): $(NAME) $(TEST_OBJ) $(UNITY_OBJ)
	$(CC) $(CFLAGS) $(TEST_OBJ) $(UNITY_OBJ) -L. -lft -o $(TEST_EXEC)

# Default target to build project
all: $(NAME)

# Clean up generated object files 
clean:
	$(RM) $(OBJECTS)

# Clean up object files and the library
fclean: clean
	$(RM) $(NAME)

# Rebuild project
re: fclean all

# Test target to build and run tests
test: $(TEST_EXEC)
	./(TEST_EXEC)

# Clean test files
tclean: 
	$(RM) $(TEST_OBJ) $(UNITY_OBJ)

# Delete targets on error
.DELETE_ON_ERROR:

# Phony targets
.PHONY:		all clean fclean re test tclean
