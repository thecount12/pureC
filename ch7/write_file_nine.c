#include "common.h"
#include <bio.h>
void 
usage(void)
{
	print("write_file: file_name\n");
}
int
main(int argc, char *argv[])
{
	Biobuf *bp;
	if (argc <= 1) {
		usage();
		exits("usage");
	}
	bp = Bopen(argv[1], OWRITE);
	if(bp == nil) {
		sysfatal("failed to open file for writing: %r");
	}
	Bprint(bp, "Hello from the Plan 9 world!\n");
	Bprint(bp, "Writing files line by line using Bprint.\n");
	Bterm(bp);
	exits(nil);
}
