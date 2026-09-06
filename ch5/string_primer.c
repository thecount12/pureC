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
	printf("String: %s\n", string);
	printf("Length: %d\n", strsize(string));
	printf("First char %c\n", string[0]);
	printf("First point chr: %c\n", ptr[0]);
	printf("Address: %p\n", (void *)&ptr[0]);
	change(string);
	printf("change: %c%c\n", string[0], string[1]);
	printf("Same Address: %p\n", (void *)&ptr[0]);
	return 0;
}
