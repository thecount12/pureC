.NH
Chapter 1
.NH 2
Why C?
.LP
Over the years I have gone back and forth with this. I almost always settled with python. Over the years
I have had plenty of interruptions with other languages. I'm a big fan of the right language for the right
task. But in some situations its just not possible. Working in Plan9 is one such discovery where you have
limited options. Nothing has changed from the late 1980's. In fact "C" gave birth to a bunch of other languages
that have higher than normal usage today. 
.LP
The K&R second edition has remained the last final goto if you get stuck in "C". They crammed a ton of 
stuff in 177 pages. The core of "C" is in 150 pages. But we have dozens of books that exceed 300+ pages
on "C" language concepts.
.LP
So where is "C" used today. Mostly systems programming and micro controllers, FPGA's, ASICS, and bunch of 
language creations, intepreters, browsers, and operating systems. The big catch is that the language
is kind of easy to learn. Its the root of most modern languages today. 
.LP
Learning "C" forces you to do what few other langues do today. Its also why we have soo many problems 
today. Very few developers deal with bits and bytes, memory management, garbage collection, and generally just how data moves or turns into tiny machine instruction code. You also have no guard rails which enable you to
make a ton of mistakes unless you adhere to a strict discipline of precision and control. 
.LP
I have a collection of C books. Probably all of them or at least all of the popular books. But I want to do
a few things different. Let's just focus on the core of "C" with the least usage of the libary today. But
we can't help but use the following 3 main libraries <stdio.h>, <stdlib.h> and <string.h>. These are imported
using a preprocessor directive called #include. Lets just create that now and be done with you. 
Create a file called common.h and that will be included in every file we create. 
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
Every book chooses to introduce each library that comes up and I just simply don't care. Most people use IDE's and compilers are now sofisticated
enough to tell you that you are missing a library. Plus I code mostly in plan9  operating system of "9front" and we just don't use them. If
you choose to code in plan9 C you would use the following:
.P1
#include <u.h>
#includce <libc.h>
.P2
The developers in plan9 kind of squeezed everything int a few libraries and called it a day. This is not the case in Posix systems. You will come
across plenty of code with endless libs that are nearly impossible to follow. 
.NH 2
First Program
.LP
Almost every program starts with the same phrase "Hello World!" so let's do that now and get it out of the way. 
.PP
.ft I
hello.c
.ft R
.P1
#include "common.h"

int
main()
{
	printf("hello\en");
	return 0;
}
.P2
.LP
This is a simple function that returns an integer defined as "int". No arguments are passed
into the function in plan9 "print()" is the same as "printf()" in posix like systems. 
Please bear that in mind that I might forget the syntax from time to time becase I primarily
develop on a non-traditional operating system. The other thing to take into consideration
is that I use a very ancient style. To write my functions. Modernin examples show
"int main" on the same line and I also move my braces "{}" to a different line. I'm likely
going to continue to use this style through the book. Finally since we are including our own header file we enclose "common.h"
in quotes instead of system libs which are enclosed in "<>" brackets. 
.NH 2
C Versions
.LP
To compile this you will be using primarily "gcc" but "clang" works perfectly fine as well as "tcc". Again
I compile everything in "9front" os first then try to compile on MacOS. I beleve you need "xcode-select --install" 
to get gcc working. Please note MacOS uses "gcc" as a wrapper for "clang". I will show you multiple examples on 
how to compile your program. You really should script it and or create a Makfile. 
.P1
gcc -o foo bar.c # basic example 
gcc -Wall -Wextra -o foo bar.c # verbose example for error checking
8c -FVw foo.c; 8l -o foo foo.8 # plan9 example
.P2
.LP
There is a little more to the plan9 because Plan9 has multiple compilers for different archectures. 
.LP
.IP \(bu
Sparc: kc compiler and kl linker
.IP \(bu
PowerPC: qc and ql linker
.IP \(bu
MIPS: vc and vl
.IP \(bu
ARM: 5c and 5l
.IP \(bu
AMD64: 6c and 6l
.IP \(bu
Intel386: 8c and 8l
.LP
As well as a handfull more not listed here. But these are the most popular at the moment. There 
are generally only a few versions os "C" since its inception in 1978. 
.LP
.IP \(bu
K&R C: Created in 1978, and named after Brian Kernighan and Dennis Ritchie.The second edition 
is still considered the standard today.
.IP \(bu
C89, ANSI C, C90: The 1989 version and the primary specification used today. More than 90% of the code is written in C89.
.IP \(bu
C95: Rarely mentioned version because it was superceded by C99 as a big overhaul.
.IP \(bu
C99: The first major overhaul with tons of features I will never use with exception of "//" style comments.
.IP \(bu
C11: Only useful in Windows systems. 
.IP \(bu
Plan9 C: The Plan9 C dialect is not ANSI or ISO C. It is a variation implemented by Ken Thompson.
.LP
