#include "Encryption.h"
void _rc4(Encryption* encry,char* data, const char* key, int len)
{
    _rc4_state s;
    _rc4_init(encry,&s, (unsigned char*)key);
    _rc4_encrypt(encry,&s, (unsigned char*)data, len);
}

void _rc4_encrypt(Encryption* encry,_rc4_state* s, unsigned char* data, int len)
{
    register int i, x = s->x, y = s->y;
    for (i = 0; i < len; i++) {
        x = (x + 1) % 256;
        y = (y + s->state[x]) % 256;
        {
            register int t;
            t = s->state[x];
            s->state[x] = s->state[y];
            s->state[y] = t;
        }
        {
            register int xorIndex;
            xorIndex = (s->state[x] + s->state[y]) % 256;
            data[i] ^= s->state[xorIndex];
        }
    }
    s->x = x;
    s->y = y;
}

void _rc4_init(Encryption* encry,_rc4_state* s, unsigned char* key)
{
    register int i, index1, index2;
    for (i = 0; i < 256; i++) {
        s->state[i] = i;
    }
    s->x = 0;
    s->y = 0;
    index1 = 0;
    index2 = 0;
    for (i = 0; i < 256; i++) {
        register int t;
        index2 = (key[index1] + s->state[i] + index2) % 256;
        t = s->state[i];
        s->state[i] = s->state[index2];
        s->state[index2] = t;
        index1 = (index1 + 1) % encry->_keyLen;
    }
}
Encryption*  getEncryption(const char* seed)
{
    Encryption* encry=(Encryption*)malloc(sizeof(Encryption));
    encry->free_func=freeEncryption;
    int n = strlen(seed);
    if (n > 0) {
        int saltLen = strlen(SLAT);
        encry->_keyLen = saltLen + n;
        encry->_key = (char*)malloc(encry->_keyLen);
        memcpy(encry->_key, SLAT, saltLen);
        memcpy(encry->_key + saltLen, seed, n);
        int i = 0;
        for (; i < encry->_keyLen / 2; i++) {
            register int t;
            t = encry->_key[i];
            encry->_key[i] = encry->_key[encry->_keyLen - i - 1];
            encry->_key[encry->_keyLen - i - 1] = t;
        }

    } else {
        encry->_key = NULL;
    }
    return encry;
}

void freeEncryption(void* cry)
{
    if (cry)
    {
        Encryption* temp=(Encryption*)cry;
        if (temp->_key) {
            FREE_POINTER(temp->_key);
        }
    }

}

void myencrypt(Encryption* encry,char* data, int len)
{
    if (encry->_key != NULL) {
        _rc4(encry,data, encry->_key, len);
    }
}

void mydecrypt(Encryption* encry,char* data, int len)
{
    myencrypt(encry,data, len);
}