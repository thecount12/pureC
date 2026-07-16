.NH
Functions
.LP
Functions accept a variety of agruments and return values. Functions make the code
organized,testable and esy to understand but you also must pre-define everything.
We have already been using the main function now lets add more functions.
.PP
.ft I
add.c
.ft R
.P1
#include "common.h"
int
add(int a, int b); // declare prototype
int
main()
{
	int res = add(3,4);
	printf("Result: %d\en", res);
	return 0;
}
int
add(int a, int b)
{
	return a+b;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
Result: 7
.br
\l'\n(.lu'
.br
.PP
.NH 2
Scopes
.LP
A "Scope" defines where a variable can be seem or used in your program. Here
is an example of "Block scope". The variables defined inside this block are 
only accessible within the block.
.P1
void block(void) {
	int x = 42;
	printf("num: %d\n", x):
}
.P2
.LP
A "File Scope" Declares a global outside of all functions that you can access every
after the file declaration.
.P1
int counter = 0;
void count(void) {
	counter++;
}
.P2
.LP
A "Function paramater scope" behaves like local variables visible only within a function.
.P1
void greet(char *name) {
	printf("Hello %s!\n", name);
}
.P2
A "Block shadowing" are inner variables that temporarily hide outer ones.
.P1
int x = 5;
{
	int x = 10;         // shadows outer
	printf("%d\en", x); // prints 10
}
printf("%d\n", x);      //prints 5
.P2
.NH 2
Life time scope
.LP 
This example fully illustrates persistence during the lifetime of the call.
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
	print("global: %d, local: %d, static: %d\en", 
	global_var, local_var, persist);
	persist++;
}
int
main()
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
.PP
call 1 - global: 42, local: 10, static: 0
.PP
call 2 - global: 42, local: 10, static: 1
.PP
Unchanged global: 42
.br
\l'\n(.lu'
.br
.PP
The "static" keyword allowes the variable declared in this scope to persist.
.NH 2
Return values and Signatures
.LP
So far we have only been returning "int" or "void" in the previous example.  We
can return other values such as "char" , "double" etc.
.NH 2
Small Calculator
.PP
Let's but a few things together and create a simple calculator, but in an unconventional manner. While
not in common practice the "main" function always has runtime features available to you regardless if
you pass any command line options or not. The "argc" argument counts args and "argv[]" vector holds
a pointer to the string containing the executable and additional arguments at the prompt. 
.P1
#include "common.h"
void
usage(void)
{
		printf("\enUsage: \en");
		printf("calc: 2 + 2\en");
		printf("calc: 2 '*' 2\en"); // shell * means match everything
		printf("calc: 2 - 3\en");
}
int
main(int argc, char *argv[])
{
	if (argc <= 2) {
		usage();
	}
	int num1 = atoi(argv[1]);
	int num2 = atoi(argv[3]);
	char op = argv[2][0];
	switch(op) {
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
			printf("default\en");
	}
	return 0;
}
.P2
.ft I
Output:
.ft R
.PP
foo 3 + 4
.PP
7
.PP
foo 4 '*' 3
.PP
12
.PP
foo 3 - 4
.PP
-1
.br
\l'\n(.lu'
.br
.PP
Other examples of calculators use functions like "scanf", "getchar", and "putchar" which are more reliable
then arguments on the command line. However I'm not always on a posix system so I might not exactly
have those functions available to me. I also introduced "atoi" which is ascii to to integer conversion. 
We needed to convert the character to an integer to be able to perform the calculation. 
