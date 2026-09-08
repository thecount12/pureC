.NH
A list that can grow
.LP
Chapter 7 had three people and a fixed array. Chapter 8 had one
person on the heap. Chapter 9 wrote two of them to a file. Put
those together:
.CW malloc
a small list,
.CW load
what you have,
.CW realloc
when it fills,
.CW save
it back. That is the record-keeper I wanted in the intro. Not a
new program. The same
.CW people ,
finished.
.LP
The path can come from
.CW argv
again, the way it did in chapter 4. No argument means
.CW people.txt .
.PP
.ft I
people/ch10.c
.ft R
.P1
#include "common.h"

struct Person {
	char name[32];
	int age;
	float height;
};

void
print_person(struct Person *p)
{
	printf("%s, age %d\en", p->name, p->age);
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
		fprintf(fp, "%s %d %.1f\en", p[i].name, p[i].age, p[i].height);
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
		printf("malloc failed\en");
		return 1;
	}
	if (load(path, list, cap, &n) != 0) {
		printf("no file yet: %s\en", path);
		n = 0;
	}
	if (add_person(&list, &n, &cap, "Kid", 12, 4.2f) != 0) {
		printf("realloc failed\en");
		free(list);
		return 1;
	}
	for (i = 0; i < n; i++)
		print_person(&list[i]);
	printf("count %d cap %d\en", n, cap);
	if (save(path, list, n) != 0) {
		printf("save failed\en");
		free(list);
		return 1;
	}
	free(list);
	return 0;
}
.P2
.LP
.CW add_person
takes
.CW struct Person **
so
.CW realloc
can change the pointer
.CW main
holds.
.CW tmp
still matters. If
.CW realloc
fails I still have the old
.CW list
and I
.CW free
it. This list is one block; an arena is that idea with a cursor.
.LP
A missing file is not a crash. I say so, start empty, add Kid,
save. That is the failure I actually ran:
.P1
$ ./ch10 missing.txt
no file yet: missing.txt
Kid, age 12
count 1 cap 2
.P2
.LP
After chapter 9,
.CW people.txt
already has Bob and Ann. Capacity is 2. Those two fill it. Kid
needs more room, so we double.
.P1
$ ./ch9
Bob, age 42, height 5.8
Ann, age 35, height 5.5
$ ./ch10 people.txt
Bob, age 42
Ann, age 35
Kid, age 12
count 3 cap 4
.P2
.LP
The file after that run:
.P1
Bob 42 5.8
Ann 35 5.5
Kid 12 4.2
.P2
.LP
Run it twice and you get two Kids. I know. It is a first
record-keeper, not a database.
.LP
Now you: pass a path that is not
.CW people.txt .
Or stop adding Kid and only load and print.
.LP
Unions and fake OOP are a side road. The program we kept is this
list.
