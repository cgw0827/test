#include "util.c"
#include <limits.h>

#define BITS_PER_WORD (CHAR_BIT*sizeof(unsigned int))
#define I_WORD(i) ((unsigned int)(i)/BITS_PER_WORD)
#define I_BIT(i)  (1<<((unsigned int)(i)%BITS_PER_WORD))

#define checkarray(L) \
		(NumArray *) luaL_checkudata(L,1,"LuaBook.array")
typedef struct NumArray
{
	int size;
	unsigned int value[1];

}NumArray;
static unsigned int * getindex(lua_State *L,unsigned int *mask){
	NumArray *a=checkarray(L);
	luaL_argcheck(L, a!=NULL,1,"'array' expected");
	int index=luaL_checkinteger(L,2)-1;
	luaL_argcheck(L,0<=index && index <= a->size,2,"index out of range");
	*mask = I_BIT(index);
	return &a->value[I_WORD(index)];
}
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
	luaL_getmetatable(L,"LuaBook.array");
	lua_setmetatable(L,-2);
	return 1;
}

static int setarray(lua_State *L){
	// NumArray *a = (NumArray *)lua_touserdata(L,1);
	// int index = luaL_checkinteger(L,2) - 1;
	unsigned int mask;
	unsigned int *entry = getindex(L,&mask);
	luaL_checkany(L,3);
	// luaL_argcheck(L, a!=NULL,1,"'array' expected");
	// luaL_argcheck(L,0<=index && index < a->size,2,"index out of range");
	if (lua_toboolean(L,3))
	{
		// a->value[I_WORD(index)] |= I_BIT(index);
		*entry |= mask;
	}else {
		*entry &= -mask;
		// a->value[I_WORD(index)] &= -I_BIT(index);
	}
	return 0;
}

static int getarray(lua_State *L){
	// NumArray *a = (NumArray *)lua_touserdata(L,1);
	// int index = luaL_checkinteger(L,2)-1;
	// luaL_argcheck(L,a!=NULL,1,"'array' expected");
	// luaL_argcheck(L,0<=index && index < a->size,2,"index out of range");
	unsigned int mask;
	unsigned int *entry = getindex(L,&mask);
	// lua_pushboolean(L,a->value[I_WORD(index)]&I_BIT(index));
	lua_pushboolean(L,*entry & mask);
	stackDump(L);
	return 1;
}
static int getsize(lua_State *L){
	NumArray *a = checkarray(L);
	luaL_argcheck(L,a!=NULL,1,"'array' expected");
	lua_pushinteger(L,a->size);
	return 1;
}
static const struct luaL_Reg arraylib_f [] = {
    {"new", newarray},
    {NULL, NULL}
};
static const struct luaL_Reg arraylib_m [] = {
    {"set",setarray},
    {"get", getarray},
    {"size", getsize},
    {"__gc", auto_gc},
    {NULL, NULL}
};
int luaopen_array (lua_State *L) {
    luaL_newmetatable(L, "LuaBook.array");
    lua_pushvalue(L, -1);
    lua_setfield(L, -2, "__index");
    luaL_setfuncs(L, arraylib_m, 0);	
    luaL_newlib(L, arraylib_f);
    return 1;
}

static const luaL_Reg lualibs[] =
{
    {"array", luaopen_array},
    {NULL, NULL}
};
int main(){
	printf(" BITS_PER_WORD = %ld sizeof(unsigned int) = %ld \n",BITS_PER_WORD,sizeof(unsigned int));
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);
	// luaL_newmetatable(L,"LuaBook.array");

	const luaL_Reg *lib = lualibs;
	for(; lib->func != NULL; lib++)
	{
	    //注意这里如果使用的不是requiref，则需要手动在Lua里面调用require "模块名"
	    luaL_requiref(L, lib->name, lib->func, 1);
	    lua_settop(L, 0);
	}

	// lua_pushvalue(L,-1);
	// lua_setfield(L,-2,"--index");
	
	// lua_register(L,"newarray",newarray);
	// lua_register(L,"setarray",setarray);
	// lua_register(L,"getarray",getarray);
	// lua_register(L,"getsize",getsize);
	loadfile(L,"test2801.lua");
	return 0;
}