#include "Data.h"
#include "BinaryDataUtils.h"
Data* getData(const void*msg,int len){
	Data* temp=(Data*)malloc(sizeof(Data));
	temp->bytes=(char*)malloc(sizeof(char)*(len+1));
	memcpy((void *)temp-> bytes,msg, len);
    temp->bytes[len]='\0';
	temp->len=len;
    temp->free_func=free_data;
	return temp;
}
Data* getData2(Data *pData)
{
    int len=pData->len;
    return getData(pData->bytes,len);
}
void free_data(void* data){
    if (data)
    {
        CCLOG("free_data~~~~~~~~~~~~~");
        Data* temp=(Data*)data;
        if (temp->bytes)
        {
           
           FREE_POINTER(temp->bytes);
        }
        
        // FREE_POINTER(temp);
    }
}
Data* newData(){
	Data* temp=(Data*)malloc(sizeof(Data));
	temp->len=0;
    temp->bytes=NULL;
    temp->free_func=free_data;
	return temp;
}
Data* dataWithBytes(const char* bytes)
{
    int length = strlen(bytes);
    if (length>0)
    {
        Data * tData =getData(bytes, length);
        return tData;
    }else{
        return NULL;
    }
}
Data* dataWithBytesLen(const void* bytes,int length){
    
    // char*  temp=(char*)malloc(sizeof(char)*length);
    
    // memcpy(temp, bytes, length);
    
    Data * tData =getData(bytes, length);
    // tData->autorelease();
    // FREE_POINTER(temp);
    return tData;
}
void appendData(Data* old,Data* other){
    
    if(!other)
        return;
    if(other->len==0)
        return;
    if(old->len == 0)
    {
        old->len = other->len;
        FREE_POINTER(old->bytes);
        // char* temp = new char[m_nSize];
        // memcpy(temp, other->getBytes(), m_nSize);
        // CC_SAFE_DELETE_ARRAY(m_pBytes);
        old->bytes=(char*)malloc(sizeof(char)*(old->len+1));
        
        memcpy(old->bytes,other->bytes,old->len);
        old->bytes[old->len]='\0';
        // CC_SAFE_DELETE_ARRAY(temp);
        return ;
    }
    // printf("old len is %d other len is %d\n",old->len,other->len);
    // printf("old->bytes  -- %s\n",old->bytes );
    // printf("other->bytes is %s\n",other->bytes );
    char* temp =(char*)malloc(sizeof(char)*(old->len+other->len));
    memcpy(temp, old->bytes, old->len);
    memcpy(temp+old->len, other->bytes, other->len);
    old->len = old->len+other->len;
    
    FREE_POINTER(old->bytes);
    old->bytes=(char*)malloc(sizeof(char)*(old->len+1));
    memcpy(old->bytes,temp,old->len);
    FREE_POINTER(temp);
    old->bytes[old->len]='\0';
     // printf("newData ->bytes is %s\n",old->bytes );
}
void appendBytes(Data*old,const void* bytes,int length){
    if(length==0)
        return;
    else
        if(old->len==0)
        {
            old->len = length;
            FREE_POINTER(old->bytes);
            old->bytes =(char*)malloc(sizeof(char)*(old->len+1));
            
            memcpy(old->bytes,bytes,old->len);
            old->bytes[old->len]='\0';
            // CC_SAFE_DELETE_ARRAY(temp);
            return;
        }else{
            // printf("new data111 is %s\n",bytes);
            // printf("oldLen is %d  length is %d\n",old->len,length);
            char* temp =(char*)malloc(sizeof(char)*(old->len+length));
            memcpy(temp, old->bytes, old->len);
            memcpy(temp+old->len, bytes, length);
            old->len = old->len+length;
            FREE_POINTER(old->bytes);
            old->bytes =(char*)malloc(sizeof(char)*(old->len+1));
            memcpy(old->bytes,temp,old->len);
            old->bytes[old->len]='\0';
            // printf("new data222 is %s\n",old->bytes);
            FREE_POINTER(temp);
        }
}
