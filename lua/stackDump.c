#include <stdio.h>
#include <string.h>

#include <lua.h>  
#include <lauxlib.h>  
#include <lualib.h>  
// 从栈底到栈顶依次遍历整个堆栈
static void stackDump(lua_State* L)
{
    int i;
    int top = lua_gettop(L);
    for(i = 1; i <= top; ++i)
    {
        int t = lua_type(L, i);
        switch(t)
        {
        case LUA_TSTRING:
            printf("'%s'", lua_tostring(L, i));
            break;
        case LUA_TBOOLEAN:
            printf(lua_toboolean(L, i) ? "true": "false");
            break;
        case LUA_TNUMBER:
            printf("'%g'", lua_tonumber(L, i));
            break;
        default:
            printf("'%s'", lua_typename(L, t));
            break;
        }
        printf("    ");
    }
    printf("\n");
}

int main(void)
{
    lua_State* L = lua_open();
    luaL_openlibs(L);

    lua_pushboolean(L, 1);
    lua_pushnumber(L, 10);
    lua_pushnil(L);
    lua_pushstring(L, "hello");
    stackDump(L);

    lua_pushvalue(L, -4);
    stackDump(L);

    lua_replace(L, 3);
    stackDump(L);

    lua_settop(L, 6);
    stackDump(L);

    lua_remove(L, -3);
    stackDump(L);

    lua_settop(L, -5);
    stackDump(L);

    return 0;
}