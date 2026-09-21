#include "common.h"

#define CIRCLE 3.14159
enum Rank {
	apprentice,
	adept,
	mage,
	archmage
};
int
main(void)
{
	int a = apprentice;
	int b = adept;
	printf("circle: %.2f\n", CIRCLE);
	printf("rank starts: %d\n", apprentice);
	a += 1;
	printf("apprentice+1: %d\n", a);
	b++;
	printf("adept+1: %d\n", b);
	return 0;
}
