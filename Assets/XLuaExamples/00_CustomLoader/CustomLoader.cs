/*
 * Author:      熊哲
 * CreateTime:  5/23/2017 6:20:26 PM
 * Description:
 * 
*/
using System;
using System.Collections;
using System.IO;
using UnityEngine;
using XLua;

namespace EZhex1991.XLuaExamples
{
    public class CustomLoader : MonoBehaviour
    {
        public string require;

        private string luaDirPath;
        private LuaEnv luaEnv;

        void Start()
        {
            luaDirPath = Application.dataPath + "/XLuaExamples/";
            luaEnv = new LuaEnv();
            luaEnv.AddLoader(LoadFromFile);
            luaEnv.DoString("require('" + require + "')");
        }

        private byte[] LoadFromFile(ref string fileName)
        {
            string filePath = luaDirPath + fileName.Replace('.', '/') + ".lua";             // lua文件的实际路径
            fileName = fileName.Replace('.', '/');     // 返给lua调试器的路径
            try
            {
                // File.ReadAllBytes返回值可能会带有BOM（0xEF，0xBB，0xBF），这会导致脚本加载出错（</239>）
                byte[] script = System.Text.Encoding.UTF8.GetBytes(File.ReadAllText(filePath));
                return script;
            }
            catch
            {
                return null;
            }
        }
    }
}