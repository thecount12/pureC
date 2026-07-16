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
main()
{
	print("call 1 - ");
	example();
	print("call 2 - ");
	example();
	printf("Unchanged global: %d\en", global_var);
	return 0;
}
