.NH
Memory Allocation
.NH 2
Malloc
.LP
So far we have been dealing with satic arrays or fixed size array. But programs grow and shrink at runtime.
We will look at four dynamic memory allocation functions. 
.PP
Pointer and Dereference
.TS
box, center, tab(|);
cb | cb
r | l.
Function|Purpose
_
Maloc(size)|Allocates block of memory
calloc(n,size)|Allocates and clears memory for n elements
realloc(ptr,size)|Changes size of previously allocated block
free(ptr)|Release memory back
.TE
.PP
In the next example we will dynamically allocate memory on each iteration and free it at the very end.
.PP
.ft I
arg_malloc.c
.ft R
.P1
#include "common.h"
void
usage(void)
{
	print("Usage: foo 1 2 3\n");
}
int
main(int argc, char *argv[])
{
	int len;
	char *buffer;
	printf("args: %d, argv: %s\en", argc, argv[0]);
	if ( argc <= 1) {
		usage();
		exits(0);
	}
	for (int i = 1; i<argc; i++) {
		len = strlen(argv[i]) + 1;
		buffer = malloc(len); // dynamic allocation
		if (buffer == nil) {
			printf("Error: Memory allocation failed!\en");
			exits("malloc");
		}
		strcpy(buffer, argv[i]);
		printf("id [%d] address %p: item: %s, length: %d\en", 
		i, buffer, buffer, len);
		free(buffer); // don't forget to free it
	}
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
cpu% arg_malloc 1 2 three
.PP
args: 4, argv: foo
.PP
id [1] address 401820: item: 1, length: 2
.PP
id [2] address 401820: item: 2, length: 2
.PP
id [3] address 401820: item: three, length: 6
.br
\l'\n(.lu'
.br
.LP
The malloc function leaves memory uniitialized and calloc clears it to zero or all elements start at zero. 
See example below:
.P1
int *arr = calloc(n, sizeof(int)); 
.P2
.LP
Here is an example of resize allocation block using realloc. 
.P1
#include "common.h"
int
main()
{
	int *ptr = malloc(2 * sizeof(int));
	if (ptr == nil) {
		print("allocation failed\n");
		return 1;
	}
	ptr[0] = 10; ptr[1] = 20;
	int *temp = realloc(ptr, 4 * sizeof(int));
	if (temp == nil) {
		print("realloc failed\n");
		free(ptr); // free original before exit
	}
	ptr = temp; // realoc succeedded
	ptr[2] = 30; ptr[3] = 40;
	print("items: ");
	for (int i = 0; i< 4; i++) {
		print("%d ", ptr[i]);
	}
	print("\n");
	free(ptr); // free memory
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.br
\l'\n(.lu'
.br
.LP
This is the backbone of all system programming. Each allocation reserves stack on the heap and stays
allocated until explicitly freed. 


