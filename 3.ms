.NH
Chapter 3. Flow Control
.NH 2
if, else, switch
.LP
Deciding which path to take is
.CW if ,
.CW else ,
and
.CW switch .
.PP
.ft I
temp.c
.ft R
.P1
#include "common.h"
int
main(void)
{
	int temp = 82;

	if (temp > 90) {
		printf("It's hot!\en");
	} else if (temp >= 80) {
		printf("It's warm.\en");
	} else {
		printf("it's cool\en");
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
It's warm.
.P2
.LP
I do not use a boolean type. C did not have one at the start. C99
added
.CW <stdbool.h> .
I did not put it in
.CW common.h
and I will not. Zero is false. Anything else is true. That is enough.
A lone
.CW if
with no
.CW else :
.PP
.ft I
soloIf.c
.ft R
.P1
#include "common.h"
int
main(void)
{
	if (1)
		printf("let's go!\en");
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
let's go!
.P2
.NH 2
The while statement
.LP
.CW while
is what I reach for when I do not know how many times I will loop.
Streaming data, reading a file, waiting on input.
.CW do-while
runs the body once before it tests. I rarely want that, but it exists.
.PP
.ft I
whileDo.c
.ft R
.P1
#include "common.h"
int
main(void)
{
	int i = 40;

	while (i < 42) {
		printf("While: i is %d\en", i);
		i++;
	}
	do {
		printf("do-while: i is %d\en", i);
	} while (i < 40);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
While: i is 40
While: i is 41
do-while: i is 42
.P2
.NH 2
The for loop
.LP
.CW for
is a
.CW while
with the counter written in one place. Use it when you know the
bounds.
.PP
.ft I
forLoop.c
.ft R
.P1
#include "common.h"
int
main(void)
{
	int i;

	for (i = 1; i < 5; i++) {
		printf("i is: %d\en", i);
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
i is: 1
i is: 2
i is: 3
i is: 4
.P2
.LP
I declare
.CW i
before the loop. C99 lets you write
.CW for (int i = 1; i < 5; i++) .
I avoid that so the same file still compiles on Plan 9 after I swap
the header.
.CW break
leaves a loop.
.CW continue
skips the rest of this iteration. We will see
.CW break
in
.CW switch
next.
.NH 2
The switch statement
.LP
I rarely used
.CW switch
in other languages. In C it is cleaner than a tall
.CW if-else
chain, and it will punish you if you forget
.CW break .
.PP
.ft I
switch.c
.ft R
.P1
#include "common.h"
int
main(void)
{
	int num = 3;

	switch (num) {
	case 1:
		printf("one\en");
		break;
	case 2:
		printf("two\en");
		break;
	case 3:
		printf("three\en");
	case 4:
		printf("missing break: four\en");
		break;
	default:
		printf("default\en");
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
three
missing break: four
.P2
.LP
Case 3 has no
.CW break ,
so it falls into case 4. That is not a mystery. It is the language.
I used to write
.CW case '4'
(a character) while
.CW num
was an integer 3. That compiles and it is still the wrong case label.
Match the types.
.NH 2
People so far
.LP
Three names, three ages. Print the adults.
.PP
.ft I
people/ch3.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	char *names[3];
	int ages[3];
	int i;

	names[0] = "Bob";
	names[1] = "Ann";
	names[2] = "Kid";
	ages[0] = 42;
	ages[1] = 35;
	ages[2] = 12;

	for (i = 0; i < 3; i++) {
		if (ages[i] >= 21)
			printf("%s, age %d\en", names[i], ages[i]);
	}
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
.P2
.LP
Two arrays in lockstep is a smell. They should be one type. That is
a struct, and we have not earned it yet. Next chapter we wrap the
printing in a function and look at
.CW argc
and
.CW argv .
