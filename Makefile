# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cauvray <cauvray@student.42lehavre.fr>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/10/14 14:56:43 by cauvray           #+#    #+#              #
#    Updated: 2024/11/02 22:11:32 by cauvray          ###   ########.fr        #
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

SRCS_DIR	= srcs/
GNL_DIR		= gnl/
IS_DIR		= is/
LST_DIR		= lst/
MEM_DIR		= mem/
PRINTF_DIR	= printf/
PUT_DIR		= put/
STR_DIR		= str/
TO_DIR		= to/

_GNL	= get_next_line.c
_IS		= ft_isalnum.c \
			ft_isalpha.c \
			ft_isascii.c \
			ft_isdigit.c \
			ft_islower.c \
			ft_isprint.c \
			ft_isspace.c \
			ft_isupper.c
_LST	= ft_lstadd_back.c \
			ft_lstadd_front.c \
			ft_lstclear.c \
			ft_lstdelone.c \
			ft_lstiter.c \
			ft_lstlast.c \
			ft_lstmap.c \
			ft_lstnew.c \
			ft_lstsize.c
_MEM	= ft_bzero.c \
			ft_calloc.c \
			ft_memchr.c \
			ft_memcmp.c \
			ft_memcpy.c \
			ft_memmove.c \
			ft_memset.c
_PRINTF	= ft_hex_utils.c \
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
_PUT	= ft_putchar_fd.c \
			ft_putendl_fd.c \
			ft_putnbr_fd.c \
			ft_putstr_fd.c
_STR	= ft_split.c \
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
_TO		= ft_atoi.c \
			ft_itoa.c \
			ft_tolower.c \
			ft_toupper.c


GNL		= $(addprefix $(GNL_DIR), $(_GNL))
IS		= $(addprefix $(IS_DIR), $(_IS))
LST		= $(addprefix $(LST_DIR), $(_LST))
MEM		= $(addprefix $(MEM_DIR), $(_MEM))
PRINTF	= $(addprefix $(PRINTF_DIR), $(_PRINTF))
PUT		= $(addprefix $(PUT_DIR), $(_PUT))
STR		= $(addprefix $(STR_DIR), $(_STR))
TO		= $(addprefix $(TO_DIR), $(_TO))

_SRCS = $(GNL) $(IS) $(LST) $(MEM) $(PRINTF) $(PUT) $(STR) $(TO)
SRCS = $(addprefix $(SRCS_DIR)/, $(_SRCS))
OBJS = $(SRCS:.c=.o)

%.o: %.c
	@echo "$(INFO) Compiling $<..."
	@$(CC) $(CFLAGS) -c $(INCLUDES) $< -o $@

$(NAME): $(OBJS)
	@echo "$(INFO) Creating $(NAME)..."
	@$(AR) $(AR_FLAGS) $@ $^
	@echo "$(SUCCESS) $(NAME) created successfully!"

all: $(NAME)

clean:
	@echo "$(INFO) Removing object files..."
	@rm -f $(OBJS) $(BONUS_OBJS)
	@echo "$(SUCCESS) Objects removed."

fclean: clean
	@echo "$(INFO) Removing $(NAME)..."
	@rm -f $(NAME)
	@echo "$(SUCCESS) $(NAME) removed."

re: fclean all

.PHONY: all clean fclean re bonus test
