# pureC

This repo is a C book. The reader learns core C. The author writes on Plan 9
and swaps headers. Follow `.cursor/rules/` and `0.ms`.

## Prompt to paste into a new Cursor chat or Plan

Continue the pureC book. Printed listings are POSIX (`printf`, `NULL`, `exit`).
Plan 9 is `plan9/common.h` and chapter 12. The spine is `people/chN.c`, one
snapshot per chapter. Keep my first-person voice in the `.ms` files. Compile
with `gcc -Wall -Wextra` and paste real output into the book. The
twelve-chapter draft is in place (`5.ms` pointers through `12.ms` Plan 9).
Next: keep listings matched to the `.c` files. Do not add a new toy
when `people/chN.c` can teach it.

## How to work here

1. Open this folder as the Cursor workspace (`pureC`, not `lux`).
2. Start a new Agent chat (or Plan). The project rules load automatically.
3. Paste the prompt above if you want Plan mode to lock the outline first.
