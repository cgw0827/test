#include "Socket.h"
Socket* new_socket(ENCRYP_FUNC func,MSG_FUNC msg_func){
    Socket*temp=(Socket*)malloc(sizeof(Socket));
    temp->host_=NULL;
    temp->needQuit_=false;
    temp->port_=0;
    temp->state=kStateClosed;
    temp->socket_=0;
    temp->isCanSendMessage_=true;
    temp->currentMessageId_=0;
    temp->revMessageList_=new_list();
    temp->sendMessageList_=new_list();
    temp->func=func;
    temp->msg_func=msg_func;
    temp->free_func=free_socket;
    // pthread_mutex_init(&temp->sendMessageListLock, NULL);
    // pthread_mutex_init(&temp->revMessageListLock, NULL);
    return temp;
}
void free_socket(void* socket){
    if (socket)
    {
        Socket* soc=(Socket*)socket;
        FREE_LIST(soc->revMessageList_,Message);
        FREE_LIST(soc->sendMessageList_,Message);
        /* code */
    }
}
bool init_socket(Socket*soc,const char* host, int post)
{
    soc->host_ = host;
    soc->port_ = post;
    open_socket_thread(soc);
    return true;
}
void open_socket_thread(Socket* soc){

    if (soc==NULL)
    {
        CCLOG("soc is  NULL");
        /* code */
    }else{
        CCLOG("soc is ok");
    }
    pthread_t tid1,tid2;
    pthread_attr_t sendAttr;
    pthread_attr_init(&sendAttr);
    int result=pthread_create(&tid1, &sendAttr, sendThreadLoop, soc);
    if (result!=0)
    {
       CCLOG("sendThread_ create fail !");
    }
    pthread_attr_t revAttr;
    pthread_attr_init(&revAttr);
    result=pthread_create(&tid2, &revAttr, recvThreadLoop, soc);
    if (result!=0)
    {
       CCLOG("recvThread_ create fail !");
    }
}
void closeSocket(Socket*soc)
{
    Message *message =getMessage();
    message -> what = CS_MSG_TO_UITHREAD_CLOSE;
    addMessageToList(soc,soc->revMessageList_, message);
    soc->needQuit_ = true;
    close(soc->socket_);
}
void* recvThreadLoop(void *arg)
{
    CCLOG("recvThreadLoop");
    Socket*socket = (Socket *)arg;
    revLoop(socket);
    revMessageUpdate(socket);
    return NULL;
}
void* sendThreadLoop(void *arg)
{
    CCLOG("sendThreadLoop");
    Socket* socket = (Socket*)arg;
    sendLoop(socket);
    return NULL;
}
void revMessageUpdate(Socket*socket)
{
        
    // CCLOG("revMessageList_ size is %d",list_size(socket->revMessageList_));
    pthread_mutex_lock(&revMessageListLock);
    if (list_size(socket->revMessageList_)== 0) {
        pthread_mutex_unlock(&revMessageListLock);
        // CCLOG("revMessageUpdate return");
        return;
    }
    CCLOG("revMessageUpdate %d",list_size(socket->revMessageList_));
    Message* msg=( Message*)pop_list_front(socket->revMessageList_);
    // pop_list_front(socket->revMessageList_);
    pthread_mutex_unlock(&revMessageListLock);
    
    endCheckMessage(socket,msg -> commandId);
    socket->msg_func(msg);
    FREE_STRUCT(msg);


}
void send_socket_data(Socket*socket,int commandId, const char *msg, unsigned int len)
{
    Message* message = getMessage();
    Data* data =getData((const void*)msg,len);
    message -> commandId = commandId;
    message -> obj = data;
    message -> what = CS_MSG_TO_SUBTRHEAD_SENDING;
    addMessageToList(socket,socket->sendMessageList_, message);
}
bool sendMessage(Socket*socket,const char *msg, unsigned int len)
{
    int bytes;
    int count = 0;

    while (count < len) {
        bytes = send(socket->socket_, msg + count, len - count, 0);
        if (bytes == -1 || bytes == 0) {
            return false;
        }
        count += bytes;
    }
    
    return true;
}
void startCheckMessage(Socket*socket,int commandId)
{
    // if (delegate_ -> getMessageArray(commandId)) {
    //     setCurrentMessageId(socket,commandId);
    // }
}
void endCheckMessage(Socket*socket,int commandId)
{
    // if (socket->currentMessageId_ != 0) {
    //     if (commandId == 399998) {
    //         clearCurrentMessageId(socket);
    //     } else {
    //         CCArray *messageArray = delegate_ -> getMessageArray(currentMessageId_);
    //         CCObject *object = NULL;
    //         CCARRAY_FOREACH(messageArray, object)
    //         {
    //             int messageId = ((CCString *)object) -> intValue();
    //             if (messageId == commandId) {
    //                 clearCurrentMessageId(socket);
    //             }
    //         }
    //     }
    // }
}
void setCurrentMessageId(Socket*socket,int commandId)
{
    socket->isCanSendMessage_ = false;
    socket->currentMessageId_ = commandId;
}
void clearCurrentMessageId(Socket*socket)
{
    socket->isCanSendMessage_ = true;
    socket->currentMessageId_ = 0;
}
void handleSendMessage(Socket*socket,Message *message)
{
    if (message -> what == CS_MSG_TO_SUBTRHEAD_SENDING) {
        Data* data = (Data*)message -> obj;
        if (!sendMessage(socket,data -> bytes, data -> len)) {
            CCLOG("handleSendMessage fail");
            Message* message =getMessage();
            message -> what = CS_MSG_TO_UITHREAD_ERROR;
            addMessageToList(socket,socket->revMessageList_, message);
            closeSocket(socket);
        }
        // FREE_STRUCT(data);
    }
}

void revLoop(Socket*socket)
{
    if (!createConnection(socket)) {
        return;
    }
    while (!socket->needQuit_) {

        if (!socket->revMessageList_) {
            return;
        }
        
//         //创建包头
        int defaultPackageHeadLength =defaultSize;
        char _buf[defaultPackageHeadLength];
        
        ssize_t len = recv(socket->socket_, _buf, defaultPackageHeadLength, MSG_WAITALL);
        if (len == 0) {
            CCLOG("服务器正常断开连接");
            Message *message = getMessage();
            message -> what = CS_MSG_TO_UITHREAD_ERROR;
            addMessageToList(socket,socket->revMessageList_, message);
            closeSocket(socket);
            return;
        } else if (len < 0) {
            continue;
        }
// /
        CCLOG("revLoop len %d",len);
        
        PackageHead *packageHead =getPackageHead();
        init_package_head(packageHead,_buf);

        
        //创建包体
        int bodyLength = packageHead ->bodySize_;
        int flag = packageHead ->flag_;
        CCLOG("flag ------- %d",flag);
        int len2 = 0;

        unsigned char _buf2[bodyLength];
        unsigned char *deflated = NULL;
        
        if (bodyLength) {
            len2 = recv(socket->socket_, _buf2, bodyLength, MSG_WAITALL);
            if (len2 == 0 || len2 == -1) {
                Message *message =getMessage();
                message -> what = CS_MSG_TO_UITHREAD_ERROR;
                addMessageToList(socket,socket->revMessageList_, message);
                closeSocket(socket);
                return;
            }
            
            if (flag) {
                // len2 = cocos2d::ZipUtils::ccInflateMemory(encryptionMessage(packageHead ->commandID_, _buf2, bodyLength), bodyLength, &deflated);
            } else {
                deflated =socket->func(packageHead->commandID_, _buf2, bodyLength);
            }
        }
        CCLOG("bodyLength = %d",bodyLength);
        CCLOG("commandID_ %d",packageHead ->commandID_);
        CCLOG("deflated = %s",deflated);
        
        
        Data* data =getData((const void*)deflated,len2);
        Message* message =getMessage();
        message -> what = CS_MSG_TO_UITHREAD_MESSAGE;
        message -> obj = (void*)data;
        message -> commandId = packageHead ->commandID_;
        addMessageToList(socket,socket->revMessageList_, message);
        CCLOG("clear haed start ");
        FREE_STRUCT(packageHead);
        CCLOG("clear haed end ");
    }
}
void sendLoop(Socket*soc)
{
    while (!soc->needQuit_) {
        usleep(5000);
        pthread_mutex_lock(&sendMessageListLock);
        if (!soc->sendMessageList_) {
        	CCLOG(" send message list is NULL");
            return;
        }
        if (list_size(soc->sendMessageList_)== 0) {
            pthread_mutex_unlock(&sendMessageListLock);
            continue;
        }
        if (!soc->isCanSendMessage_) {
            pthread_mutex_unlock(&sendMessageListLock);
            continue;
        }
 
        Message *msg = (Message*)pop_list_front(soc->sendMessageList_ );
        

        pthread_mutex_unlock(&sendMessageListLock);
        startCheckMessage(soc,msg -> commandId);
        handleSendMessage(soc,msg);
        CCLOG("sendLoop msg start ");
        FREE_STRUCT(msg);
        CCLOG("sendLoop msg end ");
    }
    CCLOG("end of sendLoop");
}

bool createConnection(Socket*soc)
{
    soc->socket_ = socket(AF_INET, SOCK_STREAM, 0);
    if (soc->socket_ == INVALID_SOCKET) {
        closeSocket(soc);
        CCLOG("获得socket编号出错");
        return false;
    }
    
    soc->state = kStateConnecting;
    
    if (false) {
        int optval = 1;
        if(setsockopt(soc->socket_, SOL_SOCKET, SO_KEEPALIVE, (char *) &optval, sizeof(optval)))
        {
            closeSocket(soc);
            CCLOG("设置socket属性SO_KEEPALIVE出错");
            return false;
        }
    }
    
    unsigned long serveraddr = inet_addr(soc->host_);
    if (serveraddr == INADDR_NONE) {
        closeSocket(soc);
        CCLOG("ip地址出错");
        return false;
    }
    
    struct sockaddr_in svraddr;
    svraddr.sin_family = AF_INET;
    svraddr.sin_addr.s_addr = inet_addr(soc->host_);
    svraddr.sin_port = htons(soc->port_);
    int ret = connect(soc->socket_, (struct sockaddr*)&svraddr, sizeof(svraddr));
    if (ret == SOCKET_ERROR) {
        CCLOG("连接socket出错");
        closeSocket(soc);
        return false;
    }
    
    struct linger so_linger;
    so_linger.l_onoff = 1;
    so_linger.l_linger = 0;
    setsockopt(soc->socket_, SOL_SOCKET, SO_LINGER, (const char*)&so_linger, sizeof(so_linger));
    
    
    soc->state = kStateOpen;
    
    Message* message =getMessage();
    message->what = CS_MSG_TO_UITHREAD_OPEN;
    addMessageToList(soc,soc->revMessageList_, message);
    CCLOG("连接成功");
    
    return true;
}
void addMessageToList(Socket*soc,List *list,Message *message)
{
    if (list == soc->revMessageList_) {
        pthread_mutex_lock(&revMessageListLock);
        push_list_back(list,message);
        pthread_mutex_unlock(&revMessageListLock);
    } else if (list == soc->sendMessageList_) {
        pthread_mutex_lock(&sendMessageListLock);
        push_list_back(list,message);
        pthread_mutex_unlock(&sendMessageListLock);
    }
}

