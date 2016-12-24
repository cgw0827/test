#include "Array.h"

ARRAY_1D* get1DArray(int len){
	ARRAY_1D* array=(ARRAY_1D*)malloc(sizeof(ARRAY_1D));
	array->size=len;
	array->value=(int *)calloc(sizeof(int),len);
	return array;
}
void free1DArray(ARRAY_1D* array){
	free(array->value);
	free(array);
}

ARRAY_2D*  get2DArray(int len,int len2){
	ARRAY_2D* array=(ARRAY_2D*)malloc(sizeof(ARRAY_2D));
	array->size=len;
	array->value=(ARRAY_1D**)malloc(sizeof(ARRAY_1D*)*len);
	for (int i = 0; i < len; ++i)
	{
		array->value[i]=get1DArray(len2);
	}
	return array;
}
void free2DArray(ARRAY_2D *array){
	for (int i = 0; i < array->size; ++i)
	{
		free1DArray(array->value[i]);
	}
	free(array->value);
	free(array);
}

ARRAY_3D*  get3DArray(int len,int len2,int len3){
	ARRAY_3D*  array=(ARRAY_3D*)malloc(sizeof(ARRAY_3D));
	array->size=len;
	array->value=(ARRAY_2D**)malloc(sizeof(ARRAY_2D*)*len);
	for (int i = 0; i < len; ++i)
	{
		array->value[i]=get2DArray(len2,len3);
	}
	return array;
}
void free3DArray(ARRAY_3D* array){
	for (int i = 0; i < array->size; ++i)
	{
		free2DArray(array->value[i]);
	}
	free(array->value);
	free(array);
}