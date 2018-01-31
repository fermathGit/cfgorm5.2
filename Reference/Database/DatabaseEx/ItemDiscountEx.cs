
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
    public partial class  ItemDiscountEx {
        static ItemDiscountEx() {
            OnLoadComplexField_itemid = ItemDiscount.onLoadComplexField_itemid;
            OnLoadComplexField_model_hight = ItemDiscount.onLoadComplexField_model_hight;
            OnLoadComplexField_model_s = ItemDiscount.onLoadComplexField_model_s;
            OnLoadComplexField_OriginalPrice = ItemDiscount.onLoadComplexField_OriginalPrice;
            OnLoadComplexField_PresentPrice = ItemDiscount.onLoadComplexField_PresentPrice;
        }
    }

    public partial class ItemDiscount {
        private TArray<int> m_itemid;
        public TArray<int> itemid { get { return m_itemid; } set { m_itemid = value; } }

        private TArray<int> m_model_hight;
        public TArray<int> model_hight { get { return m_model_hight; } set { m_model_hight = value; } }

        private TArray<int> m_model_s;
        public TArray<int> model_s { get { return m_model_s; } set { m_model_s = value; } }

        private TArray<int> m_OriginalPrice;
        public TArray<int> OriginalPrice { get { return m_OriginalPrice; } set { m_OriginalPrice = value; } }

        private TArray<int> m_PresentPrice;
        public TArray<int> PresentPrice { get { return m_PresentPrice; } set { m_PresentPrice = value; } }

        internal static void onLoadComplexField_itemid( ItemDiscount data, LuaDatabase.Query q ) {
            data.m_itemid = ItemDiscountEx.IsValid_itemid ? Dataset.LoadIntArray( "itemid", q ) : __default.m_itemid;
        }

        internal static void onLoadComplexField_model_hight( ItemDiscount data, LuaDatabase.Query q ) {
            data.m_model_hight = ItemDiscountEx.IsValid_model_hight ? Dataset.LoadIntArray( "model_hight", q ) : __default.m_model_hight;
        }

        internal static void onLoadComplexField_model_s( ItemDiscount data, LuaDatabase.Query q ) {
            data.m_model_s = ItemDiscountEx.IsValid_model_s ? Dataset.LoadIntArray( "model_s", q ) : __default.m_model_s;
        }

        internal static void onLoadComplexField_OriginalPrice( ItemDiscount data, LuaDatabase.Query q ) {
            data.m_OriginalPrice = ItemDiscountEx.IsValid_OriginalPrice ? Dataset.LoadIntArray( "OriginalPrice", q ) : __default.m_OriginalPrice;
        }

        internal static void onLoadComplexField_PresentPrice( ItemDiscount data, LuaDatabase.Query q ) {
            data.m_PresentPrice = ItemDiscountEx.IsValid_PresentPrice ? Dataset.LoadIntArray( "PresentPrice", q ) : __default.m_PresentPrice;
        }
    }
}
