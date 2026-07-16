#include "common.h"
void
change_array(int *a,int len)
{
	for (int i = 0; i<len; i++) {
		a[i] *= 2;
	}
}
int
main()
{
	int x[4] = {1,2,3,4};
	change_array(x,4);
	for (int i=0; i<4; i++) {
		printf("%d\n", x[i]);
	}
	return 0;
}
