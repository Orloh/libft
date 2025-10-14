/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libft.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: orhernan <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/09/29 12:29:42 by orhernan          #+#    #+#             */
/*   Updated: 2025/10/14 09:48:26 by orhernan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBFT_H
# define LIBFT_H

# include <unistd.h>
# include <stdlib.h>

void		ft_bzero(void *ptr, size_t n);
int		ft_isalnum(int c);
int		ft_isalpha(int c);
int		ft_isascii(int c);
int		ft_isdigit(int c);
int		ft_isprint(int c);
void		*ft_memcpy(void *dest, const void *src, size_t n);
void		*ft_memmove(void *dest, const void *src, size_t n);
void		*ft_memset(void *p, int c, size_t n);
const char	*ft_strchr(cons char *s, int c);
size_t		ft_strlcat(char *dest, const char *src, size_t dstsize);
size_t		ft_strlcpy(char *dest, const char *src, size_t dstsize);
size_t		ft_strlen(char *s);
int		ft_tolower(int c);
int		ft_toupper(int c);

#endif
