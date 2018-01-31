return {
	GS2U_AddBlackFriendResult = 
	{
		fields = "isSuccess,$info,tu",
		[1] = {
			fields = "roleId,roleName,career,sex,level,isOnline,vip,fightValue,head,LzBBSBBIi",
		},
	},

	GS2U_AddFriendResult = 
	{
		fields = "$friend,u",
		[1] = {
			fields = "friendValue,$info,Iu",
			[1] = {
				fields = "roleId,roleName,career,sex,level,isOnline,vip,fightValue,head,LzBBSBBIi",
			},
		},
	},

	GS2U_AskTargetAddFriend = 
	{
		fields = "sourceId,sourceName,Lz",
	},

	GS2U_LoadBlackFriendInfoList = 
	{
		fields = "$blackInfoList,1",
		[1] = {
			fields = "roleId,roleName,career,sex,level,isOnline,vip,fightValue,head,LzBBSBBIi",
		},
	},

	GS2U_LoadFriendInfoList = 
	{
		fields = "$friendInfoList,1",
		[1] = {
			fields = "friendValue,$info,Iu",
			[1] = {
				fields = "roleId,roleName,career,sex,level,isOnline,vip,fightValue,head,LzBBSBBIi",
			},
		},
	},

	GS2U_LoadTempFriendInfoList = 
	{
		fields = "$tempInfoList,1",
		[1] = {
			fields = "roleId,roleName,career,sex,level,isOnline,vip,fightValue,head,LzBBSBBIi",
		},
	},

	GS2U_RecommendFriendResult = 
	{
		fields = "$infoList,1",
		[1] = {
			fields = "roleId,roleName,career,sex,level,isOnline,vip,fightValue,head,LzBBSBBIi",
		},
	},

	GS2U_RemoveBlackResult = 
	{
		fields = "roleId,isSuccess,Lt",
	},

	GS2U_RemoveFriendResult = 
	{
		fields = "roleId,isSuccess,Lt",
	},

	GS2U_SearchResult = 
	{
		fields = "$info,u",
		[1] = {
			fields = "roleId,roleName,career,sex,level,isOnline,vip,fightValue,head,LzBBSBBIi",
		},
	},

	U2GS_AddBlackFriendRequest = 
	{
		fields = "roleId,L",
	},

	U2GS_AddFriendRequest = 
	{
		fields = "roleId,L",
	},

	U2GS_BlackFriendInfoListRequest = 
	{
	},

	U2GS_FriendInfoListRequest = 
	{
	},

	U2GS_RecommendFriendRequest = 
	{
		fields = "pageIndex,pageNum,SS",
	},

	U2GS_RemoveBlackRequest = 
	{
		fields = "roleId,L",
	},

	U2GS_RemoveFriendRequest = 
	{
		fields = "roleId,L",
	},

	U2GS_SearchRequest = 
	{
		fields = "roleName,z",
	},

	U2GS_TempFriendInfoListRequest = 
	{
	},

}
