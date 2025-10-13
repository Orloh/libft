/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   bzero.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: orhernan <ohercelli@gmail.com>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/03 23:23:40 by orhernan          #+#    #+#             */
/*   Updated: 2025/10/03 23:32:02 by orhernan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_bzero(void *ptr, size_t n)
{
	unsigned char	*p;
	
	if (ptr == NULL)
		return;
	p = (unsigned char *)ptr;
	while (n > 0)
	{
		*p = 0;
		p++;
		n--;
	}
}
