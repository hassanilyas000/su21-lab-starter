#include <stdio.h>
#include <stdlib.h>

static inline int counter(int count)
{
    count++;
    return count;
}



int main(int argc, char **argv) {
    int count=0;
    count=counter(count);
    count=counter(count);
    printf("count=%d\n",count);
}
