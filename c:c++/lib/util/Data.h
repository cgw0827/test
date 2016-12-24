#ifndef DATA_H_
#define DATA_H_
#include <string.h>
typedef struct 
{
	 char* bytes;
	 int len;
	 FREE_FUNC free_func;
}Data;
Data* newData();
Data* getData2(Data *pData);
Data* getData(const void*msg,int len);
Data* dataWithBytes(const char*msg);
Data* dataWithBytesLen(const void* b,int length);
void appendData(Data* old,Data* other);
void appendBytes(Data*old,const void* bytes,int length);
void free_data(void* data);
#endif