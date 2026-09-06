.NH
How to read this book
.LP
I wrote this book to learn C. I work in Plan 9, but I want you to learn
the language, not my operating system. So here is the one rule.
.NH 2
The printed code is POSIX
.LP
Every listing in the core chapters compiles with gcc or clang.
I use
.CW printf ,
.CW NULL ,
and
.CW exit .
If I slip and write
.CW print
or
.CW nil
in those chapters, that is a mistake.
.LP
The only library file we need for a long time is
.CW common.h :
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
I still write the programs on 9front. When I do, I swap this file for
.CW plan9/common.h
and I change
.CW printf
to
.CW print .
That mapping lives in chapter 12. Until then, ignore Plan 9. The point
of the header swap is that the
.I language
does not change. Types, pointers, structs, and
.CW malloc
are the book. Opening a file is just a library call.
.NH 2
One program that grows
.LP
Most C books show a new toy every page. I did that in the first draft
and I did not get better. So we also keep one small program called
.CW people .
Each chapter adds a little. By the time we have structs and
.CW malloc ,
you have a tiny record-keeper, not a pile of fragments.
.LP
The extra examples (temperature, calculator, cars) stay as side roads.
The spine is
.CW people .
The snapshots live in the
.CW people/
directory and should compile with
.CW gcc .
.NH 2
How I compile
.LP
On macOS or Linux:
.P1
gcc -Wall -Wextra -o hello ch1/1_hello.c
gcc -Wall -Wextra -o people people/ch1.c
.P2
.LP
.CW -Wall
and
.CW -Wextra
are the teacher. I used to treat warnings as noise. They are not.
A Makefile sits at the root of the repo for the
.CW people
snapshots.
.LP
I write functions in an older layout:
.CW int
on its own line, braces on the next line. I declare loop variables at
the start of a block so the same code still compiles on Plan 9 after a
header swap. You can put
.CW int
on the same line as
.CW main
if that is what you are used to. I will not.
.NH 2
The shape of the book
.IP 1.
A program is a function that returns int
.IP 2.
Types and values
.IP 3.
Control flow
.IP 4.
Functions, scope,
.CW argc
and
.CW argv
.IP 5.
Pointers (just addresses)
.IP 6.
Arrays and strings
.IP 7.
Structs
.IP 8.
Memory:
.CW malloc ,
.CW realloc ,
.CW free
.IP 9.
Files
.IP 10.
A list of people that can grow
.IP 11.
Tagged unions and function pointers (the fake OOP)
.IP 12.
The same programs on Plan 9
.LP
The twelve chapters exist in this draft. I bent the old 1 through 8
toward this outline instead of throwing them away. If a listing and a
.CW .c
file disagree, trust the
.CW .c
file, then fix the book. That is the whole method.
.LP
C skill is not syntax. It is a few habits: initialize every variable,
check
.CW malloc
and
.CW fopen ,
pass a length with every array, and keep one dialect in a file.
The rest of the book is those habits, repeated until they stick.
