#include "common.h"
void
usage(void)
{
		print("\nUsage: \n");
		printf("calc: 2 + 2\n");
		printf("calc: 2 '*' 2\n"); // shell * means match everything
		printf("calc: 2 - 3\n");
}
int
main(int argc, char *argv[])
{
	if (argc <= 2) {
		usage();
	}
	int num1 = atoi(argv[1]);
	int num2 = atoi(argv[3]);
	char op = argv[2][0];
	switch(op) {
		case '+':
			printf("calc: %d\n", num1 + num2);
			break;
		case '*':
			printf("calc: %d\n", num1 * num2);
			break;
		case '-':
			printf("calc: %d\n", num1 - num2);
			break;
		default:
			printf("default\n");
	}
	return 0;
}
