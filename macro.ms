.\" Rename the original ms macros to keep their internal formatting
.rn P1 oldP1
.rn P2 oldP2

.\" Redefine P1: Draw top line, run oldP1, then apply the layout fixes
.de P1
.sp 0.5v
\l'\n(.lu'
.sp 0.2v
.oldP1           \" Run the original P1 code logic (handles the default code font)
.in +0.5i        \" Indent the code block cleanly
.ft CW
.nf              \" NO-FILL: Keeps your manual code line breaks intact
..

.\" Redefine P2: Fix fill and layout settings, run oldP2, then draw bottom line
.de P2
.fi              \" FILL: Turns normal paragraph wrapping back on
.ft R
.in -0.5i        \" Reset indentation back to the default page margin
.oldP2           \" Run the original P2 closing font logic
.sp 0.2v
\l'\n(.lu'
.sp 0.5v
..

