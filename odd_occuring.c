#include <stdio.h>
#include <stdlib.h>

void odds(int *arr){
    int var=arr[0];
    for(int i=1;i<7;i++)
    {
        var=var^arr[i];
    };
   // var=arr[0]^arr[1]^arr[2]^arr[3]^arr[4]^arr[5]^arr[6];

    printf("Odd element: %d \n",var);
}

int main(int argc, char **argv) {

int array[] = {12, 12, 14, 90, 14, 14, 14};

odds(array);

}