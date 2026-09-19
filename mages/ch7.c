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
	struct Mage mages[3];
	int i;
	int n;

	mages[0].name = "Bob";
	mages[0].age = 42;
	mages[0].height = 5.8f;
	mages[1].name = "Ann";
	mages[1].age = 35;
	mages[1].height = 5.5f;
	mages[2].name = "Kid";
	mages[2].age = 12;
	mages[2].height = 4.2f;
	n = 3;
	for (i = 0; i < n; i++)
		print_mage(&mages[i]);
	return 0;
}
