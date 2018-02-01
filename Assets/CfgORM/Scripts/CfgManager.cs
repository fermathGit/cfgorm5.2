using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using UnityEngine;
/// <summary>
/// 资源信息管理。
/// </summary>
public class CfgManager {

    #region private class ColumnInfo Orm类的字段信息（内部分析用）。
    /// <summary>
    /// Orm类的字段信息（内部分析用）。
    /// </summary>
    private class ColumnInfo {
        /// <summary>
        /// Orm类的字段名（已转大写）。
        /// </summary>
        public string mColumnName;
        /// <summary>
        /// Orm类的字段信息。
        /// </summary>
        public FieldInfo mFieldInfo;
        /// <summary>
        /// Orm类数组字段的维度。
        /// </summary>
        public int mArrayIndex;
    }
    #endregion


    private delegate object ConvertFunc( string aReadValue );
    private static IDictionary<Type, ConvertFunc> mTypeDic;


    #region private CfgManager() 私有构造函数（防止实例化）。
    /// <summary>
    /// 私有构造函数（防止实例化）。
    /// </summary>
    private CfgManager() {
    }
    #endregion

    #region static CfgManager() 静态构造函数（初始化全局缓存信息）。
    /// <summary>
    /// 静态构造函数（初始化全局缓存信息）。
    /// </summary>
    static CfgManager() {
        RegisterConvert();
    }
    #endregion


    #region public static void LoadResource<T>(string, IDictionary<string, T>) 读取1个资源文件，并加载到指定的缓冲集合中。
    /// <summary>
    /// 读取1个资源文件，并加载到指定的缓冲集合中。
    /// </summary>
    /// <typeparam name="T">Orm类。</typeparam>
    /// <param name="aUrl">资源文件地址。</param>
    /// <param name="aConfigDic">要装载的缓冲集合（要被系统自动清空）</param>
    public static void LoadResource<T>( string aUrl, IDictionary<int, T> aConfigDic ) {
        TextAsset txtAsset = Resources.Load<TextAsset>( aUrl );
        if ( !txtAsset ) {
            Debug.Log( "Not Find TextAsset Resource: " + aUrl );
        } else {
            Parse( txtAsset, aConfigDic );
        }
    }
    #endregion

    public static string Get_UFT8( string unicodeString ) {
        System.Text.UTF8Encoding utf8 = new System.Text.UTF8Encoding();
        var encodedBytes = utf8.GetBytes( unicodeString );
        string decodedString = utf8.GetString( encodedBytes );
        return decodedString;
    }

    #region public static void Parse<T>(TextAsset, IDictionary<string, T>) 进行CSV资源文件解析，并加载到缓冲集合中。
    /// <summary>
    /// 进行CSV资源文件解析，并加载到缓冲集合中。
    /// </summary>
    /// <typeparam name="T">Orm类。</typeparam>
    /// <param name="aTxtAsset">资源文件资源对象。</param>
    /// <param name="aConfigDic">要装载的缓冲集合。</param>
    public static void Parse<T>( TextAsset aTxtAsset, IDictionary<int, T> aConfigDic ) {
        Parse( aTxtAsset.name, aTxtAsset.text, aConfigDic );
    }
    #endregion

    #region public static void Parse<T>(string, string, IDictionary<string, T>) 进行CSV资源文件解析，并加载到缓冲集合中。
    /// <summary>
    /// 进行CSV资源文件解析，并加载到缓冲集合中。
    /// </summary>
    /// <typeparam name="T">Orm类。</typeparam>
    /// <param name="aAssetName">资源文件名称。</param>
    /// <param name="aTxtContent">资源文件内容。</param>
    /// <param name="aConfigDic">要装载的缓冲集合。</param>
    public static void Parse<T>( string aAssetName, string aTxtContent, IDictionary<int, T> aConfigDic ) {
        //文件格式检查
        Debug.Log( "正在解析资源：" + aAssetName );
        IList<string> txtLines = aTxtContent.Split( new[]
        {
      "\r\n"
    }, StringSplitOptions.RemoveEmptyEntries ).ToList();
        if ( txtLines.Count < 2 ) {
            Debug.Log( string.Format( "资源文件 <{0}> 格式不正确", aAssetName ) );
            return;
        }
        //导入数据的列检查和筛选
        IDictionary<int, ColumnInfo> columnInfodDic = new Dictionary<int, ColumnInfo>();
        IDictionary<string, FieldInfo> fieldDic = typeof( T ).GetFields( BindingFlags.Instance | BindingFlags.Public ).ToDictionary( c => c.Name.ToUpper(), c => c );
        int iCounter = 0;
        IDictionary<int, string> columnDic = txtLines[1].Split( new[]
        {
      ","
    }, StringSplitOptions.None ).ToDictionary( c => iCounter++, c => c.ToUpper() );
        foreach ( KeyValuePair<string, FieldInfo> itr in fieldDic ) {
            if ( columnDic.Values.Contains( itr.Key ) ) {
                bool isArray = itr.Value.FieldType.IsArray;
                iCounter = 0;
                for ( int i = 0; i < columnDic.Count; i++ ) {
                    if ( columnDic[i] == itr.Key ) {
                        columnInfodDic.Add( i, new ColumnInfo { mColumnName = itr.Key, mFieldInfo = itr.Value, mArrayIndex = isArray ? iCounter : 0 } );
                        if ( isArray ) {
                            iCounter++;
                        } else {
                            break;
                        }
                    }
                }
            } else {
                Debug.Log( string.Format( "资源文件 <{0}> 不存在ORM类 <{1}> 所需的 <{2}> 字段", aAssetName, typeof( T ).Name, itr.Key ) );
                return;
            }
        }
        //动态加载数据到缓冲集合中
        aConfigDic.Clear();
        //Func<T> funcExpress = GetExpressCreateFunc<T>();
        //Func<T> funcEmit = GetEmitCreateFunc<T>();
        for ( int i = 2; i < txtLines.Count; i++ ) {
            int sID = -1;
            //经过测试，以下3种性能差别不大；稳定起见，还是考虑第1种方式
            T ormObj = Activator.CreateInstance<T>(); //对象动态创建方式1
                                                      //T ormObj = funcExpress(); //对象动态创建方式2
                                                      //T ormObj = funcEmit(); //对象动态创建方式3
            string[] txtLine = txtLines[i].Split( new[]
            {
        ","
      }, StringSplitOptions.None );
            for ( int j = 0; j < txtLine.Length; j++ ) {
                if ( !columnInfodDic.ContainsKey( j ) || columnInfodDic[j].mArrayIndex > 0 ) {
                    continue;
                }
                FieldInfo fInfo = columnInfodDic[j].mFieldInfo;
                Type fType = fInfo.FieldType;
                //不是数组，直接赋值
                if ( !fType.IsArray ) {
                    fInfo.SetValue( ormObj, mTypeDic.ContainsKey( fType ) ? mTypeDic[fType]( txtLine[j] ) : txtLine[j] );
                    //处理主键
                    if ( j == 0 ) {
                        int temp = 0;
                        if ( int.TryParse( txtLine[j], out temp ) ) {
                            sID = temp;
                        } else {
                            Debug.LogFormat( "{0}表的主键配置有错，应该为int型", aAssetName );
                        }
                    }
                    continue;
                }
                //是数组，需查找所有的相同字段名
                IList<int> arrayIndexs = (
                          from itr in columnInfodDic
                          where itr.Value.mColumnName == columnInfodDic[j].mColumnName
                          select itr.Key
                        ).ToList();
                fType = fType.GetElementType();
                Array objAry = Array.CreateInstance( fType, arrayIndexs.Count );
                for ( int k = 0; k < arrayIndexs.Count; k++ ) {
                    objAry.SetValue( mTypeDic.ContainsKey( fType ) ? mTypeDic[fType]( txtLine[arrayIndexs[k]] ) : txtLine[arrayIndexs[k]], k );
                }
                fInfo.SetValue( ormObj, objAry );
            }
            if ( aConfigDic.ContainsKey( sID ) ) {
                aConfigDic[sID] = ormObj;
                Debug.LogWarning( string.Format( "资源文件 <{0}> 的Key <{1}> 重复，系统自动进行覆盖", aAssetName, sID ) );
            } else {
                aConfigDic.Add( sID, ormObj );
            }
        }
    }


    /// <summary>
    /// 进行CSV资源文件解析，并加载到缓冲集合中。
    /// </summary>
    /// <typeparam name="T">Orm类。</typeparam>
    /// <param name="aAssetName">资源文件名称。</param>
    /// <param name="aTxtContent">资源文件内容。</param>
    /// <param name="aConfigDic">要装载的缓冲集合。</param>
    //public static void Parse<T>( string aAssetName, string aTxtContent, IDictionary<int, T> aConfigDic ) {
    //    //文件格式检查
    //    Debug.Log( "正在解析资源：" + aAssetName );

    //    IList<string> txtLines = aTxtContent.Split( new[]
    //    {
    //  "\r\n"
    //}, StringSplitOptions.RemoveEmptyEntries ).ToList();
    //    if ( txtLines.Count < 2 ) {

    //        return;
    //    }
    //    //导入数据的列检查和筛选
    //    IDictionary<int, ColumnInfo> columnInfodDic = new Dictionary<int, ColumnInfo>();
    //    IDictionary<string, FieldInfo> fieldDic = typeof( T ).GetFields( BindingFlags.Instance | BindingFlags.Public ).ToDictionary( c => c.Name.ToUpper(), c => c );
    //    int iCounter = 0;
    //    IDictionary<int, string> columnDic = txtLines[1].Split( new[]
    //    {
    //  ","
    //}, StringSplitOptions.None ).ToDictionary( c => iCounter++, c => c.ToUpper() );
    //    foreach ( KeyValuePair<string, FieldInfo> itr in fieldDic ) {
    //        if ( columnDic.Values.Contains( itr.Key ) ) {
    //            bool isArray = itr.Value.FieldType.IsArray;
    //            iCounter = 0;
    //            for ( int i = 0; i < columnDic.Count; i++ ) {
    //                if ( columnDic[i] == itr.Key ) {
    //                    columnInfodDic.Add( i, new ColumnInfo { mColumnName = itr.Key, mFieldInfo = itr.Value, mArrayIndex = isArray ? iCounter : 0 } );
    //                    if ( isArray ) {
    //                        iCounter++;
    //                    } else {
    //                        break;
    //                    }
    //                }
    //            }
    //        } else {

    //            return;
    //        }
    //    }
    //    //动态加载数据到缓冲集合中
    //    aConfigDic.Clear();
    //    //Func<T> funcExpress = GetExpressCreateFunc<T>();
    //    //Func<T> funcEmit = GetEmitCreateFunc<T>();
    //    for ( int i = 2; i < txtLines.Count; i++ ) {
    //        int sID = int.MinValue;
    //        //经过测试，以下3种性能差别不大；稳定起见，还是考虑第1种方式
    //        T ormObj = Activator.CreateInstance<T>(); //对象动态创建方式1
    //                                                  //T ormObj = funcExpress(); //对象动态创建方式2
    //                                                  //T ormObj = funcEmit(); //对象动态创建方式3
    //        string[] txtLine = txtLines[i].Split( new[]
    //        {
    //    ","
    //  }, StringSplitOptions.None );
    //        for ( int j = 0; j < txtLine.Length; j++ ) {
    //            if ( !columnInfodDic.ContainsKey( j ) || columnInfodDic[j].mArrayIndex > 0 ) {
    //                continue;
    //            }
    //            FieldInfo fInfo = columnInfodDic[j].mFieldInfo;
    //            Type fType = fInfo.FieldType;
    //            //不是数组，直接赋值
    //            if ( !fType.IsArray ) {
    //                fInfo.SetValue( ormObj, mTypeDic.ContainsKey( fType ) ? mTypeDic[fType]( txtLine[j] ) : txtLine[j] );
    //                if ( j == 0 ) {

    //                    sID = int.Parse( txtLine[j] );
    //                }
    //                continue;
    //            }
    //            //是数组，需查找所有的相同字段名
    //            IList<int> arrayIndexs = (
    //                      from itr in columnInfodDic
    //                      where itr.Value.mColumnName == columnInfodDic[j].mColumnName
    //                      select itr.Key
    //                      ).ToList();
    //            fType = fType.GetElementType();
    //            Array objAry = Array.CreateInstance( fType, arrayIndexs.Count );
    //            for ( int k = 0; k < arrayIndexs.Count; k++ ) {
    //                objAry.SetValue( mTypeDic.ContainsKey( fType ) ? mTypeDic[fType]( txtLine[arrayIndexs[k]] ) : txtLine[arrayIndexs[k]], k );
    //            }
    //            fInfo.SetValue( ormObj, objAry );
    //        }
    //        if ( aConfigDic.ContainsKey( sID ) ) {
    //            aConfigDic[sID] = ormObj;
    //            Debug.LogWarning( string.Format( "资源文件 <{0}> 的Key <{1}> 重复，系统自动进行覆盖", aAssetName, sID ) );
    //        } else {
    //            aConfigDic.Add( sID, ormObj );
    //        }
    //    }
    //}

    //private static Func<T> GetExpressCreateFunc<T>()
    //{
    //  return Expression.Lambda<Func<T>>(Expression.New(typeof(T)), null).Compile();
    //}

    //private static Func<T> GetEmitCreateFunc<T>()
    //{
    //  DynamicMethod method = new DynamicMethod("", typeof(T), null);
    //  ILGenerator il = method.GetILGenerator();
    //  il.Emit(OpCodes.Newobj, typeof(T).GetConstructors()[0]);
    //  il.Emit(OpCodes.Ret);
    //  return method.CreateDelegate(typeof(Func<T>)) as Func<T>;
    //}
    #endregion

    //  #region public static T ParseXml<T>(string) 进行XML资源文件解析，并返回加载好的对象。
    //  /// <summary>
    //  /// 进行XML资源文件解析，并返回加载好的对象。
    //  /// </summary>
    //  /// <typeparam name="T">Orm类。</typeparam>
    //  /// <param name="aTxtContent">资源文件内容。</param>
    //  /// <returns>加载好的Orm对象。</returns>
    //  public static T ParseXml<T>(string aTxtContent) {
    //    IDictionary<string, FieldInfo> fieldDic = typeof(T).GetFields(BindingFlags.Instance | BindingFlags.Public).ToDictionary(c => c.Name.ToUpper(), c => c);
    //    T ormObj = Activator.CreateInstance<T>();
    //    XmlDocument xmlDoc = new XmlDocument();
    //    xmlDoc.LoadXml(aTxtContent);
    //    foreach(XmlNode node in xmlDoc.GetElementsByTagName("item")) {
    //      FieldInfo fInfo;
    //      if(fieldDic.TryGetValue(node.Attributes["key"].Value.ToUpper(), out fInfo)) {
    //        fInfo.SetValue(ormObj, mTypeDic.ContainsKey(fInfo.FieldType) ? mTypeDic[fInfo.FieldType](node.Attributes["value"].Value) : node.Attributes["value"].Value);
    //      }
    //    }
    //    return ormObj;
    //  }
    //  #endregion

    #region private static void RegisterConvert() Orm映射字段的类型转换函数注册。
    /// <summary>
    /// Orm映射字段的类型转换函数注册。
    /// </summary>
    private static void RegisterConvert() {
        mTypeDic = new Dictionary<Type, ConvertFunc>();
        //bool
        ConvertFunc cFunc = delegate ( string aReadValue ) {
            ushort rst;
            if ( ushort.TryParse( aReadValue, out rst ) ) {
                return rst != 0;
            }
            return false;
        };
        mTypeDic.Add( typeof( bool ), cFunc );
        //byte
        cFunc = delegate ( string aReadValue ) {
            byte rst;
            return !byte.TryParse( aReadValue, out rst ) ? (byte)0 : rst;
        };
        mTypeDic.Add( typeof( byte ), cFunc );
        //char
        cFunc = delegate ( string aReadValue ) {
            char rst;
            return !char.TryParse( aReadValue, out rst ) ? '0' : rst;
        };
        mTypeDic.Add( typeof( char ), cFunc );
        //decimal
        cFunc = delegate ( string aReadValue ) {
            decimal rst;
            return !decimal.TryParse( aReadValue, out rst ) ? 0 : rst;
        };
        mTypeDic.Add( typeof( decimal ), cFunc );
        //double
        cFunc = delegate ( string aReadValue ) {
            double rst;
            return !double.TryParse( aReadValue, out rst ) ? 0 : rst;
        };
        mTypeDic.Add( typeof( double ), cFunc );
        //float
        cFunc = delegate ( string aReadValue ) {
            float rst;
            return !float.TryParse( aReadValue, out rst ) ? 0f : rst;
        };
        mTypeDic.Add( typeof( float ), cFunc );
        //int
        cFunc = delegate ( string aReadValue ) {
            int rst;
            return !int.TryParse( aReadValue, out rst ) ? 0 : rst;
        };
        mTypeDic.Add( typeof( int ), cFunc );
        //long
        cFunc = delegate ( string aReadValue ) {
            long rst;
            return !long.TryParse( aReadValue, out rst ) ? 0 : rst;
        };
        mTypeDic.Add( typeof( long ), cFunc );
        //sbyte
        cFunc = delegate ( string aReadValue ) {
            sbyte rst;
            return !sbyte.TryParse( aReadValue, out rst ) ? (sbyte)0 : rst;
        };
        mTypeDic.Add( typeof( sbyte ), cFunc );
        //short
        cFunc = delegate ( string aReadValue ) {
            short rst;
            return !short.TryParse( aReadValue, out rst ) ? (short)0 : rst;
        };
        mTypeDic.Add( typeof( short ), cFunc );
        //string 不需要类型转换
        //uint
        cFunc = delegate ( string aReadValue ) {
            uint rst;
            return !uint.TryParse( aReadValue, out rst ) ? 0 : rst;
        };
        mTypeDic.Add( typeof( uint ), cFunc );
        //ushort
        cFunc = delegate ( string aReadValue ) {
            ushort rst;
            return !ushort.TryParse( aReadValue, out rst ) ? (ushort)0 : rst;
        };
        mTypeDic.Add( typeof( ushort ), cFunc );
    }
    #endregion

}
