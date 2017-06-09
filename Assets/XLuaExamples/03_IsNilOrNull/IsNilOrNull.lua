--[==[
Author:     熊哲
CreateTime: 6/9/2017 3:09:45 PM
Description:

--]==]
local moduleName = ...;
local M = { };
M.__index = M;
----- begin module -----
local GameObject = CS.UnityEngine.GameObject;

local obj = GameObject("TestObj");

local rigidbody = obj:GetComponent("Rigidbody");	-- 物体上是没有Rigidbody的
print("rigidbody == nil", rigidbody == nil);		-- 返回值实际上是一个Object，在C#上因为重载了==null所以为空，此处==nil不行
print("rigidbody:Equals(nil)", rigidbody:Equals(nil));	-- 个人认为==的重载实际上是重载的object.Equals方法，所以这样可以获取到正确值
print("IsNull(rigidbody)", CS.EZhex1991.XLuaExample.CheckNull.IsNull(rigidbody));	-- xLua作者在faq上推荐的方法，个人认为没必要
----- end -----
return M;