#include "common.h"
void foo(int *arr, int length)
{
	print("Function array total: %d\n", sizeof(arr));  // decay 
	print("Functiaon array length: %d\n", sizeof(arr) / sizeof(int));
	print("passed size: %d\n", length);
}
int
main()
{
	int x[3] = {42,43,44};
	print("array total: %d\n", sizeof(x));
	print("array length: %d\n", sizeof(x) / sizeof(int));
	int length = sizeof(x) / sizeof(int);
	foo(x, length);
	return 0;
}
