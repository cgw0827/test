#ifndef LINK_LIST_H_
#define LINK_LIST_H_
#include <stdio.h>
#include <stdlib.h>
#include "../FrameWork.h"
typedef struct link
{
	void* data;//这里的data必须是struct 或者是union
	struct link* next;
	struct link* pre;
	FREE_FUNC free_func;
}Node;
typedef struct 
{
	Node* first;
	Node* last;
	FREE_FUNC free_func;
}LinkList;
typedef struct 
{
	Node* current;
	Node* pre;
	LinkList* ourList;
	FREE_FUNC free_func;
}ListIterator;

ListIterator* new_link_iterator(LinkList* list);
void reset_link_iterator(ListIterator* iter);
int end_link_iterator(ListIterator* iter);
void next_link_iterator(ListIterator* iter);
void free_link_iterator(void* iter);
void* current_link_iterator(ListIterator* iter);

static Node* new_node(void* data);
LinkList* new_linkList();
void* find(LinkList* list,void*data);
void* delete(LinkList* list,void*data);
void insert_first(LinkList* list,void* data);
void insert_last(LinkList* list,void*data);
int is_empty(LinkList* list);
void* delete_first(LinkList* list);
void* delete_last(LinkList* list);
void display_link_list(LinkList* list);
int insert_after(LinkList* list,void*key,void* data);
void free_linkList(void* list);
void free_node(void* Node);

void* link_first(LinkList* list);
#endif