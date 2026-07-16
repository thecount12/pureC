#include "common.h"
int
add(int a, int b);
int
main()
{
	int res = add(3,4);
	printf("Result: %d\n", res);
	return 0;
}
int
add(int a, int b)
{
	return a+b;
}
