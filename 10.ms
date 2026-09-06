.NH
Chapter 10. A list that can grow
.LP
Chapter 7 had three people and a fixed array. Chapter 8 had one
person on the heap. Put those together:
.CW malloc
a small list,
.CW realloc
when it fills, keep a count and a capacity.
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
		printf("malloc failed\en");
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
			printf("realloc failed\en");
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
	printf("count %d cap %d\en", n, cap);
	free(list);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Bob, age 42
Ann, age 35
Kid, age 12
count 3 cap 4
.P2
.LP
Start at capacity 2. Bob and Ann fill it. Kid needs more room, so
we double.
.CW tmp
matters. If
.CW realloc
fails I still have
.CW list
and I
.CW free
it. Assigning
.CW realloc
straight back onto
.CW list
is how you leak the old block on failure.
.LP
The names live in the struct now, not as literals. That is the same
habit as the file chapter. One
.CW free
at the end because one
.CW malloc
(and one
.CW realloc )
owns the whole row.
.LP
This is the spine I wanted in chapter 0. A tiny record-keeper. You
can hang
.CW save
and
.CW load
from chapter 9 on this list if you want homework. I will not add
another toy program for it.
