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
add_person(struct Person **list, int *n, int *cap,
	char *name, int age, float height)
{
	struct Person *tmp;

	if (*n == *cap) {
		tmp = realloc(*list, (*cap * 2) * sizeof(struct Person));
		if (tmp == NULL)
			return 1;
		*list = tmp;
		*cap = *cap * 2;
	}
	strcpy((*list)[*n].name, name);
	(*list)[*n].age = age;
	(*list)[*n].height = height;
	(*n)++;
	return 0;
}

int
main(int argc, char *argv[])
{
	struct Person *list;
	char *path;
	int cap;
	int n;
	int i;

	path = "people.txt";
	if (argc > 1)
		path = argv[1];
	cap = 2;
	n = 0;
	list = malloc(cap * sizeof(struct Person));
	if (list == NULL) {
		printf("malloc failed\n");
		return 1;
	}
	if (load(path, list, cap, &n) != 0) {
		printf("no file yet: %s\n", path);
		n = 0;
	}
	if (add_person(&list, &n, &cap, "Kid", 12, 4.2f) != 0) {
		printf("realloc failed\n");
		free(list);
		return 1;
	}
	for (i = 0; i < n; i++)
		print_person(&list[i]);
	printf("count %d cap %d\n", n, cap);
	if (save(path, list, n) != 0) {
		printf("save failed\n");
		free(list);
		return 1;
	}
	free(list);
	return 0;
}
