#include "common.h"

int
main(void)
{
	int dragons = 4;
	float manna = 3.52163;
	char rune = 'a';
	double treasure = 172.2;
	unsigned int herbs = 100;
	long jewels = 2114748364;
	long long hoard = 12345678901234LL;
	printf("dragons: %d, manna: %f\n", dragons, manna);
	printf("rune: %c, treasure: %f\n", rune, treasure);
	printf("herbs: %u\n", herbs);
	printf("jewels: %ld\n", jewels);
	printf("hoard: %lld\n", hoard);
	return 0;
}
