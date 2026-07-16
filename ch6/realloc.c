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
