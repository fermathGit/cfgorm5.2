return {
	GS2U_BuyVipSpecialItemSuccess = 
	{
		fields = "id,b",
	},

	GS2U_GetVipLevelGiftSuccess = 
	{
		fields = "id,b",
	},

	GS2U_MonthCardDayRewardSuccess = 
	{
		fields = "id,haveDayGetTime,bi",
	},

	GS2U_MonthCardInfo = 
	{
		fields = "$list,1",
		[1] = {
			fields = "buyTime,id,haveDayGetTime,ibi",
		},
	},

	GS2U_VipBuyCount = 
	{
		fields = "type,id,nowBuycount,bii",
	},

	GS2U_VipBuyCountList = 
	{
		fields = "$copyBuy,$dailybuy,12",
		[1] = {
			fields = "id,buycount,ii",
		},
		[2] = {
			fields = "id,buycount,ii",
		},
	},

	GS2U_VipInfo = 
	{
		fields = "vipExp,levelGift,specialItem,ill",
	},

	GS2U_VipInfoExp = 
	{
		fields = "vipExp,i",
	},

	U2GS_BuyVipSpecialItem = 
	{
		fields = "id,b",
	},

	U2GS_GetVipLevelGift = 
	{
		fields = "id,b",
	},

	U2GS_MonthCardDayReward = 
	{
		fields = "id,b",
	},

	U2GS_RequestVipInfo = 
	{
	},

	U2GS_VipBuyCount = 
	{
		fields = "type,id,count,bii",
	},

}
