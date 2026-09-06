#include "common.h"
union Packet {
	int num;
	float myPi;
	char c;
};
int
main(void)
{
	union Packet data;
	data.num = 42;
	printf("data.num: %d\n", data.num);
	data.myPi = 3.14;
	printf("data.myPi: %.2f\n", data.myPi);
	data.c = 'A';
	printf("data.c: %c\n", data.c);
	printf("check previous data.num: %d\n", data.num);
	return 0;
}
