using System.Collections.Generic;
using Database;

//再每个项目里创建一个类似的Factory类来统一管理资源
public class CfgORM_ExampleFactory {
    //private static readonly IDictionary<string, Database> configs = new Dictionary<string, Database>();

    //private static readonly IDictionary<string, CfgORM_Example01Orm> mExample01Dic = new Dictionary<string, CfgORM_Example01Orm>();

    private static readonly IDictionary<string, CfgORMExample02Orm> lwz = new Dictionary<string, CfgORMExample02Orm>();

    private CfgORM_ExampleFactory() {

    }

    //加载资源
    public static void LoadResources( string aUrl ) {
        CfgManager.LoadResource( aUrl, lwz );
    }

    // public static void LoadAllResources( ) {
    //     if ( s_CfgORMExample02 != null && s_CfgORMExample02.Length > 0 ) {
    //         for ( int i = 0, imax = s_CfgORMExample02.Length; i < imax; ++i ) {
    //
    //        }
    //    }
    // }

    //读取资源
    public static CfgORMExample02Orm GetExample01( string aID ) {
        CfgORMExample02Orm orm;
        lwz.TryGetValue( aID, out orm );
        return orm;
    }

}

//* factory类代码自动生成
//* 生成的类除了结构，再提供几种常用方法。和上面一条结合起来  （get;getALL;）
//* 类的partial提供一种可行的模板（缓存一些数据、实在不行 二维数组在这搞一下）
//* 表头预先写好字段类型
//* 二维数组的处理
