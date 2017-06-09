﻿--[==[
Author:     熊哲
CreateTime: 6/9/2017 5:17:08 PM
Description:

--]==]
local moduleName = ...;
local M = { };
M.__index = M;
----- begin module -----
-- 多用于纯lua逻辑，C#需要做一定的处理(见该例子目录下的LuaManager)
local util = require "xlua.util"
Yield = util.async_to_sync( function(yield, callback)
	CS.EZhex1991.XLuaExample.LuaManager.Instance:Yield(yield, callback);
end );
function WaitForEndOfFrame() Yield(CS.UnityEngine.WaitForEndOfFrame()); end
function WaitForFixedUpdate() Yield(CS.UnityEngine.WaitForFixedUpdate()); end
function WaitForSeconds(sec) Yield(CS.UnityEngine.WaitForSeconds(sec)); end
-- 以上代码可以让ulua中的协程逻辑在xlua上直接用
function Coroutine(...)
	local params = { ...};
	local cor = coroutine.create( function()
		print("Coroutine Test");

		local wwwB = CS.UnityEngine.WWW("www.baidu.com");
		Yield(wwwB);
		print(wwwB.text);
		print("baidu go die");

		local wwwA = CS.UnityEngine.WWW("www.alibaba.com");
		while not wwwA.isDone do
			WaitForSeconds(2);
			print(wwwA.progress);
		end
		print("ali father");

		local wwwT = CS.UnityEngine.WWW("www.tencent.com");
		while not wwwT.isDone do
			WaitForEndOfFrame();
			print(wwwT.progress);
		end
		print("tencent majesty");

		print(table.unpack(params));
	end );
	coroutine.resume(cor);
end
Coroutine("xlua", "banzai");
----- end -----
return M;