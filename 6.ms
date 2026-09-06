.NH
Chapter 6. Arrays and strings
.LP
An array is a row of the same type. You pick a slot with
.CW [0] ,
.CW [1] ,
.CW [2] .
C will not stop you if you walk off the end. I used to print past
the last slot and call the garbage "interesting." It is undefined.
Pass the length. Stay inside it.
.PP
.ft I
raw_array.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	int num[3];
	int i;

	num[0] = 42;
	num[1] = 43;
	num[2] = 44;
	for (i = 0; i < 3; i++)
		printf("%d\en", num[i]);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
42
43
44
.P2
.NH 2
Decay
.LP
.CW sizeof
on an array in
.CW main
is the whole row. Pass that array into a function and it becomes a
pointer. The compiler told me so.
.P1
ch5/length_array.c:7:60: warning: 'sizeof (arr)' will
return the size of the pointer, not the array itself
.P2
.LP
Warnings are the teacher. Here is the file that earned it.
.PP
.ft I
length_array.c
.ft R
.P1
#include "common.h"

void
foo(int *arr, int length)
{
	printf("Function array total: %ld\en", (long)sizeof(arr));
	printf("Function array length: %ld\en", (long)(sizeof(arr) / sizeof(int)));
	printf("passed size: %d\en", length);
}

int
main(void)
{
	int x[3];
	int length;

	x[0] = 42;
	x[1] = 43;
	x[2] = 44;
	printf("array total: %ld\en", (long)sizeof(x));
	printf("array length: %ld\en", (long)(sizeof(x) / sizeof(int)));
	length = (int)(sizeof(x) / sizeof(int));
	foo(x, length);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
array total: 12
array length: 3
Function array total: 8
Function array length: 2
passed size: 3
.P2
.LP
Twelve bytes in
.CW main .
Eight bytes in
.CW foo
because that is a pointer on this machine.
.CW sizeof(arr) / sizeof(int)
then lies and says 2. The only honest length is the one I passed.
.PP
.ft I
out_array.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	int a[3];
	int i;

	a[0] = 42;
	a[1] = 43;
	a[2] = 44;
	for (i = 0; i < 3; i++)
		printf("%d\en", a[i]);
	printf("length is 3. I will not print past it.\en");
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
42
43
44
length is 3. I will not print past it.
.P2
.NH 2
Passing arrays
.LP
Three spellings, one decay. I pass the length with all of them.
.PP
.ft I
pass_array.c
.ft R
.P1
#include "common.h"

void
test1(int *a, int len)
{
	int i;

	for (i = 0; i < len; i++)
		printf("%d\en", a[i] * 2);
}

void
test2(int a[], int len)
{
	int i;

	for (i = 0; i < len; i++)
		printf("%d\en", a[i] * 2);
}

void
test3(int a[5], int len)
{
	int i;

	for (i = 0; i < len; i++)
		printf("%d\en", a[i] * 2);
}

int
main(void)
{
	int x[5];

	x[0] = 1;
	x[1] = 2;
	x[2] = 3;
	x[3] = 4;
	x[4] = 5;
	test1(x, 4);
	printf("---\en");
	test2(x, 4);
	printf("---\en");
	test3(x, 4);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
2
4
6
8
---
2
4
6
8
---
2
4
6
8
.P2
.LP
.CW test3
says
.CW a[5]
and then I pass 4. The 5 is decoration. The pointer does not know.
.CW change_array.c
is the same idea: the function writes through the pointer, so
.CW main
sees the new values.
.PP
.ft I
Output:
.ft R
.P1
2
4
6
8
.P2
.NH 2
Two dimensions
.LP
A grid is an array of arrays. I do not live here. One extra index is
enough to show the syntax.
.PP
.ft I
multi.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	int a[2][5];
	int row, col;

	a[0][0] = 0;
	a[0][1] = 1;
	a[0][2] = 2;
	a[0][3] = 3;
	a[0][4] = 4;
	a[1][0] = 5;
	a[1][1] = 6;
	a[1][2] = 7;
	a[1][3] = 8;
	a[1][4] = 9;
	for (row = 0; row < 2; row++) {
		for (col = 0; col < 5; col++)
			printf("(%d,%d) = %d\en", row, col, a[row][col]);
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
(0,0) = 0
(0,1) = 1
(0,2) = 2
(0,3) = 3
(0,4) = 4
(1,0) = 5
(1,1) = 6
(1,2) = 7
(1,3) = 8
(1,4) = 9
.P2
.NH 2
Strings
.LP
C has no string type. A string is a
.CW char
array with a
.CW '\\0'
at the end. You walk it with a pointer or with
.CW [ ] .
Same bytes.
.PP
.ft I
string_primer.c
.ft R
.P1
#include "common.h"

int
strsize(char *str)
{
	int count;

	count = 0;
	while (str[count] != 0)
		count++;
	return count;
}

void
change(char *s)
{
	s[0] = 'm';
}

int
main(void)
{
	char string[] = "My First String";
	char *ptr;

	ptr = string;
	printf("String: %s\en", string);
	printf("Length: %d\en", strsize(string));
	printf("First char %c\en", string[0]);
	printf("First point chr: %c\en", ptr[0]);
	printf("Address: %p\en", (void *)&ptr[0]);
	change(string);
	printf("change: %c%c\en", string[0], string[1]);
	printf("Same Address: %p\en", (void *)&ptr[0]);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
String: My First String
Length: 15
First char M
First point chr: M
Address: 0x16dc252f0
change: my
Same Address: 0x16dc252f0
.P2
.LP
I wrote
.CW strsize
so you can see the walk.
.CW strlen
in
.CW <string.h>
does the same job. I already included that header in
.CW common.h .
The functions I actually type:
.TS
box, center, tab(|);
cb | cb | cb
r | l | l.
Function|Description|Example
_
strlen(s)|length, not counting 0|strlen("Hello") == 5
strcpy(dst,src)|copy, including 0|strcpy(name, "Bob")
strcat(dst,src)|append|strcat(full, last)
strcmp(a,b)|compare|strcmp("a","b")
.TE
.LP
Three ways to hurt yourself:
.P1
char word[5] = {'H','e','l','l','o'};  /* no '\\0' */
char dest[5];
strcpy(dest, "too long");             /* overflow */
char *s = "Hello";
s[0] = 'Y';                           /* literal. crash */
.P2
.LP
The last one looks like
.CW change
above. It is not.
.CW string[]
is a writable array.
.CW "Hello"
as a pointer is a literal. Leave it alone.
.NH 2
People so far
.LP
Chapter 3 already had two arrays in lockstep. Now we pass the length
and we copy a name into a small buffer.
.PP
.ft I
people/ch6.c
.ft R
.P1
#include "common.h"

void
print_people(char *names[], int ages[], int n)
{
	int i;

	for (i = 0; i < n; i++)
		printf("%s, age %d\en", names[i], ages[i]);
}

int
main(void)
{
	char *names[3];
	int ages[3];
	char copy[8];
	int n;

	names[0] = "Bob";
	names[1] = "Ann";
	names[2] = "Kid";
	ages[0] = 42;
	ages[1] = 35;
	ages[2] = 12;
	n = 3;
	print_people(names, ages, n);
	strcpy(copy, names[0]);
	printf("copied: %s\en", copy);
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
copied: Bob
.P2
.LP
.CW copy[8]
is enough for
.CW "Bob"
and the
.CW '\\0' .
It is not enough for a long name. Next chapter those two arrays
become one type.
