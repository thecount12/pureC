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
		exits(nil);
	}
	Biobuf *bp;
	char *line;
	bp = Bopen(argv[1], OREAD);
	if(bp == nil) {
		print("failed to open file: %s\n", argv[1]);
	}
	while((line = Brdstr(bp, '\n', 0)) != nil) {
        print("%s", line);
        free(line);
    }
    Bterm(bp);
	return 0;
}
