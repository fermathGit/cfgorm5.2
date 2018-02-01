using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using UnityEditor;
using UnityEngine;

public class UICfgOrmMaker : EditorWindow {

    #region 配置信息结构定义。
    /// <summary>
    /// 配置信息。
    /// </summary>
    [Serializable]
    private class CfgStruct {
        /// <summary>
        /// 资源文件存放路径。
        /// </summary>
        public string mCfgPath = "";
        /// <summary>
        /// Orm类的后缀名。
        /// </summary>
        public string mClassNameSuffix = "Orm";
        /// <summary>
        /// Orm类名首字母是否必须大写。
        /// </summary>
        public bool mClassNameUpper = true;
        /// <summary>
        /// Orm类字段名首字母是否必须大写。
        /// </summary>
        public bool mFieldNameUpper = true;
        /// <summary>
        /// Orm类文件保存路径。
        /// </summary>
        public string mSavePath;
        /// <summary>
        /// 是否自动覆盖相同的文件。
        /// </summary>
        public bool mOverwrite = true;
        /// <summary>
        /// 资源文件信息集合。
        /// </summary>
        public readonly IDictionary<string, CfgAssetStruct> mAssetDic = new Dictionary<string, CfgAssetStruct>();
    }

    /// <summary>
    /// 资源文件信息。
    /// </summary>
    [Serializable]
    private class CfgAssetStruct {
        /// <summary>
        /// 配置表名。
        /// </summary>
        public string mTableName = "";
        /// <summary>
        /// ORM类名。
        /// </summary>
        public string mOrmName = "";
        /// <summary>
        /// 是否启用。
        /// </summary>
        public bool mIsEnabled;
        /// <summary>
        /// 资源文件列信息。
        /// </summary>
        public IList<CfgAssetFieldStruct> mFieldList = new List<CfgAssetFieldStruct>();
    }

    /// <summary>
    /// 资源文件列信息。
    /// </summary>
    [Serializable]
    private class CfgAssetFieldStruct {
        /// <summary>
        /// 列索引。
        /// </summary>
        public int mIndex;
        /// <summary>
        /// 列中文描述。
        /// </summary>
        public string mColumnCName = "";
        /// <summary>
        /// 列英文描述。
        /// </summary>
        public string mColumnEName = "";
        /// <summary>
        /// 列字段名。
        /// </summary>
        public string mFieldName = "";
        /// <summary>
        /// 列数据类型。
        /// </summary>
        public int mDataType;
        /// <summary>
        /// 是否启用。
        /// </summary>
        public bool mIsEnabled;
    }
    #endregion

    private readonly Regex mRgFName = new Regex( "[^a-zA-Z0-9]" ); //文件名允许的字符
    private readonly Regex mRgEName = new Regex( "[^a-zA-Z0-9 ,_]" ); //英文描述允许的字符
    private readonly string[] mDataTypes = { "bool", "byte", "char", "decimal", "double", "float", "int", "long", "sbyte", "short", "string", "uint", "ushort" };
    private readonly string mCfgPath = Path.Combine( Application.persistentDataPath, "UICfgOrmMaker" );
    private string[] mArchives;
    private bool mIsWindowLoad = true;
    private CfgStruct mCfgStruct = new CfgStruct();
    private Vector2 mScroll1 = Vector2.zero, mScroll2 = Vector2.zero, mScroll3 = Vector2.zero;
    private string mAssetName, mSelection1, mSelection2;
    private string mCfgOrmManagerName = "CfgOrmManager";

    #region 插件配置信息设置或读取
    /// <summary>
    /// 配置信息是否持久化。
    /// </summary>
    private bool mIsSaveCfg {
        get { return EditorPrefs.GetBool( "UICfgOrmMaker IsAutoSave", true ); }
        set { EditorPrefs.SetBool( "UICfgOrmMaker IsAutoSave", value ); }
    }

    /// <summary>
    /// 资源文件存放路径。
    /// </summary>
    private string pCfgPath {
        get { return mCfgStruct.mCfgPath; }
        set { mCfgStruct.mCfgPath = value; }
    }

    /// <summary>
    /// Orm类的后缀名。
    /// </summary>
    private string pClassNameSuffix {
        get { return mCfgStruct.mClassNameSuffix; }
        set { mCfgStruct.mClassNameSuffix = value; }
    }

    /// <summary>
    /// Orm类名首字母是否必须大写。
    /// </summary>
    private bool pClassNameUpper {
        get { return mCfgStruct.mClassNameUpper; }
        set { mCfgStruct.mClassNameUpper = value; }
    }

    /// <summary>
    /// Orm类字段名首字母是否必须大写。
    /// </summary>
    private bool pFieldNameUpper {
        get { return mCfgStruct.mFieldNameUpper; }
        set { mCfgStruct.mFieldNameUpper = value; }
    }

    /// <summary>
    /// Orm类文件保存路径。
    /// </summary>
    private string pSavePath {
        get { return mCfgStruct.mSavePath; }
        set { mCfgStruct.mSavePath = value; }
    }

    /// <summary>
    /// 是否自动覆盖相同的文件。
    /// </summary>
    private bool pOverwrite {
        get { return mCfgStruct.mOverwrite; }
        set { mCfgStruct.mOverwrite = value; }
    }
    #endregion

    #region 一些特殊的UI绘制共通
    /// <summary>
    /// 绘制分区Header。
    /// </summary>
    /// <param name="aText"></param>
    private void DrawHeader( string aText ) {
        GUILayout.Space( 3f );
        GUILayout.BeginHorizontal();
        GUILayout.Toggle( true, string.Format( "\u25BC <b><size=11>{0}</size></b>", aText ), "dragtab" );
        GUILayout.Space( 2f );
        GUILayout.EndHorizontal();
    }

    /// <summary>
    /// 绘制分区开始。
    /// </summary>
    private void BeginContents() {
        GUILayout.BeginHorizontal();
        EditorGUILayout.BeginHorizontal( "AS TextArea", GUILayout.MinHeight( 10f ) );
        GUILayout.BeginVertical();
        GUILayout.Space( 2f );
    }

    /// <summary>
    /// 绘制分区结束。
    /// </summary>
    private void EndContents() {
        GUILayout.Space( 3f );
        GUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();
        GUILayout.Space( 3f );
        GUILayout.EndHorizontal();
        GUILayout.Space( 3f );
    }
    #endregion

    #region private void OnGUI() UI绘制。
    /// <summary>
    /// UI绘制。
    /// </summary>
    private void OnGUI() {
        //初次绘制窗体时加载配置以及资源信息
        if ( mIsWindowLoad ) {
            if ( position.width < 557f ) {
                position = new Rect( position.x, position.y, 557f, position.height );
            }
            DirectoryInfo dirInfo = new DirectoryInfo( Application.persistentDataPath );
            mArchives = dirInfo.GetFiles().Where( c => c.Name.StartsWith( "UICfgOrmMaker" ) && c.Name != "UICfgOrmMaker" ).Select( c => c.Name + " " + c.LastWriteTime.ToString( "yyyy-MM-dd HH:mm:ss" ) ).ToArray();
            LoadArchive( mCfgPath );
            LoadConfigList();
            mIsWindowLoad = false;
        }

        //UI绘制
        EditorGUIUtility.labelWidth = 120f;
        GUILayout.Space( 6f );
        if ( string.IsNullOrEmpty( mAssetName ) ) {
            #region 第1层的UI绘制
            GUILayout.BeginHorizontal();
            mIsSaveCfg = EditorGUILayout.Toggle( "配置信息持久化", mIsSaveCfg, GUILayout.Width( 155f ) );
            EditorGUILayout.LabelField( "关闭窗体时，自动存档配置信息", GUILayout.Width( 173f ) );
            EditorGUILayout.LabelField( "载入存档", GUILayout.Width( 48f ) );
            int ahSelection = EditorGUILayout.Popup( -1, mArchives, GUILayout.Width( 30f ) );
            if ( ahSelection > -1 ) {
                LoadArchive( Path.Combine( Application.persistentDataPath, mArchives[ahSelection].Split( new[] { " " }, StringSplitOptions.RemoveEmptyEntries )[0].Trim() ) );
            }
            GUI.backgroundColor = Color.cyan;
            if ( GUILayout.Button( "读取配置", GUILayout.Width( 60f ) ) ) {
                string loadPath = EditorUtility.OpenFilePanel( "配置信息读取", "", "" );
                if ( !string.IsNullOrEmpty( loadPath ) ) {
                    LoadArchive( loadPath );
                }
            }
            if ( GUILayout.Button( "另存配置", GUILayout.Width( 60f ) ) ) {
                string savePath = EditorUtility.SaveFilePanel( "配置信息另存", "", string.Format( "{0}_CfgOrmMaker_{1}", PlayerSettings.productName, DateTime.Now.ToString( "yyMMddHHmmss" ) ), "" );
                if ( !string.IsNullOrEmpty( savePath ) ) {
                    SaveArchive( savePath );
                }
            }
            GUI.backgroundColor = Color.white;
            GUILayout.EndHorizontal();

            DrawHeader( "输入" );
            BeginContents();
            GUILayout.BeginHorizontal();
            pCfgPath = EditorGUILayout.TextField( "资源文件路径", pCfgPath, GUILayout.Width( 500f ) );
            EditorGUI.BeginDisabledGroup( !Directory.Exists( pCfgPath ) );
            GUI.backgroundColor = Color.red;
            if ( GUILayout.Button( "读取", GUILayout.Width( 40f ) ) ) {
                LoadConfigList();
            }
            GUI.backgroundColor = Color.white;
            EditorGUI.EndDisabledGroup();
            GUILayout.EndHorizontal();
            GUILayout.BeginHorizontal();
            pSavePath = EditorGUILayout.TextField( "ORM类文件保存路径", pSavePath, GUILayout.Width( 475f ) );
            pOverwrite = EditorGUILayout.Toggle( "", pOverwrite, GUILayout.Width( 10f ) );
            GUILayout.Label( "覆盖原文件", GUILayout.Width( 60f ) );
            GUILayout.EndHorizontal();
            GUILayout.BeginHorizontal();
            pClassNameSuffix = EditorGUILayout.TextField( "ORM类名后缀", pClassNameSuffix, GUILayout.Width( 180f ) );
            GUILayout.Space( 14f );
            GUILayout.Label( "ORM类名首字母大写", GUILayout.Width( 110f ) );
            pClassNameUpper = EditorGUILayout.Toggle( "", pClassNameUpper, GUILayout.Width( 10f ) );
            GUILayout.Space( 18f );
            GUILayout.Label( "ORM类字段名首字母大写", GUILayout.Width( 130f ) );
            pFieldNameUpper = EditorGUILayout.Toggle( "", pFieldNameUpper, GUILayout.Width( 10f ) );
            GUILayout.EndHorizontal();
            EndContents();

            GUILayout.BeginHorizontal();
            GUILayout.Space( 20f );
            bool isDisable = mCfgStruct.mAssetDic.Count( c => c.Value.mIsEnabled ) == 0 || !Directory.Exists( pSavePath );
            if ( !isDisable ) {
                int iCounter = 0;
                foreach ( var itr1 in mCfgStruct.mAssetDic.Where( c => c.Value.mIsEnabled ) ) {
                    iCounter = itr1.Value.mFieldList.Count( c => c.mIsEnabled && c.mDataType != -1 );
                }
                if ( iCounter == 0 ) {
                    isDisable = true;
                }
            }
            EditorGUI.BeginDisabledGroup( isDisable );
            if ( GUILayout.Button( "创建 ORM 映射类" ) ) {
                CreateOrm();
            }
            EditorGUI.EndDisabledGroup();
            GUILayout.Space( 20f );
            GUILayout.EndHorizontal();

            if ( mCfgStruct.mAssetDic.Count > 0 ) {
                DrawHeader( "ORM 类映射对照" );
                GUILayout.BeginHorizontal();
                GUILayout.Space( 3f );
                GUILayout.BeginVertical();
                int index = 0;
                float mapWidth = ( Screen.width - 256f ) / 2;
                //行头绘制
                GUILayout.Space( -1f );
                GUILayout.BeginHorizontal( "AS TextArea", GUILayout.MinHeight( 20f ) );
                GUILayout.Label( "ID", GUILayout.Width( 24f ) );
                GUILayout.Label( "资源文件名", GUILayout.Width( mapWidth - 4f ) );
                GUILayout.Label( "ORM类名", GUILayout.Width( mapWidth - 4f ) );
                GUILayout.Label( "总列数", GUILayout.Width( 56f ) );
                GUILayout.Label( "启用列数", GUILayout.Width( 56f ) );
                GUILayout.Label( "启用", GUILayout.Width( 30f ) );
                GUILayout.Label( "列编辑", GUILayout.Width( 45f ) );
                GUILayout.EndHorizontal();
                //行明细绘制
                mScroll1 = GUILayout.BeginScrollView( mScroll1, GUILayout.Height( 24f * ( mCfgStruct.mAssetDic.Count > 5 ? 5 : mCfgStruct.mAssetDic.Count ) ) );
                foreach ( string key in new List<string>( mCfgStruct.mAssetDic.Keys ) ) {
                    index++;
                    GUILayout.Space( -1f );
                    if ( string.IsNullOrEmpty( mSelection1 ) ) {
                        mSelection1 = key;
                    }
                    GUI.backgroundColor = key == mSelection1 ? Color.white : new Color( 0.8f, 0.8f, 0.8f );
                    GUILayout.BeginHorizontal( "AS TextArea", GUILayout.MinHeight( 20f ) );
                    GUI.backgroundColor = Color.white;
                    GUILayout.Label( index.ToString(), GUILayout.Width( 24f ) );
                    if ( GUILayout.Button( key, "OL TextField", GUILayout.Height( 20f ), GUILayout.Width( mapWidth ) ) ) {
                        mSelection1 = key;
                    }
                    if ( GUILayout.Button( mCfgStruct.mAssetDic[key].mOrmName, "OL TextField", GUILayout.Height( 20f ), GUILayout.Width( mapWidth ) ) ) {
                        mSelection1 = key;
                    }
                    if ( GUILayout.Button( mCfgStruct.mAssetDic[key].mFieldList.Count.ToString(), "OL TextField", GUILayout.Height( 20f ), GUILayout.Width( 60f ) ) ) {
                        mSelection1 = key;
                    }
                    if ( GUILayout.Button( mCfgStruct.mAssetDic[key].mFieldList.Count( c => c.mIsEnabled && c.mDataType != -1 ).ToString(),
                      "OL TextField", GUILayout.Height( 20f ), GUILayout.Width( 60f ) ) ) {
                        mSelection1 = key;
                    }
                    mCfgStruct.mAssetDic[key].mIsEnabled = EditorGUILayout.Toggle( "", mCfgStruct.mAssetDic[key].mIsEnabled, GUILayout.Width( 26f ) );
                    GUI.backgroundColor = Color.green;
                    if ( GUILayout.Button( "列编辑", GUILayout.Height( 20f ), GUILayout.Width( 45f ) ) ) {
                        mAssetName = key;
                        mScroll3 = Vector2.zero;
                    }
                    GUI.backgroundColor = Color.white;
                    GUILayout.EndHorizontal();
                }
                GUILayout.EndScrollView();
                GUILayout.EndVertical();
                GUILayout.Space( 3f );
                GUILayout.EndHorizontal();

                DrawHeader( "ORM 类预览" );
                GUILayout.BeginHorizontal();
                GUILayout.Space( 3f );
                mScroll2 = GUILayout.BeginScrollView( mScroll2, GUILayout.Height( 200f ) );
                GUILayout.TextArea( GetOrmContent( mSelection1 ) );
                GUILayout.EndScrollView();
                GUILayout.Space( 3f );
                GUILayout.EndHorizontal();
            }
            #endregion
        } else {
            #region 第2层的UI绘制
            IList<CfgAssetFieldStruct> mcafStructs = mCfgStruct.mAssetDic[mAssetName].mFieldList;
            EditorGUILayout.LabelField( string.Format( "资源文件：{0}", mAssetName ) );

            DrawHeader( "ORM 列映射对照" );
            GUILayout.BeginHorizontal();
            GUILayout.Space( 3f );
            GUILayout.BeginVertical();
            float mapWidth = ( Screen.width - 180f ) / 7;
            //行头绘制
            GUILayout.Space( -1f );
            GUILayout.BeginHorizontal( "AS TextArea", GUILayout.MinHeight( 20f ) );
            GUILayout.Label( "索引", GUILayout.Width( 35f ) );
            GUILayout.Label( "中文描述", GUILayout.Width( mapWidth * 3 - 4f ) );
            GUILayout.Label( "英文描述", GUILayout.Width( mapWidth * 2 - 4f ) );
            GUILayout.Label( "ORM字段名", GUILayout.Width( mapWidth * 2 - 4f ) );
            GUILayout.Label( "数据类型", GUILayout.Width( 60f ) );
            GUILayout.Label( "", GUILayout.Width( 15f ) );
            GUILayout.Label( "启用", GUILayout.Width( 30f ) );
            GUILayout.EndHorizontal();
            //行明细绘制
            mScroll3 = GUILayout.BeginScrollView( mScroll3 );
            foreach ( CfgAssetFieldStruct fmcafStruct in mcafStructs ) {
                string key = fmcafStruct.mIndex.ToString();
                GUILayout.Space( -1f );
                GUI.backgroundColor = key == mSelection2 ? Color.white : new Color( 0.8f, 0.8f, 0.8f );
                GUILayout.BeginHorizontal( "AS TextArea", GUILayout.MinHeight( 20f ) );
                GUI.backgroundColor = Color.white;
                GUILayout.Label( key, GUILayout.Width( 35f ) );
                if ( GUILayout.Button( fmcafStruct.mColumnCName, "OL TextField", GUILayout.Height( 20f ), GUILayout.Width( mapWidth * 3 ) ) ) {
                    mSelection2 = key;
                }
                if ( GUILayout.Button( fmcafStruct.mColumnEName, "OL TextField", GUILayout.Height( 20f ), GUILayout.Width( mapWidth * 2 ) ) ) {
                    mSelection2 = key;
                }
                if ( GUILayout.Button( fmcafStruct.mFieldName, "OL TextField", GUILayout.Height( 20f ), GUILayout.Width( mapWidth * 2 ) ) ) {
                    mSelection2 = key;
                }
                EditorGUI.BeginDisabledGroup( key == "0" );
                fmcafStruct.mDataType = EditorGUILayout.Popup( key == "0" ? 6 : fmcafStruct.mDataType, mDataTypes, GUILayout.Width( 56f ) );
                EditorGUI.EndDisabledGroup();
                if ( fmcafStruct.mIsEnabled ) {
                    //如果是数组，数据类型必须一样
                    foreach ( CfgAssetFieldStruct itr2 in mcafStructs.Where( itr2 => fmcafStruct.mColumnEName == itr2.mColumnEName && itr2.mIsEnabled ) ) {
                        itr2.mDataType = fmcafStruct.mDataType;
                    }
                }
                GUILayout.Label( mcafStructs.Count( c => c.mFieldName == fmcafStruct.mFieldName && c.mIsEnabled ) > 1 ? "[]" : "", GUILayout.Width( 15f ) );
                EditorGUI.BeginDisabledGroup( key == "0" );
                fmcafStruct.mIsEnabled = EditorGUILayout.Toggle( "", fmcafStruct.mIsEnabled, GUILayout.Width( 26f ) );
                EditorGUI.EndDisabledGroup();
                GUILayout.EndHorizontal();
            }
            GUILayout.EndScrollView();
            GUILayout.EndVertical();
            GUILayout.Space( 3f );
            GUILayout.EndHorizontal();

            GUILayout.BeginHorizontal();
            GUILayout.Space( 20f );
            EditorGUI.BeginDisabledGroup( mCfgStruct.mAssetDic.Count == 0 );
            if ( GUILayout.Button( "返回" ) ) {
                mAssetName = null;
            }
            EditorGUI.EndDisabledGroup();
            GUILayout.Space( 20f );
            GUILayout.EndHorizontal();
            GUILayout.Space( 10f );
            #endregion
        }
    }
    #endregion

    #region private void OnDestroy() 窗体销毁，缓存配置信息。
    /// <summary>
    /// 窗体销毁，缓存配置信息。
    /// </summary>
    private void OnDestroy() {
        if ( !mIsSaveCfg ) {
            return;
        }
        //存档文件往前顺移
        for ( int i = 2; i < 10; i++ ) {
            string sourceFile = mCfgPath + ( i == 9 ? "" : i.ToString() );
            string destFile = mCfgPath + ( i - 1 );
            if ( File.Exists( sourceFile ) ) {
                File.Copy( sourceFile, destFile, true );
            }
        }
        //保存信息到当前存档文件中
        SaveArchive( mCfgPath );
    }
    #endregion

    #region private void SaveArchive(string) 保存配置文件。
    /// <summary>
    /// 保存配置文件。
    /// </summary>
    /// <param name="aFilePath">配置文件保存路径。</param>
    private void SaveArchive( string aFilePath ) {
        try {
            using ( Stream strm = new FileStream( aFilePath, FileMode.OpenOrCreate, FileAccess.Write, FileShare.None ) ) {
                System.Runtime.Serialization.IFormatter fmt = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                fmt.Serialize( strm, mCfgStruct );
                strm.Flush();
            }
        }
        catch ( Exception ex ) {
            Debug.Log( ex.StackTrace );
        }
    }
    #endregion

    #region private void LoadArchive(string) 加载存档文件。
    /// <summary>
    /// 加载存档文件。
    /// </summary>
    /// <param name="aFilePath">存档文件路径。</param>
    private void LoadArchive( string aFilePath ) {
        if ( !File.Exists( aFilePath ) ) {
            return;
        }
        try {
            using ( Stream strm = new FileStream( aFilePath, FileMode.Open, FileAccess.Read, FileShare.None ) ) {
                System.Runtime.Serialization.IFormatter fmt = new System.Runtime.Serialization.Formatters.Binary.BinaryFormatter();
                CfgStruct obj = fmt.Deserialize( strm ) as CfgStruct;
                if ( obj != null ) {
                    mCfgStruct = obj;
                }
            }
        }
        catch ( Exception ex ) {
            Debug.LogError( ex.StackTrace );
        }
    }
    #endregion


    #region private void LoadConfigList() 读取资源文件列表。
    /// <summary>
    /// 读取资源文件列表。
    /// </summary>
    private void LoadConfigList() {
        if ( !Directory.Exists( pCfgPath ) ) {
            return;
        }
        //读取目录里的资源文件及其结构信息
        IDictionary<string, CfgAssetStruct> caStructDic = new Dictionary<string, CfgAssetStruct>();
        foreach ( string fPath in Directory.GetFiles( pCfgPath, "*.csv" ) ) {
            string sAssetName = Path.GetFileNameWithoutExtension( fPath );
            if ( mRgFName.IsMatch( sAssetName ) ) {
                Debug.Log( string.Format( "资源文件 <{0}> 的名称不符合命名规范", sAssetName ) );
                continue;
            }
            IList<string> txtLines = LoadResource( fPath );
            if ( txtLines == null ) {
                continue;
            }
            string sOName = pClassNameUpper ? sAssetName.Substring( 0, 1 ).ToUpper() + sAssetName.Substring( 1 ) : sAssetName;
            string sClassName= sOName;
            if ( !string.IsNullOrEmpty( pClassNameSuffix.Trim() ) ) {
                sClassName = sOName + pClassNameSuffix.Trim();
            }
            //TODO: 暂时不处理第1列被搞成数组的情况
            CfgAssetStruct caStruct = new CfgAssetStruct { mTableName = sOName, mOrmName = sClassName, mFieldList = new List<CfgAssetFieldStruct>() };
            string[] sLineC = txtLines[0].Split( new[] { "," }, StringSplitOptions.None );
            string[] sLineE = txtLines[1].Split( new[] { "," }, StringSplitOptions.None );
            for ( int i = 0; i < sLineC.Length; i++ ) {
                string sEName = sLineE[i].Trim();
                if ( string.IsNullOrEmpty( sEName ) ) {
                    Debug.Log( string.Format( "资源文件 <{0}> 第{1}列 未设置英文描述", sAssetName, i + 1 ) );
                    caStruct = null;
                    break;
                }
                caStruct.mFieldList.Add( new CfgAssetFieldStruct {
                    mIndex = i,
                    mColumnCName = sLineC[i].Trim().Replace( "\"", "" ).Replace( "\n", "" ).Replace( "\r", "" ),
                    mColumnEName = sEName,
                    mFieldName = pFieldNameUpper ? sEName.Substring( 0, 1 ).ToUpper() + sEName.Substring( 1 ) : sEName,
                    mDataType = -1,
                    mIsEnabled = i == 0
                } );
            }
            if ( caStruct != null ) {
                caStructDic.Add( sAssetName, caStruct );
            }
        }
        //和系统缓存的配置信息进行比较和合并
        //增加或修改资源信息
        foreach ( KeyValuePair<string, CfgAssetStruct> itr1 in caStructDic ) {
            if ( !mCfgStruct.mAssetDic.ContainsKey( itr1.Key ) ) {
                //整个资源文件都是新的
                mCfgStruct.mAssetDic.Add( itr1.Key, itr1.Value );
            } else {
                CfgAssetStruct mcaStruct = mCfgStruct.mAssetDic[itr1.Key];
                mcaStruct.mOrmName = itr1.Value.mOrmName;
                //追加或修改字段信息
                foreach ( CfgAssetFieldStruct fcafStruct in itr1.Value.mFieldList ) {
                    bool bIsFind = false;
                    foreach ( CfgAssetFieldStruct fmcafStruct in mcaStruct.mFieldList.Where( c => c.mIndex == fcafStruct.mIndex ) ) {
                        if ( fmcafStruct.mColumnCName != fcafStruct.mColumnCName || fmcafStruct.mColumnEName != fcafStruct.mColumnEName ) {
                            fmcafStruct.mColumnCName = fcafStruct.mColumnCName;
                            fmcafStruct.mColumnEName = fcafStruct.mColumnEName;
                            if ( fmcafStruct.mIndex != 0 ) {
                                fmcafStruct.mDataType = -1;
                                fmcafStruct.mIsEnabled = false;
                            }
                        }
                        fmcafStruct.mFieldName = fcafStruct.mFieldName;
                        bIsFind = true;
                        break;
                    }
                    if ( !bIsFind ) {
                        mcaStruct.mFieldList.Add( fcafStruct );
                    }
                }
                //删除已经不存在的字段信息
                IList<int> mindexList = mcaStruct.mFieldList.Select( c => c.mIndex ).ToList();
                foreach ( int fmIndex in mindexList ) {
                    if ( itr1.Value.mFieldList.All( c => c.mIndex != fmIndex ) ) {
                        CfgAssetFieldStruct rcafStruct = null;
                        foreach ( CfgAssetFieldStruct fcafStruct in mcaStruct.mFieldList.Where( c => c.mIndex == fmIndex ) ) {
                            rcafStruct = fcafStruct;
                        }
                        mcaStruct.mFieldList.Remove( rcafStruct );
                    }
                }
            }
        }
        //删除已经不存在的资源信息
        IList<string> massetNameList = mCfgStruct.mAssetDic.Select( c => c.Key ).ToList();
        foreach ( string fassetName in massetNameList ) {
            if ( caStructDic.All( c => c.Key != fassetName ) ) {
                mCfgStruct.mAssetDic.Remove( fassetName );
            }
        }
        //清空读取的资源文件及其结构信息
        caStructDic.Clear();
    }
    #endregion

    #region private IList<string> LoadResource(string) 读取资源文件。
    /// <summary>
    /// 读取资源文件。
    /// </summary>
    /// <param name="aFilePath">资源文件的路径。</param>
    /// <returns>文件行集合。</returns>
    private IList<string> LoadResource( string aFilePath ) {
        string sAssetName = Path.GetFileNameWithoutExtension( aFilePath );
        string txtContent;
        using ( StreamReader reader = new StreamReader( aFilePath, Encoding.GetEncoding( "GB2312" ) ) ) {
            txtContent = reader.ReadToEnd();
        }
        if ( string.IsNullOrEmpty( txtContent ) ) {
            Debug.Log( string.Format( "资源文件 <{0}> 加载失败", sAssetName ) );
            return null;
        }
        IList<string> txtLins = txtContent.Split( new[] { "\r\n" }, StringSplitOptions.RemoveEmptyEntries ).ToList();
        //文件结构校验
        if ( txtLins.Count < 2 ) {
            Debug.Log( string.Format( "资源文件 <{0}> 格式不正确", sAssetName ) );
            return null;
        }
        //英文描述数据校验
        if ( mRgEName.IsMatch( txtLins[1] ) ) {
            Debug.Log( string.Format( "资源文件 <{0}> 英文描述行不符合命名规范", sAssetName ) );
            return null;
        }
        return txtLins;
    }
    #endregion


    #region 语法片段的常量定义
    private const string mSegment1 = @"using System.Collections.Generic;

namespace Database {{

    public partial class {0} {{
        private static readonly IDictionary<int, {0}> m_idCache = new Dictionary<int, {0}>();       
        {1}
        #region method
        public static void Load() {{
            CfgManager.LoadResource( {2}, m_idCache );
        }}

        public static {0} Get( int id ) {{
            {0} data; 
            m_idCache.TryGetValue( id, out data );
            return data;
        }}
        
        public static ICollection<int> GetKeys() {{
            return m_idCache.Keys;
        }}
        #endregion
    }}
}}";

    private const string mSegment2 = @"
        /// <summary>
        /// {0}。
        /// </summary>
        public readonly {1} {2};
";

    private const string mSegment3 = @"
namespace Database {{
    public class {0} {{
        public static void LoadAll() {{
            {1}
        }}
    }}
}}
";

    private const string mSegment4 = @"
            {0}.Load();";
    #endregion

    #region private void CreateOrm() 创建 ORM 映射类。
    /// <summary>
    /// 创建 ORM 映射类。
    /// </summary>
    private void CreateOrm() {
        StringBuilder sTemp = new StringBuilder();
        foreach ( KeyValuePair<string, CfgAssetStruct> itr in mCfgStruct.mAssetDic.Where( c => c.Value.mIsEnabled ) ) {
            string sContent = GetOrmContent( itr.Key );
            if ( !string.IsNullOrEmpty( sContent ) ) {
                SaveFile( Path.Combine( pSavePath, itr.Value.mOrmName + ".cs" ), sContent );
                sTemp.AppendFormat( mSegment4, itr.Value.mOrmName );
            }
        }
        //生成一个manager类，用来打包生成的所有配置类的方法的引用
        string sManagerClassContent = string.Format( mSegment3, mCfgOrmManagerName, sTemp );
        if ( !string.IsNullOrEmpty( sManagerClassContent ) ) {
            SaveFile( Path.Combine( pSavePath, mCfgOrmManagerName + ".cs" ), sManagerClassContent );
        }
    }

    private string GetOrmContent( string aAssetName ) {
        if ( !mCfgStruct.mAssetDic.ContainsKey( aAssetName ) ) {
            return "";
        }
        CfgAssetStruct caStruct = mCfgStruct.mAssetDic[aAssetName];
        StringBuilder sbSegment2 = new StringBuilder();
        IList<string> yclFieldName = new List<string>();
        foreach ( CfgAssetFieldStruct fcafStruct in caStruct.mFieldList.Where( c => c.mIsEnabled && c.mDataType != -1 ).Where( c => !yclFieldName.Contains( c.mFieldName ) ) ) {
            yclFieldName.Add( fcafStruct.mFieldName );
            sbSegment2.AppendFormat( mSegment2, fcafStruct.mColumnCName,
              mDataTypes[fcafStruct.mDataType] + ( caStruct.mFieldList.Count( c => c.mFieldName == fcafStruct.mFieldName && c.mIsEnabled ) > 1 ? "[]" : "" ),
              fcafStruct.mFieldName );
        }
        if ( sbSegment2.Length == 0 ) {
            return "";
        }
        return string.Format( mSegment1, caStruct.mOrmName, sbSegment2 , '"'+ caStruct.mTableName + '"' );
    }

    private void SaveFile( string aTxtPath, string aTxtContent ) {
        //类文件已经存在，但不允许自动覆盖时，不进行保存
        if ( !pOverwrite && File.Exists( aTxtPath ) ) {
            Debug.Log( string.Format( "ORM类文件 <{0}> 已经存在，略过本次处理", aTxtPath ) );
            return;
        }
        //创建Class文件
        using ( FileStream fs = File.Create( aTxtPath ) ) {
            byte[] content = Encoding.GetEncoding( 65001 ).GetBytes( aTxtContent );
            fs.Write( content, 0, content.Length );
            fs.Close();
        }
        Debug.Log( string.Format( "ORM类文件 <{0}> 创建成功", aTxtPath ) );
    }
    #endregion

}
