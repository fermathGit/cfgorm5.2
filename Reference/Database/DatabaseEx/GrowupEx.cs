
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
    public partial class GrowupEx {
        static GrowupEx() {
            //OnLoadComplexField_rewardItem = Growup.onLoadComplexField_rewardItem;
            OnLoadComplexField_show_fake_ranke = Growup.onLoadComplexField_showFakeRank;
        }
    }

    public partial class Growup {
        public enum ELinkType {
            Daily,
            Panel,
        }

        public class TLink {
            public int id;
            public ELinkType type;
            public string name;
            public int icon;
        }

        protected TArray<int> m_show_fake_ranke = null;
        protected int m_showTopStart;
        protected int m_showDiv;

        public int GetTop( int top ) {
            /*
             * 作者:
            客户端排名显示是否作假【A,B】
            【A=开始作假的名次，B=作假除以后面的值】
            [0,0] 表示不作假
            [200,50] 表示大于200这个值，作假
            作假计算公式为：作假排名=取整（（真实名次-A）/B+A）            */
            int ret = top;
            if ( m_showTopStart > 0 && m_showDiv > 0 && top > m_showTopStart ) {
                 ret = ( top - m_showTopStart ) / m_showDiv + m_showTopStart;
            }
            UDebug.Log( "{0}: {3}-{4} top {1} -> {2}", m_showname, top, ret, m_showTopStart, m_showDiv );
            return ret;
        }

        internal static void onLoadComplexField_showFakeRank( Growup data, LuaDatabase.Query q ) {
            data.m_show_fake_ranke = GrowupEx.IsValid_show_fake_ranke ? Dataset.LoadIntArray( "show_fake_ranke", q ) : __default.m_show_fake_ranke;
            data.m_showTopStart = data.m_show_fake_ranke == null ? 0 : ( data.m_show_fake_ranke.Length > 0 ? data.m_show_fake_ranke[ 0 ] : 0 );
            data.m_showDiv = data.m_show_fake_ranke == null ? 0 : ( data.m_show_fake_ranke.Length > 1 ? data.m_show_fake_ranke[ 1 ] : 0 );
        }

        public static List<TLink> GetLinks(Growup data ) {
            List<TLink> ret = new List<TLink>();
            if (data.ifdaily1 > 0 ) {
                var way = new TLink();
                way.type = ELinkType.Daily;
                way.id = data.ifdaily1;
                way.name = data.iconname1;
                way.icon = data.iconshow1;
                ret.Add( way );
            } else if (data.ifpanle1 > 0 ) {
                var way = new TLink();
                way.type = ELinkType.Panel;
                way.id = data.ifpanle1;
                way.name = data.iconname1;
                way.icon = data.iconshow1;
                ret.Add( way );
            }

            if ( data.ifdaily2 > 0 ) {
                var way = new TLink();
                way.type = ELinkType.Daily;
                way.id = data.ifdaily2;
                way.name = data.iconname2;
                way.icon = data.iconshow2;
                ret.Add( way );
            } else if ( data.ifpanle2 > 0 ) {
                var way = new TLink();
                way.type = ELinkType.Panel;
                way.id = data.ifpanle2;
                way.name = data.iconname2;
                way.icon = data.iconshow2;
                ret.Add( way );
            }

            if ( data.ifdaily3 > 0 ) {
                var way = new TLink();
                way.type = ELinkType.Daily;
                way.id = data.ifdaily3;
                way.name = data.iconname3;
                way.icon = data.iconshow3;
                ret.Add( way );
            } else if ( data.ifpanle3 > 0 ) {
                var way = new TLink();
                way.type = ELinkType.Panel;
                way.id = data.ifpanle3;
                way.name = data.iconname3;
                way.icon = data.iconshow3;
                ret.Add( way );
            }

            if ( data.ifdaily4 > 0 ) {
                var way = new TLink();
                way.type = ELinkType.Daily;
                way.id = data.ifdaily4;
                way.name = data.iconname4;
                way.icon = data.iconshow4;
                ret.Add( way );
            } else if ( data.ifpanle4 > 0 ) {
                var way = new TLink();
                way.type = ELinkType.Panel;
                way.id = data.ifpanle4;
                way.name = data.iconname4;
                way.icon = data.iconshow4;
                ret.Add( way );
            }

            return ret;
        }
    }
}
