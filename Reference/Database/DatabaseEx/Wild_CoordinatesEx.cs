using System;
using System.Collections.Generic;
using Common;
#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaDatabase = NativeLua.LuaDatabase;
using LuaTableHandle = System.Int64;
using LuaStateHandle = System.IntPtr;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
using LuaTableHandle = System.Object;
using LuaStateHandle = UniLua.ILuaState;
#endif


namespace Database {
    public partial class Wild_Coordinates {
        private TArray<TArray<int>> m_wild_coordinates = null;
        public TArray<TArray<int>> wild_coordinates { get { return m_wild_coordinates; } set { m_wild_coordinates = value; } }


        internal static void OnLoadComplexField_coordinates( Wild_Coordinates data, LuaDatabase.Query q ) {
            data.m_wild_coordinates = Wild_CoordinatesEx.IsValid_coordinates ? Dataset.LoadIntArray2d( "coordinates", q ) : __default.m_wild_coordinates;
        }
    }


    public partial class Wild_CoordinatesEx {
        static Wild_CoordinatesEx() {
            OnLoadComplexField_coordinates = Wild_Coordinates.OnLoadComplexField_coordinates;
        }
    }
}
