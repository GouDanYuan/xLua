/*
 * Author:      熊哲
 * CreateTime:  3/13/2017 11:23:11 AM
 * Description:
 * 
*/

using UnityEngine;
using CSObjectWrapEditor;

namespace EZhex1991.XLuaExample
{
    public static class GenConfig
    {
        [GenPath]
        public static string GenPath = Application.dataPath + "/Gen/";

        [GenCodeMenu]
        public static void OnGenCode()
        {
            Debug.Log("[GenCodeMenu] function called");
        }
    }
}