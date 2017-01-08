#include "util.c"
#include <math.h>

#include <dirent.h>
#include <errno.h>
static int l_sin(lua_State* L){
	// double d=lua_tonumber(L,1);
	double d=luaL_checknumber(L,1);
	lua_pushnumber(L,sin(d));
	return 1;//结果数量
}
static int l_dir(lua_State *L){
	const char* path=luaL_checkstring(L,1);
	DIR *dir=opendir(path);
	if(dir==NULL){
		lua_pushnil(L);
		lua_pushstring(L,strerror(errno));
		return 2;
	}
	lua_newtable(L);
	int i=1;
	struct dirent * entry;
	while((entry=readdir(dir))!=NULL){
		lua_pushnumber(L,i++);
		lua_pushstring(L,entry->d_name);
		lua_settable(L,-3);
	}
	closedir(dir);
	return 1;
}
static const luaL_Reg mylib[]={
	{"mydir",l_dir},
	{"mysin",l_sin},
	{NULL,NULL}
};	
int luaopen_mylib(lua_State *L){
	lua_register(L,"mydir",l_dir);
	lua_register(L,"mysin",l_sin);
	return 1;
}
int main(){
	lua_State* L =luaL_newstate();
	luaL_openlibs(L);
	luaopen_mylib(L);
	loadfile(L,"test.lua");
	

	return 0;
}
