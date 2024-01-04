#ifndef LUAVM_HPP
#define LUAVM_HPP
/*
IMPLEMENTATION OF AN ABSTRACT LUAVM CLASS TO RUN & HANDLE THE LUA ENVIRONNEMENT
*/
#include <utils/singleton.hpp>
#include <memory>
extern "C"
{
    #include <lua/lua.h>
    #include <lua/lauxlib.h>
    #include <lua/lapi.h>
}

typedef struct
{
	int line; // code line the error is at
	std::string errorMsg;
} LuaErrorStruct;


class LuaVM : public Singleton<LuaVM>
{
public:
    std::unique_ptr<lua_State*> luaState;
    //init the luaVM
    public void Init();

    bool RunScriptSafe(const char* script, LuaErrorStruct& err);
}


#endif