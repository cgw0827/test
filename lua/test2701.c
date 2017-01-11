#include "util.c"
int l_map(lua_State *L){
	int i,n;
	luaL_checktype(L,1,LUA_TTABLE);
	luaL_checktype(L,2,LUA_TFUNCTION);
	n=luaL_len(L,1);
	printf("n= %d \n",n);
	for(i=1;i<=n;i++){
		lua_pushvalue(L,2);
		lua_rawgeti(L,1,i);
		lua_call(L,1,1);
		lua_rawseti(L,1,i);
	}
	return 0;
}

int luaopen_mylib(lua_State *L){
	lua_register(L,"mymap",l_map);
	return 1;
}
int main(){
	lua_State* L =luaL_newstate();
	luaL_openlibs(L);
	luaopen_mylib(L);
	loadfile(L,"test2701.lua");
	return 0;
}