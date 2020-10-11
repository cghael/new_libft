# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cghael <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/09/05 18:58:06 by cghael            #+#    #+#              #
#    Updated: 2019/10/06 14:23:39 by cghael           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = gcc
FLAGS = -Wall -Wextra -Werror -c
INCLUDES = -I$(HEADERS_DIRECTORY)

HEADERS_LIST = libft.h
HEADERS_DIRECTORY = ./inc/
HEADERS = $(addprefix $(HEADERS_DIRECTORY), $(HEADERS_LIST))

SOURCES_LIST = \
	ft_atoi.c\
	ft_bzero.c\
	ft_isalnum.c\
	ft_isalpha.c\
	ft_isascii.c\
	ft_isdigit.c\
	ft_isprint.c\
	ft_itoa.c\
	ft_memalloc.c\
	ft_memccpy.c\
	ft_memchr.c\
	ft_memcmp.c\
	ft_memcpy.c\
	ft_memdel.c\
	ft_memmove.c\
	ft_memset.c\
	ft_putchar.c\
	ft_putchar_fd.c\
	ft_putendl.c\
	ft_putendl_fd.c\
	ft_putnbr.c\
	ft_putnbr_fd.c\
	ft_putstr.c\
	ft_putstr_fd.c\
	ft_strcat.c\
	ft_strchr.c\
	ft_strclr.c\
	ft_strcmp.c\
	ft_strcpy.c\
	ft_strdel.c\
	ft_strdup.c\
	ft_strequ.c\
	ft_striter.c\
	ft_striteri.c\
	ft_strjoin.c\
	ft_strlcat.c\
	ft_strlen.c\
	ft_strmap.c\
	ft_strmapi.c\
	ft_strncat.c\
	ft_strncmp.c\
	ft_strncpy.c\
	ft_strnequ.c\
	ft_strnew.c\
	ft_strnstr.c\
	ft_strrchr.c\
	ft_strsepcut.c\
	ft_strsplit.c\
	ft_strstr.c\
	ft_strsub.c\
	ft_strtrim.c\
	ft_tolower.c\
	ft_toupper.c\
	ft_lstnew.c\
	ft_lstdelone.c\
	ft_lstdel.c\
	ft_lstadd.c\
	ft_lstiter.c\
	ft_lstmap.c\
	ft_lstaddend.c\
	ft_list_size.c\
	ft_list_clear.c\
	ft_word_count.c\
	ft_free_tdarr.c\
	ft_node_del.c\
	ft_get_next_line.c \
	ft_free_two_dem_str.c \
	ft_str_is_int.c \
			ft_abs.c \
			ft_add_specials.c \
			ft_buff_finded_percent.c \
			ft_buff_free.c \
			ft_buff_no_percent.c \
			ft_buff_print_free.c \
			ft_buff_print_n_len.c \
			ft_buff_treated_percent.c \
			ft_bzero_buf_n_set_pointers.c \
			ft_choose_func.c \
			ft_dollar_arg.c \
			ft_dollar_treat.c \
			ft_error_exit.c \
			ft_final_print_n_free_rt_len.c \
			ft_find_digit.c \
			ft_find_in_def.c \
			ft_isbigger.c \
			ft_i64toa_base.c \
			ft_num_to_str.c \
			ft_parse_flags.c \
			ft_parse_spec.c \
			ft_parsing.c \
			ft_percent_treat.c \
			ft_precision_treat.c \
			ft_printf.c \
			ft_strcpy_dptp.c \
			ft_strpcpy.c \
			ft_width_treat.c \
			ft_u64toa_base.c \
			ft_c.c \
			ft_di.c \
			ft_o.c \
			ft_p.c \
			ft_s.c \
			ft_u.c \
			ft_x.c \
			ft_b.c \
			ft_f.c \
			ft_count_float.c \
			ft_get_integer.c \
			ft_get_divisional.c \
			ft_round_float.c \
			ft_exeption_treat.c \
			ft_integer_to_str.c \
			ft_add_dig_to_int.c \
			ft_width_n_precision.c \
			ft_add_float_to_str.c \
			ft_put_div_by_one.c

SOURCES_DIRECTORY = ./src/
SOURCES = $(addprefix $(SOURCES_DIRECTORY), $(SOURCES_LIST))

OBJECTS_DIRECTORY = objects/
OBJECTS_LIST = $(patsubst %.c, %.o, $(SOURCES_LIST))
OBJECTS	= $(addprefix $(OBJECTS_DIRECTORY), $(OBJECTS_LIST))

# COLORS
GREEN = \033[0;32m
RED = \033[0;31m
RESET = \033[0m

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJECTS_DIRECTORY) $(OBJECTS)
	@ar rc $(NAME) $(OBJECTS)
	@ranlib $(NAME)
	@echo "\n$(NAME): $(GREEN)object files were created$(RESET)"
	@echo "$(NAME): $(GREEN)$(NAME) was created$(RESET)"

$(OBJECTS_DIRECTORY):
	@mkdir -p $(OBJECTS_DIRECTORY)
	@echo "$(NAME): $(GREEN)$(OBJECTS_DIRECTORY) was created$(RESET)"

$(OBJECTS_DIRECTORY)%.o: $(SOURCES_DIRECTORY)%.c $(HEADERS)
	@$(CC) $(FLAGS) $(INCLUDES) $< -o $@
	@echo "$(GREEN).$(RESET)\c"

clean:
	@rm -rf $(OBJECTS_DIRECTORY)
	@echo "$(NAME): $(RED)$(OBJECTS_DIRECTORY) was deleted$(RESET)"
	@echo "$(NAME): $(RED)object files were deleted$(RESET)"

fclean: clean
	@rm -f $(NAME)
	@echo "$(NAME): $(RED)$(NAME) was deleted$(RESET)"

re:
	@$(MAKE) fclean
	@$(MAKE) all