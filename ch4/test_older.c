#include "common.h"

int
older(int a, int b)
{
	if (a > b)
		return a;
	return b;
}

int
fail(char *msg)
{
	printf("fail: %s\n", msg);
	return 1;
}

int
main(void)
{
	if (older(42, 35) != 42)
		return fail("42 and 35");
	if (older(12, 35) != 35)
		return fail("12 and 35");
	if (older(7, 7) != 7)
		return fail("equal");
	printf("ok\n");
	return 0;
}
