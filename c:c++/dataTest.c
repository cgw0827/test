#include "lib/headers.h"
List* list;
char* loginServerIp ="192.168.1.21";
int loginServerPost = 39000;
Encryption* encryption_;

Socket* currentSocket_;
int send_commandID=200001;
List* revMessageList_;
unsigned char* encryptionMessage(int commandId, unsigned char* data, int len)
{
    CCLOG("encryptionMessage commandId is %d\n",commandId);
    if (encryption_ && commandId != 388851) {
        myencrypt(encryption_ ,(char *)data, len);
    }
    return data;
}
void sendTestMessage(){
    Message *msg = (Message*)list_begin(list);
    pop_list_front(list);
    FREE_STRUCT(msg);
}
int main(){
	list=new_List(STRUCT);
    char *out ;
    cJSON *root,*fmt;
    root=cJSON_CreateObject();
    cJSON_AddStringToObject(root, "name","cgwooi");
    cJSON_AddStringToObject(root,"pwd", "aaaaaa");
    cJSON_AddStringToObject(root,"uuid", "hajklsdhfklhadshfjklahsd");
    cJSON_AddStringToObject(root,"ip", loginServerIp);
    cJSON_AddNumberToObject(root,"envID",        1);



    out=cJSON_Print(root);
    // printf("len  is %lu %s\n",strlen(out),out);

    Data* data = dataWithBytes(out);
	Data* sendData_ =newData();
	appendBytes(sendData_,encryptionMessage(send_commandID, (unsigned char *)data->bytes, data -> len), data->len);
	// Data* data=dataWithBytes("abcdefghijklmn");
	// char * b=data->bytes;
	CCLOG("dataasdfasdfsdddddddd 1 %s",sendData_->bytes);
 //    Data* data2=dataWithBytes("Hello");
	// getData2(data,data2);
    
    // appendData(data,data2);
    // CCLOG("data 12 %s\n",data->bytes);

 //    Message* message = getMessage();
 //    Data* data3 =getData("123456789",9);
 //    message -> obj = data3;
 //    push_list_front(list,message);
	// FREE_STRUCT(data);
	// FREE_STRUCT(data2);
	// FREE_STRUCT(message);
	// FREE_POINTER(data);
	// FREE_POINTER(b);
	// sendTestMessage();
	return 0;
}