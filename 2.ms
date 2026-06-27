.NH
Chapter 2. Variables and Statements
.LP
In "C", everything begins with a type. This "type" tells the compiler how much memory to reserveand how bits are stored
including which operations are allowed. It's closes way to speak to comptuers native language precicely.
.PP
.ft I
2_data_types.c
.ft R
.P1
#include "common.h"
int
main()
{
	int age = 42; // integer
	float price = 3.14159; // floating-point number
	char initial = 'a'; //single character
	double weight = 155.2; // double precision
	unsigned int score = 100; // only non negative
 	long long_num = 2114748364; // long 32-bit
 	long long big_num = 12345678901234; // long number 64-bit

	printf("age: %d, price: %f\en", age, price);
	printf("initial: %c, weight: %f\en", initial, weight);
	printf("score: %d\en", score);
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
Each variable is initialized, but you can declare without assignment like this: 
.PP
.ft CW
int count;
.ft R
.LP
You can do multiple declarations on one line separated
by a comma: 
.PP
.ft CW
int x = 1,y = 2;
.ft R
.LP
You just have to remember they must be declared before you
use them and the "type"  can't change. 
.NH
Variable Types
.LP
The "C" language is a bit picky about types and how you work with them. 
.PS
box "This is a figure"
.PE
.LP
.BI "Figure 1."
.I "The following table highlights core built-in variable types"
.PP
The following table highlights essential text processing utilities available
on the system:
.TS
box, center, tab(|);
cb | cb | cb
r | l | l.
Type|Description|Format
_
Character|char  'c'|%c
Integer|int     3490|%d
Floating point|float  3.14159|%f
string|char*  "Hello, world!"| %c
.TE
.LP
C is not great at strings as you can see. Its really just a character array or a
pointer to a bunch of characters. We also have a few modifiers
.TS
box, center, tab(|);
cb|cb|cb
r|l|l.
Modifier|Example|Meaning
_
short|short int x;|small integer(often 2 bytes)
long| long int y;|large integer (often 8 bytes)
unsigned|unsigned int z;|only non-negative values
.TE
.LP
C is often very specific and requires a strategy to utilize meaningful names for
program readability and reusability.
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
main()
{
	int mon;
	int tue = 1;
	printf("PI: %.2f\n", myPI);
	printf("enum starts: %d\en", monday);
	mon +=1;
    printf("monday: %d\en", mon);
	tue++;
	printf("tuesday: %d\en", tue);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
cpu% enum
PI: 3.14
enum starts: 0
monday: 1
tuesday: 2
.P2
.LP
I had to pick myPi instead of PI. Some systems recognize PI as 3.14159 and a redefinition
erorr would appear at compile time. But generally this is how you define a preprocessor
constant. The keyword "const   <type> <name>" is another way but I never really use those.
The "enum" keyword generally starts at zero (0). You could set "monday = 1," and 
enumeration would continue from that number. Also preprocessors don't take up memory
because its replaced during compile time. 
.NH
Arithmetic
.LP
I try to stick to basic math. But if you need to dig deeper you do have math.h which 
has features like exponentation with pow() function and other suck functions for
the full range of math. But you can be creative enough and a bunch of complex math
with functions. Here are the basics. 
.PP
.ft I
calc.c
.ft R
.P1
#include "common.h"
int
main()
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
a+b = 13
a-b = 7
a*b = 30
a/b = 3
a%b = 1
.P2
.PP
Relational and logical Operators
.TS
box, center, tab(|);
cb|cb|cb
r|l|l.
Type|Example|Meaning
_
Relational|a == b| Equal
 |a != b | Not equal
 |a < b |comparion
logical | a && b | Logical and
  | !a | Logical NOT
.TE
.LP
We also have Logical OR ( a || b). These symbols are the same for bitwise operations only
singular in usage.
.TS
box, center, tab(|);
cb|cb|cb
r|l|l.
Operator|Meaning|Example
_
&|AND| a & b
^ |XOR | a ^ b
~ |NOT |~a
<< | Left shift | a <<1
 >> | Right shift | a >>2
.TE
.LP
Finally we have OR ( a| b ) these are usefful for embeded or optimized tasks. 
.NH
The sizeof Operator
.LP
This operator get size in bytes that a variable or data type stores in memory. It
can be different on different systems. Super useful in embedded systems and I use it
it very often. 
.PP
.ft I
size.c
.ft R
.P1
#include "common.h"
int
main()
{
	int a = 9999;
	printf("%ld\en", (long)sizeof(a));
	printf("%ld\en", sizeof(7*4));
	printf("%ld\en", sizeof(3.14));
	printf("%ld\en", sizeof(int));
	printf("%ld\en", sizeof(char));
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
.PP
asdf
