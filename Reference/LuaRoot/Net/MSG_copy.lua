return {
	GS2U_CopyMapRemainCount = 
	{
		fields = "$list,1",
		[1] = {
			fields = "mapDataId,remainCount,isFinish,iit",
		},
	},

	GS2U_CopyProcessApointMonster = 
	{
		fields = "$value,u",
		[1] = {
			fields = "monsterId,remainnum,ii",
		},
	},

	GS2U_CopyProcessEscort = 
	{
		fields = "processId,per,loop,remainTime,escortPer,ibbii",
	},

	GS2U_CopyProcessEscortPer = 
	{
		fields = "per,i",
	},

	GS2U_CopyProcessHpPer = 
	{
		fields = "per,b",
	},

	GS2U_CopyProcessKillAll = 
	{
		fields = "processId,killNum,loop,remainTime,iibi",
	},

	GS2U_CopyProcessKillApoint = 
	{
		fields = "processId,$remains,remainTime,i1i",
		[1] = {
			fields = "monsterId,remainnum,ii",
		},
	},

	GS2U_CopyProcessKillNum = 
	{
		fields = "killNum,i",
	},

	GS2U_CopyProcessLoop = 
	{
		fields = "loop,b",
	},

	GS2U_CopyProcessProtected = 
	{
		fields = "processId,per,loop,remainTime,ibbi",
	},

	GS2U_ExtraRewardRemainTime = 
	{
		fields = "createTime,haveProfit,it",
	},

	GS2U_FinishCopy = 
	{
		fields = "mapDataId,$list,$getList,addExp,success,i12it",
		[1] = {
			fields = "name,harm,zi",
		},
		[2] = {
			fields = "itemDataId,num,bind,iit",
		},
	},

	GS2U_MapInspire = 
	{
		fields = "count,b",
	},

	GS2U_MiniMapInfo = 
	{
		fields = "$infoes,$monsteres,12",
		[1] = {
			fields = "x,y,type,ffb",
		},
		[2] = {
			fields = "x,y,monsterDataId,ffi",
		},
	},

	GS2U_NextPos = 
	{
		fields = "x,y,ff",
	},

	GS2U_RequestEnterCopyMap = 
	{
		fields = "copyMapID,copyId,il",
	},

	GS2U_StoryCopyFinishId = 
	{
		fields = "mapId,i",
	},

	GS2U_UpdateCopyMapRemainCount = 
	{
		fields = "$copyReamin,u",
		[1] = {
			fields = "mapDataId,remainCount,isFinish,iit",
		},
	},

	GS2U_WipeCopyResult = 
	{
		fields = "copyMapID,remainCount,$list,ii1",
		[1] = {
			fields = "itemDataId,num,bind,iit",
		},
	},

	U2GS_AddMapInspire = 
	{
	},

	U2GS_AgreeEnterCopyMap = 
	{
		fields = "copyMapID,copyId,il",
	},

	U2GS_EnterCopyMap = 
	{
		fields = "copyMapID,i",
	},

	U2GS_EnterStoryCopyMap = 
	{
		fields = "mapId,i",
	},

	U2GS_GetMiniMapInfo = 
	{
	},

	U2GS_GetStoryCopyFinishId = 
	{
	},

	U2GS_LeaveCopyMap = 
	{
	},

	U2GS_RefrehMonster = 
	{
	},

	U2GS_RequestNextPos = 
	{
	},

	U2GS_TriggerNextProgress = 
	{
		fields = "triggerId,i",
	},

	U2GS_WipeCopyMap = 
	{
		fields = "Id,type,ii",
	},

}
