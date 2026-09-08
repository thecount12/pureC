.NH
Chapter 11. Unions and fake OOP
.LP
The spine does not need this chapter. A
.CW Person
is one layout. I am putting the leftover toys here so they do not
sit on top of structs again.
.NH 2
Unions
.LP
A union is a struct that lies. The members share one piece of
memory. Write one, and the others are whatever bits you just left
there.
.PP
.ft I
my_union.c
.ft R
.P1
#include "common.h"
union Packet {
	int num;
	float myPi;
	char c;
};
int
main(void)
{
	union Packet data;
	data.num = 42;
	printf("data.num: %d\en", data.num);
	data.myPi = 3.14;
	printf("data.myPi: %.2f\en", data.myPi);
	data.c = 'A';
	printf("data.c: %c\en", data.c);
	printf("check previous data.num: %d\en", data.num);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
data.num: 42
data.myPi: 3.14
data.c: A
check previous data.num: 1078523201
.P2
.LP
.CW 1078523201
is not a mystery. It is the integer view of the last write. I
rarely want a union. Compilers and packets do. If you grow the
.CW char
to
.CW char str[20] ,
the union is 20 bytes. Size of the largest member.
.NH 2
A struct at the front
.LP
The pointer to a struct is the pointer to its first member. Put a
.CW Person
at the front of a
.CW Student
and you can treat the student as a person. That is the whole trick.
.PP
.ft I
fakeoop.c
.ft R
.P1
#include "common.h"
struct Person {
	char *name;
	int age;
};
struct Student {
	struct Person base;
	char *major;
	double gpa;
};
void
print_person(struct Person *p)
{
	printf("Name: %s, Age: %d\en", p->name, p->age);
}
void
print_student(struct Student *s)
{
	printf("Student: %s | Major: %s | GPA: %.2f\en",
		s->base.name, s->major, s->gpa);
}
int
main(void)
{
	struct Student s = {{"Bob Jones", 21}, "Mathematics", 3.7};
	print_student(&s);
	print_person((struct Person *)&s);
	print_person(&s.base);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Student: Bob Jones | Major: Mathematics | GPA: 3.70
Name: Bob Jones, Age: 21
Name: Bob Jones, Age: 21
.P2
.LP
The cast and
.CW &s.base
print the same thing because
.CW base
is first. Reorder the fields and the cast is a bug. That is the
layout half of fake OOP. Methods are the other half: a function
pointer on the struct, and you pass the struct itself as the first
argument. C++ hides that pointer and calls it
.CW this .
We write
.CW self
and we pass it. I bind the pointers once in a small constructor so
I do not forget.
.PP
.ft I
selfoop.c
.ft R
.P1
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
	printf("Initial a: %d, b: %d\en", my_obj.a, my_obj.b);
	sum = my_obj.add_fields(&my_obj);
	printf("Sum of fields: %d\en", sum);
	my_obj.multiply_by_scalar(&my_obj, 3);
	printf("After scaling by 3 -> a: %d, b: %d\en", my_obj.a, my_obj.b);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Initial a: 10, b: 5
Sum of fields: 15
After scaling by 3 -> a: 30, b: 15
.P2
.LP
.CW my_obj.add_fields
is just a pointer I stored.
.CW add_fields(&my_obj)
would do the same work. The
.CW my_obj.
in front does not sneak in a hidden
.CW this .
You still pass
.CW &my_obj .
Put both tricks in one struct and you have a class: data at the
front, methods as pointers, a
.CW self
you pass yourself. That is enough pretend C++. The program we kept
is
.CW people ,
not a class. Next chapter is the header swap I have been postponing.
