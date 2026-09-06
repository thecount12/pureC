#include "common.h"

struct Person {
	char name[32];
	int age;
	float height;
};

void
print_person(struct Person *p)
{
	printf("%s, age %d, height %.1f\n", p->name, p->age, p->height);
}

int
save(char *path, struct Person *p, int n)
{
	FILE *fp;
	int i;

	fp = fopen(path, "w");
	if (fp == NULL)
		return 1;
	for (i = 0; i < n; i++)
		fprintf(fp, "%s %d %.1f\n", p[i].name, p[i].age, p[i].height);
	fclose(fp);
	return 0;
}

int
load(char *path, struct Person *p, int cap, int *n)
{
	FILE *fp;
	int i;

	fp = fopen(path, "r");
	if (fp == NULL)
		return 1;
	i = 0;
	while (i < cap &&
	    fscanf(fp, "%31s %d %f", p[i].name, &p[i].age, &p[i].height) == 3)
		i++;
	fclose(fp);
	*n = i;
	return 0;
}

int
main(void)
{
	struct Person people[3];
	struct Person loaded[3];
	int n;
	int i;

	strcpy(people[0].name, "Bob");
	people[0].age = 42;
	people[0].height = 5.8f;
	strcpy(people[1].name, "Ann");
	people[1].age = 35;
	people[1].height = 5.5f;
	n = 2;
	if (save("people.txt", people, n) != 0) {
		printf("save failed\n");
		return 1;
	}
	n = 0;
	if (load("people.txt", loaded, 3, &n) != 0) {
		printf("load failed\n");
		return 1;
	}
	for (i = 0; i < n; i++)
		print_person(&loaded[i]);
	return 0;
}
