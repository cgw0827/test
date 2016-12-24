#include "DataReadTool.h"
#include "BinaryDataUtils.h"
DataReadTool* newDataReadTool(Data* data){
	DataReadTool* temp=(DataReadTool*)malloc(sizeof(DataReadTool));
	temp->data=data;
	temp->skip=0;
    temp->free_func=free_read_tool;
	return temp;
}
void free_read_tool(void* read){
    CCLOG("free_read_tool~~~~~~~~~~~~~");
    // if (read)
    // {
    //     DataReadTool* tool=(DataReadTool* )read;

    //     if(tool->data){
    //         FREE_STRUCT(tool->data);
    //     }
    //     // FREE_POINTER(tool);
    //     /* code */
    // }
}
unsigned char data_read_byte(DataReadTool*stream)
{
    char* buffer = (char*)stream->data->bytes;
    unsigned char num = buffer[stream->skip];
    stream->skip++;
    return num;
}

int data_read_int(DataReadTool*stream){
   char* buffer = (char*)stream->data->bytes;
    int num = 0;
    num = byte_to_int(buffer,stream->skip);
    stream->skip += 4;
    return num;
}
short data_read_short(DataReadTool*stream){
    char* buffer = (char*)stream->data->bytes;
    short num = 0;
    num = byte_to_short(buffer,stream->skip);
    stream->skip+= 2;
    return num;
}