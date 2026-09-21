.\" Front matter. Unnumbered. Preview:
.\"   tbl macro.ms intro.ms 1.ms | troff -ms | page -w
.TL
pureC
.AU
William C. Gunnells
gunnells@gmail.com
thinktankworkspaces.com
.AB
A small grimoire for those inclined to learn the dark arts of C programming. This document will get you up to speed in C using mostly single-file programs. The printed listings are POSIX. I write them on an obscure operating system called 9front, whose predecessor was Plan9 from AT&T Bell-Labs and swap out a header file to be compatible with macOS, BSD, and Linux. One small program called “mages” grows with you.
.AE
.SH
How to read this book
.LP
.sp 1v
I wrote this book to relearn C. I work with the 9front operating system most of the time, but I want you to learn the language, not my operating system. So here is the one rule. 
.SH
A grimoire, not a textbook
.LP
.sp 1v
Lisp got there first in my head. Abelson and Sussman's Structure and Interpretation of Computer Programs (second edition), and the MIT Lectures that go with it made a program feel like a spell: a small text that, when you run it, does a thing in the machine. People call that the wizard's book. Many years later, an operating system called Sorcerer GNU/Linux was created with a magic-themed package management system. Building the system directly from source allows for high optimization on the user's hardware. I still remember it fondly. This grimoire on C is a book you work from to create super-powerful programs.
.LP
The listings are the spells. You copy them, compile them, and they either run or the compiler tells you why your summoning failed. We keep one program working called mages; each chapter performs a new ritual that builds on the previous one. The same craft lives on in 9front and other operating systems. Here the printed dialect stays POSIX so you can learn the language. The names in the listings are magical. They are pure C. 
.SH
The printed code is POSIX
.LP
.sp 1v
Every listing in the core chapters compiles with gcc or clang. I use “printf”,  “NULL”, and “exit”. If I slip and write “print” or “nil” in those chapters, that is a mistake on my part.
.LP
.sp 1v
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
does not change. Types, pointers, structs, and malloc are the foundational tools for application development used to manage memory dynamically and build complex, custom data structures. 
(liked linked lists, trees, and graphs). Opening a file is just a library call.
.SH
One program that grows
.LP
Most C books show a new toy every page. I did that in the first draft
and It did not get better. So now we keep one small program called
mages. Each chapter adds a little to it. By the time we have structs and malloc, you will have a tiny roster, not a pile of fragments.
.LP
The extra examples (temperature, calculator, cars) stay as side roads. The spine is mages. The snapshots live in the "mages/"
directory and should compile with "gcc" .
.LP
Here is the spine. The extra examples are side roads. Stay on this
if you get lost.
.TS
box, center, tab(|);
cb | cb | cb
l | l | l.
Chapter|File|What the circle gained
_
1|mages/ch1.c|a name and an age, printed
2|mages/ch2.c|real variables
3|mages/ch3.c|a loop, skip the apprentice
4|mages/ch4.c|functions and argv
5|mages/ch5.c|a pointer, a birthday
6|mages/ch6.c|pass the length, copy a name
7|mages/ch7.c|one struct
8|mages/ch8.c|one Mage on the heap
9|mages/ch9.c|save and load
10|mages/ch10.c|grow, then keep it
.TE
.SH
How I compile
.LP
On macOS or Linux:
.P1
gcc -Wall -Wextra -o hello ch1/1_hello.c
gcc -Wall -Wextra -o mages mages/ch1.c
.P2
.LP
The statement options "-Wall" and "-Wextra" are the teacher. I used to treat warnings as noise. They are not. A Makefile sits at the root of the repo for the mages snapshots. The "make test" command runs the small "test_older.c" check from chapter 4.
.LP
I write functions in an older layout: "int" on its own line, braces on the next line. I declare loop variables at the start of a block so the same code still compiles on Plan 9 after a header swap. You can put
"int" on the same line as "main" if that is what you are used to. I will not.
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
A list of mages that can grow
.IP 11.
Tagged unions and fake OOP
.IP 12.
The same programs on Plan 9
.LP
The afterword is unnumbered, like this intro and explains what you have now, and where to go for future learning.
.LP
In summary if a listing and a ".c" file disagree, trust the ".c" file, then fix the the spine and contribute to an errata. That is the whole method to spell crafting. C skill is not syntax. It is a few habits: initialize every variable, check "malloc" and "fopen", pass a length with every array, and keep one dialect in a file. The rest of the book is those habits, repeated until they stick.
