/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strlcat.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: orhernan <ohercelli@gmail.com>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/13 23:08:17 by orhernan          #+#    #+#             */
/*   Updated: 2025/10/13 23:39:38 by orhernan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

size_t	ft_strlcat(char *dest, const char *src, size_t dstsize)
{
	size_t	srclen;
	size_t	dstlen;
	
	srclen = ft_strlen(src);
	dstlen = ft_strlen(dest);
	if (dstlen >= dstsize)
		dstlen = dstsize;
	if (dstlen == dstsize)	
		return (dstlen + srclen);
	if (srclen < dstsize - dstlen)
		ft_memcpy(dst + dstlen, src, srclen + 1);
	else
	{
		ft_memcpy(dst + dstlen, src, dstsize - dstlen -1);
		dest[dstsize - 1] = '\0';
	}
	return (dstlen + srclen)
}
