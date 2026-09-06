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
