#include "common.h"

void
usage(void)
{
	printf("Usage:\n");
	printf("calc 2 + 2\n");
	printf("calc 2 '*' 2\n");
	printf("calc 2 - 3\n");
}

int
main(int argc, char *argv[])
{
	int num1, num2;
	char op;

	if (argc != 4) {
		usage();
		return 1;
	}
	num1 = atoi(argv[1]);
	op = argv[2][0];
	num2 = atoi(argv[3]);
	switch (op) {
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
		printf("unknown operator\n");
		return 1;
	}
	return 0;
}
