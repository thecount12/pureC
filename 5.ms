.NH
Pointers oh no!
.LP
A pointer is a variable that stores the address of another variable.  Here is an example below:
.P1
int value = 42;
int *ptr = &value; // pointer to int that stores
                   //the address of the value
.P2
.PP
Let's look at an example.
.PP
.ft I
pointer.c
.ft R
.P1
#include "common.h"
int
main()
{
	int num = 42;
	int *p = &num; //pointer stores address of number

	printf("Value of num: %d\en", num);
	printf("Address num: %p\ne", &num);
	printf("Pointer addr: %p\en", p);	
	printf("value of pointer: %d\en", *p);
	*p = 52; //modify value via the pointer
	printf("New value: %d\en", num);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
Value of num: 42
.PP
Address num: 7fffffffeedc
.PP
Pointer addr: 7fffffffeedc
.PP
value of pointer: 42
.PP
New value: 52
.br
\l'\n(.lu'
.br
.PP
Pointer and Dereference
.TS
box, center, tab(|);
cb | cb
r | l.
Syntax|Meaning
_
Int *p;|Pointer to integer
char *c;|Pointer to character 
float *f|Pointer to float
p = &x|Assign address of variable x to pointer p
*p|Dereferences value stored at address held by p
.TE
.NH 2
NULL Pointer
.LP
Most of the time this is used incorrectly. You use it when you know you plan assign something to in. But
you have to make a habit to test before using.
.P1
int my_var = 0;
int *p = NULL; // or nil depending on OS
if (p == NULL) {
	printf("Pointer not initialized.\en");
	// this would crash
	// *p = 42;
} else {
	int *p = &my_var; // valid memory
	*p = 42;  // dereference
}
.P2
.NH 2
Pointer to Pointer
.LP
You also have pointers that can store the address of other pointers.
.P1
int x = 42
int *p = &x;
int **OP = &p;
printf("x = %d\en", **OP);
.P2
.PP
You usually find this in multi-dimensional arrays and function pointers.
.NH 2
Arrays
.PP
.ft I
raw_array.c
.ft R
.P1
main()
{
	int num[3];
	num[0] = 42;
	num[1] = 43;
	num[2] = 44;
	for (int i = 0; i<3; i++) {
		printf("%d\en", num[i]);
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
42
.PP
43
.PP
44
.br
\l'\n(.lu'
.br
.PP
Getting the length of an arry could be possible to a certain extent. You can iterate to get the size but 
that could take time. Integers are genrally 4 bytes and characters are 1. But in a function you have decay. 
The sizeof apointer in a function is 4 or 8 bytes. It's a better practice to pass in the length if possible.
.PP
.ft I
length_array.c
.ft R
.P1
#include "common.h"
void foo(int *arr, int length)
{
	printf("Function array total: %d\en", sizeof(arr));  // decay 
	printf("Functiaon array length: %d\en", sizeof(arr) / sizeof(int));
	printf("passed size: %d\en", length);
}
int
main()
{
	int x[3] = {42,43,44};
	printf("array total: %d\en", sizeof(x));
	printf("array length: %d\en", sizeof(x) / sizeof(int));
	int length = sizeof(x) / sizeof(int);
	foo(x, length);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
array total: 12
.PP
array length: 3
.PP
Function array total: 8
.PP
Functiaon array length: 2
.PP
passed size: 3
.br
\l'\n(.lu'
.br
.PP
We also show an example of using a pointer with an array used in a funciton. C doesn't have any guard rails.
So if you don't know the lenght of an array you could go out of bounds and it still works!
.PP
.ft I
out_array.c
.ft R
.P1
#include "common.h"
int
main()
{
	int a[3] = {42,43,44};
	for (int i = 0; i<10; i++) {
		printf("%d\en", a[i]);
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
42
.PP
43
.PP
44
.PP
2097342
.PP
0
.PP
0
.PP
0
.PP
-4192
.PP
32767
.PP
0
.br
\l'\n(.lu'
.br
.PP
.NH 2
Multidimensional Arrays
.LP
You can add as many dimensions as you want but time crunch complexit increased exponentially. 
.PP
.ft I
multi.c
.ft R
.P1
#include "common.h"
int
main()
{
	int a[2][5] = {
		{0,1,2,3,4},
		{5,6,7,8,9}
	};
	for (int row = 0; row < 2; row++) {
		for (int col = 0; col<5; col++) {
			printf("(%d,%d) = %d\en", row, col, a[row][col]);
		}
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
(0,0) = 0
.PP
(0,1) = 1
.PP
(0,2) = 2
.PP
(0,3) = 3
.PP
(0,4) = 4
.PP
(1,0) = 5
.PP
(1,1) = 6
.PP
(1,2) = 7
.PP
(1,3) = 8
.PP
(1,4) = 9
.br
\l'\n(.lu'
.br
.LP
Three examples of passing arrays into functions. All of the methods listed are identical.
.PP
.ft I
pass_array.c
.ft R
.P1
#include "common.h"
void 
test1(int *a, int len)
{
	for (int i = 0; i < len; i++) {
		printf("%d\en", a[i] *2);
	}
}
void
test2(int a[], int len)
{
	for (int i = 0; i < len; i++) {
		printf("%d\en", a[i] * 2);
	}
}
void
test3(int a[5], int len)
{
	for (int i = 0; i < len; i++) {
		printf("%d\en", a[i] * 2);
	}
}
int
main()
{
	int x[5] = {1, 2, 3, 4};
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
.PP
2
.PP
4
.PP
6
.PP
8
.br
\l'\n(.lu'
.br
.LP
We have three different examples producing the same result. Now let's look an array using a function with
a pointer.
.PP
.ft I
change_array.c
.ft R
.P1
#include "common.h"
void
change_array(int *a,int len)
{
	for (int i = 0; i<len; i++) {
		a[i] *= 2;
	}
}
int
main()
{
	int x[4] = {1,2,3,4};
	change_array(x,4);
	for (int i=0; i<4; i++) {
		printf("%d\en", x[i]);
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
2
.PP
4
.PP
6
.PP
8
.br
\l'\n(.lu'
.br
.NH 2
Strings
.LP
Yea "C" doesn't do strings. It's just an array of characters delimited with null or nil character '\0'.
You can control or manipulate with pointers.
.PP
.ft I
string_primer.c
.ft R
.P1
#include "common.h"
int
strsize(char *str)
{
	int count = 0;
	while(str[count] != 0) {
		count++;
	}
	return count;
}
void
change(char *s)
{
	s[0] = 'm';
}
int
main()
{
	char string[] = "My First String";
	char *ptr = string;
	printf("String: %s\en", string);
	printf("Length: %d\en", strsize(string));
	printf("First char %c\en", string[0]);
	printf("First point chr: %c\en", ptr[0]);
	printf("Address: %p\en", &ptr[0]);
	change(string);
	printf("change: %c%c\en", string[0], string[1]);
	printf("Same Address: %p\en", &ptr[0]);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
String: My First String
.PP
Length: 15
.PP
First char M
.PP
First point chr: M
.PP
Address: 7fffffffeed0
.PP
change: my
.PP
Same Address: 7fffffffeed0
.br
\l'\n(.lu'
.br
.LP
Great example of string conversion with pointer and array manipulation. We also created our own string 
counter by scratch. You could use the built in library "string.h" which contains strlen(). But it's 
honestly not much additional code. 
PP
<string.h> functions
.TS
box, center, tab(|);
cb | cb | cb
r | l | l.
Function|Description|Example
_
strlen(s);|string length| strlen("Hello") == 5
strcpy(dst,src)|Copy string|strcpy(name, "Will") 
strcat(dst,src)|Concat string|strcat(full, last)
strcmp(a,b)|Compare strings|strcmp("a","b")
strstr(s,sub)|Find substring|strstr(text, "find")
.TE
.LP
The only left is to be aware of the common pitfalls:
.P1
1. Forgetting '\0':
   char word[5] = {'H','e','l','l','o'}; // missing null terminator \0
2.Buffer overflows:
  char dest[5];
  strcpy(dest, "string too long"); //
3 Change string literal:
  char *s = "Hello";
  s[0] = 'Y'; // undefined or crash
.P2
.LP
Strings are a huge foundation in C because of text processing, file handling, memory management, 
null termination and buffer size.


 