#include "common.h"

void
usage(void)
{
	printf("write_file: file_name\n");
}

int
main(int argc, char *argv[])
{
	FILE *fp;

	if (argc <= 1) {
		usage();
		return 1;
	}
	fp = fopen(argv[1], "w");
	if (fp == NULL) {
		printf("error opening file for writing\n");
		return 1;
	}
	fprintf(fp, "Hello from the POSIX world!\n");
	fprintf(fp, "Writing files line by line using fprintf.\n");
	fclose(fp);
	return 0;
}
