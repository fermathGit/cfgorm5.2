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
    public partial class Equip_QualityEx {
        static Equip_QualityEx() {
            OnLoadComplexField_Tree_front = Equip_Quality.LoadComplexField_Tree_front;
        }
    }

    public partial class Equip_Quality {

        private TArray<int> m_treeFront = null;
        private List<Materialcost> m_materialcost = null;

        public TArray<int> treeFront { get { return m_treeFront; } }
        public List<Materialcost> materialcost { get { return m_materialcost; } }


        public static void LoadComplexField_Tree_front( Equip_Quality data, LuaDatabase.Query q ) {
            if ( Equip_QualityEx.IsValid_Tree_front ) {
                data.m_treeFront = Dataset.LoadIntArray( "Tree_front", q );
            } else {
                data.m_treeFront = __default.m_treeFront;
            }
            data.InitMaterialcost();
        }

        private void InitMaterialcost() {
            m_materialcost = new List<Materialcost>();
            if( q1_gold_type_0 != 0 && q1_gold_num_0 != 0 ) {
                m_materialcost.Add( new Materialcost( q1_gold_type_0, q1_gold_num_0 ) );
            }
            if( q1_item1_0 != 0 && q1_item1_num_0 != 0 ) {
                m_materialcost.Add( new Materialcost( q1_item1_0, q1_item1_num_0 ) );
            }
            if( q1_item2_0 != 0 && q1_item2_num_0 != 0 ) {
                m_materialcost.Add( new Materialcost( q1_item2_0, q1_item2_num_0 ) );
            }
            if( q1_item3_0 != 0 && q1_item3_num_0 != 0 ) {
                m_materialcost.Add( new Materialcost( q1_item3_0, q1_item3_num_0 ) );
            }
        }
    }

}
