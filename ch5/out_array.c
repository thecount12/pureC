#include "common.h"

int
main(void)
{
	int a[3];
	int i;

	a[0] = 42;
	a[1] = 43;
	a[2] = 44;
	for (i = 0; i < 3; i++)
		printf("%d\n", a[i]);
	printf("length is 3. I will not print past it.\n");
	return 0;
}
