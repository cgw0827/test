//https://my.oschina.net/wxwHome/blog/51312
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>
#include <string.h>
#define MAX_COLOR 255



void error(lua_State* L ,const char* fmt,...){
	va_list argp;
	va_start(argp,fmt);
	vfprintf(stderr,fmt,argp);
	va_end(argp);
	exit(EXIT_FAILURE);
}
static void stackDump(lua_State* L){
    int i;
    int top = lua_gettop(L);
    printf("top = %d\n  ",top);
    for(i=1;i<=top;i++){
        int t=lua_type(L,i);
		switch(t){
		    case LUA_TSTRING:{
	     		printf("'%s'",lua_tostring(L,i));
		    }
		    break;
		    case LUA_TBOOLEAN:{
			printf(lua_toboolean(L,i)?"true":"false");
		    }
		    break;
		    case LUA_TNUMBER:{
		    	printf("%g",lua_tonumber(L,i));
		    }
		    break;
		    default:{
		   	printf("%s",lua_typename(L,t));
			break;
		    }

		}
		printf("  ");
    }
    printf("\n");
}
void loadfile(lua_State* L,const char* fname){
	if(luaL_loadfile(L,fname)||lua_pcall(L,0,0,0))
		error(L,"cannot run config.file:%s",lua_tostring(L,-1));
}


void call_lua(lua_State*L,const char* func,const char* sig,...){
	va_list vl;
	int narg,nres;
	va_start(vl,sig);
	lua_getglobal(L,func);
	// push stack 
	for(narg=0;*sig;narg++){
		luaL_checkstack(L,1,"too many arguments");
		switch(*sig++){
			case 'd':
			lua_pushnumber(L,va_arg(vl,double));
			break;
			case 'i':
				lua_pushinteger(L,va_arg(vl,int));
			break;
			case 's':
				lua_pushstring(L,va_arg(vl,char*));
			break;
			case '>':
				goto endargs;
			break;
			default:
				error(L,"invalid option(%c)",*(sig-1));
		}
	}
	endargs:

	nres=strlen(sig);
	printf("111 sig %s narg %d nres %d \n",sig,narg,nres);
	if(lua_pcall(L,narg,nres,0)!=0)
		error(L,"error calling '%s':%s ",func,lua_tostring(L,-1));

	// search result 
	nres=-nres;
	printf("222 sig %s nres %d \n",sig,nres);
	while(*sig){
		
		switch(*sig++){
			case 'd':
				if(!lua_isnumber(L,nres))
					error(L,"wrong result type ");
				// printf(" sig1111 %s \n",sig);
				*va_arg(vl,double*)=lua_tonumber(L,nres);
				// printf(" sig2222 %s \n",sig);
			break;
			case 'i':
				if(!lua_isnumber(L,nres))
					error(L,"wrong result type of i ");
				*va_arg(vl,int*)=lua_tointeger(L,nres);
			break;
			case 's':
				if(!lua_isstring(L,nres))
					error(L,"wrong result type string");
				*va_arg(vl,const char**)=lua_tostring(L,nres);
			break;
			default:
				error(L," invalid option (%c) *,",*(sig-1));
			break;
			
		}
		nres++;		
	}

	va_end(vl);
	stackDump(L);
	// lua_pop(nres);
	lua_settop(L,0);
	stackDump(L);
}





