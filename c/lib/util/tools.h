#ifndef TOOLS_H_
#define TOOLS_H_
#include <stdio.h>
#include "../FrameWork.h"

#define SWAP(x,y,t) ((t=(x),(x)=(y),(y)=(t)))
#define COMPARE(x,y) (((x)<(y))? -1 : ((x)==(y))? 0 : 1)

void swap(int *x ,int *y);
void sortHarf(int list[],int n);
int compare(int x,int y);
int binSearch(int list[],int value,int left,int right);
void CCLOG(const char * pszFormat, ...);

#endif
