#include "util.c"
double f(lua_State *L,double x,double y){
	double z;
	lua_getglobal(L,"f");
	lua_pushnumber(L,x);
	lua_pushnumber(L,y);
	if(lua_pcall(L,2,1,0)!=0)
		error(L,"error running function 'f' : %s",lua_tostring(L,-1));
	if(!lua_isnumber(L,-1))
		error(L,"funtion 'f' must return a number");
	z=lua_tonumber(L,-1);
	// lua_pop(L,1);
	lua_settop(L,0);
	return z;
}
int main(){
	lua_State* L =luaL_newstate();
	luaL_openlibs(L);
	loadfile(L,"test.lua");
	// double z=f(L,10,20);
	// double z;
	// call_lua(L,"f","dd>d",0.6,0.8,&z);
	// printf("z == %lf \n",z);

	char* z;

	call_lua(L,"f","ss>s","haha","ll",&z);
	printf("z111 == %s \n",z);	
	char* x=malloc(strlen(z)+1);
	strcpy(x,z);
	x[strlen(z)+1]='\0';
	char* ss;
	call_lua(L,"f","ss>s","cgw","sxb",&ss);
	printf("z == %s \n",z);	
	free(x);
	return 0;
}