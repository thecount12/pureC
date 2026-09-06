#include "common.h"
int
main(void)
{
	int num = 42;
	int *p = &num;

	printf("Value of num: %d\n", num);
	printf("Address num: %p\n", (void *)&num);
	printf("Pointer addr: %p\n", (void *)p);
	printf("value of pointer: %d\n", *p);
	*p = 52;
	printf("New value: %d\n", num);
	return 0;
}
