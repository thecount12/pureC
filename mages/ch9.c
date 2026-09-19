#include "common.h"

struct Mage {
	char name[32];
	int age;
	float height;
};

void
print_mage(struct Mage *p)
{
	printf("%s, age %d, height %.1f\n", p->name, p->age, p->height);
}

int
save(char *path, struct Mage *p, int n)
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
load(char *path, struct Mage *p, int cap, int *n)
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
	struct Mage mages[3];
	struct Mage loaded[3];
	int n;
	int i;

	strcpy(mages[0].name, "Bob");
	mages[0].age = 42;
	mages[0].height = 5.8f;
	strcpy(mages[1].name, "Ann");
	mages[1].age = 35;
	mages[1].height = 5.5f;
	n = 2;
	if (save("mages.txt", mages, n) != 0) {
		printf("save failed\n");
		return 1;
	}
	n = 0;
	if (load("mages.txt", loaded, 3, &n) != 0) {
		printf("load failed\n");
		return 1;
	}
	for (i = 0; i < n; i++)
		print_mage(&loaded[i]);
	return 0;
}
