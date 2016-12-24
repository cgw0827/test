#include "tools.h"
#include <stdarg.h>
void swap(int *x ,int *y){
    int temp=*x;
    *x=*y;
    *y=temp;
}
void sortHarf(int list[],int n){
    int i,j,min,temp;
    for (i=0;i<n-1;i++){
        min=i;
        for(j=i+1;j<n;j++){
	    if(list[j]<list[min]){
	        min=j;
	    }
	}
	swap(&list[i],&list[min]);
	//SWAP(list[i],list[min],temp);//宏定义的本质就是替换文本。
    }
}
int compare(int x,int y){
    if(x<y) return -1;
    else if(x==y) return 0;
    else return 1;
}
int binSearch(int list[],int value,int left,int right){
	int mid;
	while(left<=right){
		mid=(left+right)/2;
		//printf("mid is %d  value is %d \n",mid,list[mid]);
		//int result=COMPARE(list[mid],value);
	   	int result=compare(list[mid],value);
		//printf("result is  %d \n",result);
		switch(result){
		    case -1:left=mid+1;
		        break;
		    case 0: return mid;
		    case 1: right=mid-1;
			break;
		}
	}
	return -1;
}
static const int kMaxLogLen = 16*1024;
void CCLOG(const char * pszFormat, ...)
{
    printf("test: ");
    char szBuf[kMaxLogLen+1] = {0};
    va_list ap;
    va_start(ap, pszFormat);
    vsnprintf(szBuf, kMaxLogLen, pszFormat, ap);
    va_end(ap);
    printf("%s", szBuf);
    printf("\n");
}
