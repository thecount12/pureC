#include "common.h"

int
main(void)
{
	int age = 42;
	float price = 3.14159;
	char initial = 'a';
	double weight = 155.2;
	unsigned int score = 100;
	long long_num = 2114748364;
	long long big_num = 12345678901234LL;

	printf("age: %d, price: %f\n", age, price);
	printf("initial: %c, weight: %f\n", initial, weight);
	printf("score: %u\n", score);
	printf("long_num: %ld\n", long_num);
	printf("big_num: %lld\n", big_num);
	return 0;
}
