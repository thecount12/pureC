.NH
Files
.LP
A file is a stream. You open it, you check the pointer, you use it,
you close it. Skip the check or the close and the rest of the
program is theater.
.TS
box, center, tab(|);
cb | cb
r | l.
FILE *|Description
_
stdin|keyboard
stdout|screen
stderr|errors
.TE
.LP
Plan 9 uses
.CW Biobuf
instead of
.CW FILE * .
That mapping is chapter 12. The
.CW *_nine.c
files in
.CW ch7/
wait there. Here we stay POSIX.
.NH 2
People on disk
.LP
The name is now a buffer. A string literal cannot survive a
.CW fscanf .
We write two people, close the file, open it again, and print what
came back.
.PP
.ft I
people/ch9.c
.ft R
.P1
#include "common.h"

struct Person {
	char name[32];
	int age;
	float height;
};

void
print_person(struct Person *p)
{
	printf("%s, age %d, height %.1f\en", p->name, p->age, p->height);
}

int
save(char *path, struct Person *p, int n)
{
	FILE *fp;
	int i;

	fp = fopen(path, "w");
	if (fp == NULL)
		return 1;
	for (i = 0; i < n; i++)
		fprintf(fp, "%s %d %.1f\en", p[i].name, p[i].age, p[i].height);
	fclose(fp);
	return 0;
}

int
load(char *path, struct Person *p, int cap, int *n)
{
	FILE *fp;
	int i;

	fp = fopen(path, "r");
	if (fp == NULL)
		return 1;
	i = 0;
	while (i < cap &&
	    fscanf(fp, "%31s %d %f", p[i].name, &p[i].age, &p[i].height) == 3)
		i++;
	fclose(fp);
	*n = i;
	return 0;
}

int
main(void)
{
	struct Person people[3];
	struct Person loaded[3];
	int n;
	int i;

	strcpy(people[0].name, "Bob");
	people[0].age = 42;
	people[0].height = 5.8f;
	strcpy(people[1].name, "Ann");
	people[1].age = 35;
	people[1].height = 5.5f;
	n = 2;
	if (save("people.txt", people, n) != 0) {
		printf("save failed\en");
		return 1;
	}
	n = 0;
	if (load("people.txt", loaded, 3, &n) != 0) {
		printf("load failed\en");
		return 1;
	}
	for (i = 0; i < n; i++)
		print_person(&loaded[i]);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Bob, age 42, height 5.8
Ann, age 35, height 5.5
.P2
.LP
.CW people.txt
looks like this:
.P1
Bob 42 5.8
Ann 35 5.5
.P2
.LP
.CW %31s
leaves room for the
.CW '\\0'
in a 32-byte name. Spaces in a name will break this format. I know.
It is a first file, not a database.
.NH 2
Reading any text file
.LP
.CW fgets
is the other habit. One line, a buffer, a length.
.PP
.ft I
read_file.c
.ft R
.P1
#include "common.h"

void
usage(void)
{
	printf("read_file: file_name\en");
}

int
main(int argc, char *argv[])
{
	FILE *fp;
	char buffer[256];

	printf("id: %d, item: %s\en", argc, argv[0]);
	if (argc <= 1) {
		usage();
		return 1;
	}
	fp = fopen(argv[1], "r");
	if (fp == NULL) {
		printf("error opening file\en");
		return 1;
	}
	while (fgets(buffer, sizeof(buffer), fp) != NULL)
		printf("%s", buffer);
	fclose(fp);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
$ ./read_file ch7/file_name.txt
id: 2, item: ./read_file
"hello world"
"foo bar"
.P2
.LP
The check is not decoration. I ran it on a name that does not
exist:
.P1
$ ./read_file no-such.txt
id: 2, item: ./read_file
error opening file
.P2
.NH 2
Writing
.LP
.CW fprintf
to a
.CW FILE *
is
.CW printf
with a destination.
.PP
.ft I
write_file.c
.ft R
.P1
#include "common.h"

void
usage(void)
{
	printf("write_file: file_name\en");
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
		printf("error opening file for writing\en");
		return 1;
	}
	fprintf(fp, "Hello from the POSIX world!\en");
	fprintf(fp, "Writing files line by line using fprintf.\en");
	fclose(fp);
	return 0;
}
.P2
.LP
.CW fopen ,
check for
.CW NULL ,
use the file,
.CW fclose .
Binary files and
.CW fseek
can wait. Now you: add a third person to the file. Or run
.CW load
when
.CW people.txt
is missing. Chapter 10 hangs that habit on a list that can grow.
