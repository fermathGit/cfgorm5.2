
using System;
using System.Collections.Generic;
using Common;
using System.Text;
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
    public partial class RndNameEx {

    }

    public partial class RndName {
        public static string GetRandName( Gender gender ) {
            StringBuilder roleName = StringUtils.newStringBuilder;
            RndName firstName = GetName();
            RndName secondName = GetName();
            if ( firstName != null && secondName != null ) {
                roleName.Append( firstName.firstname );
                roleName.Append( gender == Gender.Male ? secondName.boyname : secondName.girlname );
            }
            return roleName.ToString();
        }

        private static RndName GetName() {
            return RndName.Get( UnityEngine.Random.Range( 1, RndName.GetKeys().Count ) );
        }
    }
}
