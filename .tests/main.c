/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: orhernan <ohercelli@gmail.com>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/10/24 12:10:53 by orhernan          #+#    #+#             */
/*   Updated: 2025/10/24 13:06:01 by orhernan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdio.h>

void *str_duplicate(void *content)
{
	char *str = (char *)content;
	char *new_str = ft_strdup(str);
	return (new_str);
}

void del_content(void *content)
{
    free(content);
}

void print_list(t_list *lst)
{
    while (lst)
    {
        printf("%s -> ", (char *)lst->content);
        lst = lst->next;
    }
    printf("NULL\n");
}

int main(void)
{
	t_list *list = NULL;
	t_list *node1 = ft_lstnew(ft_strdup("A"));
	t_list *node2 = ft_lstnew(ft_strdup("B"));
	t_list *node3 = ft_lstnew(ft_strdup("C"));
	t_list *node4 = ft_lstnew(ft_strdup("D"));

	if (!node1 || !node2 || !node3 || !node4)
	{
		printf("Memory allocation failed\n");
		return (1);
	}

	ft_lstadd_back(&list, node1);
	ft_lstadd_back(&list, node2);
	ft_lstadd_back(&list, node3);
	ft_lstadd_back(&list, node4);

	printf("Original list: ");
	print_list(list);

	t_list *new_list = ft_lstmap(list, str_duplicate, del_content);

	printf("Mapped list: ");
	print_list(list);

	ft_lstclear(&list, del_content);
	ft_lstclear(&new_list, del_content);

	return (0);
}
