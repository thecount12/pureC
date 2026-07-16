#include "common.h"
#include <bio.h>
void 
usage(void)
{
	print("read_file: file_name\n");
}
int
main(int argc, char *argv[])
{
	print("id: %d, item: %s\n", argc, argv[0]);
	if (argc <= 1) {
		usage();
		exit(1);
	}
	char *filename
	FILE *fp;
	char buffer[256];
	fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("error opening file");
        return;
    }
    while (fgets(buffer, sizeof(buffer), fp) != NULL) {
        printf("%s", buffer);
    }
    fclose(fp);
	return 0;
}
