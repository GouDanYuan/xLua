--[==[
Author:     熊哲
CreateTime: 5/23/2017 7:00:42 PM
Description:

--]==]
local moduleName = ...;
local M = { };
M.__index = M;
----- begin module -----
print("UnityEngine.Random.Range(0,10)", "->", CS.UnityEngine.Random.Range(0, 10));
print("EZhex1991.Random.RangeInt(0,10)", "->", CS.EZhex1991.Random.RangeInt(0, 10));
print("EZhex1991.Random.RangeFoat(0,10)", "->", CS.EZhex1991.Random.RangeFloat(0, 10));

local origin = CS.UnityEngine.Vector3.one * -1;
local direction = CS.UnityEngine.Vector3.one;
local ray = CS.UnityEngine.Ray(origin, direction);
local hit1, info1 = CS.UnityEngine.Physics.Raycast(ray);
print(hit1, info1 and info1.collider.name);
local hit2, info2 = CS.EZhex1991.Physics.Raycast(ray);
print(hit2, info2 and info2.collider.name);
----- end -----
return M;