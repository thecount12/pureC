.NH
Flow Control
.NH 2
if, else, switch
.LP
Deciding the right path is handled by data conditions such as "if", "else", and 
"switch" statements. 
.PP
.ft I
temp.c
.ft R
.P1
#include "common.h"
int
main()
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
.PP
It\'s warm.
.br
\l'\n(.lu'
.br
.LP
I don't really use booleans logic because it didn't orignally have it. It comes with 
C99 standard and uses "stdboo.h" but I didn't add that to common.h and I won't. We
might create a typedef for it later. But here is a single if statementwith no else
.PP
.ft I
soloIf.c
.ft R
.P1
#include "common.h"
int
main()
{
	if(1) printf("let's go!\en");
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
let's go!
.br
\l'\n(.lu'
.br
.NH 2
The 'while' statement
.PP
The "while" condition is convenient many cases. The "do-while" I have arely used because
I spend a great deal of time validating before running a condition. But never the
less it could be useful if you always need something to execute at least once.
.PP
.ft I
whileDo.c
.ft R
.P1
#include "common.h"
int
main()
{
	int i = 40;
	while(i < 42) {
		printf("While: i is %d\n", i);
		i++;
	}
	do {
		printf("do-while: i is %d\n", i);
	} while(i <40);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
While: i is 40
.PP
While: i is 41
.PP
do-while: i is 42
.br
\l'\n(.lu'
.br
.LP
I primarily use while statements if I'm dealing with unknown values or source. Excellent
for streaming data.
.NH 2
The 'for' Loop
.LP
The "for" loop repeats a block of code during a fixed number of times. 
.PP
.ft I
forLoop.c
.ft R
.P1
#include "common.h"
int
main()
{
	for (int i=1; i<5;i++) {
		printf("i is: %d\n", i);
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
i is: 1
.PP
i is: 2
.PP
i is: 3
.PP
i is: 4
.br
\l'\n(.lu'
.br
.PP
asdf
