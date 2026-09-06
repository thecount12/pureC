#include "common.h"
int global_var = 42;

void
example(void)
{
	int local_var = 10;
	static int persist = 0;

	printf("global: %d, local: %d, static: %d\n",
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
	printf("Unchanged global: %d\n", global_var);
	return 0;
}
