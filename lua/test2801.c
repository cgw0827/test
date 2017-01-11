#include "util.c"
#include <limits.h>

#define BITS_PER_WORD (CHAR_BIT*sizeof(unsigned int))
#define I_WORD(i) ((unsigned int)(i)/BITS_PER_WORD)
#define I_BIT(i)  (1<<((unsigned int)(i)%BITS_PER_WORD))

typedef struct NumArray
{
	int size;
	unsigned int value[1];

}NumArray;

static int newarray(lua_State *L){
	size_t nbytes;
	NumArray *a;
	int n =luaL_checkinteger(L,1);
	luaL_argcheck(L,n >= 1,1,"invalid size");
	nbytes = sizeof(NumArray) + I_WORD(n - 1)*sizeof(unsigned int);
	a = (NumArray *)lua_newuserdata(L,nbytes);
	a->size = n;
	for (int i = 0; i < I_WORD(n-1); i++)
	{
		a->value[i] = 0;
	}
	return 1;
}

static int setarray(lua_State *L){
	NumArray *a = (NumArray *)lua_touserdata(L,1);
	int index = luaL_checkinteger(L,2) - 1;
	luaL_checkany(L,3);
	luaL_argcheck(L, a!=NULL,1,"'array' expected");
	luaL_argcheck(L,0<=index && index < a->size,2,"index out of range");
	if (lua_toboolean(L,3))
	{
		a->value[I_WORD(index)] |= I_BIT(index);
	}else {
		a->value[I_WORD(index)] &= -I_BIT(index);
	}
	return 0;
}

static int getarray(lua_State *L){
	NumArray *a = (NumArray *)lua_touserdata(L,1);
	int index = luaL_checkinteger(L,2)-1;
	luaL_argcheck(L,a!=NULL,1,"'array' expected");
	luaL_argcheck(L,0<=index && index < a->size,2,"index out of range");
	lua_pushboolean(L,a->value[I_WORD(index)]&I_BIT(index));
	stackDump(L);
	return 1;
}
static int getsize(lua_State *L){
	NumArray *a = (NumArray *)lua_touserdata(L,1);
	luaL_argcheck(L,a!=NULL,1,"'array' expected");
	lua_pushinteger(L,a->size);
	return 1;
}

int main(){
	printf(" BITS_PER_WORD = %ld sizeof(unsigned int) = %ld \n",BITS_PER_WORD,sizeof(unsigned int));
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	lua_register(L,"newarray",newarray);
	lua_register(L,"setarray",setarray);
	lua_register(L,"getarray",getarray);
	lua_register(L,"getsize",getsize);
	loadfile(L,"test2801.lua");
	return 0;
}