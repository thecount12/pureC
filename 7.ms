.NH
Files
.LP
I plan to keep this chapter super simple and just focus on read, write, edits and possibly binary.
First lets createa basic file from scratch and put some data in it. 
.P1
echo "hello world" > file.txt
echo "foo bar" >> file.txt
.P2
.LP
The FILE* data type is the standard for manipulation of input and output streams. Streams are categorized as text or binary.
.TS
box, center, tab(|);
cb | cb
r | l.
FILE*|Description
_
stdin|Standard Input (kbd, mouse)
stdout|Standard Output (screen)
stderr|Standard Error (screen)
.TE
.NH 2
Reading Files
.PP
.ft I
read_file.c
.ft R
.P1
#include "common.h"
void 
usage(void)
{
	printf("read_file: file_name\n");
}
int
main(int argc, char *argv[])
{
	printf("id: %d, item: %s\en", argc, argv[0]);
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
.P2
.PP
.ft I
Output:
.ft R
.PP
read_file file.txt
.PP
id: 2, item: read_file
.PP
"hello world"
.PP
"foo bar"
.br
\l'\n(.lu'
.br
.LP
.NH 2
Write Files
.LP
Let's write files.I suppose I could use fputc() or fputs() but fprintf() works well enough. 
.PP
.ft I
write_file.c
.ft R
.P1
#include "common.h" // Swapped for POSIX headers
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
		exit(1);
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
.P2
.PP
Summary or binary files

