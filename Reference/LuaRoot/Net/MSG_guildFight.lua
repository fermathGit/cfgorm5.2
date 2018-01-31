return {
	GS2U_RspCampKill = 
	{
		fields = "isDay,campKillNum,campKillBossNum,campOpenBoxNum,rewardMask,tiiiL",
	},

	GS2U_RspGetRew = 
	{
		fields = "rewId,isGet,bt",
	},

	GS2U_RspGuildKill = 
	{
		fields = "isDay,guildKillNum,guildKillBossNum,guildOpenBoxNum,rewardMask,tiiiL",
	},

	GS2U_RspPersonBoxDrop = 
	{
		fields = "$list,1",
		[1] = {
			fields = "isOpenBox,time,itemid,openBoxPerson,$dropList,tiiz1",
			[1] = {
				fields = "itemDataId,num,isBind,iib",
			},
		},
	},

	GS2U_RspPersonKill = 
	{
		fields = "isDay,killNum,killBossNum,openBoxNum,dieNUm,killMonster,rewardMask,tiiiiiL",
	},

	GS2U_RsplastFightInfo = 
	{
		fields = "$lastFights,1",
		[1] = {
			fields = "mapModelId,$menberInfo,$killBossList,iu1",
			[1] = {
				fields = "killNum,killBossNum,openBoxNum,dieNum,guildKillNum,guildKillBossNum,guildOpenBoxNum,guildAllNum,sbssibss",
			},
			[2] = {
				fields = "mapModelId,monsterModelId,playerName,guildName,camp,$dropList,iizzb1",
				[1] = {
					fields = "itemDataId,num,isBind,iib",
				},
			},
		},
	},

	GS2U_SendActiveInfo = 
	{
		fields = "bindMapId,rank,$infos,$killBossInfos,ii12",
		[1] = {
			fields = "mapId,personNum,bossNum,iib",
		},
		[2] = {
			fields = "mapModelId,monsterModelId,playerName,guildName,camp,$dropList,iizzb1",
			[1] = {
				fields = "itemDataId,num,isBind,iib",
			},
		},
	},

	GS2U_SendBossTime = 
	{
		fields = "time,L",
	},

	GS2U_SynBossRemain = 
	{
		fields = "bossRamin,b",
	},

	GS2U_SynBuff = 
	{
		fields = "num,name,bz",
	},

	GS2U_SynDieNum = 
	{
		fields = "dieNum,s",
	},

	GS2U_SynGuildMenberInfo = 
	{
		fields = "$menberInfo,u",
		[1] = {
			fields = "killNum,killBossNum,openBoxNum,dieNum,guildKillNum,guildKillBossNum,guildOpenBoxNum,guildAllNum,sbssibss",
		},
	},

	GS2U_SynKillBossNum = 
	{
		fields = "isSelf,killBossNum,guildKillBossNum,campKillBossNum,tbbb",
	},

	GS2U_SynKillMonster = 
	{
		fields = "killMonster,b",
	},

	GS2U_SynKillNum = 
	{
		fields = "isSelf,killNumToShow,killNum,guildKillNum,campKillNum,tssii",
	},

	GS2U_SynOpenBoxNum = 
	{
		fields = "isSelf,openBoxNum,guildOpenBoxNum,campOpenBoxNum,tsss",
	},

	GS2U_SynRemainBoxNum = 
	{
		fields = "remainBoxNum,s",
	},

	U2GS_ReqActiveInfo = 
	{
	},

	U2GS_ReqCampDayKill = 
	{
	},

	U2GS_ReqCampForeverKill = 
	{
	},

	U2GS_ReqEnter = 
	{
		fields = "mapModelId,i",
	},

	U2GS_ReqGetRew = 
	{
		fields = "rewId,b",
	},

	U2GS_ReqGuildDayKill = 
	{
	},

	U2GS_ReqGuildForeverKill = 
	{
	},

	U2GS_ReqLastFightInfo = 
	{
	},

	U2GS_ReqPersonBoxDrop = 
	{
	},

	U2GS_ReqPersonDayKill = 
	{
	},

	U2GS_ReqPersonForeverKill = 
	{
	},

}
