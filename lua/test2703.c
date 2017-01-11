#include "test2702.c"
static int registerKey(lua_State *L, char * key,const char * mystr){
	lua_pushlightuserdata(L,(void*)&key);
	lua_pushstring(L,mystr);
	lua_settable(L,LUA_REGISTRYINDEX);

	lua_pushlightuserdata(L,(void*)&key);
	lua_gettable(L,LUA_REGISTRYINDEX);
	const char* str=lua_tostring(L,-1);
	printf(" result is %s\n",str);
	return 1;

}
int luaopen_foo(lua_State *L){
	lua_newtable(L);
	// lua_replace(L,LUA_ENVIRONINDEX);
	// lua_register(L,"mysplit",l_split);
	// lua_register(L,"myupper",l_super);
	return 0;
}
static int counter(lua_State *L){
	int upindex=lua_upvalueindex(1);

	int val=lua_tointeger(L,upindex);
	printf(" val111 is %d upindex = %d \n",val,upindex);
	stackDump(L);
	lua_pushinteger(L,++val);
	stackDump(L);
	lua_pushvalue(L,-1);
	stackDump(L);
	upindex=lua_upvalueindex(1);
	printf(" val222 is %d upindex = %d \n",val,upindex);
	lua_replace(L,upindex);
	stackDump(L);
	return 1;

}
int newCounter(lua_State *L){
	// lua_pushinteger(L,0);
	stackDump(L);
	lua_pushcclosure(L,&counter,1);
	stackDump(L);
	return 1;
}
int main(){
	lua_State*L=luaL_newstate();
	luaL_openlibs(L);
	// registerKey(L,"k","my name is cgw");
	// luaopen_foo(L);
	lua_register(L,"counter",counter);
	lua_register(L,"newCounter",newCounter);
	loadfile(L,"test2703.lua");	
	return 0;
}