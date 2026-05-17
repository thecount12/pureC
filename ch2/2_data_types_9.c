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

	print("age: %d, price: %f\n", age, price);
	print("initial: %c, weight: %f\n", initial, weight);
	print("score: %d\n", score);
	print("long_num: %ld\n", long_num);
	print("big_num: %lld\n", big_num);
	return 0;
}
