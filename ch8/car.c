#include "common.h"
typedef struct Price Price;
struct Price {
	double base;
	double total;
};
typedef struct Car Car;
struct Car {
	char *make;
	char *model;
	int year;
	Price price;
};
void
print_car(Car *p)
{
	printf("Car: %d %s %s\n", p->year, p->make, p->model);
	printf("Base Price: $%.2f\n", p->price.base);
	printf("Total Cost: $%.2f\n", p->price.total);
}
int
main(void)
{
	Car c1 = {"Toyota", "Corolla", 2024, 
		{22000.00, 23800.50}
	};
	print_car(&c1);
	return 0;
}
