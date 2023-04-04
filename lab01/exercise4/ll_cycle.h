#ifndef LL_CYCLE_H
#define LL_CYCLE_H
#include <stdio.h>
#include <stdlib.h>

typedef struct node {
    int value;
    struct node *next;
} node;

int ll_has_cycle(node *);

#endif // LL_CYCLE_H
