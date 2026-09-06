#include "common.h"

void
usage(void)
{
	printf("Usage: arg_malloc 1 2 3\n");
}

int
main(int argc, char *argv[])
{
	int i, len;
	char *buffer;

	printf("args: %d, argv: %s\n", argc, argv[0]);
	if (argc <= 1) {
		usage();
		return 1;
	}
	for (i = 1; i < argc; i++) {
		len = strlen(argv[i]) + 1;
		buffer = malloc(len);
		if (buffer == NULL) {
			printf("Error: Memory allocation failed!\n");
			return 1;
		}
		strcpy(buffer, argv[i]);
		printf("id [%d] address %p: item: %s, length: %d\n",
			i, (void *)buffer, buffer, len);
		free(buffer);
	}
	return 0;
}
