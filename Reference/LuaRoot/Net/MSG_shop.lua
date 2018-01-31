return {
	GS2U_FlushShop = 
	{
	},

	GS2U_ForeverFriendValue = 
	{
		fields = "value,i",
	},

	GS2U_GetShop = 
	{
		fields = "source,$shop,Bu",
		[1] = {
			fields = "id,count,time,$infos,iBi1",
			[1] = {
				fields = "id,num,reason,discount,iiBB",
			},
		},
	},

	GS2U_GetShopStatus = 
	{
		fields = "$status,1",
		[1] = {
			fields = "id,status,it",
		},
	},

	GS2U_ShopBuyNormal = 
	{
		fields = "shopId,id,num,remain,iiii",
	},

	GS2U_ShopBuySpacial = 
	{
		fields = "shopId,id,num,iii",
	},

	U2GS_FlushShop = 
	{
		fields = "shopId,itemFlush,it",
	},

	U2GS_ForeverFriendValue = 
	{
	},

	U2GS_GetShop = 
	{
		fields = "shopId,i",
	},

	U2GS_GetShopStatus = 
	{
		fields = "type,B",
	},

	U2GS_ShopBuy = 
	{
		fields = "shopId,id,num,iii",
	},

}
