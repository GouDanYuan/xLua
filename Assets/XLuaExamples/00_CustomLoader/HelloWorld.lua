--[==[
Author:     熊哲
CreateTime: 5/23/2017 6:30:07 PM
Description:

--]==]
local moduleName = ...;
local M = { };
M.__index = M;
----- begin module -----
print("Hello World!");
print("Script File Load By CustomLoader");
CS.EZhex1991.XLuaExample.CustomLoader.Instance.actionTest = CS.EZhex1991.XLuaExample.CustomLoader.Instance.actionTest + function() print("action test") end
CS.EZhex1991.XLuaExample.CustomLoader.Instance:Test("+", (function() prin("event test") end));
----- end -----
return M;