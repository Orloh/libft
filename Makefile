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
CC		= gcc

# Compiler flags
CFLAGS		= -Wall -Werror -Wextra

# Archiver
AR		= ar

# Archiver flags
ARFLAGS		= rcs

# Cleanup commands
# Detect operating system
ifeq ($(OS),Windows_NT)
    # Windows: Use del /Q
    RM = del /Q
    FIXPATH = $(subst /,\,$1)
else
    # Linux/Unix: Use rm -f
    RM = rm -f
    FIXPATH = $1
endif

# Source files
	SOURCES		=	$(wildcard *.c)

# Name of the static library
NAME		= libft.a

	# Object files
OBJECTS		= $(SOURCES:.c=.o)

# Header files
HEADERS		= libft.h

# Compilation rule for object files
%.o: %.c $(HEADERS) 
	$(CC) $(CFLAGS) -c $< -o $@

# Build rule
$(NAME): 	$(OBJECTS)
		$(AR) $(ARFLAGS) $(NAME) $(OBJECTS)

# Default target to build project
all:		$(NAME)

# Clean up generated object files 
clean:
		$(RM) $(OBJECTS)

# Clean up object files and the library
fclean: 	clean
		$(RM) $(NAME)

# Rebuild project
re:		fclean $(NAME)

# Delete targets on error
.DELETE_ON_ERROR:

# Phony targets
.PHONY:		all c:lean fclean re
