#include "conv_x_bigx_test.h"

int		x_all_02(void)
{
	t_data	data;
	int		pfd[2];
	int		ret;
	int		save_stdout;

	ft_write_debug("t %#7.5X%0006.2x et %lX!, 0xab, 0x876, 0xff11ff11ff1");
	ft_connect_stdout(pfd, &save_stdout);
	data.r1 = ft_printf("t %#7.5X%0006.2x et %lX!", 0xab, 0x876, 0xff11ff11ff1);
	data.s1 = ft_get_stdout(pfd, &save_stdout);
	ft_connect_stdout(pfd, &save_stdout);
	data.r2 = printf("t %#7.5X%0006.2x et %lX!", 0xab, 0x876, 0xff11ff11ff1);
	data.s2 = ft_get_stdout(pfd, &save_stdout);
	ret = 0;
	if (data.r1 != data.r2)
		ret = -1;
	if (ft_strcmp(data.s1, data.s2))
		ret = -1;
	ft_write_rslt(data, ret);
	ft_strdel(&data.s1);
	ft_strdel(&data.s2);
	return (ret);
}
