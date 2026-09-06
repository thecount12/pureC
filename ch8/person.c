#include "common.h"

struct Person {
	char *name;
	int age;
	float height;
};

int
main(void)
{
	struct Person p1;
	struct Person *ptr;

	p1.name = "Bob";
	p1.age = 42;
	p1.height = 5.8f;
	printf("Name: %s\n", p1.name);
	printf("Age: %d\n", p1.age);
	printf("Height: %.2f\n", p1.height);
	ptr = &p1;
	printf("Pointer example: %s, age %d\n", ptr->name, ptr->age);
	return 0;
}
