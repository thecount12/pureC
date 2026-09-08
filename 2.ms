.NH
Variables and statements
.LP
In C, everything begins with a type. The type tells the compiler how
much memory to reserve, how the bits are stored, and which operations
are allowed. It is the closest we get to talking to the machine
without writing assembly.
.PP
.ft I
2_data_types.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	int age = 42;
	float price = 3.14159;
	char initial = 'a';
	double weight = 155.2;
	unsigned int score = 100;
	long long_num = 2114748364;
	long long big_num = 12345678901234LL;

	printf("age: %d, price: %f\en", age, price);
	printf("initial: %c, weight: %f\en", initial, weight);
	printf("score: %u\en", score);
	printf("long_num: %ld\en", long_num);
	printf("big_num: %lld\en", big_num);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
age: 42, price: 3.141590
initial: a, weight: 155.200000
score: 100
long_num: 2114748364
big_num: 12345678901234
.P2
.LP
Each variable is initialized. You can declare without an assignment:
.PP
.ft CW
int count;
.ft R
.LP
but then
.CW count
holds garbage until you store something. I used to increment
uninitialized variables and call the output "interesting." It is a bug.
Initialize it.
.LP
Multiple names of the same type can share a line:
.PP
.ft CW
int x = 1, y = 2;
.ft R
.LP
They must be declared before you use them, and the type cannot change.
.NH 2
Variable types
.LP
C is picky about types. This is the small set we actually need:
.TS
box, center, tab(|);
cb | cb | cb
l | l | l.
Type|Example|printf
_
char|char c = 'c';|%c
int|int n = 3490;|%d
unsigned int|unsigned int u = 100;|%u
float|float x = 3.14159;|%f
double|double y = 155.2;|%f
char array|char s[] = "hello";|%s
.TE
.LP
C has no real string type. A string is a character array with a
.CW '\\0'
at the end, or a pointer to those characters. We will spend a later
chapter on that. For now, a
.CW char
array is enough to hold a name.
.LP
Modifiers change size or sign:
.TS
box, center, tab(|);
cb|cb|cb
l|l|l.
Modifier|Example|Meaning
_
short|short int x;|smaller integer (often 2 bytes)
long|long int y;|larger integer (often 4 or 8 bytes)
unsigned|unsigned int z;|never negative
.TE
.NH 2
Names, enums, and preprocessor constants
.LP
Give things names a human can read. An
.CW enum
is a list of integer names. A
.CW #define
is a name the preprocessor pastes in before the compiler sees the file.
.PP
.ft I
enum.c
.ft R
.P1
#include "common.h"
#define myPI 3.14159
enum WeekDays {
	monday,
	tuesday,
	wednesday,
	thursday,
	friday
};
int
main(void)
{
	int mon = monday;
	int tue = tuesday;

	printf("PI: %.2f\en", myPI);
	printf("enum starts: %d\en", monday);
	mon += 1;
	printf("monday+1: %d\en", mon);
	tue++;
	printf("tuesday+1: %d\en", tue);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
PI: 3.14
enum starts: 0
monday+1: 1
tuesday+1: 2
.P2
.LP
I used
.CW myPI
instead of
.CW PI .
Some environments already define
.CW PI
and you get a redefinition error.
.CW enum
starts at zero unless you set the first value.
.CW #define
names are not variables. They disappear at compile time, so they do
not take memory.
.CW const int
is the other way. I rarely use it. You can.
.NH 2
Arithmetic
.LP
I stick to basic math.
.CW <math.h>
exists if you need
.CW pow
and friends. Here are the operators we will actually type:
.PP
.ft I
arithmetic.c
.ft R
.P1
#include "common.h"
int
main(void)
{
	int a = 10, b = 2;

	printf("a+b = %d\en", a + b);
	printf("a-b = %d\en", a - b);
	printf("a*b = %d\en", a * b);
	printf("a/b = %d\en", a / b);
	printf("a%%b = %d\en", a % b);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
a+b = 12
a-b = 8
a*b = 20
a/b = 5
a%b = 0
.P2
.LP
Integer division truncates.
.CW 10 / 2
is 5.
.CW 5 / 2
is 2, not 2.5. Use
.CW float
or
.CW double
if you want a fraction.
.LP
Relational and logical operators:
.TS
box, center, tab(|);
cb|cb|cb
l|l|l.
Kind|Example|Meaning
_
Relational|a == b|equal
 |a != b|not equal
 |a < b|less than
Logical|a && b|and
 |a || b|or
 |!a|not
.TE
.LP
Bitwise operators look similar but take one
.CW &
or
.CW |
instead of two. They are useful on embedded work. We will not live
in them:
.TS
box, center, tab(|);
cb|cb|cb
l|l|l.
Operator|Meaning|Example
_
&|AND|a & b
\||OR|a | b
^|XOR|a ^ b
~|NOT|~a
<<|left shift|a << 1
>>|right shift|a >> 2
.TE
.NH 2
The sizeof operator
.LP
.CW sizeof
gives the size in bytes of a type or a value. It can change with the
machine. I use it constantly.
.PP
.ft I
size.c
.ft R
.P1
#include "common.h"
int
main(void)
{
	int a = 9999;

	printf("%ld\en", (long)sizeof(a));
	printf("%ld\en", (long)sizeof(7 * 4));
	printf("%ld\en", (long)sizeof(3.14));
	printf("%ld\en", (long)sizeof(int));
	printf("%ld\en", (long)sizeof(char));
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
4
4
8
4
1
.P2
.LP
The honest conversion specifier for
.CW sizeof
is
.CW %zu
because the result is
.CW size_t .
I cast to
.CW long
and print
.CW %ld
so I am not fighting format warnings yet. These sizes are for my
machine. Yours might differ. That is the lesson.
.NH 2
People so far
.LP
Bob is no longer a magic number inside
.CW printf .
He has a name, an age, and a height, each with a type.
.PP
.ft I
people/ch2.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	char name[] = "Bob";
	int age = 42;
	float height = 5.8f;

	printf("name: %s\en", name);
	printf("age: %d\en", age);
	printf("height: %.1f\en", height);
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
.CW name
is a character array. Now you: give Ann a name, an age, and a
height. Print her too.
.LP
Next chapter we get a few people and a loop, and we skip anyone
under 21.
