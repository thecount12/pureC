#include "common.h"
int
main()
{
	int i = 40;
	while(i < 42) {
		printf("While: i is %d\n", i);
		i++;
	}
	do {
		printf("do-while: i is %d\n", i);
	} while(i <40);
	return 0;
}
