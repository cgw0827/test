#include "util.c"
static int l_split(lua_State *L){
	const char* s=luaL_checkstring(L,1);
	const char* sep=luaL_checkstring(L,2);
	const char* e;
	// stackDump(L);
	int i=1;
	lua_newtable(L);
	// stackDump(L);
	while((e=strchr(s,*sep))!=NULL){
		lua_pushlstring(L,s,e-s);
		// stackDump(L);
		lua_rawseti(L,-2,i++);
		// stackDump(L);
		s=e+1;
	}
	// stackDump(L);
	lua_pushstring(L,s);
	// stackDump(L);
	lua_rawseti(L,-2,i);
	return 1;
}
int main(){
	lua_State*L=luaL_newstate();
	luaL_openlibs(L);
	lua_register(L,"mysplit",l_split);
	loadfile(L,"test.lua");
	return 0;
}