#include "common.h"

void
change_array(int *a, int len)
{
	int i;

	for (i = 0; i < len; i++)
		a[i] *= 2;
}

int
main(void)
{
	int x[4];
	int i;

	x[0] = 1;
	x[1] = 2;
	x[2] = 3;
	x[3] = 4;
	change_array(x, 4);
	for (i = 0; i < 4; i++)
		printf("%d\n", x[i]);
	return 0;
}
