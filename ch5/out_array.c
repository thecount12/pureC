#include "common.h"
int
main()
{
	int a[3] = {42,43,44};
	for (int i = 0; i<10; i++) {
		print("%d\n", a[i]);
	}
	return 0;
}
