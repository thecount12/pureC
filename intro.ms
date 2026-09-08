.\" Front matter. Unnumbered. Preview:
.\"   tbl macro.ms intro.ms 1.ms | troff -ms | page -w
.TL
pureC
.AU
William C. Gunnells
gunnells@gmail.com
thinktankworkspaces.com
.AB
A small grimoire. This document will get you up to speed in C using
mostly single-file programs. The printed listings are POSIX. I write
them on Plan 9 and swap a header. One small program,
.CW people ,
grows with you.
.AE
.SH
How to read this book
.LP
I wrote this book to learn C. I work in Plan 9, but I want you to learn
the language, not my operating system. So here is the one rule.
.SH
A grimoire, not a textbook
.LP
Lisp got there first in my head. Abelson and Sussman's
.I Structure and Interpretation of Computer Programs
(second edition), and the MIT lectures that go with it, made a program
feel like a spell: a small text that, when you run it, does a thing
in the machine. People call that the wizard book. Sorcerer Linux,
which later became Source Mage, used the same word for a package you
compile. I still like that. A grimoire is a book you work from.
.LP
This one is C. The listings are the spells. You copy them, you compile,
they run or the compiler tells you why. We keep one working,
.CW people ,
instead of a new demon every page. The same craft lives on Plan 9 at
.CW technomancy.site .
Here the printed dialect stays POSIX so you can learn the language.
The names in the listings are not magic. They are C.
.SH
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
.SH
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
Here is the spine. The extra examples are side roads. Stay on this
if you get lost.
.TS
box, center, tab(|);
cb | cb | cb
l | l | l.
Chapter|File|What people gained
_
1|people/ch1.c|a name and an age, printed
2|people/ch2.c|real variables
3|people/ch3.c|a loop, skip the kid
4|people/ch4.c|functions and argv
5|people/ch5.c|a pointer, a birthday
6|people/ch6.c|pass the length, copy a name
7|people/ch7.c|one struct
8|people/ch8.c|one Person on the heap
9|people/ch9.c|save and load
10|people/ch10.c|grow, then keep it
.TE
.SH
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
.CW make test
runs the small
.CW older
check from chapter 4.
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
.SH
Table of Contents
.IP 1.
Why C
.IP 2.
Variables and statements
.IP 3.
Flow control
.IP 4.
Functions
.IP 5.
Pointers
.IP 6.
Arrays and strings
.IP 7.
Structs
.IP 8.
Memory
.IP 9.
Files
.IP 10.
A list of people that can grow
.IP 11.
Tagged unions and fake OOP
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
