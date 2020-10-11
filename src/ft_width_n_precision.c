/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_width_n_precision.c                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ksemele <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/07 20:47:53 by ksemele           #+#    #+#             */
/*   Updated: 2020/02/07 20:47:54 by ksemele          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static char	*ft_precision(char *p, t_ftptf *tmp_t, t_arg *ap_t)
{
	if (*p == '*' && tmp_t->dollar[0] == 0)
	{
		tmp_t->precision = va_arg(ap_t->n_arg, int);
		p++;
	}
	else if (*p == '*' && tmp_t->dollar[0])
	{
		tmp_t->precision = tmp_t->dollar[2];
		p = ft_strchr(p, '$');
		p++;
	}
	else if (ft_isdigit(*p))
		tmp_t->precision = ft_atoi((const char *)p);
	return (p);
}

static char	*ft_width(char *p, t_ftptf *tmp_t, t_arg *ap_t)
{
	if (*p == '*' && tmp_t->dollar[0] == 0)
	{
		tmp_t->width = va_arg(ap_t->n_arg, int);
		p++;
	}
	else if (*p == '*' && tmp_t->dollar[0])
	{
		tmp_t->width = tmp_t->dollar[1];
		p = ft_strchr(p, '$');
		p++;
	}
	else if (ft_isdigit(*p))
		tmp_t->width = ft_atoi((const char*)p);
	return (p);
}

/*
** DESCRIPTION
** ft_width_n_precision() treating char line and save
*/

char		*ft_width_n_precision(char *p, t_ftptf *tmp_t, t_arg *ap_t)
{
	p = ft_width(p, tmp_t, ap_t);
	while (ft_isdigit(*p))
		p++;
	if (*p == '.')
	{
		tmp_t->dot = 1;
		p++;
	}
	p = ft_precision(p, tmp_t, ap_t);
	while (ft_isdigit(*p))
		p++;
	return (p);
}
