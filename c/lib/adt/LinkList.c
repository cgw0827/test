#include "LinkList.h"
ListIterator* new_link_iterator(LinkList* list){
	ListIterator* temp=(ListIterator*)malloc(sizeof(ListIterator));
	temp->ourList=list;
	temp->free_func=free_link_iterator;
	reset_link_iterator(temp);
	return temp;
}
void reset_link_iterator(ListIterator* iter){
	iter->current=link_first(iter->ourList);
	iter->pre=NULL;
}
void free_link_iterator(void* iter){
}
int end_link_iterator(ListIterator* iter){
	if (iter->current->next==NULL)
	{
		/* code */
		return 1;
	}
	return 0;
}
void next_link_iterator(ListIterator* iter){
	iter->pre=iter->current;
	iter->current=iter->current->next;
}
void* current_link_iterator(ListIterator* iter){
	return iter->current->data;
}

static Node* new_node(void* data){
   Node* temp=(Node*)malloc(sizeof(Node));
   temp->data=data;
   temp->next=NULL;
   temp->pre=NULL;
   temp->free_func=free_node;
   return temp;
}
void free_node(void* node){
	CCLOG("free_node~~~~~~");
}
LinkList* new_linkList(){
	LinkList* temp=(LinkList*)malloc(sizeof(LinkList));
	temp->first=NULL;
	temp->last=NULL;
	temp->free_func=free_linkList;
	return temp;
}
void free_linkList(void* list){

}
void* find(LinkList* list,void*data){
	Node* current=list->first;
	while(current->data!=data){
		if (current->next==NULL)
		{
			return NULL;
		}else{
			current=current->next;
		}
	}
	return current->data;
}
void* delete_key(LinkList* list,void*key){
	Node* current=list->first;
	while(current->data!=key){
		current=current->next;
		if (current==NULL)
		{
			return NULL;
			/* code */
		}
	}
	if (current==list->first)
	{
		/* code */
		list->first=current->next;
	}else{
		current->pre->next=current->next;
	}
	if (current==list->last)
	{
		/* code */
		list->last=current->pre;
	}else{
		current->next->pre=current->pre;
	}
	void* value=current->data;
	FREE_POINTER(current);
	return value;
}
void* delete(LinkList* list,void*data){
	Node* current=list->first;
	Node* pre=list->first;
	while(current->data!=data){
		if (current->next==NULL)
		{
			return NULL;
		}else{
			pre=current;
			current=current->next;
		}
	}
	if (current==list->first)
	{
		list->first=list->first->next;
	}else{
		pre->next=current->next;
	}
	void* value=current->data;
	FREE_POINTER(current);
	return value;
}
void insert_first(LinkList* list,void* data){
     Node* temp=new_node(data);
     if (is_empty(list))
     {
     	list->last=temp;
     }else{
     	list->first->pre=temp;
     }
     temp->next=list->first;
     list->first=temp;
}
void insert_last(LinkList* list,void*data){
	Node* temp=new_node(data);
	if (is_empty(list))
	{
		list->first=temp;
	}else{
		list->last->next=temp;
		temp->pre=list->last;
	}
	list->last=temp;
}
int is_empty(LinkList* list){
	if(list->first==NULL){
		return 1;
	}else {
		return 0;
	}
}
void* link_first(LinkList* list){
	return list->first->data;
}
void* delete_first(LinkList* list){
	Node* temp=list->first;
	if (list->first->next==NULL)
	{
		list->last=NULL;
	}else{
		list->first->next->pre=NULL;
	}
	list->first=list->first->next;
	void* value=temp->data;
	FREE_POINTER(temp);
	return value;
}
void* delete_last(LinkList* list){
	Node* temp=list->last;
	if (list->first->next==NULL)
	{
		list->first=NULL;
	}else{
		list->last->pre->next=NULL;
	}
	list->last=list->last->pre;
	void* value=temp->data;
	FREE_POINTER(temp);
	return value;
}
void display_link_list(LinkList* list){
	Node*current=list->first;
	while(current!=NULL){
		current=current->next;
	}
}
int insert_after(LinkList* list,void*key,void* data){
	Node* current=list->first;
	while(current->data!=key){
		current=current->next;
		if (current==NULL)
		{
			/* code */
			return 0;
		}
	}
	Node* temp=new_node(data);
	if (current==list->last)
	{
		temp->next=NULL;
		list->last=temp;
	}else{
		temp->next=current->next;
		current->next->pre=temp;
	}
	temp->pre=current;
	current->next=temp;
	return 1;

}