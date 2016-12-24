#include <stdio.h>
#include <string.h>

void setArray(int a[],int len ){
	for (int i = 0; i < len; ++i)
	{
		/* code */
		a[i]=i+20;
	}
}
int main(){
	char d[100]="C program";
	char e[]="is very foolish";
	int elen=strlen(e);
	printf("elen is %d\n",elen );
    strcat(d,e);// d's len  must be large than d+e
    printf("d value is %s\n", d); 
    char str1[15],str2[]="C language";
    strcpy(str1,str2);
    int k=strcmp(d,e);
    printf("result is %d\n",k );

    int a[10]={};
    for (int i = 0; i < 10; ++i)
    {
    	/* code */
    	printf(" a value is %d\n",a[i] );
    }
    setArray(a,10);
    for (int i = 0; i < 10; ++i)
    {
    	/* code */
    	printf(" a 2 value is %d\n",a[i] );
    }
	return 0;
}