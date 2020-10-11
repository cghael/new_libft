/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_error_exit.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cghael <marvin@42.fr>                      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/16 11:41:03 by cghael            #+#    #+#             */
/*   Updated: 2020/01/16 11:48:10 by cghael           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

void	ft_error_exit(char *str, t_res *buf_t)
{
	write(2, str, ft_strlen(str));
	if (buf_t && buf_t->res)
		free(buf_t->res);
	exit(1);
}
