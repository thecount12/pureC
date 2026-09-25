#include "common.h"
int
main()
{
	int temp = 82;
	if (temp > 90) {
		printf("It's hot!\n");
	} else if (temp >= 80) {
		printf("It's warm.\n");
	} else {
		printf("it's cool\n");
	}
	return 0;
}
