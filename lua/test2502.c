#include "util.c"
struct ColorTable{
	char* name;
	unsigned char red,green,blue;
}colortable[]={
	{"WHITE",MAX_COLOR,MAX_COLOR,MAX_COLOR},
	{"RED",MAX_COLOR,0,0},
	{"GREDD",0,MAX_COLOR,0},
	{"BLUE",0,0,MAX_COLOR},
	{"NULL",0,0,0},
};
int getfield(lua_State* L,const char *key){
	int result;

	// lua_pushstring(L,key);//key index is -1
	// lua_gettable(L,-2);  // background index is -1
	lua_getfield(L,-1,key);
	stackDump(L);
	if(!lua_isnumber(L,-1))
		error(L,"invilid component in background color");
	result=(int)lua_tonumber(L,-1)*MAX_COLOR;
	lua_pop(L,1);
	return result;
}
void load(lua_State* L,const char* fname){
	if(luaL_loadfile(L,fname)||lua_pcall(L,0,0,0))
		error(L,"cannot run config.file:%s",lua_tostring(L,-1));
	lua_getglobal(L,"background");
	if(!lua_istable(L,-1))
		error(L,"background is not a table\n");
	int red=getfield(L,"r");
	int green=getfield(L,"g");
	int blue=getfield(L,"b");
	printf("red = %d green = %d blue = %d \n",red,green,blue);
}
void setfield(lua_State*L,const char* key,int value){
	// lua_pushstring(L,key);
	lua_pushnumber(L,(double)value/MAX_COLOR);
	stackDump(L);
	// lua_settable(L,-3);
	lua_setfield(L,-2,key);
	stackDump(L);
}
void setcolor(lua_State*L,struct ColorTable* ct){
	lua_newtable(L);
	setfield(L,"r",ct->red);
	setfield(L,"g",ct->green);
	setfield(L,"b",ct->blue);
	lua_setglobal(L,ct->name);
}
int main(){

	lua_State* L=luaL_newstate();

	
	int i=0;
	while(colortable[i].name!=NULL){
		setcolor(L,&colortable[i++]);
	}
	load(L,"test.lua");
	return 0;
}
