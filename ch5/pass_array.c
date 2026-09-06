#include "common.h"

void
test1(int *a, int len)
{
	int i;

	for (i = 0; i < len; i++)
		printf("%d\n", a[i] * 2);
}

void
test2(int a[], int len)
{
	int i;

	for (i = 0; i < len; i++)
		printf("%d\n", a[i] * 2);
}

void
test3(int a[5], int len)
{
	int i;

	for (i = 0; i < len; i++)
		printf("%d\n", a[i] * 2);
}

int
main(void)
{
	int x[5];

	x[0] = 1;
	x[1] = 2;
	x[2] = 3;
	x[3] = 4;
	x[4] = 5;
	test1(x, 4);
	printf("---\n");
	test2(x, 4);
	printf("---\n");
	test3(x, 4);
	return 0;
}
