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
	struct Person *p;

	p = malloc(sizeof(struct Person));
	if (p == NULL) {
		printf("malloc failed\n");
		return 1;
	}
	p->name = "Bob";
	p->age = 42;
	p->height = 5.8f;
	print_person(p);
	free(p);
	return 0;
}
