# pureC

Core C. No extras.

The printed book is POSIX C. I write the programs on Plan 9 and swap
`common.h`. Chapter 0 (`0.ms`) is the plan: one growing program
(`people/`), POSIX listings, Plan 9 in a last chapter.

    Preview a chapter on Plan 9:
        tbl macro.ms 0.ms 1.ms | troff -ms | page -w
        tbl macro.ms 5.ms 6.ms | troff -ms | page -w

    Build the people snapshots on macOS or Linux:
        make
