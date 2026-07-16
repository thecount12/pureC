#include "common.h"
int
main()
{
	int num[3];
	num[0] = 42;
	num[1] = 43;
	num[2] = 44;
	for (int i = 0; i<3; i++) {
		printf("%d\n", num[i]);
	}
	return 0;
}
