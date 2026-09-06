#include "common.h"
union Packet {
	int num;
	float myPi;
	char c;
};
int
main()
{
	union Packet data;
	data.num = 42;
	print("data.num: %d\n", data.num);
	data.myPi = 3.14;
	print("data.myPi: %.2f\n", data.myPi);
	data.c = 'A';
	print("data.c: %c\n", data.c);
	print("check previous data.num: %d\n", data.num);
	return 0;
}
