#include <stdio.h>
int main(){
	int a[3][4]={{1,3,5,7},{9,11,13,15},{17,19,21,23}};
	int * p =a+1;
	int *d=&a[1];
	int *h=a[1];
	int *f=*(a+1);
	printf("f==%p \n",f);
	printf("d==%p \n",d);
	printf("p==%p \n",p);
	printf("h==%p \n",h);
	return 0;
}
