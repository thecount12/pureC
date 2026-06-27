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
main()
{
	int mon;
	int tue = 1;
	printf("PI: %.2f\n", myPI);
	printf("enum starts: %d\n", monday);
	mon +=1;
    printf("monday: %d\n", mon);
	tue++;
	printf("tuesday: %d\n", tue);
	return 0;
}
