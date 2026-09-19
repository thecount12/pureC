#include "common.h"

int
main(void)
{
	char *names[3];
	int ages[3];
	int i;

	names[0] = "Bob";
	names[1] = "Ann";
	names[2] = "Kid";
	ages[0] = 42;
	ages[1] = 35;
	ages[2] = 12;

	for (i = 0; i < 3; i++) {
		if (ages[i] >= 21)
			printf("%s, age %d\n", names[i], ages[i]);
	}
	return 0;
}
