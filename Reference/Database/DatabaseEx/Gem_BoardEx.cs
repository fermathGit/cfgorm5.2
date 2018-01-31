using System;
using System.Collections.Generic;
using Common;
using EquipSpace;
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
    public partial class Gem_Board {
        public struct GemBoardType {
            public int type;
            public int lv;
            public string des;
            public int itemid;
        }
        public static Dictionary<int, List<GemBoardType>> m_gemboard = new Dictionary<int, List<GemBoardType>>();

        //public static List<GemBoardType> GetBoardByHole( int hole ) {
        //    if ( m_gemboard.ContainsKey( hole ) ) {
        //        return m_gemboard[hole];
        //    }
        //    return SetAllGemBoard(hole);
        //}

        public static List<GemBoardType> SetAllGemBoard( int hole ) {
            if ( m_gemboard.ContainsKey( hole ) ) {
                return m_gemboard[hole];
            }
            var list = GetKeys();
            List<GemBoardType> wuqi = new List<GemBoardType>();
            List<GemBoardType> fushou = new List<GemBoardType>();
            List<GemBoardType> hujia = new List<GemBoardType>();
            List<GemBoardType> hue = new List<GemBoardType>();
            List<GemBoardType> huwan = new List<GemBoardType>();
            List<GemBoardType> huyao = new List<GemBoardType>();
            List<GemBoardType> hutui = new List<GemBoardType>();
            List<GemBoardType> xianglian = new List<GemBoardType>();
            List<GemBoardType> jiezi = new List<GemBoardType>();
            List<GemBoardType> shipin = new List<GemBoardType>();
            for ( int i = 0; i < list.Count; ++i ) {
                var data = Get( list[i] );
                switch ( data.hole_pos ) {
                case (int)EquipDefine.WuQi:
                    GemBoardType type = new GemBoardType();
                    type.type = data.hole_type;
                    type.lv = data.open_lv;
                    type.des = data.dec;
                    type.itemid = data.item;
                    wuqi.Add( type );
                    break;
                case (int)EquipDefine.FuShou:
                    GemBoardType type1 = new GemBoardType();
                    type1.type = data.hole_type;
                    type1.lv = data.open_lv;
                    type1.des = data.dec;
                    type1.itemid = data.item;
                    fushou.Add( type1 );
                    break;
                case (int)EquipDefine.HuJia:
                    GemBoardType type2 = new GemBoardType();
                    type2.type = data.hole_type;
                    type2.lv = data.open_lv;
                    type2.des = data.dec;
                    type2.itemid = data.item;
                    hujia.Add( type2 );
                    break;
                case (int)EquipDefine.HuE:
                    GemBoardType type3 = new GemBoardType();
                    type3.type = data.hole_type;
                    type3.lv = data.open_lv;
                    type3.des = data.dec;
                    type3.itemid = data.item;
                    hue.Add( type3 );
                    break;
                case (int)EquipDefine.HuWan:
                    GemBoardType type4 = new GemBoardType();
                    type4.type = data.hole_type;
                    type4.lv = data.open_lv;
                    type4.des = data.dec;
                    type4.itemid = data.item;
                    huwan.Add( type4 );
                    break;
                case (int)EquipDefine.HuYao:
                    GemBoardType type5 = new GemBoardType();
                    type5.type = data.hole_type;
                    type5.lv = data.open_lv;
                    type5.des = data.dec;
                    type5.itemid = data.item;
                    huyao.Add( type5 );
                    break;
                case (int)EquipDefine.HuTui:
                    GemBoardType type6 = new GemBoardType();
                    type6.type = data.hole_type;
                    type6.lv = data.open_lv;
                    type6.des = data.dec;
                    type6.itemid = data.item;
                    hutui.Add( type6 );
                    break;
                case (int)EquipDefine.XiangLian:
                    GemBoardType type7 = new GemBoardType();
                    type7.type = data.hole_type;
                    type7.lv = data.open_lv;
                    type7.des = data.dec;
                    type7.itemid = data.item;
                    xianglian.Add( type7 );
                    break;
                case (int)EquipDefine.JieZi:
                    GemBoardType type8 = new GemBoardType();
                    type8.type = data.hole_type;
                    type8.lv = data.open_lv;
                    type8.des = data.dec;
                    type8.itemid = data.item;
                    jiezi.Add( type8 );
                    break;
                case (int)EquipDefine.ShiPin:
                    GemBoardType type9 = new GemBoardType();
                    type9.type = data.hole_type;
                    type9.lv = data.open_lv;
                    type9.des = data.dec;
                    type9.itemid = data.item;
                    shipin.Add( type9 );
                    break;
                }
            }
            wuqi.Sort( ( a, b ) => { return a.lv - b.lv; } );
            fushou.Sort( ( a, b ) => { return a.lv - b.lv; } );
            hujia.Sort( ( a, b ) => { return a.lv - b.lv; } );
            hue.Sort( ( a, b ) => { return a.lv - b.lv; } );
            huwan.Sort( ( a, b ) => { return a.lv - b.lv; } );
            huyao.Sort( ( a, b ) => { return a.lv - b.lv; } );
            hutui.Sort( ( a, b ) => { return a.lv - b.lv; } );
            xianglian.Sort( ( a, b ) => { return a.lv - b.lv; } );
            jiezi.Sort( ( a, b ) => { return a.lv - b.lv; } );
            shipin.Sort( ( a, b ) => { return a.lv - b.lv; } );
            m_gemboard.Add( (int)EquipDefine.WuQi, wuqi );
            m_gemboard.Add( (int)EquipDefine.FuShou, fushou );
            m_gemboard.Add( (int)EquipDefine.HuJia, hujia );
            m_gemboard.Add( (int)EquipDefine.HuE, hue );
            m_gemboard.Add( (int)EquipDefine.HuWan, huwan );
            m_gemboard.Add( (int)EquipDefine.HuYao, huyao );
            m_gemboard.Add( (int)EquipDefine.HuTui, hutui );
            m_gemboard.Add( (int)EquipDefine.XiangLian, xianglian );
            m_gemboard.Add( (int)EquipDefine.JieZi, jiezi );
            m_gemboard.Add( (int)EquipDefine.ShiPin, shipin );
            return m_gemboard[hole];
        }
    }
}
