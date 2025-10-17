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

# Preprocessor flags
CPPFLAGS = -I$(INC_DIR)

# Include directory
INC_DIR = . 

# Detect operating system to select file deleting program
ifeq ($(OS),Windows_NT)
    # Windows: Use del /Q
    RM = del /Q
else
    # Linux/Unix: Use rm -f
    RM = rm -f
endif

# Source files
SOURCES =	ft_atoi.c	ft_bzero.c	ft_calloc.c	ft_isalnum.c	\
		ft_isalpha.c	ft_isascii.c	ft_isdigit.c	ft_isprint.c	\
		ft_memchr.c	ft_memcmp.c	ft_memcpy.c	ft_memmove.c	\
		ft_memset.c	ft_strchr.c	ft_strlcat.c	ft_strlcpy.c	\
		ft_strlen.c	ft_strncmp.c	ft_strnstr.c	ft_strrchr.c	\
		ft_tolower.c	ft_toupper.c

# Name of the static library
NAME = libft.a

# Object files
OBJECTS := $(SOURCES:%.c=%.o)

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
	$(RM) $(OBJECTS)

# Clean up object files and the library
fclean: clean
	$(RM) $(NAME)

# Rebuild project
re: fclean all

# Phony targets
.PHONY: all clean fclean re
