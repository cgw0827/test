#ifndef C_ARRAY_H
#define C_ARRAY_H
#include <stdio.h>
#include <stdlib.h>
typedef struct 
{
	int size;
	int *value;
	/* data */
}ARRAY_1D;
typedef struct 
{
	int size;
	ARRAY_1D **value;
}ARRAY_2D;

typedef struct 
{
	int size;
	ARRAY_2D **value;
	/* data */
}ARRAY_3D;

ARRAY_1D* get1DArray(int len);
void free1DArray(ARRAY_1D* array);

ARRAY_2D*  get2DArray(int len,int len2);
void free2DArray(ARRAY_2D *array);

ARRAY_3D*  get3DArray(int len,int len2,int len3);

void free3DArray(ARRAY_3D* array);

#endif