#include <Core/LuaVM/LuaVM.hpp>

void LuaVM::Init()
{
    luaState = luaL_newstate()
	luaL_openlibs(luaState);
}

bool LuaVM::RunScriptSafe(const char* script, LuaErrorStruct& errorStruct)
{
	if (luaL_loadstring(luaState.get(), script) == LUA_OK)
	{
		if (lua_pcall(lua_State.get(), 0, LUA_MULTRET, 0) != LUA_OK)
		{
			goto PostError;
		}
		return true;
	}
	else {
		goto PostError;
	}

	PostError:
	const char* errorStr = lua_tostring(luaState.get(), -1);
	if (errorStr != nullptr)
	{
		std::cout << errorStr << std::endl;
		std::string errorfr = std::string(errorStr);
		int line = errorfr.find("]:") + 2;
		int codeline = std::atoi((errorfr.substr(line, errorfr.find(":", line) - line)).c_str());
		errorStruct.line = codeline;
		int line2 = errorfr.find(":", line) + 1;
		errorStruct.errorMsg = errorfr.substr(line2);

		lua_pop(luaState.get(), 1); // remove error message
		return false;
	}
	else {
		return false;
	}
 }