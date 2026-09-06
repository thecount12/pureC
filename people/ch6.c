#include "common.h"

void
print_people(char *names[], int ages[], int n)
{
	int i;

	for (i = 0; i < n; i++)
		printf("%s, age %d\n", names[i], ages[i]);
}

int
main(void)
{
	char *names[3];
	int ages[3];
	char copy[8];
	int n;

	names[0] = "Bob";
	names[1] = "Ann";
	names[2] = "Kid";
	ages[0] = 42;
	ages[1] = 35;
	ages[2] = 12;
	n = 3;
	print_people(names, ages, n);
	strcpy(copy, names[0]);
	printf("copied: %s\n", copy);
	return 0;
}
