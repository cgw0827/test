#ifndef C_ARRAY_H
#define C_ARRAY_H
#include <stdio.h>
#include <stdlib.h>
typedef struct 
{
	int size;
	int *value;
	/* data */
}Array1D;
typedef struct 
{
	int size;
	Array1D **value;
}Array2D;

typedef struct 
{
	int size;
	Array2D **value;
	/* data */
}Array3D;

Array1D* getArray1D(int len);
void freeArray1D(Array1D* array);

Array2D*  getArray2D(int len,int len2);
void freeArray2D(Array2D *array);

Array3D*  getArray3D(int len,int len2,int len3);

void freeArray3D(Array3D* array);

#endif