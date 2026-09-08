#include "common.h"

typedef struct MyClass MyClass;

struct MyClass {
	int a;
	int b;
	int (*add_fields)(MyClass *self);
	void (*multiply_by_scalar)(MyClass *self, int factor);
};

int
add_fields(MyClass *self)
{
	return self->a + self->b;
}

void
multiply_by_scalar(MyClass *self, int factor)
{
	self->a *= factor;
	self->b *= factor;
}

MyClass
new_my_class(int initial_a, int initial_b)
{
	MyClass obj;

	obj.a = initial_a;
	obj.b = initial_b;
	obj.add_fields = add_fields;
	obj.multiply_by_scalar = multiply_by_scalar;
	return obj;
}

int
main(void)
{
	MyClass my_obj;
	int sum;

	my_obj = new_my_class(10, 5);
	printf("Initial a: %d, b: %d\n", my_obj.a, my_obj.b);
	sum = my_obj.add_fields(&my_obj);
	printf("Sum of fields: %d\n", sum);
	my_obj.multiply_by_scalar(&my_obj, 3);
	printf("After scaling by 3 -> a: %d, b: %d\n", my_obj.a, my_obj.b);
	return 0;
}
