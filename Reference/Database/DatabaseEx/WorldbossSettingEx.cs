using System;
using System.Collections.Generic;
using Common;
using UniLuax;
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
    public partial class WorldbossSettingEx {
        static WorldbossSettingEx() {
            OnLoadComplexField_PlayerNo1 = WorldbossSetting.OnLoadComplexField_PlayerNo1;
            OnLoadComplexField_PlayerNo2 = WorldbossSetting.OnLoadComplexField_PlayerNo2;
            OnLoadComplexField_PlayerNo3 = WorldbossSetting.OnLoadComplexField_PlayerNo3;
            OnLoadComplexField_PlayerNo4 = WorldbossSetting.OnLoadComplexField_PlayerNo4;
            OnLoadComplexField_PlayerNo5 = WorldbossSetting.OnLoadComplexField_PlayerNo5;
            OnLoadComplexField_PlayerNo6 = WorldbossSetting.OnLoadComplexField_PlayerNo6;
            OnLoadComplexField_PlayerNo7 = WorldbossSetting.OnLoadComplexField_PlayerNo7;
            OnLoadComplexField_PlayerNo8 = WorldbossSetting.OnLoadComplexField_PlayerNo8;

            OnLoadComplexField_Rewarditem1 = WorldbossSetting.OnLoadComplexField_Rewarditem1;
            OnLoadComplexField_Rewarditem2 = WorldbossSetting.OnLoadComplexField_Rewarditem2;
            OnLoadComplexField_Rewarditem3 = WorldbossSetting.OnLoadComplexField_Rewarditem3;
            OnLoadComplexField_Rewarditem4 = WorldbossSetting.OnLoadComplexField_Rewarditem4;
            OnLoadComplexField_Rewarditem5 = WorldbossSetting.OnLoadComplexField_Rewarditem5;
            OnLoadComplexField_Rewarditem6 = WorldbossSetting.OnLoadComplexField_Rewarditem6;
            OnLoadComplexField_Rewarditem7 = WorldbossSetting.OnLoadComplexField_Rewarditem7;
            OnLoadComplexField_Rewarditem8 = WorldbossSetting.OnLoadComplexField_Rewarditem8;
            OnLoadComplexField_RewardAll = WorldbossSetting.OnLoadComplexField_RewardAll;

        }
    }

    public partial class WorldbossSetting {
        public TArray<int> PlayerNo1;
        public TArray<int> PlayerNo2;
        public TArray<int> PlayerNo3;
        public TArray<int> PlayerNo4;
        public TArray<int> PlayerNo5;
        public TArray<int> PlayerNo6;
        public TArray<int> PlayerNo7;
        public TArray<int> PlayerNo8;
        public TArray<TArray<int>> Rewarditem1;
        public TArray<TArray<int>> Rewarditem2;
        public TArray<TArray<int>> Rewarditem3;
        public TArray<TArray<int>> Rewarditem4;
        public TArray<TArray<int>> Rewarditem5;
        public TArray<TArray<int>> Rewarditem6;
        public TArray<TArray<int>> Rewarditem7;
        public TArray<TArray<int>> Rewarditem8;
        public TArray<TArray<int>> RewardAll;

        internal static void OnLoadComplexField_PlayerNo1( WorldbossSetting data, LuaDatabase.Query q ) {
            data.PlayerNo1 = WorldbossSettingEx.IsValid_PlayerNo1 ? Dataset.LoadIntArray( "PlayerNo1", q ) : __default.PlayerNo1;
        }

        internal static void OnLoadComplexField_PlayerNo2( WorldbossSetting data, LuaDatabase.Query q ) {
            data.PlayerNo2 = WorldbossSettingEx.IsValid_PlayerNo2 ? Dataset.LoadIntArray( "PlayerNo2", q ) : __default.PlayerNo2;
        }

        internal static void OnLoadComplexField_PlayerNo3( WorldbossSetting data, LuaDatabase.Query q ) {
            data.PlayerNo3 = WorldbossSettingEx.IsValid_PlayerNo3 ? Dataset.LoadIntArray( "PlayerNo3", q ) : __default.PlayerNo3;
        }

        internal static void OnLoadComplexField_PlayerNo4( WorldbossSetting data, LuaDatabase.Query q ) {
            data.PlayerNo4 = WorldbossSettingEx.IsValid_PlayerNo4 ? Dataset.LoadIntArray( "PlayerNo4", q ) : __default.PlayerNo4;
        }

        internal static void OnLoadComplexField_PlayerNo5( WorldbossSetting data, LuaDatabase.Query q ) {
            data.PlayerNo5 = WorldbossSettingEx.IsValid_PlayerNo5 ? Dataset.LoadIntArray( "PlayerNo5", q ) : __default.PlayerNo5;
        }

        internal static void OnLoadComplexField_PlayerNo6( WorldbossSetting data, LuaDatabase.Query q ) {
            data.PlayerNo6 = WorldbossSettingEx.IsValid_PlayerNo6 ? Dataset.LoadIntArray( "PlayerNo6", q ) : __default.PlayerNo6;
        }

        internal static void OnLoadComplexField_PlayerNo7( WorldbossSetting data, LuaDatabase.Query q ) {
            data.PlayerNo7 = WorldbossSettingEx.IsValid_PlayerNo7 ? Dataset.LoadIntArray( "PlayerNo7", q ) : __default.PlayerNo7;
        }

        internal static void OnLoadComplexField_PlayerNo8( WorldbossSetting data, LuaDatabase.Query q ) {
            data.PlayerNo8 = WorldbossSettingEx.IsValid_PlayerNo8 ? Dataset.LoadIntArray( "PlayerNo8", q ) : __default.PlayerNo8;
        }


        internal static void OnLoadComplexField_Rewarditem1( WorldbossSetting data, LuaDatabase.Query q ) {
            data.Rewarditem1 = WorldbossSettingEx.IsValid_Rewarditem1 ? Dataset.LoadIntArray2d( "Rewarditem1", q ) : __default.Rewarditem1;
        }

        internal static void OnLoadComplexField_Rewarditem2( WorldbossSetting data, LuaDatabase.Query q ) {
            data.Rewarditem2 = WorldbossSettingEx.IsValid_Rewarditem2 ? Dataset.LoadIntArray2d( "Rewarditem2", q ) : __default.Rewarditem2;
        }

        internal static void OnLoadComplexField_Rewarditem3( WorldbossSetting data, LuaDatabase.Query q ) {
            data.Rewarditem3 = WorldbossSettingEx.IsValid_Rewarditem3 ? Dataset.LoadIntArray2d( "Rewarditem3", q ) : __default.Rewarditem3;
        }

        internal static void OnLoadComplexField_Rewarditem4( WorldbossSetting data, LuaDatabase.Query q ) {
            data.Rewarditem4 = WorldbossSettingEx.IsValid_Rewarditem4 ? Dataset.LoadIntArray2d( "Rewarditem4", q ) : __default.Rewarditem4;
        }

        internal static void OnLoadComplexField_Rewarditem5( WorldbossSetting data, LuaDatabase.Query q ) {
            data.Rewarditem5 = WorldbossSettingEx.IsValid_Rewarditem5 ? Dataset.LoadIntArray2d( "Rewarditem5", q ) : __default.Rewarditem5;
        }

        internal static void OnLoadComplexField_Rewarditem6( WorldbossSetting data, LuaDatabase.Query q ) {
            data.Rewarditem6 = WorldbossSettingEx.IsValid_Rewarditem6 ? Dataset.LoadIntArray2d( "Rewarditem6", q ) : __default.Rewarditem6;
        }

        internal static void OnLoadComplexField_Rewarditem7( WorldbossSetting data, LuaDatabase.Query q ) {
            data.Rewarditem7 = WorldbossSettingEx.IsValid_Rewarditem7 ? Dataset.LoadIntArray2d( "Rewarditem7", q ) : __default.Rewarditem7;
        }

        internal static void OnLoadComplexField_Rewarditem8( WorldbossSetting data, LuaDatabase.Query q ) {
            data.Rewarditem8 = WorldbossSettingEx.IsValid_Rewarditem8 ? Dataset.LoadIntArray2d( "Rewarditem8", q ) : __default.Rewarditem8;
        }

        internal static void OnLoadComplexField_RewardAll( WorldbossSetting data, LuaDatabase.Query q ) {
            data.RewardAll = WorldbossSettingEx.IsValid_RewardAll ? Dataset.LoadIntArray2d( "RewardAll", q ) : __default.RewardAll;
        }

        public static TArray<int> GetCurReward( int id, int myRank ) {
            var data = Get( id );
            if ( myRank <= data.PlayerNo1[1] && myRank >= data.PlayerNo1[0] ) {
                return data.Rewarditem1[0];
            }
            if ( myRank <= data.PlayerNo2[1] && myRank >= data.PlayerNo2[0] ) {
                return data.Rewarditem2[0];
            }
            if ( myRank <= data.PlayerNo3[1] && myRank >= data.PlayerNo3[0] ) {
                return data.Rewarditem3[0];
            }
            if ( myRank <= data.PlayerNo4[1] && myRank >= data.PlayerNo4[0] ) {
                return data.Rewarditem4[0];
            }
            if ( myRank <= data.PlayerNo5[1] && myRank >= data.PlayerNo5[0] ) {
                return data.Rewarditem5[0];
            }
            if ( myRank <= data.PlayerNo6[1] && myRank >= data.PlayerNo6[0] ) {
                return data.Rewarditem6[0];
            }
            if ( myRank <= data.PlayerNo7[1] && myRank >= data.PlayerNo7[0] ) {
                return data.Rewarditem7[0];
            }
            if ( myRank <= data.PlayerNo8[1] && myRank >= data.PlayerNo8[0] ) {
                return data.Rewarditem8[0];
            }

            return data.RewardAll[0];
        }

    }
}
