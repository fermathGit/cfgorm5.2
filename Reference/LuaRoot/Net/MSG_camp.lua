return {
	GS2U_BordCampBossDeadBord = 
	{
		fields = "attaName,beattaName,camp,zzb",
	},

	GS2U_BordCampBossHp = 
	{
		fields = "camp,nowHpPer,bi",
	},

	GS2U_CampDartBossBlood = 
	{
		fields = "percent,b",
	},

	GS2U_CampDartKill = 
	{
		fields = "num,s",
	},

	GS2U_CampIsCanBanTalk = 
	{
		fields = "isCanBanTalk,t",
	},

	GS2U_CampTaskNumber = 
	{
		fields = "$taskinfo,1",
		[1] = {
			fields = "type,number,ii",
		},
	},

	GS2U_CampWarBossBlood = 
	{
		fields = "percentOfTJ,percentOfXZ,bb",
	},

	GS2U_CampWarKill = 
	{
		fields = "num,s",
	},

	GS2U_CampWarMonsDeadStateList = 
	{
		fields = "$monState,1",
		[1] = {
			fields = "monsterDataId,state,it",
		},
	},

	GS2U_CampWarProcessResponse = 
	{
		fields = "winner,$warProcess,b1",
		[1] = {
			fields = "type,value,bs",
		},
	},

	GS2U_CampWarRankResponse = 
	{
		fields = "$rank,1",
		[1] = {
			fields = "roleId,roleName,camp,score,assist,killNum,Lzbiss",
		},
	},

	GS2U_CampWarResult = 
	{
		fields = "winner,$warResult,$rank,b12",
		[1] = {
			fields = "type,value,bs",
		},
		[2] = {
			fields = "roleId,roleName,camp,score,assist,killNum,Lzbiss",
		},
	},

	GS2U_ExploitValue = 
	{
		fields = "number,i",
	},

	GS2U_RespCampDartBossPosition = 
	{
		fields = "mapid,x,y,iff",
	},

	GS2U_ReturnCampLeader = 
	{
		fields = "camp,$players,b1",
		[1] = {
			fields = "roleId,name,career,sex,weaponId,offhandId,mainBodyId,fashionList,equiplv,head,fightPoint,wingList,titleId,Lzbbiii1iii2i",
		},
	},

	GS2U_ReturnCampTypeId = 
	{
		fields = "$taskinfo,u",
		[1] = {
			fields = "type,number,ii",
		},
	},

	GS2U_TadayCampSalaryCount = 
	{
		fields = "count,military,ii",
	},

	GS2U_campDartBossBosPos = 
	{
		fields = "mapid,x,y,open,ifft",
	},

	U2GS_CampBanTalk = 
	{
		fields = "roleId,L",
	},

	U2GS_CampGetSalary = 
	{
	},

	U2GS_CampWarBossBloodQuery = 
	{
	},

	U2GS_CampWarEnterReqest = 
	{
		fields = "isBegin,type,ti",
	},

	U2GS_CampWarProcessReqest = 
	{
	},

	U2GS_CampWarRankRequest = 
	{
	},

	U2GS_GetCampTask = 
	{
		fields = "taskType,i",
	},

	U2GS_GoToCampMap = 
	{
	},

	U2GS_ReqCampDartBossPosition = 
	{
	},

	U2GS_RequestCampLeader = 
	{
		fields = "camp,i",
	},

	U2GS_RequestCampTaskNumber = 
	{
	},

	U2GS_RequestSalaryCount = 
	{
	},

}
