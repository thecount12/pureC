#include "common.h"
void 
test1(int *a, int len)
{
	for (int i = 0; i < len; i++) {
		print("%d\n", a[i] *2);
	}
}
void
test2(int a[], int len)
{
	for (int i = 0; i < len; i++) {
		print("%d\n", a[i] * 2);
	}
}
void
test3(int a[5], int len)
{
	for (int i = 0; i < len; i++) {
		print("%d\n", a[i] * 2);
	}
}
int
main()
{
	int x[5] = {1, 2, 3, 4, 5};
	test1(x, 4);
	print("---\n");
	test2(x, 4);
	print("---\n");
	test3(x, 4);
	return 0;
}
