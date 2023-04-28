#include <stdio.h>
#include <stdlib.h>

void swap(int *x, int *y) {
    // Add code here
    int temp;
    temp=*x;
    *x=*y;
    *y=temp;
}

int main(int argc, char **argv) {
    int a=5;
    int b=11;
    printf("Before func call: %d , %d \n" , a,b);
    swap(&a,&b);
    printf("After func call: %d , %d \n" , a,b);
}
