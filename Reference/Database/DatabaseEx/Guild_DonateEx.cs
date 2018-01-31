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
    public partial class Guild_DonateEx {
        static Guild_DonateEx() {
            OnLoadComplexField_consumption = Guild_Donate.OnLoadComplexField_consumption;
            OnLoadComplexField_guild_ewards = Guild_Donate.OnLoadComplexField_guild_ewards;
            OnLoadComplexField_self_exp = Guild_Donate.OnLoadComplexField_self_exp;
        }
    }

    public partial class Guild_Donate {
        TArray<TArray<int>> consumption = null;
        TArray<TArray<int>> guild_ewards = null;
        TArray<TArray<int>> self_exp = null;

        public TArray<TArray<int>> Consumption { get { return consumption; } }
        public TArray<TArray<int>> Guild_ewards { get { return guild_ewards; } }
        public TArray<TArray<int>> Self_exp { get { return self_exp; } }

        public static void OnLoadComplexField_consumption( Guild_Donate data, LuaDatabase.Query q ) {
            data.consumption = Guild_DonateEx.IsValid_consumption ? Dataset.LoadIntArray2d( "consumption", q ) : __default.consumption;
        }

        public static void OnLoadComplexField_guild_ewards( Guild_Donate data, LuaDatabase.Query q ) {
            data.guild_ewards = Guild_DonateEx.IsValid_guild_ewards ? Dataset.LoadIntArray2d( "guild_ewards", q ) : __default.guild_ewards;
        }

        public static void OnLoadComplexField_self_exp( Guild_Donate data, LuaDatabase.Query q ) {
            data.self_exp = Guild_DonateEx.IsValid_self_exp ? Dataset.LoadIntArray2d( "self_exp", q ) : __default.self_exp;
        }

    }
}
