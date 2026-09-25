#include "common.h"

int
main(void)
{
	char *names[3];
	int ages[3];
	int i;

	names[0] = "Merlin";
	names[1] = "Morgana";
	names[2] = "Nimue";
	ages[0] = 1502;
	ages[1] = 35;
	ages[2] = 20;

	for (i = 0; i < 3; i++) {
		if (ages[i] >= 21)
			printf("%s, age %d\n", names[i], ages[i]);
	}
	return 0;
}
