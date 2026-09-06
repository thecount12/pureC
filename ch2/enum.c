#include "common.h"
#define myPI 3.14159
enum WeekDays {
	monday,
	tuesday,
	wednesday,
	thursday,
	friday
};
int
main(void)
{
	int mon = monday;
	int tue = tuesday;

	printf("PI: %.2f\n", myPI);
	printf("enum starts: %d\n", monday);
	mon += 1;
	printf("monday+1: %d\n", mon);
	tue++;
	printf("tuesday+1: %d\n", tue);
	return 0;
}
