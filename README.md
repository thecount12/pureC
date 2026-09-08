# pureC

A small grimoire for core C. No extras.

The printed book is POSIX C. I write the programs on Plan 9 and swap
`common.h`. The intro (`intro.ms`) is the plan: one growing program
(`people/`), POSIX listings, Plan 9 in a last chapter. Lisp and
[SICP](https://www.youtube.com/watch?v=-J_xL4IGhJA) are why a listing
still feels like a spell. The listings themselves stay C.

    Preview a chapter on Plan 9:
        tbl macro.ms intro.ms 1.ms | troff -ms | page -w
        tbl macro.ms 12.ms outro.ms | troff -ms | page -w

    Build the people snapshots on macOS or Linux:
        make
