.NH
Chapter 7. Structs
.LP
A struct is a type you invent that holds mixed data. We have been
carrying a name in one array and an age in another. That is a smell.
This is where
.CW people
becomes one type.
.PP
.ft I
people/ch7.c
.ft R
.P1
#include "common.h"

struct Person {
	char *name;
	int age;
	float height;
};

void
print_person(struct Person *p)
{
	printf("name: %s\en", p->name);
	printf("age: %d\en", p->age);
	printf("height: %.1f\en", p->height);
}

int
main(void)
{
	struct Person people[3];
	int i;
	int n;

	people[0].name = "Bob";
	people[0].age = 42;
	people[0].height = 5.8f;
	people[1].name = "Ann";
	people[1].age = 35;
	people[1].height = 5.5f;
	people[2].name = "Kid";
	people[2].age = 12;
	people[2].height = 4.2f;
	n = 3;
	for (i = 0; i < n; i++)
		print_person(&people[i]);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
name: Bob
age: 42
height: 5.8
name: Ann
age: 35
height: 5.5
name: Kid
age: 12
height: 4.2
.P2
.LP
.CW p->name
is
.CW (*p).name .
The arrow is how you talk to a struct through a pointer. The array
is still on the stack and still has a fixed length. We have not
earned
.CW malloc
yet. Next chapter we put one
.CW Person
on the heap.
.NH 2
Dot and arrow
.LP
The extra example is one person, then a pointer to him.
.PP
.ft I
person.c
.ft R
.P1
#include "common.h"

struct Person {
	char *name;
	int age;
	float height;
};

int
main(void)
{
	struct Person p1;
	struct Person *ptr;

	p1.name = "Bob";
	p1.age = 42;
	p1.height = 5.8f;
	printf("Name: %s\en", p1.name);
	printf("Age: %d\en", p1.age);
	printf("Height: %.2f\en", p1.height);
	ptr = &p1;
	printf("Pointer example: %s, age %d\en", ptr->name, ptr->age);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
Name: Bob
Age: 42
Height: 5.80
Pointer example: Bob, age 42
.P2
.LP
.CW typedef
is an alias. I use it when the extra
.CW struct
word starts to itch. You can write
.CW typedef struct Person Person
and then
Person p1 .
I still like seeing
.CW struct
in the spine. It reminds me I made the type.
.NH 2
A nested struct
.LP
Cars are a side road. The point is a struct inside a struct, passed
by pointer.
.PP
.ft I
car.c
.ft R
.P1
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
	printf("Car: %d %s %s\en", p->year, p->make, p->model);
	printf("Base Price: $%.2f\en", p->price.base);
	printf("Total Cost: $%.2f\en", p->price.total);
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
.P2
.PP
.ft I
Output:
.ft R
.P1
Car: 2024 Toyota Corolla
Base Price: $22000.00
Total Cost: $23800.50
.P2
.LP
Unions and fake OOP wait until chapter 11. The program we are
keeping is still
.CW people :
one struct, an array of them, a pointer into each slot.
