/*
 * Author:      熊哲
 * CreateTime:  1/20/2017 1:33:41 PM
 * Description:
 * 
*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using XLua;

namespace EZFramework.XLuaGen
{
    public static class UnityEngineGenList
    {
        [LuaCallCSharp]
        public static List<Type> LuaCallCSharp
        {
            get
            {
                return (Assembly.Load("Assembly-CSharp").GetTypes()
                        .Where(type => type.Namespace == "UnityEngine"))
                        .ToList();
            }
        }

        [CSharpCallLua]
        public static List<Type> CSharpCallLua = new List<Type>()
        {
            typeof(UnityEngine.Events.UnityAction),
        };

        [BlackList]
        public static List<List<string>> BlackList = new List<List<string>>()
        {
            new List<string>() {"UnityEngine.GameObject", "networkView" },
            new List<string>() {"UnityEngine.Input", "IsJoystickPreconfigured", "System.String" },
            new List<string>() {"UnityEngine.Light", "areaSize" },
            new List<string>() {"UnityEngine.Texture2D", "alphaIsTransparency" },
            new List<string>() {"UnityEngine.UI.Text", "OnRebuildRequested" },
            new List<string>() {"UnityEngine.WWW", "movie" },
            new List<string>() {"UnityEngine.Handheld", "GetActivityIndicatorStyle" },
            new List<string>() {"UnityEngine.Handheld", "SetActivityIndicatorStyle", "UnityEngine.iOS.ActivityIndicatorStyle" },
        };
    }
}