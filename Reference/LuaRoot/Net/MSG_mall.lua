return {
	GS2U_ItemSellPrice = 
	{
		fields = "itemid,moneyType,moneyNum,Ibi",
	},

	GS2U_MallBuySuccess = 
	{
		fields = "db_id,haveBuyNum,Ii",
	},

	GS2U_MallInfoList = 
	{
		fields = "$mallinfolist,1",
		[1] = {
			fields = "db_id,itemid,mainmenu,submenu,isBinded,sortNumber,moneyType,moneyNum,discount,limit_targettype,limitType,limitNum,haveBuyNum,buyBeginTime,buyEndTime,limitVipLv,itemNum,IIbbbibibbbssiibb",
		},
	},

	GS2U_MallPriceList = 
	{
		fields = "$mallinfolist,1",
		[1] = {
			fields = "db_id,itemid,mainmenu,submenu,isBinded,sortNumber,moneyType,moneyNum,discount,limit_targettype,limitType,limitNum,haveBuyNum,buyBeginTime,buyEndTime,limitVipLv,itemNum,IIbbbibibbbssiibb",
		},
	},

	GS2U_ServerBuyNum = 
	{
		fields = "db_id,haveBuyNum,Ii",
	},

	U2GS_GetItemSellPrice = 
	{
		fields = "db_id,I",
	},

	U2GS_ItemBuyRequest = 
	{
		fields = "db_id,itemnum,Ii",
	},

	U2GS_MallInfo = 
	{
	},

}
