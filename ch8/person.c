#include "common.h"
struct Person {
	char *name;
	int age;
	float height;
};
int
main()
{
	struct Person p1 = {"Bob", 42, 5.8};
	print("Name: %s\n", p1.name);
	print("Age: %d\n", p1.age);
	print("Height: %.2f\n", p1.height);
	struct Person *ptr = &p1;
	print("Pointer example: %s, age %d\n", ptr->name, ptr->age);
	return 0;
}
