using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Common;
#if USE_NATIVE_LUA
using NLuaState = NativeLua.NLuaState;
using LuaType = NativeLua.LuaDLL;
using LuaTinker = NativeLua.LuaTinker;
using LuaDatabase = NativeLua.LuaDatabase;
#else
using NLuaState = UniLua.ILuaState;
using LuaType = UniLua.LuaType;
using LuaTinker = UniLuax.LuaTinker;
using LuaDatabase = UniLuax.LuaDatabase;
#endif


namespace Database {
    public partial class ZhenYaoTaEx {
        static ZhenYaoTaEx(){
            OnLoadComplexField_floor_show = ZhenYaoTa.LoadComplexField;
        }
    }

    public partial class ZhenYaoTa {
        TArray<TArray<int>> floor_show = null;
        TArray<TArray<double>> boss = null;

        public TArray<TArray<int>> Floor_show { get { return floor_show; } }
        public TArray<TArray<double>> Boss { get { return boss; } }

        public static void LoadComplexField(ZhenYaoTa data, LuaDatabase.Query q) {
            data.floor_show = ZhenYaoTaEx.IsValid_floor_show? Dataset.LoadIntArray2d("floor_show", q):__default.floor_show;
            data.boss = ZhenYaoTaEx.IsValid_BOSS ? Dataset.LoadNumberArray2d( "BOSS", q ) : __default.boss;
        }
    }
}
