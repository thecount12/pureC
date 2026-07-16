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
	print("args: %d, argv: %s\n", argc, argv[0]);
	if ( argc <= 1) {
		usage();
		exits(0);
	}
	for (int i = 1; i<argc; i++) {
		len = strlen(argv[i]) + 1;
		buffer = malloc(len); // dynamic allocation
		if (buffer == nil) {
			print("Error: Memory allocation failed!\n");
			exits("malloc");
		}
		strcpy(buffer, argv[i]);
		print("id [%d] address %p: item: %s, length: %d\n", i, buffer, buffer, len);
		free(buffer); // don't forget to free it
	}
	return 0;
}
