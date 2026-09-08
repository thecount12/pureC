.NH
Why C
.LP
Over the years I have gone back and forth with this. I almost always
settled on Python. I like the right language for the right task. Then
I spent real time in Plan 9, where the options shrink, and C is what
you have. Nothing about that has changed since the late 1980s. C also
gave birth to a pile of languages people actually use.
.LP
K&R second edition is still the book I open when I am stuck. They
crammed the core into about 150 pages. Dozens of later books spend
300 pages on the same core. Duc-Tam Nguyen's
.I The Little Book of C
is a recent short one I liked: a tiny listing, then you try it.
Abelson and Sussman's wizard book is the other pole. Scheme, not C,
but it is why a short working text still feels like sorcery to me.
I wanted that size, and one program that grows instead of a new
toy every page. Types, control, functions, pointers, structs,
memory, files. The least library we can get away with.
.LP
We still need three headers. Every book dribbles them in one at a time.
I do not care. Compilers will tell you when something is missing.
Put them in
.CW common.h
and we are done for a while:
.PP
.ft I
common.h
.ft R
.P1
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
.P2
.LP
If you are following along on Plan 9, swap this file for
.CW plan9/common.h
(
.CW <u.h>
and
.CW <libc.h>
) and read chapter 12 when you get there. The listings below stay POSIX
so the reader is looking at one dialect.
.NH 2
First program
.LP
Almost every book starts with "Hello World," so let's get it out of the
way.
.PP
.ft I
1_hello.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	printf("hello\en");
	return 0;
}
.P2
.LP
.CW main
is a function that returns an
.CW int .
No arguments yet. We include our own header in quotes. System headers
use
.CW <> .
.LP
I write functions in an older layout:
.CW int
on its own line, opening brace on the next line. A lot of modern
examples glue
.CW int main
onto one line. I am going to keep my layout through the book.
.NH 2
Compile it
.LP
On macOS or Linux, gcc or clang is fine. macOS
.CW gcc
is usually a wrapper for clang.
.P1
gcc -o hello 1_hello.c
gcc -Wall -Wextra -o hello 1_hello.c
.P2
.LP
Use the second line. Warnings are how C talks to you. Then run
.CW ./hello
and you should see
.CW hello .
.LP
I compile on 9front first with
.CW 8c
and
.CW 8l .
That is a different compiler family, and I will not dump the whole
architecture list into chapter 1. If you came here for Plan 9, skip
to chapter 12 after you can compile this file with gcc.
.NH 2
The program we will keep
.LP
Hello world teaches the shape of a file. It does not teach C. Starting
now we also keep a tiny program called
.CW people .
Chapter 1 is just a name and an age, printed. No struct yet. We have
not earned it.
.PP
.ft I
people/ch1.c
.ft R
.P1
#include "common.h"

int
main(void)
{
	printf("Bob, age %d\en", 42);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Bob, age 42
.P2
.LP
.CW %d
is a hole in the string that
.CW printf
fills with an integer.
.CW 42
is an
.CW int .
Now you: change the age. Change the name. Compile it again.
.LP
Next chapter we give Bob real variables instead of a magic number in
the
.CW printf
line.
.NH 2
C versions, in one breath
.LP
You will hear a lot of version names. For this book:
.IP \(bu
K&R C is the ancestor. The second edition is still worth owning.
.IP \(bu
C89 / ANSI C is the dialect most of this book lives in. Declare
variables at the top of a block.
.IP \(bu
C99 added
.CW //
comments and for (int i = 0) .
I use the comments. I still declare
.CW i
at the top so Plan 9's compiler will take the same file after a
header swap.
.IP \(bu
C11 and later exist. We do not need them here.
.IP \(bu
Plan 9 C is Ken Thompson's compiler, not ANSI. Libraries and a few
names differ. The language ideas do not.
.LP
If a later chapter needs a newer feature, I will say so. Until then,
small C is the point.
