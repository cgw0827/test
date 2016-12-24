#include <stdio.h>
#include "./lib/headers.h"
int main(){
	List*li=new_list();
	for (int i = 0; i < 10; ++i)
	{
		push_list_front(li,getData("230",3));
	}
	
	void* data=pop_list_front(li);
	while(data!=NULL){
		printf("value  is %s\n", ((Data*)data)->bytes);
		data=pop_list_front(li);
	}
	FREE_LIST(li,Data)
	if (li==NULL)
	{
		printf("jlksjdljf;asdjf\n");
	}
	return 0;
}