#ifndef DATA_READ_TOOL_H_
#define DATA_READ_TOOL_H_
#include "Data.h"
typedef struct 
{
	/* data */
	Data* data;
	int skip;
	FREE_FUNC free_func;
}DataReadTool;
DataReadTool* newDataReadTool(Data* data);
unsigned char data_read_byte(DataReadTool*stream);
int data_read_int(DataReadTool*stream);
short data_read_short(DataReadTool*stream);
void free_read_tool(void* read);
#endif