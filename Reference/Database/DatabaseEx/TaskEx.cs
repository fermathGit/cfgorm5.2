
using System;
using System.Collections.Generic;
using Common;
using UnityEngine;
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

    public enum TaskTargetType {
        None = -1,
        TalkTask = 0, // 对话
        KillMonsterTask = 1, // 杀怪
        KillAndCollectTask = 2, // 打怪收集
        CollectTask = 3, // 采集	
        FinishCopyTask = 4, // 完成副本
        FinishPlanesTask = 5, // 完成位面	
        FinishFunctionsTask = 6, // 完成特定功能
        JoinActivityTask = 7, // 进入特定活动
        ReachLevel = 8, // 达到等级
        FinishCutscene = 9, // 完成剧情
        ClientFinishFunctionsTask = 10, // 客户端完成特定功能
    }

    public enum TaskType {
        None = -1,
        MainTask = 0, // 主线
        BranchTask = 1, // 支线
        DailyTask = 2, // 每日任务
        CampTask = 4,        //阵营任务
        GuideTask = 5,// 引导任务
        MasterTask = 6,// 师门任务
    }

    public enum ClientTaskFinishFunc {
        None = 0,
        EquipImprove = 1, // 1.x件装备强化x级
        GetMount = 2, // 2.获得x个蓝色以上坐骑
        GetWing = 3, // 3.获得x个蓝色以上分翼
        GetPet = 4, // 4.获得x只蓝色以上宠物
        UpGuildSkill = 5, // 5.x个仙盟技能达x级
        GetEquipSuit = 6, // 6.收集x级橙装一套
        GetEquip = 7, // 7.收集x件橙装
        UpPetLevel = 8, // 8.升级x只宠物到x级
        FightPetCount = 9, // 9.上阵x只宠物
    }

    // 当任务为完成特定功能时，需要完成的功能(没多大用了，只有特殊处理的才有点用)
    public enum TaskFinishFunc {
        None = 0,
        SelectCamp = 1, // 1 选择阵营
        EnhanceEquip = 2, // 2 强化装备
        ImproEquipQuality = 3, // 3 装备升品
        UpEquipStar = 4, // 4 装备冲星
        EquipReset = 5,  // 5 装备洗炼
        GemMounting = 6, // 6 宝石镶嵌
        UpRoleSkill = 7, // 7 技能升级
        CallOutPet = 8, // 8 宠物出战 
        UpPetLevel = 9, // 9 宠物等级成长
        PetCultivaty = 10, // 10 宠物吞噬 
        UpPetSkill = 11, // 11 宠物技能学习 
        UpMountStar = 12, // 12 坐骑冲星
        UpWingStar = 13, // 13 翅膀升星
        UseItem = 14, // 14 使用道具
        JoinXm = 15, // 15 加入或创建一个仙盟
        LittleSisterLinxi = 16, // 16 师妹灵犀
        LittleSisterYouli = 17, // 17 师妹游历
        Addfriend = 18, // 18 加好友
        YaoQianShu = 19, // 19 摇钱树
        SelectPet = 20, // 20 选择宠物
        UpMount = 21, // 21 骑乘坐骑
        ActiveFuWen = 22, // 22 激活符文
        UpHunQi = 23, // 23 魂器升级
    }

    public partial class TaskEx {
        static TaskEx() {
            OnLoadComplexField_movetoNPC = Task.LoadComplexField_movetoNPC;
            OnLoadComplexField_guidetype = Task.LoadComplexField_Guidetype;
            OnLoadComplexField_task_reward_item = Task.LoadComplexField_SetRewardItem;
            OnLoadComplexField_showItem = Task.LoadComplexField_showItem;
        }
    }

    public partial class Task {
        #region task para
        // 人物类型（五选一）
        // 完成对话
        public struct TalkTask {
            public int npcId;
        }

        // 完成副本
        public struct FinishCopyTask {
            public int copyId;
        }

        // 完成位面
        public struct FinishPlanesTask {
            public int planeNpc;
            public int planeId;
        }

        // 杀怪任务
        public struct KillMonTask {
            public int monsterId;
            public int monsterNum;
        }

        // 采集任务
        public struct CollectTask {
            public int collectId;
            public int collectNum;
        }

        // 杀怪采集任务
        public struct KillAndCollectTask {
            public int monsterId;
            public int collectId;
            public int collectNum;
        }
        #endregion

        #region members
        private Vector3 m_npcOffsetPos = Vector3.zero;
        private RewardItemInfo m_rewardSHowItem;
        private RewardItemInfo[] m_rewardItem = null;
        private FinishCopyTask m_finishCopyTask;
        private FinishPlanesTask m_finishPlanesTask;
        private TalkTask m_talkTask;
        private KillMonTask m_killMonTask;
        private CollectTask m_collectTask;
        private KillAndCollectTask m_killAndCollectTask;
        private TArray<int> m_guideType = null;
        #endregion

        #region properties
        public Vector3 npcOffsetPos { get { return m_npcOffsetPos; } }
        public RewardItemInfo rewardSHowItem { get { return m_rewardSHowItem; } }
        public RewardItemInfo[] rewardItem { get { return m_rewardItem; } }
        public FinishCopyTask finishCopy { get { return m_finishCopyTask; } }
        public FinishPlanesTask finishPlanes { get { return m_finishPlanesTask; } }
        public TalkTask talkTask { get { return m_talkTask; } }
        public KillMonTask killMonTask { get { return m_killMonTask; } }
        public CollectTask collectTask { get { return m_collectTask; } }
        public KillAndCollectTask killAndCollectTask { get { return m_killAndCollectTask; } }
        public TArray<int> guideType { get { return m_guideType; } }

        // include exp and gold
        public List<RewardItemInfo> allRewardItem {
            get {
                var ret = new List<RewardItemInfo>();
                if( task_reward_goldnum != 0 ) {
                    ret.Add( new Database.RewardItemInfo( task_reward_goldtype, task_reward_goldnum, false ) );
                }
                if( task_reward_exp != 0 ) {
                    ret.Add( new Database.RewardItemInfo( (int)Database.Item.ItemIdType.RoleExp, task_reward_exp, false ) );
                }
                if( rewardItem != null ) {
                    for( int i = 0; i < rewardItem.Length; ++i ) {
                        var tempItem = rewardItem[i];
                        if( tempItem.id != 0 ) {
                            ret.Add( tempItem );
                        }
                    }
                }
                return ret;
            }
        }
        #endregion

        #region cacheEx
        static Dictionary<int, List<int>> dicCacheTaskByMapId = new Dictionary<int, List<int>>();
        static Dictionary<int, List<int>> dicCacheTaskByGroupId = new Dictionary<int, List<int>>();
        #endregion

        public static void ClearCacheEx() {
            dicCacheTaskByMapId = null;
            dicCacheTaskByGroupId.Clear();
        }

        #region load and set
        internal static void LoadComplexField_movetoNPC( Task data, LuaDatabase.Query q ) {
            var item = Dataset.LoadIntArray( "movetoNPC", q );
            if( item != null && item.Length >= 2 ) {
                data.m_npcOffsetPos = new Vector3( item[0], 0, item[1] );
            }
        }

        internal static void LoadComplexField_Guidetype( Task data, LuaDatabase.Query q ) {
            data.m_guideType = Dataset.LoadIntArray( "guidetype", q );
        }

        internal static void LoadComplexField_showItem( Task data, LuaDatabase.Query q ) {
            var item = Dataset.LoadIntArray( "showItem", q );
            if( item != null && item.Length >= 2 ) {
                var temp = new RewardItemInfo();
                temp.id = item[0];
                temp.num = item[1];
                temp.isBind = false;
                temp.isForceItem = true;
                data.m_rewardSHowItem = temp;
            }
        }

        internal static void LoadComplexField_SetRewardItem( Task data, LuaDatabase.Query q ) {
            var items = Dataset.LoadIntArray2d( "task_reward_item", q );
            if( items != null ) {
                data.m_rewardItem = new RewardItemInfo[items.Length];
                for( int i = 0; i < items.Length; i++ ) {
                    var item = items[i];
                    if( item != null && item.Length >= 2 ) {
                        var temp = new RewardItemInfo();
                        temp.id = item[0];
                        temp.num = item[1];
                        temp.isBind = false;
                        temp.isForceItem = true;
                        data.m_rewardItem[i] = temp;
                    }
                }
            }

            try {
                LoadComplexField_SetTaskTarget( data, q );
            }
            finally {
            }
        }

        static void LoadComplexField_SetTaskTarget( Task data, LuaDatabase.Query q ) {
            switch( (TaskTargetType)data.target_type ) {
                case TaskTargetType.TalkTask: SetTalkTask( data, q ); break;
                case TaskTargetType.KillMonsterTask: SetKillMonsterTask( data, q ); break;
                case TaskTargetType.KillAndCollectTask: SetKillAndCollectTask( data, q ); break;
                case TaskTargetType.CollectTask: SetCollectTask( data, q ); break;
                case TaskTargetType.FinishCopyTask:
                case TaskTargetType.FinishCutscene: SetFinishCopyTask( data, q ); break;
                case TaskTargetType.FinishPlanesTask: SetFinishPlanesTask( data, q ); break;
            }
        }

        static void SetKillMonsterTask( Task data, LuaDatabase.Query q ) {
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                var table = new LuaTinker.Table( L, -1 );
                var subTable = table.GetSubTable( "target_kill" );
                if ( subTable != LuaTinker.Table.Empty ) {
                    var temp = new KillMonTask();
                    temp.monsterId = subTable.Get<int>( "mst" );
                    temp.monsterNum = subTable.Get<int>( "mstnum" );
                    data.m_killMonTask = temp;
                }
            }
            finally {
                L.SetTop( top );
            }
        }

        static void SetTalkTask( Task data, LuaDatabase.Query q ) {
            data.m_talkTask = new TalkTask();
            data.m_talkTask.npcId = data.task_commitnpc;
        }

        static void SetCollectTask( Task data, LuaDatabase.Query q ) {
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                var table = new LuaTinker.Table( L, -1 );
                var subTable = table.GetSubTable( "target_collect" );
                if ( subTable != LuaTinker.Table.Empty ) {
                    var temp = new CollectTask();
                    temp.collectId = subTable.Get<int>( "cobj" );
                    temp.collectNum = subTable.Get<int>( "cnum" );
                    data.m_collectTask = temp;
                }
            }
            finally {
                L.SetTop( top );
            }
        }

        static void SetKillAndCollectTask( Task data, LuaDatabase.Query q ) {
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                var table = new LuaTinker.Table( L, -1 );
                var subTable = table.GetSubTable( "target_killget" );
                if ( subTable != LuaTinker.Table.Empty ) {
                    var temp = new KillAndCollectTask();
                    temp.monsterId = subTable.Get<int>( "kmst" );
                    temp.collectId = subTable.Get<int>( "kitem" );
                    temp.collectNum = subTable.Get<int>( "knum" );
                    data.m_killAndCollectTask = temp;
                }
            }
            finally {
                L.SetTop( top );
            }
        }

        static void SetFinishCopyTask( Task data, LuaDatabase.Query q ) {
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                var table = new LuaTinker.Table( L, -1 );
                var subTable = table.GetSubTable( "target_finishcopy" );
                if ( subTable != LuaTinker.Table.Empty ) {
                    var temp = new FinishCopyTask();
                    temp.copyId = subTable.Get<int>( "getcopy" );
                    data.m_finishCopyTask = temp;
                }
            }
            finally {
                L.SetTop( top );
            }
        }

        static void SetFinishPlanesTask( Task data, LuaDatabase.Query q ) {
            var L = q.LuaState;
            int top = L.GetTop();
            try {
                var table = new LuaTinker.Table( L, -1 );
                var subTable = table.GetSubTable( "target_minicopy" );
                if ( subTable != LuaTinker.Table.Empty ) {
                    var temp = new FinishPlanesTask();
                    temp.planeId = subTable.Get<int>( "getminicopy" );
                    temp.planeNpc = subTable.Get<int>( "mininpc" );
                    data.m_finishPlanesTask = temp;
                }
            }
            finally {
                L.SetTop( top );
            }
        }
        #endregion
    }
}
