#include "common.h"
int
main(void)
{
	int num = 3;

	switch (num) {
	case 1:
		printf("one\n");
		break;
	case 2:
		printf("two\n");
		break;
	case 3:
		printf("three\n");
	case 4:
		printf("missing break: four\n");
		break;
	default:
		printf("default\n");
	}
	return 0;
}
