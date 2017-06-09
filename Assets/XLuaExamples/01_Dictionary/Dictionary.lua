--[==[
Author:     熊哲
CreateTime: 5/23/2017 5:55:45 PM
Description:

--]==]
local moduleName = ...;
local M = { };
M.__index = M;
----- begin module -----
local DictSS = CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"]; -- 泛型的表示可以在C#上通过Debug.Log(typeof(Type))输出
local dictSS = DictSS();

dictSS:Add("0", "zero");
dictSS:Add("1", "one");

print(dictSS.Count);
local keys = { "0", "1", "2" };
for i = 1, 3 do
	local succeed, value = dictSS:TryGetValue(keys[i]);	-- 字符串Key不能通过[]直接索引了，需要通过TryGetValue来获取（数字依然可以直接索引）
	print(succeed, value);
end

local enum = dictSS:GetEnumerator();	-- 遍历用Enumerator
while enum:MoveNext() do
	print(enum.Current.Key, enum.Current.Value);
end
----- end -----
return M;