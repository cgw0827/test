#include "Message.h"
Message* getMessage(){
	Message* temp=(Message*)malloc(sizeof(Message));
	temp->what=0;
	temp->commandId=0;
	temp->obj=NULL;
	temp->free_func=free_message;
	return temp;
}
void free_message(void* msg){

	if (msg)
	{
		CCLOG("free_message~~~~~~~~~~~~~\n");
		Message* m=(Message*)msg;
		if (m->obj)
		{

			FREE_STRUCT(m->obj);
		}

	}
}