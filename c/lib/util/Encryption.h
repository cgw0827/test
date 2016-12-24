#ifndef SanGuoGame_ENCRYPTION_H
#define SanGuoGame_ENCRYPTION_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define SLAT "miaomiao20141"

typedef struct {
    unsigned char state[256];
    unsigned char x, y;
} _rc4_state;

typedef struct 
{
    char* _key;
    int _keyLen;
    FREE_FUNC free_func;
}Encryption;
    void _rc4(Encryption* encry,char* data, const char* key, int len);

    void _rc4_encrypt(Encryption* encry,_rc4_state* s, unsigned char* data, int len);

    void _rc4_init(Encryption* encry,_rc4_state* s, unsigned char* key);

    Encryption*  getEncryption(const char* seed);

    void freeEncryption(void* cry);

    void myencrypt(Encryption* encry,char* data, int len);

    void mydecrypt(Encryption* encry,char* data, int len);

#endif
