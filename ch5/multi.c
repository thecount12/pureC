#include "common.h"
int
main()
{
	int a[2][5] = {
		{0,1,2,3,4},
		{5,6,7,8,9}
	};
	for (int row = 0; row < 2; row++) {
		for (int col = 0; col<5; col++) {
			print("(%d,%d) = %d\n", row, col, a[row][col]);
		}
	}
	return 0;
}
