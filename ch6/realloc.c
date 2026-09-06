#include "common.h"

int
main(void)
{
	int *ptr;
	int *temp;
	int i;

	ptr = malloc(2 * sizeof(int));
	if (ptr == NULL) {
		printf("allocation failed\n");
		return 1;
	}
	ptr[0] = 10;
	ptr[1] = 20;
	temp = realloc(ptr, 4 * sizeof(int));
	if (temp == NULL) {
		printf("realloc failed\n");
		free(ptr);
		return 1;
	}
	ptr = temp;
	ptr[2] = 30;
	ptr[3] = 40;
	printf("items: ");
	for (i = 0; i < 4; i++)
		printf("%d ", ptr[i]);
	printf("\n");
	free(ptr);
	return 0;
}
