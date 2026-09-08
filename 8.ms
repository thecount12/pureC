.NH
Memory
.LP
The stack dies when the function returns. The heap does not. You
ask for bytes with
.CW malloc ,
you give them back with
.CW free .
Forget
.CW free
and the program leaks. Free twice and it can crash. Pair them.
.TS
box, center, tab(|);
cb | cb
r | l.
Function|Purpose
_
malloc(size)|bytes, uninitialized
calloc(n,size)|n elements, zeroed
realloc(ptr,size)|grow or shrink a block
free(ptr)|give the bytes back
.TE
.NH 2
People on the heap
.LP
Same
.CW Person
as chapter 7. One of him, from
.CW malloc .
.PP
.ft I
people/ch8.c
.ft R
.P1
#include "common.h"

struct Person {
	char *name;
	int age;
	float height;
};

void
print_person(struct Person *p)
{
	printf("name: %s\en", p->name);
	printf("age: %d\en", p->age);
	printf("height: %.1f\en", p->height);
}

int
main(void)
{
	struct Person *p;

	p = malloc(sizeof(struct Person));
	if (p == NULL) {
		printf("malloc failed\en");
		return 1;
	}
	p->name = "Bob";
	p->age = 42;
	p->height = 5.8f;
	print_person(p);
	free(p);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
name: Bob
age: 42
height: 5.8
.P2
.LP
I check
.CW malloc
the same way I check a pointer for
.CW NULL .
The name is still a string literal. We copied a name into a buffer
in chapter 6. We will do that again when we write a file. For now
the heap owns the struct, not the letters. Now you:
.CW malloc
a second
.CW Person .
Print both. Free both.
.NH 2
Arguments into the heap
.LP
Each argument gets its own block. I free it before the next one.
.PP
.ft I
arg_malloc.c
.ft R
.P1
#include "common.h"

void
usage(void)
{
	printf("Usage: arg_malloc 1 2 3\en");
}

int
main(int argc, char *argv[])
{
	int i, len;
	char *buffer;

	printf("args: %d, argv: %s\en", argc, argv[0]);
	if (argc <= 1) {
		usage();
		return 1;
	}
	for (i = 1; i < argc; i++) {
		len = strlen(argv[i]) + 1;
		buffer = malloc(len);
		if (buffer == NULL) {
			printf("Error: Memory allocation failed!\en");
			return 1;
		}
		strcpy(buffer, argv[i]);
		printf("id [%d] address %p: item: %s, length: %d\en",
			i, (void *)buffer, buffer, len);
		free(buffer);
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
$ ./arg_malloc 1 2 three
args: 4, argv: ./arg_malloc
id [1] address 0x1009357a0: item: 1, length: 2
id [2] address 0x1009357a0: item: 2, length: 2
id [3] address 0x1009357a0: item: three, length: 6
.P2
.LP
The addresses matched on this run because I freed before the next
.CW malloc
and the allocator handed the same bytes back. Do not count on that.
.CW calloc
is
.CW malloc
that also writes zeros:
.P1
int *arr = calloc(n, sizeof(int));
.P2
.NH 2
realloc
.LP
.CW realloc
keeps the old values and gives you a bigger (or smaller) block.
If it fails, the old pointer is still yours. That is why I use a
temp.
.PP
.ft I
realloc.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	int *ptr;
	int *temp;
	int i;

	ptr = malloc(2 * sizeof(int));
	if (ptr == NULL) {
		printf("allocation failed\en");
		return 1;
	}
	ptr[0] = 10;
	ptr[1] = 20;
	temp = realloc(ptr, 4 * sizeof(int));
	if (temp == NULL) {
		printf("realloc failed\en");
		free(ptr);
		return 1;
	}
	ptr = temp;
	ptr[2] = 30;
	ptr[3] = 40;
	printf("items: ");
	for (i = 0; i < 4; i++)
		printf("%d ", ptr[i]);
	printf("\en");
	free(ptr);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
items: 10 20 30 40
.P2
.LP
Chapter 10 uses this on a list of people. Next we write one
.CW Person
to a file and read it back.
