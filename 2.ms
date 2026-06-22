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
asdf
