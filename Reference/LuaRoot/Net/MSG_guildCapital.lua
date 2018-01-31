return {
	GS2U_GCBattleAtkPlayer = 
	{
		fields = "num,i",
	},

	GS2U_GCBattleClearingPanel = 
	{
		fields = "$infos,$battleinfos,winnerGuildName,winnerGuildChairmanName,12zz",
		[1] = {
			fields = "guildId,guildName,sumScore,Lzi",
		},
		[2] = {
			fields = "playerName,kills,assist,score,guildName,ziiiz",
		},
	},

	GS2U_GCBattleFlagAndFortBarbette = 
	{
		fields = "$flaginfos,scores,12",
		[1] = {
			fields = "guildid,flagid,postionx,postiony,state,process,Llffif",
		},
	},

	GS2U_GCGuildBattleCannonCD = 
	{
		fields = "CannonCD,1",
	},

	GS2U_GCGuildBattleFlagOccupiedScore = 
	{
		fields = "score,i",
	},

	GS2U_GCGuildBattleStartNotice = 
	{
		fields = "activityId,i",
	},

	GS2U_GCGuildCapitalBattleFireResult = 
	{
		fields = "range,x,y,fff",
	},

	GS2U_GCSendBattleClearingDetailPanel = 
	{
		fields = "infos,1",
	},

	GS2U_GCSendGuildCapitalPanel = 
	{
		fields = "state,time,guildNames,guildid,index,Bi12i",
	},

	GS2U_GCSendGuildCapitalPersonalStatistics = 
	{
		fields = "$infos,1",
		[1] = {
			fields = "playerName,kills,assist,score,guildName,ziiiz",
		},
	},

	GS2U_GCSendGuildRemainTime = 
	{
		fields = "readyTime,remainTime,ii",
	},

	GS2U_SendGuildCapitalGroup = 
	{
		fields = "$battleinfo,1",
		[1] = {
			fields = "guildNames,index,1i",
		},
	},

	U2GS_GCGuildCapitalBattleFire = 
	{
		fields = "flagIndex,i",
	},

	U2GS_GCGuildMapinfo = 
	{
	},

	U2GS_GCSendBattleClearingDetailPanel = 
	{
	},

	U2GS_GCSendGuildCapitalPanel = 
	{
	},

	U2GS_GCSendGuildCapitalPersonalStatistics = 
	{
	},

	U2GS_RequestGuildCapitalGroup = 
	{
		fields = "camp,i",
	},

}
