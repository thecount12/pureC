.NH
Functions
.LP
Functions take arguments and return values. They make the code
testable, but C wants a prototype (or the full definition) before you
call the function. We have been living in
.CW main .
Time to add friends.
.PP
.ft I
add.c
.ft R
.P1
#include "common.h"
int add(int a, int b);

int
main(void)
{
	int res;

	res = add(3, 4);
	printf("Result: %d\en", res);
	return 0;
}

int
add(int a, int b)
{
	return a + b;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Result: 7
.P2
.LP
The line
int add(int a, int b);
is the prototype. It is a promise. The real
.CW add
can sit below
.CW main .
If the promise and the body disagree, the compiler should complain.
Listen to it.
.NH 2
Scope
.LP
Scope is where a name can be seen.
.LP
Block scope: names inside braces die at the closing brace.
.P1
void
block(void)
{
	int x = 42;
	printf("num: %d\en", x);
}
.P2
.LP
File scope: a name outside every function is global from that point
down the file. I use globals sparingly. They make functions harder
to test.
.P1
int counter = 0;
void
count(void)
{
	counter++;
}
.P2
.LP
A parameter is a local name for this call only:
.P1
void
greet(char *name)
{
	printf("Hello %s!\en", name);
}
.P2
.LP
An inner name can hide an outer one. That is shadowing. It is legal
and it is how you confuse yourself:
.P1
int x = 5;
{
	int x = 10;
	printf("%d\en", x);  /* 10 */
}
printf("%d\en", x);      /* 5 */
.P2
.NH 2
Lifetime
.LP
.CW static
inside a function means the variable lives for the whole program, but
the name is still local. That is different from a global.
.PP
.ft I
lifetime.c
.ft R
.P1
#include "common.h"
int global_var = 42;

void
example(void)
{
	int local_var = 10;
	static int persist = 0;

	printf("global: %d, local: %d, static: %d\en",
		global_var, local_var, persist);
	persist++;
}

int
main(void)
{
	printf("call 1 - ");
	example();
	printf("call 2 - ");
	example();
	printf("Unchanged global: %d\en", global_var);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
call 1 - global: 42, local: 10, static: 0
call 2 - global: 42, local: 10, static: 1
Unchanged global: 42
.P2
.LP
.CW local_var
is born and dies on every call.
.CW persist
keeps its value.
.CW global_var
was never in danger.
.NH 2
Return values
.LP
So far we have returned
.CW int
or
.CW void .
You can return
.CW char ,
.CW double ,
a pointer, a struct. Returning a pointer to a dead local is a classic
way to lose a weekend. We will get there with
.CW malloc .
.NH 2
A small calculator
.LP
.CW main
always has
.CW argc
and
.CW argv
available, even if you write
.CW main(void)
and ignore them.
.CW argc
is the count.
.CW argv[0]
is usually the program name.
.CW argv[1]
is the first argument you typed.
.PP
.ft I
calc.c
.ft R
.P1
#include "common.h"

void
usage(void)
{
	printf("Usage:\en");
	printf("calc 2 + 2\en");
	printf("calc 2 '*' 2\en");
	printf("calc 2 - 3\en");
}

int
main(int argc, char *argv[])
{
	int num1, num2;
	char op;

	if (argc != 4) {
		usage();
		return 1;
	}
	num1 = atoi(argv[1]);
	op = argv[2][0];
	num2 = atoi(argv[3]);
	switch (op) {
	case '+':
		printf("calc: %d\en", num1 + num2);
		break;
	case '*':
		printf("calc: %d\en", num1 * num2);
		break;
	case '-':
		printf("calc: %d\en", num1 - num2);
		break;
	default:
		printf("unknown operator\en");
		return 1;
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
$ ./calc 3 + 4
calc: 7
$ ./calc 4 '*' 3
calc: 12
$ ./calc 3 - 4
calc: -1
.P2
.LP
The shell eats
.CW * ,
so you quote it.
.CW atoi
turns ASCII into an
.CW int .
If you pass garbage, you get 0. That is a weak parser. It is enough
to show
.CW argc
and
.CW argv .
If the count is wrong, we print usage and
return 1 .
The old draft kept running and then read
.CW argv[3]
anyway. That is how you crash a first program.
.NH 2
People so far
.LP
Printing a person is now a function. Comparing ages is another.
You can pass a name on the command line.
.PP
.ft I
people/ch4.c
.ft R
.P1
#include "common.h"

void
print_person(char *name, int age)
{
	printf("%s, age %d\en", name, age);
}

int
older(int a, int b)
{
	if (a > b)
		return a;
	return b;
}

int
main(int argc, char *argv[])
{
	if (argc > 1)
		print_person(argv[1], 42);
	else
		print_person("Bob", 42);
	printf("older of 42 and 35: %d\en", older(42, 35));
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
$ ./ch4
Bob, age 42
older of 42 and 35: 42
$ ./ch4 Ann
Ann, age 42
older of 42 and 35: 42
.P2
.LP
No arguments is a path, not a crash. Now you: pass two names.
Print both. Or make
.CW older
take three ages.
.NH 2
A small test
.LP
.CW older
is small enough to check without staring at
.CW printf .
I copied it into a second file and asked three questions. If any
answer is wrong, the program says so and returns 1. If they are
all right, it prints
.CW ok
and returns 0. That is a unit test. No framework. A function, a
few
.CW if
s, an exit status.
.PP
.ft I
test_older.c
.ft R
.P1
#include "common.h"

int
older(int a, int b)
{
	if (a > b)
		return a;
	return b;
}

int
fail(char *msg)
{
	printf("fail: %s\en", msg);
	return 1;
}

int
main(void)
{
	if (older(42, 35) != 42)
		return fail("42 and 35");
	if (older(12, 35) != 35)
		return fail("12 and 35");
	if (older(7, 7) != 7)
		return fail("equal");
	printf("ok\en");
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
ok
.P2
.LP
I ran
.CW gcc -Wall -Wextra -o test_older ch4/test_older.c
and then
.CW ./test_older .
The equal case is the one I used to forget.
.CW make test
builds this and runs it. Later you can do the same to
.CW add_person
or
.CW load .
I will not add a test runner. One file is enough to see the habit.
I wrote
.CW fail
so you can see the return; the library name is
.CW assert
in
.CW <assert.h> .
.LP
Next we need addresses.
.CW print_person
already takes a
.CW char * .
That star is the whole next chapter.
