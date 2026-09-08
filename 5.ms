.NH
Pointers
.LP
A pointer is a variable that stores the address of another variable.
That is the whole idea. Arrays and strings can wait one chapter.
.P1
int value = 42;
int *ptr = &value;
.P2
.LP
.CW &value
is the address.
.CW ptr
holds it.
.CW *ptr
is the int sitting there. Write through
.CW *ptr
and
.CW value
changes. Same memory, two names.
.PP
.ft I
pointer.c
.ft R
.P1
#include "common.h"
int
main(void)
{
	int num = 42;
	int *p = &num;

	printf("Value of num: %d\en", num);
	printf("Address num: %p\en", (void *)&num);
	printf("Pointer addr: %p\en", (void *)p);
	printf("value of pointer: %d\en", *p);
	*p = 52;
	printf("New value: %d\en", num);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Value of num: 42
Address num: 0x16f1c1308
Pointer addr: 0x16f1c1308
value of pointer: 42
New value: 52
.P2
.LP
Your addresses will differ. Mine did the next time I ran it. The
lesson is that both prints of the address are the same, and that
.CW *p = 52
changed
.CW num .
.LP
.TS
box, center, tab(|);
cb | cb
r | l.
Syntax|Meaning
_
int *p;|pointer to int
char *c;|pointer to char
p = &x|store the address of x
*p|the value at that address
.TE
.NH 2
NULL
.LP
.CW NULL
means "this pointer does not point at anything yet." On Plan 9 the
same idea is
.CW nil .
That swap is chapter 12. Until then, write
.CW NULL
and test before you touch it.
.P1
int age = 42;
int *p;

p = NULL;
if (p == NULL)
	printf("no person yet\en");
p = &age;
if (p != NULL)
	printf("age %d\en", *p);
.P2
.LP
I used to skip the test and then wonder why the program died.
.CW *p
on a
.CW NULL
pointer is not a warning. It is a crash. Make the habit now. We will
need it for
.CW malloc
and
.CW fopen .
.NH 2
People so far
.LP
.CW print_person
already took a
.CW char *
for the name. That star was a pointer and I did not make a fuss.
Now the age is a pointer too, so a function can change it.
.PP
.ft I
people/ch5.c
.ft R
.P1
#include "common.h"

void
print_person(char *name, int *age)
{
	printf("%s, age %d\en", name, *age);
}

void
have_birthday(int *age)
{
	*age = *age + 1;
}

int
main(void)
{
	char *name;
	int age;
	int *p;

	name = "Bob";
	age = 42;
	p = &age;
	print_person(name, p);
	have_birthday(p);
	print_person(name, &age);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Bob, age 42
Bob, age 43
.P2
.LP
.CW p
and
.CW &age
are the same address.
.CW have_birthday
does not return a new int. It writes through the pointer. Bob is
still not a type. Now you: call
.CW have_birthday
twice. Or pass height as a
.CW float *
and change that too.
.LP
Next chapter we put a few of him in arrays and pass the length.
