--[==[
Author:     熊哲
CreateTime: 5/23/2017 7:00:42 PM
Description:

--]==]
local moduleName = ...;
local M = { };
M.__index = M;
----- begin module -----

-- lua弱类型造成的参数类型混淆
print("UnityEngine.Random.Range(0,10)", "->", CS.UnityEngine.Random.Range(0, 10));	-- float和int在lua上无法区分，这里会调用Range(float, float)
print("EZhex1991.Random.RangeInt(0,10)", "->", CS.EZhex1991.Random.RangeInt(0, 10));	-- 自己把这个方法封装一下RangeInt(int, int) -> Range(int, int)
print("EZhex1991.Random.RangeFoat(0,10)", "->", CS.EZhex1991.Random.RangeFloat(0, 10));	-- RangeFloat(float, float) -> Range(float, float)

-- out和ref由参数变成返回值造成的参数个数混淆
local origin = CS.UnityEngine.Vector3.one * -1;
local direction = CS.UnityEngine.Vector3.one;
local ray = CS.UnityEngine.Ray(origin, direction);
local hit1, info1 = CS.UnityEngine.Physics.Raycast(ray);	-- 无法区分Raycast(Ray)和Raycast(Ray, out HitInfo)，这里会调用Raycast(Ray)
print(hit1, info1 and info1.collider.name);
local hit2, info2 = CS.EZhex1991.Physics.Raycast(ray);		-- 自己封装Raycast(Ray, out HitInfo)
print(hit2, info2 and info2.collider.name);
----- end -----
return M;