#include "util.c"
#include <ctype.h>
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
static int l_super(lua_State *L){
	size_t l;
	size_t i;
	luaL_Buffer b;
	const char *s=luaL_checklstring(L,1,&l);
	luaL_buffinit(L,&b);
	for(i=0;i<l;i++){
		luaL_addchar(&b,toupper(s[i]));
	}
	luaL_pushresult(&b);
	return 1;
}
// int main(){
// 	lua_State*L=luaL_newstate();
// 	luaL_openlibs(L);
// 	lua_register(L,"mysplit",l_split);
// 	lua_register(L,"myupper",l_super);
// 	loadfile(L,"test.lua");
// 	return 0;
// }