--[==[
Author:     熊哲
CreateTime: 5/23/2017 5:55:45 PM
Description:

--]==]
local moduleName = ...;
local M = { };
M.__index = M;
----- begin module -----
local DictSS = CS.System.Collections.Generic["Dictionary`2[System.String,System.String]"];
local dictSS = DictSS();

dictSS:Add("0", "zero");
dictSS:Add("1", "one");

print(dictSS.Count);
local keys = { "0", "1", "2" };
for i = 1, 3 do
	local succeed, value = dictSS:TryGetValue(keys[i]);
	print(succeed, value);
end

local enum = dictSS:GetEnumerator();
while enum:MoveNext() do
	print(enum.Current.Key, enum.Current.Value);
end
----- end -----
return M;