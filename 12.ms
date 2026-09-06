.NH
Chapter 12. The same programs on Plan 9
.LP
I write these programs on 9front. You have been reading POSIX.
The language did not change. A few names did. I swap
.CW common.h
and I change the calls in this table.
.PP
.ft I
plan9/map.txt
.ft R
.P1
Printed POSIX name     Plan 9 after you swap common.h
-------------------    --------------------------------
printf(...)            print(...)
NULL                   nil
exit(n)                exits(nil) or exits("error")
FILE *                 Biobuf *
fopen(path, "r")       Bopen(path, OREAD)
fopen(path, "w")       Bopen(path, OWRITE)
fgets / fprintf        Brdstr / Bprint
fclose(fp)             Bterm(bp)
.P2
.LP
.CW plan9/common.h
is two lines:
.P1
#include <u.h>
#include <libc.h>
.P2
.LP
That is the swap. Types, pointers, structs, and
.CW malloc
stay. Opening a file is a library call. I kept the Plan 9 file
programs in
.CW ch7/
so they would not leak
.CW print
and
.CW nil
into the earlier chapters.
.NH 2
A file, twice
.LP
Here is the POSIX reader you already compiled:
.P1
fp = fopen(argv[1], "r");
if (fp == NULL) {
	printf("error opening file\en");
	return 1;
}
while (fgets(buffer, sizeof(buffer), fp) != NULL)
	printf("%s", buffer);
fclose(fp);
.P2
.LP
Here is
.CW ch7/read_file_nine.c
after the same idea, different names:
.P1
bp = Bopen(argv[1], OREAD);
if (bp == nil) {
	print("failed to open file: %s\en", argv[1]);
}
while ((line = Brdstr(bp, '\\n', 0)) != nil) {
	print("%s", line);
	free(line);
}
Bterm(bp);
.P2
.LP
.CW write_file_nine.c
is
.CW Bopen
with
.CW OWRITE
and
.CW Bprint .
I do not compile those two with gcc. They want
.CW 8c
and
.CW <bio.h> .
If you are not on Plan 9, skip the files. You already learned the
language.
.NH 2
What I will not mix
.LP
One dialect per file. This is the mistake:
.P1
if (p == nil)
	print("fail\en");
.P2
.LP
That is Plan 9 in a POSIX chapter. And this is POSIX in a Plan 9
file:
.P1
if (p == NULL)
	printf("fail\en");
.P2
.LP
I still declare variables at the start of a block, and I still
write
.CW for (i = 0; ... )
so
.CW 8c
will take the same
.CW people
snapshot after I swap the header. That is why the book looks old.
It is the price of one program on two systems.
.LP
C skill is not the mapping. It is the habits: initialize, check
.CW malloc
and
.CW fopen ,
pass a length with every array, free what you allocate. The names
in this chapter are wallpaper.
