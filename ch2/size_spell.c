#include "common.h"
int
main(void)
{
	int a = 9999;

	printf("%ld\n", (long)sizeof(a));
	printf("%ld\n", (long)sizeof(7 * 4));
	printf("%ld\n", (long)sizeof(3.14));
	printf("%ld\n", (long)sizeof(int));
	printf("%ld\n", (long)sizeof(char));
	return 0;
}
