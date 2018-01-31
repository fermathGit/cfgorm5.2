return {
	GS2U_BuyTradeItemFail = 
	{
		fields = "tradeId,L",
	},

	GS2U_BuyTradeItemSuccess = 
	{
		fields = "tradeId,L",
	},

	GS2U_DownTradeItemSuccess = 
	{
		fields = "tradeId,L",
	},

	GS2U_OwnUpTradeItem = 
	{
		fields = "$list,1",
		[1] = {
			fields = "tradeId,playerId,itemDataId,itemNum,cost,offTime,lliiii",
		},
	},

	GS2U_SelectTradeItemList = 
	{
		fields = "$list,1",
		[1] = {
			fields = "tradeId,playerId,itemDataId,itemNum,cost,offTime,lliiii",
		},
	},

	GS2U_TradeItemListReturn = 
	{
		fields = "$list,allSize,1i",
		[1] = {
			fields = "tradeId,playerId,itemDataId,itemNum,cost,offTime,lliiii",
		},
	},

	GS2U_UpTradeItemSuccess = 
	{
		fields = "itemId,L",
	},

	U2GS_BuyTradeItem = 
	{
		fields = "tradeId,L",
	},

	U2GS_DownTradeItem = 
	{
		fields = "tradeId,L",
	},

	U2GS_RequestOwnUpTrade = 
	{
	},

	U2GS_RequestTradeItemList = 
	{
		fields = "type,career,quality,orderType,page,iiiii",
	},

	U2GS_SelectTradeItemList = 
	{
		fields = "itemDataId,1",
	},

	U2GS_UpTradeItem = 
	{
		fields = "itemId,num,type,cost,Liii",
	},

}
