/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstnew.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: orhernan <ohercelli@gmail.com>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/20 23:55:59 by orhernan          #+#    #+#             */
/*   Updated: 2025/10/21 00:07:58 by orhernan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstnew(void *content)
{
	t_list	*el;
	
	el = malloc(sizeof(t_list));
	if (!el)
		return (NULL);
	el->content = content;
	el->next = NULL;
	return (el);
}
