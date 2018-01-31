return {
	GS2U_GetMinorlvInfo = 
	{
		fields = "$info,u",
		[1] = {
			fields = "rote,scale,actions,equip_decorations,$bag_decorations,ff123",
			[1] = {
				fields = "id,endTime,ii",
			},
		},
	},

	GS2U_MinorlvDownSucc = 
	{
		fields = "id,i",
	},

	GS2U_MinorlvEquipSucc = 
	{
		fields = "id,i",
	},

	GS2U_MinorlvItemsActive = 
	{
		fields = "$info,u",
		[1] = {
			fields = "id,endTime,ii",
		},
	},

	GS2U_MinorlvRoteScaleSuc = 
	{
	},

	GS2U_MinorlvZoneDeleteMessageSuc = 
	{
		fields = "$messages,u",
		[1] = {
			fields = "id,time,roleId,roleName,roleHead,iiLzi",
		},
	},

	GS2U_MinorlvZoneInfo = 
	{
		fields = "girlGiftNum,votes,$messages,equip_decorations,actions,isOnline,rote,scale,ii123tff",
		[1] = {
			fields = "id,time,roleId,roleName,roleHead,iiLzi",
		},
	},

	GS2U_MinorlvZoneLeaveMessageSuc = 
	{
		fields = "$messages,u",
		[1] = {
			fields = "id,time,roleId,roleName,roleHead,iiLzi",
		},
	},

	GS2U_MinorlvZoneVoteAndAddGiftSuc = 
	{
		fields = "girlGiftNum,votes,ii",
	},

	U2GS_GetMinorlvInfo = 
	{
	},

	U2GS_MinorlvDownDecoration = 
	{
		fields = "id,i",
	},

	U2GS_MinorlvEquipDecoration = 
	{
		fields = "id,i",
	},

	U2GS_MinorlvZoneAddGiftNum = 
	{
		fields = "num,i",
	},

	U2GS_MinorlvZoneDeleteMessage = 
	{
		fields = "time,roleId,iL",
	},

	U2GS_MinorlvZoneLeaveMessage = 
	{
		fields = "id,masterPlayerId,iL",
	},

	U2GS_MinorlvZoneReq = 
	{
		fields = "masterPlayerId,L",
	},

	U2GS_MinorlvZoneVote = 
	{
		fields = "masterPlayerId,L",
	},

	U2GS_SetMinorlvRoteScale = 
	{
		fields = "rote,scalte,ff",
	},

}
