#include <stdlib.h>
#include <stdio.h>
#include <string.h>
const char* hello="hello world!";
typedef void (*FREE_FUNC)(void* obj);
typedef struct
{
    char * data;
    FREE_FUNC free_func;
}Test;
void free_test(void* obj){
    if(obj){
      	Test* temp=(Test*)obj;
        if(temp->data){
    	    free(temp->data);
          temp->data=NULL;
      	}
      	free(temp);
    }
}
#define FREE_OBJ(obj) if(obj){\
    if(obj->free_func){\
      obj->free_func(obj);\
    }else{\
      free(obj);\
    }\
    (obj)=NULL;\
  }

Test* new_test_str(const char* str){
   Test* temp=(Test*)malloc(sizeof(Test));
   int len=(int)strlen(str);
   printf("len is %d\n",len);
   temp->data=(char*)malloc(sizeof(char)*(len+1));
   strncpy(temp->data,str,len);
   temp->data[len]='\0';
   printf("temp->data is %s\n",temp->data);
   temp->free_func=free_test;
   return temp;
}
Test* new_test(){
   Test* temp=(Test*)malloc(sizeof(Test));
   temp->data=NULL;
   temp->free_func=NULL;
   return temp;
}
int main(){
  Test* temp=new_test_str(hello);
  FREE_OBJ(temp);
  return 0;
}
