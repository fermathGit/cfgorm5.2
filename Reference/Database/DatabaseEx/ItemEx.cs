
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
    public partial class ItemEx {
        static ItemEx() {
            OnLoadComplexField_iconPath = Item.OnLoadComplexField_iconPath;
            OnLoadComplexField_Relation_UI = Item.onLoadComplexField_ItemJump;
            OnLoadComplexField_propParam = Item.onLoadComplexField_propParam;
            OnLoadComplexField_toequip = Item.onLoadComplexField_toequip;
            OnLoadComplexField_UseJumpPage = Item.onLoadComplexField_UseJumpPag;
            OnLoadComplexField_useNeeditem = Item.onLoadComplexField_useNeeditem;
            OnLoadComplexField_useNeedmoney = Item.onLoadComplexField_useNeedmoney;
        }
    }

    public partial class Item {
        public enum ItemBagType {
            All = 0,
            Matrial = 1,
            GiftPackage = 2,
            Other = 3,
            Count
        }

        public enum ItemUseType {
            None = 0,
            DirectUse = 1, // 服务器直接使用
            PromptUse = 2, // 提示使用
        }

        public enum ItemOperate {
            NoSell = 1 << 0,            // 不可出售
            NoStorage = 1 << 1,         // 不可放入仓库
            NoDeal = 1 << 2,            // 不可交易
        }

        // item 里面对应道具
        public enum ItemIdType {
            RoleExp = 30,       // 角色经验
        }

        private TArray<int> m_iconPath = null;
        private TArray<TArray<int>> m_itemJump = null;
        private TArray<TArray<int>> m_itemUseJump = null;
        private TArray<TArray<int>> m_propParam = null;
        private TArray<int> m_toEquip = null;
        private TArray<int> m_useNeeditem = null;
        private TArray<int> m_useNeedmoney = null;

        public TArray<TArray<int>> ItemJump { get { return m_itemJump; } }
        public TArray<TArray<int>> propParam { get { return m_propParam; } }

        public int GetIconPath( int career ) {
            if( m_iconPath == null ) {
                return 0;
            }
            if( iconCarrier == 0 ) {
                return m_iconPath.Length > 0 ? m_iconPath[0] : 0;
            } else {
                return m_iconPath.Length >= career && career > 0 ? m_iconPath[career - 1] : 0;
            }
        }

        public bool GetUseNeedItem( List<Materialcost> cost ) {
            bool ret = false;
            if( cost != null ) {
                if( m_useNeeditem != null && m_useNeeditem.Length >= 2 ) {
                    cost.Add( new Materialcost( m_useNeeditem[0], m_useNeeditem[1] ) );
                    ret = true;
                }
                if( m_useNeedmoney != null && m_useNeedmoney.Length >= 2 ) {
                    cost.Add( new Materialcost( m_useNeedmoney[0], m_useNeedmoney[1] ) );
                    ret = true;
                }
            }
            return ret;
        }

        public TArray<int> GetUseJumpPath( int career ) {
            if( m_itemUseJump == null || m_itemUseJump.Length == 0 ) {
                return null;
            }
            return m_itemUseJump.Length >= career && career > 0 ? m_itemUseJump[career - 1] : m_itemUseJump[0];
        }

        public int GetEquipId( int career ) {
            if( m_toEquip == null ) {
                return 0;
            }
            if( iconCarrier == 0 ) {
                return m_toEquip.Length > 0 ? m_toEquip[0] : 0;
            } else {
                return m_toEquip.Length >= career && career > 0 ? m_toEquip[career - 1] : 0;
            }
        }

        internal static void OnLoadComplexField_iconPath( Item data, LuaDatabase.Query q ) {
            data.m_iconPath = ItemEx.IsValid_iconPath ? Dataset.LoadIntArray( "iconPath", q ) : __default.m_iconPath;
        }

        internal static void onLoadComplexField_ItemJump( Item data, LuaDatabase.Query q ) {
            data.m_itemJump = ItemEx.IsValid_Relation_UI ? Dataset.LoadIntArray2d( "Relation_UI", q ) : __default.m_itemJump;
        }

        internal static void onLoadComplexField_propParam( Item data, LuaDatabase.Query q ) {
            data.m_propParam = ItemEx.IsValid_propParam ? Dataset.LoadIntArray2d( "propParam", q ) : __default.m_propParam;
        }

        internal static void onLoadComplexField_toequip( Item data, LuaDatabase.Query q ) {
            data.m_toEquip = ItemEx.IsValid_toequip ? Dataset.LoadIntArray( "toequip", q ) : __default.m_toEquip;
        }

        internal static void onLoadComplexField_UseJumpPag( Item data, LuaDatabase.Query q ) {
            data.m_itemUseJump = ItemEx.IsValid_UseJumpPage ? Dataset.LoadIntArray2d( "UseJumpPage", q ) : __default.m_itemUseJump;
        }

        internal static void onLoadComplexField_useNeeditem( Item data, LuaDatabase.Query q ) {
            data.m_useNeeditem = ItemEx.IsValid_useNeeditem ? Dataset.LoadIntArray( "useNeeditem", q ) : __default.m_useNeeditem;
        }

        internal static void onLoadComplexField_useNeedmoney( Item data, LuaDatabase.Query q ) {
            data.m_useNeedmoney = ItemEx.IsValid_useNeedmoney ? Dataset.LoadIntArray( "useNeedmoney", q ) : __default.m_useNeedmoney;
        }

        // item op
        public bool GetItemOperate( ItemOperate useOperate ) {
            bool ret = false;
            if( operate != 0 && ( operate & (int)useOperate ) != 0 ) {
                return true;
            }
            return ret;
        }
    }
}
