#include "common.h"

void
foo(int *arr, int length)
{
	printf("Function array total: %ld\n", (long)sizeof(arr));
	printf("Function array length: %ld\n", (long)(sizeof(arr) / sizeof(int)));
	printf("passed size: %d\n", length);
}

int
main(void)
{
	int x[3];
	int length;

	x[0] = 42;
	x[1] = 43;
	x[2] = 44;
	printf("array total: %ld\n", (long)sizeof(x));
	printf("array length: %ld\n", (long)(sizeof(x) / sizeof(int)));
	length = (int)(sizeof(x) / sizeof(int));
	foo(x, length);
	return 0;
}
