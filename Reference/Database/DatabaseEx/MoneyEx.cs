
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
#endif


namespace Database {
    public partial class Money {
        public static Dictionary<int, int> m_moneyItemDic = new Dictionary<int, int>();
        public static Dictionary<int, int> m_moneyIconDic = new Dictionary<int, int>();

        public static int GetMoneyItem( int moneyType ) {
            int ret = 0, other = 0;
            if ( !m_moneyItemDic.TryGetValue( moneyType, out ret ) ) {
                InitMoneyInfo( moneyType, ref ret, ref other );
            }
            return ret;
        }

        public static int GetMoneyIcon( int moneyType ) {
            int ret = 0, other = 0;
            if ( !m_moneyIconDic.TryGetValue( moneyType, out ret ) ) {
                InitMoneyInfo( moneyType, ref other, ref ret );
            }
            return ret;
        }

        static void InitMoneyInfo( int moneyType, ref int itemId, ref int iconId ) {
            var db = Get( moneyType );
            if ( db != null ) {
                itemId = db.id;
                iconId = db.m_money_icon;
                m_moneyItemDic[moneyType] = itemId;
                m_moneyIconDic[moneyType] = iconId;
            }
        }


        public static void ClearCacheEx() {
            m_moneyItemDic.Clear();
            m_moneyIconDic.Clear();
        }
    }
}
