#include "common.h"

int
main(void)
{
	char name[] = "Bob";
	int age = 42;
	float height = 5.8f;

	printf("name: %s\n", name);
	printf("age: %d\n", age);
	printf("height: %.1f\n", height);
	return 0;
}
