using System.Diagnostics;
using System;
using System.Collections.Generic;
using UnityEngine;
using Database;


public class CfgORM_Example01 : MonoBehaviour {
    private string mLoadTime;

    void Start() {
        Stopwatch watch = new Stopwatch();
        watch.Start();
        CfgOrmManager.LoadAll();
        watch.Stop();
        mLoadTime = string.Format( "加载时间：{0}      {1}毫秒", watch.Elapsed, watch.ElapsedMilliseconds );
    }

    void OnGUI() {
        GUILayout.BeginHorizontal();
        GUILayout.Space( 20f );
        GUILayout.BeginVertical();
        GUILayout.Label( mLoadTime );
        GUILayout.Space( 3f );
        GUILayout.Label( "读取第12行的数据" );
        
        CfgORMExample01Orm orm1 = CfgORMExample01Orm.Get( 1 );
        if ( orm1 != null ) {
            GUILayout.Label( "技能ID: = " + orm1.ID );
            GUILayout.Label( "职业: = " + orm1.FLD1 );
        }
        
        CfgORMExample02Orm orm2 = CfgORMExample02Orm.Get( 2 );

        if ( orm2 != null ) {
            GUILayout.Label( "技能ID: = " + orm2.ID );
            GUILayout.Label( "职业: = " + orm2.FLD1 );
        }

        var ItemsOrmdata = ItemsOrm.datas;
        UnityEngine.Debug.Log( ItemsOrmdata );
        var isUseList = ItemsOrm.GetIsUseItem();
        var data = ItemsOrm.Get( isUseList[1] );
        var list = data.GetUseData();
        UnityEngine.Debug.Log( list );

        GUILayout.EndVertical();
        GUILayout.EndHorizontal();
    }
}
