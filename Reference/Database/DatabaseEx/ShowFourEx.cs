
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
    public partial class ShowFourEx {
        static ShowFourEx() {
            OnLoadComplexField_talk_id = ShowFour.OnLoadComplexField_talk_id;
        }
    }

    public partial class ShowFour {

        public enum ShowFourState {
            EntryRange      = 1,    // 1����ҽ��뷶Χ��ÿ�������˵����param=��ʱ���
            MonsterFresh    = 2,    // 2������ˢ�³���ʱ
            MonsterUseSkill = 3,    // 3�������ͷŹ̶�����,param=����id
            RemainHp        = 4,    // 4��Ѫ���ﵽ�ٷ�֮����ʱ��param=Ѫ���ٷֱ�
            PetFresh        = 6,    // 6������ˢ�³���ʱ
        }

        private TArray<int> m_talkIds = null;

        public bool needPlay {
            get {
                return show_rate >= 99 || UnityEngine.Random.Range( 0, 100 ) < show_rate;
            }
        }

        public int GetRandomTalkId( int exceptId ) {
            int ret = 0;
            if( m_talkIds != null && m_talkIds.Length > 0 ) {
                var count = m_talkIds.Length;
                var index = UnityEngine.Random.Range( 0, count );
                while( ( ret <= 0 || ret == exceptId ) && count > 0 ) {
                    ret = m_talkIds[index];
                    index = ++index % m_talkIds.Length;
                    --count;
                }
            }
            return ret;
        }

        internal static void OnLoadComplexField_talk_id( ShowFour data, LuaDatabase.Query q ) {
            data.m_talkIds = ShowFourEx.IsValid_talk_id ? Dataset.LoadIntArray( "talk_id", q ) : __default.m_talkIds;
        }
    }
}
//EOF
