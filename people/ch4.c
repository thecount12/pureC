#include "common.h"

void
print_person(char *name, int age)
{
	printf("%s, age %d\n", name, age);
}

int
older(int a, int b)
{
	if (a > b)
		return a;
	return b;
}

int
main(int argc, char *argv[])
{
	if (argc > 1)
		print_person(argv[1], 42);
	else
		print_person("Bob", 42);
	printf("older of 42 and 35: %d\n", older(42, 35));
	return 0;
}
