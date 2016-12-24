#ifndef MESSAGE_H_
#define MESSAGE_H_
#include "../FrameWork.h"
typedef struct 
{
    unsigned int what;
    int commandId;
    Data *obj;
    FREE_FUNC free_func;
}Message;

Message* getMessage();
void free_message(void* msg);
#endif