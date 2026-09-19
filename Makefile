CC = gcc
CFLAGS = -Wall -Wextra

MAGES_SRC = mages/ch1.c mages/ch2.c mages/ch3.c mages/ch4.c \
	mages/ch5.c mages/ch6.c mages/ch7.c mages/ch8.c \
	mages/ch9.c mages/ch10.c
MAGES_BIN = mages/ch1 mages/ch2 mages/ch3 mages/ch4 \
	mages/ch5 mages/ch6 mages/ch7 mages/ch8 \
	mages/ch9 mages/ch10

.PHONY: all mages clean hello test

all: hello mages

hello: ch1/1_hello
	@echo built $<

ch1/1_hello: ch1/1_hello.c ch1/common.h
	$(CC) $(CFLAGS) -o $@ ch1/1_hello.c

mages: $(MAGES_BIN)

mages/%: mages/%.c mages/common.h
	$(CC) $(CFLAGS) -o $@ $<

ch4/test_older: ch4/test_older.c ch4/common.h
	$(CC) $(CFLAGS) -o $@ ch4/test_older.c

test: ch4/test_older
	./ch4/test_older

clean:
	rm -f ch1/1_hello $(MAGES_BIN) mages.txt people.txt ch4/test_older
