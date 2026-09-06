#include "common.h"

void
print_person(char *name, int *age)
{
	printf("%s, age %d\n", name, *age);
}

void
have_birthday(int *age)
{
	*age = *age + 1;
}

int
main(void)
{
	char *name;
	int age;
	int *p;

	name = "Bob";
	age = 42;
	p = &age;
	print_person(name, p);
	have_birthday(p);
	print_person(name, &age);
	return 0;
}
