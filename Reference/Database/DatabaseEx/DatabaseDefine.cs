
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

    //[属性id，属性值，乘法或加法值]
    public struct TProperty {
        public int id;
        public float value;
        public bool calcType;

        public TProperty( int id, float value, bool calcType = false ) {
            this.id = id;
            this.value = value;
            this.calcType = calcType;
        }
    }

    //[材料id，数量
    public struct Materialcost {
        public int id;
        public int needNum;

        public Materialcost( int id, int needNum ) {
            this.id = id;
            this.needNum = needNum;
        }
    }

    /* 
     * 物品奖励
     * 修改道具参数设置方式改为[a,b,c]
     * [{id,数量，绑定},{id2,数量，绑定}]
     * 0 不绑定
     * 1 绑定
     */
    public struct RewardItemInfo {
        public int id;
        public int num;
        public bool isBind;
        public bool isForceItem;

        public RewardItemInfo( int id, int num, bool isBind, bool isForceItem = false ) {
            this.id = id;
            this.num = num;
            this.isBind = isBind;
            this.isForceItem = isForceItem;
        }
    }

    /*
     * 修改道具参数设置方式改为[a,b,c,d]		
     * 其中a若<30000,则表示该参数为道具[a,b,c,d]即为[道具id,道具数量,道具只发给x职业,是否特效显示]。若c=0则表示该道具发给所有职业		
     * 其中a若≥30000,则表示该参数为装备[a,b,c,d]即为[装备id,装备品质,装备只发给x职业,是否特效显示]。若c=0则表示该装备发给所有职业		
     */
    //物品奖励:
    //[{itemid,number},...]
    public class Reward {
        public int id;
        public int param; // equip:quality, item:num
        public int carrer;
        public bool effect;
    }
}
