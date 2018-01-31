return {
	GS2U_ApplyJoinGuildSuccess = 
	{
		fields = "guildID,1",
	},

	GS2U_CanChangeGuildName = 
	{
	},

	GS2U_ChangeGuildName = 
	{
		fields = "guildId,oldGuildName,newGuildName,Lzz",
	},

	GS2U_ChangeNotice = 
	{
		fields = "guildNotice,z",
	},

	GS2U_DeleteGuildId = 
	{
		fields = "guildIds,1",
	},

	GS2U_Donate = 
	{
		fields = "type,point,bi",
	},

	GS2U_DonateGuildNotice = 
	{
		fields = "name,type,zb",
	},

	GS2U_ExitGuild = 
	{
	},

	GS2U_GetContributeGiftSuccess = 
	{
		fields = "id,i",
	},

	GS2U_GuildActive = 
	{
		fields = "value,i",
	},

	GS2U_GuildApplyList = 
	{
		fields = "$list,1",
		[1] = {
			fields = "playerId,playerName,level,fight,vipLv,Lziii",
		},
	},

	GS2U_GuildApplyTipsInfo = 
	{
		fields = "$info,u",
		[1] = {
			fields = "playerId,playerName,level,fight,vipLv,Lziii",
		},
	},

	GS2U_GuildBuildValue = 
	{
		fields = "$moneys,1",
		[1] = {
			fields = "type,value,bi",
		},
	},

	GS2U_GuildCredit = 
	{
		fields = "credit,i",
	},

	GS2U_GuildLvInfo = 
	{
		fields = "$lvList,1",
		[1] = {
			fields = "proType,lv,bs",
		},
	},

	GS2U_GuildMainInfoList = 
	{
		fields = "lastQuitGuildTime,$list,i1",
		[1] = {
			fields = "guildId,guildName,guildLevel,chairManName,nums,camp,apply,createTime,top,fight,Lziziitiii",
		},
	},

	GS2U_GuildMemberJoin = 
	{
		fields = "roleId,name,Lz",
	},

	GS2U_GuildMemberRankChange = 
	{
		fields = "playerId,rank,Lb",
	},

	GS2U_GuildMoneys = 
	{
		fields = "$moneys,1",
		[1] = {
			fields = "type,value,bi",
		},
	},

	GS2U_GuildNowExp = 
	{
		fields = "lv,exp,ii",
	},

	GS2U_GuildRecordList = 
	{
		fields = "$list,1",
		[1] = {
			fields = "name,eventType,time,parm1,zbii",
		},
	},

	GS2U_GuildRecruit = 
	{
		fields = "guildId,guildName,roleId,roleName,head,str,LzLziz",
	},

	GS2U_GuildTopInfo = 
	{
		fields = "campTop,allFightPoint,$list,ii1",
		[1] = {
			fields = "guild1,guild2,guild3,zzz",
		},
	},

	GS2U_MemberList = 
	{
		fields = "guildId,guildName,guildLevel,exp,notice,autoAgree,$list,recruitNum,ownLastDaypoint,guildLastDayPoint,todayDayPoint,ownTodayPoint,Lziizt1iiiii",
		[1] = {
			fields = "playerId,playerName,level,rank,militaryR,fight,lastOffLineTime,head,Lziiiiii",
		},
	},

	GS2U_PlayerGuildInfo = 
	{
		fields = "roleId,guildId,guildName,rank,LLzi",
	},

	GS2U_ReceivedInviteMsg = 
	{
		fields = "$guildInfo,u",
		[1] = {
			fields = "guildId,guildName,guildLevel,chairManName,nums,camp,apply,createTime,top,fight,Lziziitiii",
		},
	},

	GS2U_SearchGuildFailed = 
	{
	},

	GS2U_SearchGuildSuccess = 
	{
		fields = "$guild,u",
		[1] = {
			fields = "guildId,guildName,guildLevel,chairManName,nums,camp,apply,createTime,top,fight,Lziziitiii",
		},
	},

	GS2U_TadayDonateCount = 
	{
		fields = "count,point,haveGetReward,1ii",
	},

	GS2U_TadayGetSalaryCount = 
	{
		fields = "count,i",
	},

	GS2U_UpOwnGuildLv = 
	{
		fields = "proType,maxLv,bs",
	},

	GS2U_ViewGuild = 
	{
		fields = "$viewInfo,u",
		[1] = {
			fields = "guildId,guildName,guildLevel,chairManName,nums,camp,top,notice,Lziziiiz",
		},
	},

	SetGuildAutoAgreeApply = 
	{
		fields = "autoAgree,t",
	},

	U2GS_AgreeGuildRecruit = 
	{
		fields = "guildId,L",
	},

	U2GS_ApplyJoinGuild = 
	{
		fields = "guildID,1",
	},

	U2GS_ChangeGuildName = 
	{
		fields = "newGuildName,z",
	},

	U2GS_ChangeNotice = 
	{
		fields = "guildNotice,z",
	},

	U2GS_CreateGuild = 
	{
		fields = "isUseItem,guildName,tz",
	},

	U2GS_DealApplyJoinGuild = 
	{
		fields = "playerId,agree,Lt",
	},

	U2GS_DealInviteJoinGuild = 
	{
		fields = "guildId,agree,Lt",
	},

	U2GS_Donate = 
	{
		fields = "type,b",
	},

	U2GS_ExitGuild = 
	{
	},

	U2GS_GetContributeGift = 
	{
		fields = "id,i",
	},

	U2GS_GetGuildTop = 
	{
	},

	U2GS_GetSalary = 
	{
	},

	U2GS_GuildRecruit = 
	{
		fields = "str,z",
	},

	U2GS_InvitePlayerJoinGuild = 
	{
		fields = "playerId,L",
	},

	U2GS_RequestGuildInfo = 
	{
		fields = "type,b",
	},

	U2GS_SearchGuild = 
	{
		fields = "guildName,z",
	},

	U2GS_SetGuildMemberRank = 
	{
		fields = "playerId,rank,Lb",
	},

	U2GS_UpOwnGuildLv = 
	{
		fields = "proType,b",
	},

	U2GS_ViewGuild = 
	{
		fields = "guildId,L",
	},

	U2GS_WelcomeGuildMember = 
	{
		fields = "roleId,L",
	},

}
