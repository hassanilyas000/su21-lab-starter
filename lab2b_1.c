
#include <stdio.h>
#include <stdlib.h>

typedef struct student{
int id;
int age;
char *name;
}student;

void print(student *s){
printf("Name:%s\n",s->name);
printf("Age:%d\n",s->age);
printf("Id:%d\n",s->id);

}


int main(int argc, char **argv) {
student s1;
s1.name="Hassan";
s1.age=21;
s1.id=5218593;
print(&s1);

}
