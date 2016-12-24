#ifndef TEST_H_
#define TEST_H_
#include "lib/headers.h"
unsigned char* encryptionMessage(int commandId, unsigned char* data, int len);
void connection_socket(char* host_, int port_);
void createEncryption(const char* seed);

void sendMessageData(int commandId, Data* data);
void login();
void onMessage(Message* message);
void doSeed(char* jsonStr);
void doMessage(Message* message);
#endif