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

        var isUseList = ItemsOrm.GetIsUseItem();
        var data = ItemsOrm.Get( isUseList[1] );
        var list = data.GetUseData();
        UnityEngine.Debug.Log( list );



        //GUILayout.Label( "技能等级: = " + orm.FLD2 );
        //GUILayout.Label( "技能名: = " + orm.FLD3 );
        //GUILayout.Label( "描述: = " + orm.FLD4 );
        //GUILayout.Label( "可升等级: = " + orm.FLD5 );
        //GUILayout.Label("需要点数: = 0->" + orm.FLD6[0] + " 1->" + orm.FLD6[1] + " 2->" + orm.FLD6[2]);
        //GUILayout.Label("升级成功几率: = " + orm.FLD7);
        //GUILayout.Label("主被动: = " + orm.FLD8);
        //GUILayout.Label("图标资源: = " + orm.FLD9);
        //GUILayout.Label("子技能: = 0->" + orm.FLD10[0] + " 1->" + orm.FLD10[1] + " 2->" + orm.FLD10[2]);
        //GUILayout.Label("技能类型: = " + orm.FLD11);
        //GUILayout.Label("防御无视百分比: = " + orm.FLD12);
        //GUILayout.Label("目标类型: = " + orm.FLD13);
        //GUILayout.Label("移动类型: = " + orm.FLD14);
        //GUILayout.Label("冷却时间: = 0->" + orm.FLD15[0] + " 1->" + orm.FLD15[1]);
        //GUILayout.Label("基础伤害: = " + orm.FLD16);
        //GUILayout.Label("普通攻击力加成: = " + orm.FLD17);
        //GUILayout.Label("是否吸血: = " + orm.FLD18);
        //GUILayout.Label("吸血百分比: = " + orm.FLD19);
        //GUILayout.Label("命中加成: = " + orm.FLD20);
        //GUILayout.Label("QTE伤害附加: = " + orm.FLD21);
        //GUILayout.Label("附加暴击率: = " + orm.FLD22);
        //GUILayout.Label("附加Buff几率: = " + orm.FLD23);
        //GUILayout.Label("附加BuffId: = " + orm.FLD24);
        //GUILayout.Label("附加Buff等级: = " + orm.FLD25);
        GUILayout.EndVertical();
        GUILayout.EndHorizontal();
    }
}
