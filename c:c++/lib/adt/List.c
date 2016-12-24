#include "List.h"
#include "LinkList.h"
List* new_list(){
	List* list=(List*)malloc(sizeof(List));
	list->size=0;
	list->list=new_linkList();
	list->free_func=free_list;
	return list;
}
int  list_size(List* list){
	return list->size;
}

void push_list_front(List* list,void* data){
	insert_first(list->list,data);
	list->size++;
}
void push_list_back(List* list,void* data){
	insert_last(list->list,data);
	list->size++;
}
void* list_begin(List* list){
	Node* temp=link_first(list->list);
	if (temp)
	{
		return temp->data;
	}
	return NULL;
}
void* pop_list_front(List* list){
	if (list&&list_size(list)>0)
	{
		list->size--;
		return delete_first(list->list);
	}
	return NULL;
}
void* pop_list_back(List* list){
	if (list_size(list)>0)
	{
		list->size--;
		return delete_last(list->list);
	}
	return NULL;
}
void display_list(List* list){

}
void free_list(void* l){
	if (l)
	{
		List* temp=(List*)l;
		if (temp->list)
		{
			FREE_STRUCT(temp->list);
		}
	}
}