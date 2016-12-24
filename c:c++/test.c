#include <stdio.h>
#include <string.h>
#include "test.h"

char* loginServerIp ="192.168.1.21";
int loginServerPost = 39000;

Encryption* encryption_=NULL;

Socket* currentSocket_;

List* revMessageList_;


unsigned char* encryptionMessage(int commandId, unsigned char* data, int len)
{
    CCLOG("encryptionMessage commandId is %d\n",commandId);
    if (encryption_ && commandId != 388851) {
        myencrypt(encryption_ ,(char *)data, len);
    }
    return data;
}
void connection_socket(char* host_, int port_){
    if (currentSocket_) {
        return;
    }else{
    	currentSocket_ =new_socket(encryptionMessage,onMessage);
    }
    
    CCLOG("ip: %s,port:%d\n",host_,port_);
    init_socket(currentSocket_,host_, port_);
}
void createEncryption(const char* seed)
{
    if (encryption_) {
        FREE_STRUCT(encryption_);
    }
    encryption_ = getEncryption(seed);
}

void sendMessageData(int commandId, Data* data)
{
    // CCLOG("data is %s\n",data->bytes);
    PackageHead* packageHead =getDefaultPackageHead(commandId, data->len, 1);
    Data* sendData_ =getData2(packageHead->data);
    // getData2(sendData_,packageHead->data);
    // for (int i = 0; i < sendData_->len; ++i)
    // {
    //    printf("value is %d\n",sendData_->bytes[i]);
    // }

    appendBytes(sendData_,encryptionMessage(commandId, (unsigned char *)data->bytes, data -> len), data->len);
    // CCLOG("appendBytes sendDta is %s\n",sendData_->bytes);
    send_socket_data(currentSocket_,commandId, (char *)sendData_ -> bytes, sendData_->len);
    
    FREE_STRUCT(sendData_);
    FREE_STRUCT(packageHead);
}
void loginWorld(){
    int commandID=200021;
}
void login(){
    int send_commandID=200011;
    char *out ;
    cJSON *root,*fmt;
    root=cJSON_CreateObject();
    cJSON_AddStringToObject(root, "name","cgwooi");
    cJSON_AddStringToObject(root,"pwd", "aaaaaa");
    cJSON_AddNumberToObject(root,"envID",1);



    out=cJSON_Print(root);
    // printf("len  is %lu %s\n",strlen(out),out);

    Data* data = dataWithBytes(out);
    if (data)
    {
        sendMessageData(send_commandID,data);
        FREE_STRUCT(data);
    }
    free(out);   
    cJSON_Delete(fmt); 
    cJSON_Delete(root); 

}
void onMessage(Message* message){
    // CCLOG("onMessage=+++++++ message -> what   %d\n",message -> what);
    if (message->obj&&message->obj->bytes)
    {
      // CCLOG("onMessage=+++++ message -> content  %s\n",message->obj->bytes);
    }
    
    switch (message -> what) {
        case CS_MSG_TO_UITHREAD_OPEN:
            CCLOG("socket open");
            break;
        case CS_MSG_TO_UITHREAD_ERROR:
            CCLOG("socket error");
            break;
        case CS_MSG_TO_UITHREAD_CLOSE:
            CCLOG("socket close");
            break;
        case CS_MSG_TO_UITHREAD_MESSAGE:
            CCLOG("recive message");
            doMessage(message);
            break;
    }
}
void doMessage(Message* message){
    CCLOG(" msg ---- commandID %d",message->commandId);
    switch(message->commandId){
        case 300011:

        break;
        case 388851:
            doSeed(message->obj->bytes);
            login();
        break;

    }
}
void doSeed(char* jsonStr){
    cJSON *root;
    root = cJSON_Parse(jsonStr);     
    char* seed=cJSON_GetObjectItem(root,"seed")->valuestring;
    createEncryption(seed);
    cJSON_Delete(root);

}
int main(){
	connection_socket(loginServerIp,loginServerPost);  
    while(!currentSocket_->needQuit_||list_size(currentSocket_->revMessageList_)!=0){
        revMessageUpdate(currentSocket_);
        sleep(1);
    }
    // }
    return 0;
}
