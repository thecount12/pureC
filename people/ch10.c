#include "common.h"

struct Person {
	char name[32];
	int age;
	float height;
};

void
print_person(struct Person *p)
{
	printf("%s, age %d\n", p->name, p->age);
}

int
main(void)
{
	struct Person *list;
	struct Person *tmp;
	int cap;
	int n;
	int i;

	cap = 2;
	n = 0;
	list = malloc(cap * sizeof(struct Person));
	if (list == NULL) {
		printf("malloc failed\n");
		return 1;
	}
	strcpy(list[n].name, "Bob");
	list[n].age = 42;
	list[n].height = 5.8f;
	n++;
	strcpy(list[n].name, "Ann");
	list[n].age = 35;
	list[n].height = 5.5f;
	n++;
	if (n == cap) {
		tmp = realloc(list, (cap * 2) * sizeof(struct Person));
		if (tmp == NULL) {
			printf("realloc failed\n");
			free(list);
			return 1;
		}
		list = tmp;
		cap = cap * 2;
	}
	strcpy(list[n].name, "Kid");
	list[n].age = 12;
	list[n].height = 4.2f;
	n++;
	for (i = 0; i < n; i++)
		print_person(&list[i]);
	printf("count %d cap %d\n", n, cap);
	free(list);
	return 0;
}
