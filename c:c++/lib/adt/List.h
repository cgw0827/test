#ifndef C_LIST_H_
#define C_LIST_H_
#include "LinkList.h"
typedef struct 
{
	int size;
	LinkList* list;
	FREE_FUNC free_func;
}List;

List* new_list();
int  list_size(List* list);
void push_list_front(List* list,void* data);
void push_list_back(List* list,void* data);
void* pop_list_front(List* list);
void* pop_list_back(List* list);
void free_list(void* list);
void display_list(List* list);
void* list_begin(List* list);
#endif