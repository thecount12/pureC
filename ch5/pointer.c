#include "common.h"
int
main()
{
	int num = 42;
	int *p = &num; //pointer stores address of number

	printf("Value of num: %d\n", num);
	printf("Address num: %p\n", &num);
	printf("Pointer addr: %p\n", p);	
	printf("value of pointer: %d\n", *p);
	*p = 52; //modify value via the pointer
	print("New value: %d\n", num);
	return 0;
}
