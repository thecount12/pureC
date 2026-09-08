.NH
Unions and fake OOP
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
A tag, then a tiny tree
.LP
The smash is why you keep a tag. An
.CW enum
says which member is live. That pair is a tagged union. Compilers
store a program that way: a tree of nodes, each node a kind plus
a payload. I am not writing a compiler. I parse
.CW 12+35 ,
build three nodes, add them, free them. Depth one. No recursion.
.PP
.ft I
ast.c
.ft R
.P1
#include "common.h"

enum Kind {
	NUM,
	ADD
};

struct Node {
	enum Kind kind;
	union {
		int num;
		struct {
			struct Node *left;
			struct Node *right;
		} add;
	} u;
};

struct Node *
num_node(int n)
{
	struct Node *p;

	p = malloc(sizeof(*p));
	if (p == NULL)
		return NULL;
	p->kind = NUM;
	p->u.num = n;
	return p;
}

struct Node *
add_node(struct Node *left, struct Node *right)
{
	struct Node *p;

	p = malloc(sizeof(*p));
	if (p == NULL)
		return NULL;
	p->kind = ADD;
	p->u.add.left = left;
	p->u.add.right = right;
	return p;
}

int
number(char **s)
{
	int n;

	n = 0;
	while (**s >= '0' && **s <= '9') {
		n = n * 10 + (**s - '0');
		(*s)++;
	}
	return n;
}

struct Node *
parse(char *s)
{
	struct Node *left;
	struct Node *right;
	struct Node *t;

	left = num_node(number(&s));
	if (left == NULL)
		return NULL;
	if (*s != '+') {
		free(left);
		return NULL;
	}
	s++;
	right = num_node(number(&s));
	if (right == NULL) {
		free(left);
		return NULL;
	}
	t = add_node(left, right);
	if (t == NULL) {
		free(left);
		free(right);
		return NULL;
	}
	return t;
}

int
eval(struct Node *n)
{
	if (n->kind == NUM)
		return n->u.num;
	return n->u.add.left->u.num + n->u.add.right->u.num;
}

void
free_tree(struct Node *n)
{
	if (n->kind == ADD) {
		free(n->u.add.left);
		free(n->u.add.right);
	}
	free(n);
}

int
main(void)
{
	struct Node *t;
	char *text;

	text = "12+35";
	t = parse(text);
	if (t == NULL) {
		printf("parse failed\en");
		return 1;
	}
	printf("%s = %d\en", text, eval(t));
	free_tree(t);
	return 0;
}
.P2
.PP
.ft I
Output:
.ft R
.P1
12+35 = 47
.P2
.LP
.CW number
walks digits and advances the pointer.
.CW parse
wants one plus and two numbers. That is the whole language.
.CW eval
looks at
.CW kind
before it touches
.CW u .
Skip the tag and you are back to
.CW 1078523201 .
A real parser returns a deeper tree and
.CW eval
walks it. I will not write one.
.CW people
is still a list of records, not a language.
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
