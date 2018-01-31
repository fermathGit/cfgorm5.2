return {
	GS2U_DailyActiveInfo = 
	{
		fields = "$list,1",
		[1] = {
			fields = "activeId,enterCount,ii",
		},
	},

	GS2U_DailyActivePoint = 
	{
		fields = "allDailyNum,haveGet,allWeekNum,weekHaveGet,iiii",
	},

	GS2U_FreshWildBoss = 
	{
		fields = "$wblist,1",
		[1] = {
			fields = "dataid,time,isOpen,iit",
		},
	},

	GS2U_GetDailyRewardSuccess = 
	{
		fields = "id,i",
	},

	GS2U_KillMonsterInfo = 
	{
		fields = "remainNum,i",
	},

	GS2U_MoneyCopyMapKillNum = 
	{
		fields = "nowKillNum,i",
	},

	GS2U_MoneyCopyMapProcess = 
	{
		fields = "allNeedKillNum,haveKilledNum,haveGotMoney,iii",
	},

	GS2U_MulitipleReamin = 
	{
		fields = "remainTime,i",
	},

	GS2U_MulitipleSuccess = 
	{
	},

	GS2U_NowRefreshWorldBoss = 
	{
		fields = "id,i",
	},

	GS2U_PersonalBattleEnterMap = 
	{
		fields = "$tower,num,remainTime,1ii",
		[1] = {
			fields = "per,id,bi",
		},
	},

	GS2U_PersonalBattleFinish = 
	{
		fields = "towers,1",
	},

	GS2U_PersonalBattleHpPer = 
	{
		fields = "$tower,u",
		[1] = {
			fields = "per,id,bi",
		},
	},

	GS2U_PersonalBattleKill = 
	{
		fields = "num,i",
	},

	GS2U_ProtectNPCProcess = 
	{
		fields = "remainNum,nowProcess,time,iii",
	},

	GS2U_ProtectNpcGetEffect = 
	{
		fields = "roleId,monsterDataId,id,Lib",
	},

	GS2U_ProtectNpcHpPer = 
	{
		fields = "per,i",
	},

	GS2U_ProtectOwnEffectId = 
	{
		fields = "$effectes,1",
		[1] = {
			fields = "effectId,num,bb",
		},
	},

	GS2U_ProtectUseEffectId = 
	{
		fields = "roleId,id,cd,publicCd,Lbii",
	},

	GS2U_WildBossDead = 
	{
		fields = "monsterDataId,nextRefresTime,strName,iiz",
	},

	GS2U_WildBossOwner = 
	{
		fields = "monsterId,name,Lz",
	},

	GS2U_WorldBossHarm = 
	{
		fields = "$list,1",
		[1] = {
			fields = "id,rank,hram,$harmList,iil1",
			[1] = {
				fields = "rank,name,harm,izl",
			},
		},
	},

	GS2U_WorldBossHarmTopThree = 
	{
		fields = "id,rank,hram,$list,iil1",
		[1] = {
			fields = "rank,name,harm,izl",
		},
	},

	U2GS_GetDailyReward = 
	{
		fields = "id,i",
	},

	U2GS_JoinDailyActive = 
	{
		fields = "dailyId,groupId,ii",
	},

	U2GS_ProtectUseEffectId = 
	{
		fields = "id,b",
	},

	U2GS_RequestDailyActiveInfo = 
	{
	},

	U2GS_WorldBossHarm = 
	{
		fields = "id,i",
	},

}
