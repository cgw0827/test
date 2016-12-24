#ifndef BinaryDataUtils_H_
#define BinaryDataUtils_H_
#include "Data.h"
static int messageMode = 0;

// Data* stringToData(CCString* str);
// Data* longToData(long long num);
Data* intToData(int num);
Data* shortToData(short num);
short byte_to_short(char *buffer, int from);
int byte_to_int(char* buffer,int from);
// long long byteToLong(char* buffer,int from);
// CCString* dataToString(char* buffer,CCRange range);
// CCRange dataToStringRangeWithBuffer(char* buffer,int from);
// CCArray* boolArrayFromInt(int num);
#endif