
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
    public partial class RechargeReward {
		public class Item{
			public int m_id;
			public int m_num;

            public Item(int id, int num ) {
                m_id = id;
                m_num = num;
            }
		}
	
        private List<Item> m_items = null;		
        public List<Item> items {
			get {
				if ( m_items == null){
                    InitList();
				}
				return m_items;
			}
		}
		
		void InitList(){
			if ( m_items == null){
				m_items = new List<Item>();
                if ( m_item1 > 0 )
                    m_items.Add( new Item( m_item1, m_num1 ) );
                if ( m_item2 > 0 )
                    m_items.Add( new Item( m_item2, m_num2 ) );
                if ( m_item3 > 0 )
                    m_items.Add( new Item( m_item3, m_num3 ) );
                if ( m_item4 > 0 )
                    m_items.Add( new Item( m_item4, m_num4 ) );
                if ( m_item5 > 0 )
                    m_items.Add( new Item( m_item5, m_num5 ) );
                if ( m_item6 > 0 )
                    m_items.Add( new Item( m_item6, m_num6 ) );
                if ( m_item7 > 0 )
                    m_items.Add( new Item( m_item7, m_num7 ) );
                if ( m_item8 > 0 )
                    m_items.Add( new Item( m_item8, m_num8 ) );
                if ( m_item9 > 0 )
                    m_items.Add( new Item( m_item9, m_num9 ) );
                if ( m_item10 > 0 )
                    m_items.Add( new Item( m_item10, m_num10 ) );
            }
		}
    }
}
