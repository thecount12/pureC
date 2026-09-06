#include "common.h"

struct Person {
	char *name;
	int age;
	float height;
};

void
print_person(struct Person *p)
{
	printf("name: %s\n", p->name);
	printf("age: %d\n", p->age);
	printf("height: %.1f\n", p->height);
}

int
main(void)
{
	struct Person people[3];
	int i;
	int n;

	people[0].name = "Bob";
	people[0].age = 42;
	people[0].height = 5.8f;
	people[1].name = "Ann";
	people[1].age = 35;
	people[1].height = 5.5f;
	people[2].name = "Kid";
	people[2].age = 12;
	people[2].height = 4.2f;
	n = 3;
	for (i = 0; i < n; i++)
		print_person(&people[i]);
	return 0;
}
