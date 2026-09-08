.\" Afterword. Unnumbered, like intro.ms. Last in the pipeline.
.SH
What you have now
.LP
You started with
.CW printf
and a number. You ended with a list of people that can grow, sit
on a disk, and come back. In between: types, control, functions,
pointers, arrays, structs,
.CW malloc ,
files. That is the core. It is not a small list on the page. It is
a small list in the machine.
.LP
The habits are the book. Initialize every variable. Check
.CW malloc
and
.CW fopen .
Pass a length with every array. Pair
.CW free
with what you allocated. Keep one dialect in a file. Warnings are
the teacher. A function small enough to test is a function you
understand.
.LP
.CW people
is still tiny. Run it twice and you get two Kids. That is fine.
You know where the body is. Change it.
.SH
Where to go
.LP
Write programs. Another C book will not stick the habits. K&R
second edition is still the one I open when I am stuck. If the
wizard book is what caught you, Abelson and Sussman are Scheme;
the machine ideas are the same. If you want my other shop, swap
.CW common.h
and read chapter 12 on a 9front box. The language does not change.
.LP
Do not start an arena. Do not start a compiler. The tagged union
in chapter 11 is enough of both to see the shape. The next spell
is a program you need, compiled with
.CW -Wall
and
.CW -Wextra ,
one dialect, one
.CW people
list you kept.
.LP
The grimoire is this short. The work is not.
