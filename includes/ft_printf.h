/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cauvray <cauvray@student.42lehavre.fr>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/10/18 13:20:13 by cauvray           #+#    #+#             */
/*   Updated: 2024/11/02 21:37:55 by cauvray          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdio.h>
# include <stdarg.h>

# ifndef DEBUG
#  define DEBUG 0
# endif

typedef struct s_printf_params
{
	char	c;
	int		minus;
	int		zero;
	int		nb_before_dot;
	int		dot;
	int		nb_after_dot;
	int		hashtag;
	int		space;
	int		plus;
}	t_printf_params;

/**
 * @brief Outputs a formatted string to stdout.
 *
 * This function sends a formatted output to the standard output (stdout), 
 * using a format string str that can contain various format specifiers.
 * It can take a variable number of arguments, which are formatted 
 * according to the provided format string.
 *
 * @param str The format string that specifies how subsequent arguments 
 * are converted for output.
 * @param ... The variable number of arguments to format and output 
 * according to the format string.
 * @return The total number of characters printed (excluding the null byte 
 * used to end output to strings), or a negative number if an error occurs.
 *
 * @note Supported format specifiers include:
 * - %c: character
 * - %s: string
 * - %d: signed integer
 * - %u: unsigned integer
 * - %x: hexadecimal (lowercase)
 * - %X: hexadecimal (uppercase)
 * - %p: pointer
 * - %%%: prints a literal percent sign
 *
 * @warning If an unsupported format specifier is encountered,
 * behavior is undefined.
 */
int				ft_printf(const char *str, ...);

int				ft_printf(const char *str, ...);
size_t			ft_printf_s(t_printf_params *printf_params, char *str);
size_t			ft_printf_x(t_printf_params *params, unsigned int n, int upper);
size_t			ft_printf_c(t_printf_params *params, char c);
size_t			ft_printf_id(t_printf_params *params, int n);
size_t			ft_printf_u(t_printf_params *params, unsigned int n);
size_t			ft_printf_p(t_printf_params *params, void *ptr);

int				ft_is_parsed_char(char c);
int				ft_is_print_flag(char c);
int				ft_isnum_no0(char c);
char			*ft_get_printf_params_str(const char *str);
t_printf_params	*ft_get_printf_params(char *str);

char			*ft_int_to_hex(unsigned long long n, int upper);
char			*ft_ptr_to_hex(unsigned long long n);
size_t			ft_unbrlen(unsigned int n);
char			*ft_uitoa(unsigned int n);
int				ft_putnstr0(char *str, long long *len, int remove_len);

int				ft_putchar(char c);
int				ft_putstr(char *str);
int				ft_putnbr(int n);
int				ft_putstr_case(char *str, int upper);

#endif