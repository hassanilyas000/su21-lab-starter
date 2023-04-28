#include <stdio.h>
#include <stdlib.h>

int mystrlen(char* str) {
    int count=0;
    while(*str != '\0')
    {
        count++;
        str++;
    }
    return count;
    
}


int main(int argc, char **argv) {

    int counter;
    char s[]= "I am a programmer.";
    counter=mystrlen(s);
    printf("String length: %d \n",counter);
}