return {
	GS2U_AddTeamMemberInfo = 
	{
		fields = "$memberInfo,u",
		[1] = {
			fields = "playerID,playerName,level,career,sex,head,fight,isOnline,follow,per,LzSBBiittb",
		},
	},

	GS2U_ApplyList = 
	{
		fields = "$list,1",
		[1] = {
			fields = "teamId,playerID,playerName,level,career,sex,head,fight,visible_equips,fashionList,wing,LLzSBBii123",
		},
	},

	GS2U_AutoAgreeApply = 
	{
		fields = "autoAgreeApply,t",
	},

	GS2U_CancelMatching = 
	{
		fields = "target,i",
	},

	GS2U_ChangeTarget = 
	{
		fields = "teamTarget,i",
	},

	GS2U_ChangedLeader = 
	{
		fields = "roleId,L",
	},

	GS2U_DelTeammateInfo = 
	{
		fields = "leaderID,playerId,LL",
	},

	GS2U_InviteFollow = 
	{
	},

	GS2U_LearderInviteEnterMap = 
	{
		fields = "dailyActiveId,mapDataId,bi",
	},

	GS2U_Matching = 
	{
		fields = "target,i",
	},

	GS2U_MemberDealInviteEnterMap = 
	{
		fields = "roleId,agree,Lt",
	},

	GS2U_MemberHpChange = 
	{
		fields = "memberId,per,Lb",
	},

	GS2U_MiniMapMemberInfo = 
	{
		fields = "$info,1",
		[1] = {
			fields = "x,y,isLeader,fft",
		},
	},

	GS2U_NotFolowLeader = 
	{
	},

	GS2U_ReceiveApplyInfo = 
	{
	},

	GS2U_ReceiveInviteInfo = 
	{
		fields = "teamId,name,target,Lzi",
	},

	GS2U_RemoveWorldPropaganda = 
	{
		fields = "teamId,L",
	},

	GS2U_ReturnCopyNum = 
	{
		fields = "$list,1",
		[1] = {
			fields = "id,remainNum,Ls",
		},
	},

	GS2U_ReturnTeamCopyNum = 
	{
		fields = "$list,1",
		[1] = {
			fields = "id,remainNum,Ls",
		},
	},

	GS2U_SetFollow = 
	{
		fields = "roleId,follow,Lt",
	},

	GS2U_TeamInfo = 
	{
		fields = "teamType,teamID,leaderID,$info_list,autoAgreeApply,autoAgreeInvite,ilL1tt",
		[1] = {
			fields = "playerID,playerName,level,career,sex,head,fight,isOnline,follow,per,LzSBBiittb",
		},
	},

	GS2U_TeamList = 
	{
		fields = "$teamList,1",
		[1] = {
			fields = "teamId,leaderID,leaderName,level,head,number,target,LLzSiii",
		},
	},

	GS2U_TeamMemberFight = 
	{
		fields = "$teamlist,1",
		[1] = {
			fields = "roleid,level,head,fight,visible_equips,fashionList,wing,LSii123",
		},
	},

	GS2U_TeamMemberOffline = 
	{
		fields = "leaderID,playerID,LL",
	},

	GS2U_TeamMemberOnline = 
	{
		fields = "playerID,L",
	},

	GS2U_ViewTeam = 
	{
		fields = "leaderID,$info_list,L1",
		[1] = {
			fields = "playerID,playerName,level,career,sex,head,fight,isOnline,follow,per,LzSBBiittb",
		},
	},

	GS2U_WorldPropaganda = 
	{
		fields = "roleId,teamId,playerName,level,career,sex,head,target,LLzSBBii",
	},

	U2GS_AckInviteTeam = 
	{
		fields = "isAgree,inviteType,operatedID,BBL",
	},

	U2GS_CancelMatching = 
	{
		fields = "target,i",
	},

	U2GS_ChangeTarget = 
	{
		fields = "teamTarget,i",
	},

	U2GS_FollowLeader = 
	{
	},

	U2GS_GetMiniMapMemberInfo = 
	{
	},

	U2GS_LeaveAwayTeam = 
	{
	},

	U2GS_Matching = 
	{
		fields = "target,i",
	},

	U2GS_MemberDealInviteEnterMap = 
	{
		fields = "agree,t",
	},

	U2GS_OperateTeam = 
	{
		fields = "operateType,teamTarget,operatedID,BiL",
	},

	U2GS_RequestInviteList = 
	{
	},

	U2GS_RequestPlayerCopyNum = 
	{
		fields = "type,id,idList,bs1",
	},

	U2GS_RequestTeamCopyNum = 
	{
		fields = "type,id,bs",
	},

	U2GS_RequestTeamList = 
	{
		fields = "teamTarget,i",
	},

	U2GS_SetAutoAgreeApply = 
	{
		fields = "autoAgreeApply,t",
	},

	U2GS_SetAutoAgreeInvite = 
	{
		fields = "autoAgreeInvite,t",
	},

	U2GS_SetFollow = 
	{
		fields = "follow,t",
	},

	U2GS_TeamMemberFight = 
	{
	},

	U2GS_ViewTeam = 
	{
		fields = "teamId,L",
	},

	U2GS_WorldPropaganda = 
	{
		fields = "target,i",
	},

}
