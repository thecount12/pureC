#include "common.h"
int
main()
{
	int age = 42; // integer
	float price = 3.14159; // floating-point number
	char initial = 'a'; //single character
	double weight = 155.2; // double precision
	unsigned int score = 100; // only non negative
 	long long_num = 2114748364; // long 32-bit
 	long long big_num = 12345678901234; // long number 64-bit

	printf("age: %d, price: %f\en", age, price);
	printf("initial: %c, weight: %f\en", initial, weight);
	printf("score: %d\en", score);
	printf("long_num: %ld\en", long_num);
	printf("big_num: %lld\en", big_num);
	return 0;
}
