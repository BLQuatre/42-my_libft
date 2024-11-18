# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cauvray <cauvray@student.42lehavre.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/14 14:56:43 by cauvray           #+#    #+#              #
#    Updated: 2024/11/18 11:39:23 by cauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC			= cc
CFLAGS		= -Wall -Wextra -Werror
AR			= ar
AR_FLAGS	= rcs
INCLUDES	= -I ./includes

GREEN	= \033[0;32m
CYAN	= \033[0;36m
RESET	= \033[0m

SUCCESS	= $(GREEN)[SUCCESS]$(RESET)
INFO	= $(CYAN)[INFO]$(RESET)

# get_next_line function
GNL_DIR		= gnl
GNL_FILES	= get_next_line.c
GNL_SRC		= $(addprefix $(GNL_DIR)/, $(GNL_FILES))

# Check functions
IS_DIR		= is
IS_FILES	= ft_isalnum.c \
			ft_isalpha.c \
			ft_isascii.c \
			ft_isdigit.c \
			ft_islower.c \
			ft_isprint.c \
			ft_isspace.c \
			ft_isupper.c
IS_SRC		= $(addprefix $(IS_DIR)/, $(IS_FILES))

# Linked list functions
LST_DIR		= lst
LST_FILES	= ft_lstadd_back.c \
			ft_lstadd_front.c \
			ft_lstclear.c \
			ft_lstdelone.c \
			ft_lstiter.c \
			ft_lstlast.c \
			ft_lstmap.c \
			ft_lstnew.c \
			ft_lstsize.c
LST_SRC		= $(addprefix $(LST_DIR)/, $(LST_FILES))

# Memory functions
MEM_DIR		= mem
MEM_FILES	= ft_bzero.c \
			ft_calloc.c \
			ft_memchr.c \
			ft_memcmp.c \
			ft_memcpy.c \
			ft_memmove.c \
			ft_memset.c
MEM_SRC		= $(addprefix $(MEM_DIR)/, $(MEM_FILES))

# printf function
PRINTF_DIR		= printf
PRINTF_FILES	= ft_hex_utils.c \
				ft_int_utils.c \
				ft_printf_utils.c \
				ft_params_utils.c \
				ft_printf_params.c \
				ft_printf_c.c \
				ft_printf_s.c \
				ft_printf_id.c \
				ft_printf_x.c \
				ft_printf_u.c \
				ft_printf_p.c \
				ft_printf.c
PRINTF_SRC		= $(addprefix $(PRINTF_DIR)/, $(PRINTF_FILES))

# Write functions
PUT_DIR		= put
PUT_FILES	= ft_putchar_fd.c \
			ft_putendl_fd.c \
			ft_putnbr_fd.c \
			ft_putstr_fd.c
PUT_SRC		= $(addprefix $(PUT_DIR)/, $(PUT_FILES))

# String functions
STR_DIR		= str
STR_FILES	= ft_split.c \
			ft_strchr.c \
			ft_strdup.c \
			ft_striteri.c \
			ft_strjoin.c \
			ft_strlcat.c \
			ft_strlcpy.c \
			ft_strlen.c \
			ft_strmapi.c \
			ft_strncmp.c \
			ft_strnstr.c \
			ft_strrchr.c \
			ft_strtrim.c \
			ft_substr.c \
			ft_strndup.c \
			ft_strrev.c \
			ft_nbrlen.c
STR_SRC		= $(addprefix $(STR_DIR)/, $(STR_FILES))

# A to B functions
TO_DIR		= to
TO_FILES	= ft_atoi.c \
			ft_atol.c \
			ft_itoa.c \
			ft_tolower.c \
			ft_toupper.c
TO_SRC		= $(addprefix $(TO_DIR)/, $(TO_FILES))

ALL_FILES = $(GNL_FILES) $(IS_FILES) $(LST_FILES) $(MEM_FILES) $(PRINTF_FILES) $(PUT_FILES) $(STR_FILES) $(TO_FILES)

SRCS_DIR	= srcs
SRCS_FILES	= $(GNL_SRC) $(IS_SRC) $(LST_SRC) $(MEM_SRC) $(PRINTF_SRC) $(PUT_SRC) $(STR_SRC) $(TO_SRC)
SRCS		= $(addprefix $(SRCS_DIR)/, $(SRCS_FILES))

OBJS_DIR	= objs
OBJS_FILES	= $(ALL_FILES:.c=.o)
OBJS		= $(addprefix $(OBJS_DIR)/, $(OBJS_FILES))

all: $(NAME)

$(OBJS_DIR):
	mkdir -p $(OBJS_DIR)

$(OBJS_DIR)/%.o: $(SRCS_DIR)/**/%.c | $(OBJS_DIR)
	@echo "$(INFO) Compiling $<..."
	$(CC) $(CFLAGS) -c $(INCLUDES) $< -o $@

$(NAME): $(OBJS)
	@echo "$(INFO) Creating $(NAME)..."
	$(AR) $(AR_FLAGS) $@ $^
	@echo "$(SUCCESS) $(NAME) created successfully!"

clean:
	@echo "$(INFO) Removing object files..."
	rm -rf $(OBJS_DIR)
	@echo "$(SUCCESS) Objects removed."

fclean: clean
	@echo "$(INFO) Removing $(NAME)..."
	rm -f $(NAME)
	@echo "$(SUCCESS) $(NAME) removed."

re: fclean all

.PHONY: all clean fclean re
