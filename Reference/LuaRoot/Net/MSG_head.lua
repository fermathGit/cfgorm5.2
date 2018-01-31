return {
	GS2U_ActiveHeadSuccess = 
	{
		fields = "$head,u",
		[1] = {
			fields = "id,expireTime,ii",
		},
	},

	GS2U_ActiveHonorSuccess = 
	{
		fields = "honorId,i",
	},

	GS2U_ActiveTitleSuccess = 
	{
		fields = "$title,u",
		[1] = {
			fields = "id,expireTime,ii",
		},
	},

	GS2U_HeadChange = 
	{
		fields = "playerId,type,setId,Lii",
	},

	GS2U_HeadList = 
	{
		fields = "$headList,1",
		[1] = {
			fields = "id,expireTime,ii",
		},
	},

	GS2U_TitleList = 
	{
		fields = "$titleList,1",
		[1] = {
			fields = "id,expireTime,ii",
		},
	},

	U2GS_ActiveHead = 
	{
		fields = "headId,i",
	},

	U2GS_ActiveHonor = 
	{
		fields = "honorId,i",
	},

	U2GS_ActiveTitle = 
	{
		fields = "titleId,i",
	},

	U2GS_HeadList = 
	{
	},

	U2GS_SetHead = 
	{
		fields = "setHeadId,i",
	},

	U2GS_SetTitle = 
	{
		fields = "setTitleId,i",
	},

	U2GS_TitleList = 
	{
	},

}
