#include "common.h"

int
main(void)
{
	int a[2][5];
	int row, col;

	a[0][0] = 0;
	a[0][1] = 1;
	a[0][2] = 2;
	a[0][3] = 3;
	a[0][4] = 4;
	a[1][0] = 5;
	a[1][1] = 6;
	a[1][2] = 7;
	a[1][3] = 8;
	a[1][4] = 9;
	for (row = 0; row < 2; row++) {
		for (col = 0; col < 5; col++)
			printf("(%d,%d) = %d\n", row, col, a[row][col]);
	}
	return 0;
}
