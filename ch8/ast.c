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
		printf("parse failed\n");
		return 1;
	}
	printf("%s = %d\n", text, eval(t));
	free_tree(t);
	return 0;
}
