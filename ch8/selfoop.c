#include <stdio.h>

// Forward declaration of the struct so the function pointers can use it
typedef struct MyClass MyClass;

struct MyClass {
	/* Class fields */
	int a;
	int b;

	/* Class methods: Notice they now take a pointer to the object itself */
	int (*add_fields)(MyClass *self);
	void (*multiply_by_scalar)(MyClass *self, int factor);
};

/* The method implementation now manipulates the object's fields via 'self' */
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

/* 
 * Constructor function to cleanly instantiate the object and bind methods.
 * This prevents you from having to manually assign function pointers 
 * every single time you create an instance.
 */
MyClass
new_my_class(int initial_a, int initial_b)
{
	MyClass obj;
	obj.a = initial_a;
	obj.b = initial_b;
	
	/* Bind the implementations to the class instance */
	obj.add_fields = add_fields;
	obj.multiply_by_scalar = multiply_by_scalar;
	
	return obj;
}

int 
main(void)
{
	/* Create an instance using our constructor */
	MyClass my_obj = new_my_class(10, 5);

	printf("Initial a: %d, b: %d\n", my_obj.a, my_obj.b);

	/* 
	 * Call the method. We pass '&my_obj' as the 'self' parameter.
	 * Now the method knows exactly which instance's variables to add.
	 */
	int sum = my_obj.add_fields(&my_obj);
	printf("Sum of fields: %d\n", sum);

	/* 
	 * Call a mutating method. This actually changes the internal fields 
	 * of our specific 'my_obj' instance.
	 */
	my_obj.multiply_by_scalar(&my_obj, 3);
	printf("After scaling by 3 -> a: %d, b: %d\n", my_obj.a, my_obj.b);

	return 0;
}
