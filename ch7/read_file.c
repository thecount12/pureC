#include "common.h"
void 
usage(void)
{
	printf("read_file: file_name\n");
}
int
main(int argc, char *argv[])
{
	printf("id: %d, item: %s\n", argc, argv[0]);
	if (argc <= 1) {
		usage();
		exit(1);
	}
	FILE *fp;
	char buffer[256];
	fp = fopen(argv[1], "r");
    if (fp == NULL) {
        printf("error opening file");
        return 0;
    }
    while (fgets(buffer, sizeof(buffer), fp) != NULL) {
        printf("%s", buffer);
    }
    fclose(fp);
	return 0;
}