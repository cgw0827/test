#include "BinaryDataUtils.h"
Data* intToData(int num)
{
    if (messageMode) {
        unsigned char b[4] = {
            num >> 24,
            num >> 16,
            num >> 8,
            num
        };
        // Data *data =dataWithBytesLen(b,4);
        return getData(b,4);
    } else {
        unsigned char b[4] = {
            num,
            num >> 8,
            num >> 16,
            num >> 24
        };
        // Data *data =dataWithBytesLen(b,4);
        return  getData(b,4);
    }
}
int byte_to_int(char *buffer, int from)
{
    if (messageMode) {
        return (int)((buffer[from] & 0xff)<<24 | (buffer[from + 1] & 0xff)<<16 | (buffer[from + 2] & 0xff)<<8 |(buffer[from + 3] & 0xff));
    } else {
        return (int)((buffer[from] & 0xff) | (buffer[from + 1] & 0xff)<<8 | (buffer[from + 2] & 0xff)<<16 |(buffer[from + 3] & 0xff)<<24);
    }
}

short byte_to_short(char *buffer, int from)
{
    if (messageMode) {
        return (short)((buffer[from] & 0xff) << 8 |(buffer[from + 1] & 0xff));
    } else {
        return (short)((buffer[from] & 0xff) |(buffer[from + 1] & 0xff) << 8);
    }
}
Data* shortToData(short num)
{
    if (messageMode) {
        unsigned char b[2] = {
            num >> 8,
            num
        };
        // Data *data =dataWithBytesLen(b,2);
        return  getData(b,2);
    } else {
        unsigned char b[2] = {
            num,
            num >> 8
        };
        // Data *data =dataWithBytesLen(b,2);
        return  getData(b,2);
    }
}
