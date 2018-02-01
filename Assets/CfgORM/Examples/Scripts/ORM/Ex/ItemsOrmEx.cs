using System.Collections.Generic;

namespace Database {

    public partial class ItemsOrm {
        static List<int> m_IsUse;
        List<bool> m_UseData;

        public ItemsOrm() {

        }

        //对于一些必须要遍历整个表的操作，可以缓存起来
        public static List<int> GetIsUseItem() {
            if ( m_IsUse == null ) {
                m_IsUse = new List<int>();
                var keys = GetKeys();
                foreach ( var key in keys ) {
                    var item = Get( key );
                    if ( item.IsUse ) {
                        m_IsUse.Add( key );
                    }
                }
                m_IsUse.Sort( ( a, b ) => {
                    return a - b;
                } );
            }
            return m_IsUse;
        }

        //对于对象中变量不方便配置成数组，又想打包处理的情况
        public List<bool> GetUseData() {
            if ( m_UseData == null ) {
                m_UseData = new List<bool>();
                m_UseData.Add( IsUse );
                m_UseData.Add( Name );
                m_UseData.Add( Itemtype );
                m_UseData.Add( Quality );
                m_UseData.Add( Deal );
            }
            return m_UseData;
        }
    }
}

