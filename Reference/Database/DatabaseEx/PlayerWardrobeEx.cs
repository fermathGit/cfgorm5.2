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
    public partial class PlayerWardrobeEx {
        static PlayerWardrobeEx() {
            OnLoadComplexField_property = PlayerWardrobe.onLoadComplexField_property;
        }
    }

    public partial class PlayerWardrobe {
        private TArray<TArray<double>> m_property = null;
        public TArray<TArray<double>> property { get { return m_property; } }


        internal static void onLoadComplexField_property( PlayerWardrobe data, LuaDatabase.Query q ) {
            data.m_property = PlayerWardrobeEx.IsValid_property ? Dataset.LoadNumberArray2d( "property", q ) : __default.m_property;
        }
    }
}