#ifndef C_SOCKET_H
#define C_SOCKET_H
#include <stdio.h>
#include <sys/socket.h>
#include <pthread.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <stdarg.h>
#include <stdlib.h>

#include "../adt/List.h"
#include "../adt/LinkList.h"
#include "../util/tools.h"
#include "Message.h"
#define INVALID_SOCKET	-1
#define SOCKET_ERROR	-1
typedef unsigned char* (*ENCRYP_FUNC)(int commandId, unsigned char* data, int len);
typedef void (*MSG_FUNC)(Message* msg);
enum CS_MSG {
    CS_MSG_TO_SUBTRHEAD_SENDING = 0,
    CS_MSG_TO_UITHREAD_OPEN,
    CS_MSG_TO_UITHREAD_MESSAGE,
    CS_MSG_TO_UITHREAD_ERROR,
    CS_MSG_TO_UITHREAD_CLOSE
};
enum ErrorCode
{
    kErrorTimeout = 0,
    kErrorConnectionFailure,
    kErrorUnknown
};
typedef enum 
{
    kStateConnecting = 0,
    kStateOpen,
    kStateClosing,
    kStateClosed
}State;
typedef struct 
{
    int socket_;

    List* revMessageList_;
    List* sendMessageList_;
    State state;
    const char* host_;
    bool needQuit_;
    int port_;
    bool isCanSendMessage_;
    int currentMessageId_;
    ENCRYP_FUNC func;
    FREE_FUNC free_func;
    MSG_FUNC msg_func;

}Socket;



 pthread_t recvThread_;
 pthread_t sendThread_;
 pthread_mutex_t revMessageListLock;
 pthread_mutex_t sendMessageListLock;


void open_socket_thread(Socket* soc);
Socket* new_socket(ENCRYP_FUNC func,MSG_FUNC msg_func);
void free_socket(void* socket);
bool init_socket(Socket*socket,const char* host, int post);
void* sendThreadLoop(void *arg);
void* recvThreadLoop(void *arg);
bool createConnection(Socket*socket);
void closeSocket(Socket*socket);
void sendLoop(Socket*socket);
void revLoop(Socket*socket);
void revMessageUpdate(Socket*socket);
void setCurrentMessageId(Socket*socket,int commandId);
void handleSendMessage(Socket*socket,Message *message);
void startCheckMessage(Socket*socket,int commandId);
void endCheckMessage(Socket*socket,int commandId);
bool sendMessage(Socket*socket,const char *msg, unsigned int len);
void send_socket_data(Socket*socket,int commandId,const char* msg, unsigned int len);
void addMessageToList(Socket*socket,List *list,Message *message);
#endif