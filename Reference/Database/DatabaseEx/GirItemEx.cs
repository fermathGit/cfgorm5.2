using System;
using System.Collections.Generic;
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
using Network.Messages;
#endif


namespace Database {
    public partial class GirlItemEx {
        static GirlItemEx() {
        }
    }

    public partial class GirlItem {

        public bool IsDefaultDressItem() {
            return Ornam_base == 1;
        }

        public static GirlItem DefaultDressItem( GuilderModelPartType type ) {
            var keys = GetKeys();
            for ( int i = 0; i < keys.Count; i++ ) {
                GirlItem item = GirlItem.Get( keys[i] );
                if ( item.IsDefaultDressItem() && item.Ornam_type == (int)type ) {
                    return item;
                }
            }
            return null;
        }
    }
}
