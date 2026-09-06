.NH
Structs
.LP
I believe this makes up the core of C. A struct is a user defined type that holds mixed data types.
The most traditional example is circle. But we will go with a person.
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
int main() {
	struct Person p1 = {"Bob", 42, 5.8};
	printf("Name: %s\en", p1.name);
	printf("Age: %d\en", p1.age);
	printf("Height: %.2f\en", p1.height);
	struct Person *ptr = &p1;
	printf("Pointer example: %s, age %d\en", ptr->name, ptr->age);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.PP
Name: Bob
.PP
Age: 42
.PP
Height: 5.80
.PP
Pointer example: Bob, age 42
.br
\l'\n(.lu'
.br
.LP
You can also simplify the code just a little by adding typedef to the struct and restructure a few
things. To simplify you used typedef and 'keyword' name and "C" creates an alias to make the code cleaner and easier to read. 
It's commonly used with "struct" but can be used everywhere. 
.LP
.P1
#include "common.h"
typedef struct Person Person;
struct Person {
	char *name;
	int age;
	float height;
};
int main() {
	Person p1 = {"Bob", 42, 5.8};
	printf("Name: %s\en", p1.name);
	printf("Age: %d\en", p1.age);
	printf("Height: %.2f\en", p1.height);
	Person *ptr = &p1;
	printf("Pointer example: %s, age %d\en", ptr->name, ptr->age);
	return 0;
}
.P2
.LP
This next example will utilize car strcture with embedding price. We are now going to pass structure
by pointer to a function because its just easier and cleaner.
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
main()
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
.PP
Car: 2024 Toyota Corolla
.PP
Base Price: $22000.00
.PP
Total Cost: $23800.50
.br
\l'\n(.lu'
.br
.PP
.LP
Unions can be useful but I rarely use them. But useful for building compilers and network packets. 
They share the same memory. Lets look at this example.
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
main()
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
.PP
.ft I
Output:
.ft R
.PP
data.num: 42
.PP
data.myPi: 3.14
.PP
data.c: A
.PP
check previous data.num: 1078523201
.br
\l'\n(.lu'
.br
.PP
As you can see above the members affect each other becasue they occupy the same memory. Integer and
float consume 4 bytes while character consumes 1 byte. You could easily increaste the size of
the "char" as follows: "char str[20];" and now you have a union with 20 bytes being the size of
the largest member. 
.NH 2
OOP
.LP
Well its fake OOP. The pointer to a struct is the same as a pointer to the first element of the struct. Let's experiment
with the following. 
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
	print("Name: %s, Age: %d\n", p->name, p->age);
}
void 
print_student(struct Student *s)
{
	print("Student: %s | Major: %s | GPA: %.2f\n", s->base.name, s->major, s->gpa);
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
.PP
Student: Bob Jones | Major: Mathematics | GPA: 3.70
.PP
Name: Bob Jones, Age: 21
.PP
Name: Bob Jones, Age: 21
.br
\l'\n(.lu'
.br
.LP
The "Person" struct is the "base" class, and "Student" struct is the Derived class. You must have "Person base"
named in the derived class. "print_person" is the base class method and "print_student" is the derived class method.
Let's go deeper and "self" pointer features similart to C++.
