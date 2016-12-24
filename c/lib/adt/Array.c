#include "Array.h"

Array1D* getArray1D(int len){
	Array1D* array=(Array1D*)malloc(sizeof(Array1D));
	array->size=len;
	array->value=(int *)calloc(sizeof(int),len);
	return array;
}
void freeArray1D(Array1D* array){
	free(array->value);
	free(array);
}

Array2D*  getArray2D(int len,int len2){
	Array2D* array=(Array2D*)malloc(sizeof(Array2D));
	array->size=len;
	array->value=(Array1D**)malloc(sizeof(Array1D*)*len);
	for (int i = 0; i < len; ++i)
	{
		array->value[i]=getArray1D(len2);
	}
	return array;
}
void freeArray2D(Array2D *array){
	for (int i = 0; i < array->size; ++i)
	{
		freeArray1D(array->value[i]);
	}
	free(array->value);
	free(array);
}

Array3D*  getArray3D(int len,int len2,int len3){
	Array3D*  array=(Array3D*)malloc(sizeof(Array3D));
	array->size=len;
	array->value=(Array2D**)malloc(sizeof(Array2D*)*len);
	for (int i = 0; i < len; ++i)
	{
		array->value[i]=getArray2D(len2,len3);
	}
	return array;
}
void freeArray3D(Array3D* array){
	for (int i = 0; i < array->size; ++i)
	{
		freeArray2D(array->value[i]);
	}
	free(array->value);
	free(array);
}