#include "util.c"
void load(lua_State* L,const char* fname,int *w,int *h){
	if(luaL_loadfile(L,fname)||lua_pcall(L,0,0,0))
		error(L,"cannot run config.file:%s",lua_tostring(L,-1));
	lua_getglobal(L,"width");
	lua_getglobal(L,"height");
	if(!lua_isnumber(L,-2))
		error(L,"width should be a number \n");
	if(!lua_isnumber(L,-1))
		error(L,"height should be a number \n");
	*w=lua_tointeger(L,-2);
	*h=lua_tointeger(L,-1);
}
int main(){

	int w;
	int h;
	lua_State* L=luaL_newstate();

	load(L,"test2501.lua",&w,&h);
	printf("w = %d h = %d \n",w,h);
	return 0;
}