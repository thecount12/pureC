CC = gcc
CFLAGS = -Wall -Wextra

PEOPLE_SRC = people/ch1.c people/ch2.c people/ch3.c people/ch4.c \
	people/ch5.c people/ch6.c people/ch7.c people/ch8.c \
	people/ch9.c people/ch10.c
PEOPLE_BIN = people/ch1 people/ch2 people/ch3 people/ch4 \
	people/ch5 people/ch6 people/ch7 people/ch8 \
	people/ch9 people/ch10

.PHONY: all people clean hello test

all: hello people

hello: ch1/1_hello
	@echo built $<

ch1/1_hello: ch1/1_hello.c ch1/common.h
	$(CC) $(CFLAGS) -o $@ ch1/1_hello.c

people: $(PEOPLE_BIN)

people/%: people/%.c people/common.h
	$(CC) $(CFLAGS) -o $@ $<

ch4/test_older: ch4/test_older.c ch4/common.h
	$(CC) $(CFLAGS) -o $@ ch4/test_older.c

test: ch4/test_older
	./ch4/test_older

clean:
	rm -f ch1/1_hello $(PEOPLE_BIN) people.txt ch4/test_older
