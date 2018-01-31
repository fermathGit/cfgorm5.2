return {
	GS2U_AchievementFinish = 
	{
		fields = "$ach,u",
		[1] = {
			fields = "id,rewardIndex,targetNum,sii",
		},
	},

	GS2U_AchievementInfo = 
	{
		fields = "$dailyList,1",
		[1] = {
			fields = "id,rewardIndex,targetNum,sii",
		},
	},

	GS2U_GetAchievementReward = 
	{
		fields = "id,type,sb",
	},

	GS2U_GetGrowupAchStarRewardSuccess = 
	{
		fields = "id,s",
	},

	GS2U_GrowupAchInfo = 
	{
		fields = "achStar,achStarReward,$foreverList,si1",
		[1] = {
			fields = "id,rewardIndex,targetNum,sii",
		},
	},

	U2GS_AchievementInfo = 
	{
	},

	U2GS_GetAchievementReward = 
	{
		fields = "id,type,sb",
	},

	U2GS_GetGrowupAchStarReward = 
	{
		fields = "id,s",
	},

	U2GS_GrowupAchInfo = 
	{
	},

}
