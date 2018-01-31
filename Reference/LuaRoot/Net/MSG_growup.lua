return {
	GS2U_GetGrowUpRewardSuccess = 
	{
		fields = "id,i",
	},

	GS2U_GetHowToGrowUpRewardSuccess = 
	{
		fields = "id,B",
	},

	GS2U_GrowUpInfoList = 
	{
		fields = "$list,1",
		[1] = {
			fields = "id,top,value,getTopReward,getBaseReward,ssitt",
		},
	},

	GS2U_GrowUpInfoRefresh = 
	{
	},

	GS2U_HowToGrowUpRewardHaveGet = 
	{
		fields = "rewardbit1,rewardbit2,LL",
	},

	U2GS_GetGrowUpInfo = 
	{
	},

	U2GS_GetGrowUpReward = 
	{
		fields = "id,i",
	},

	U2GS_GetHowToGrowUpReward = 
	{
		fields = "id,B",
	},

}
