#include "common.h"
int
main()
{
	int a = 9999;
	printf("%ld\n", (long)sizeof(a));
	printf("%ld\n", sizeof(7*4));
	printf("%ld\n", sizeof(3.14));
	printf("%ld\n", sizeof(int));
	printf("%ld\n", sizeof(char));
	return 0;
}
