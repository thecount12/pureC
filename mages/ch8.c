#include "common.h"

struct Mage {
	char *name;
	int age;
	float height;
};

void
print_mage(struct Mage *p)
{
	printf("name: %s\n", p->name);
	printf("age: %d\n", p->age);
	printf("height: %.1f\n", p->height);
}

int
main(void)
{
	struct Mage *p;

	p = malloc(sizeof(struct Mage));
	if (p == NULL) {
		printf("malloc failed\n");
		return 1;
	}
	p->name = "Bob";
	p->age = 42;
	p->height = 5.8f;
	print_mage(p);
	free(p);
	return 0;
}
