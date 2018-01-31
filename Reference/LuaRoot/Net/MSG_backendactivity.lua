return {
	GS2U_BackendActivityList = 
	{
		fields = "seed,$list,i1",
		[1] = {
			fields = "id,type,beginTime,endTime,pictureId,title,content,sort,parms,ibiiizziz",
		},
	},

	GS2U_CommonExpense = 
	{
		fields = "id,isCommon,money,convertlist,iti1",
	},

	GS2U_CommonRecharge = 
	{
		fields = "id,isCommon,money,convertlist,iti1",
	},

	GS2U_ContinuousRecharge = 
	{
		fields = "id,day,convertlist,ii1",
	},

	GS2U_DayBuyActivity = 
	{
		fields = "noBuyList,1",
	},

	GS2U_ExchangeActivityInfo = 
	{
		fields = "id,$info,i1",
		[1] = {
			fields = "itemdataId,num,ii",
		},
	},

	GS2U_GetBackendActivitySuccess = 
	{
		fields = "id,subid,ii",
	},

	GS2U_GroupBuy = 
	{
		fields = "id,$convertlist,grouplist,i12",
		[1] = {
			fields = "num,grouptype,ii",
		},
	},

	GS2U_LoginActivityInfo = 
	{
		fields = "id,loginDays,haveGot,ibi",
	},

	GS2U_MultiActivity = 
	{
		fields = "$multiList,1",
		[1] = {
			fields = "beginGold,endGold,coupon,iif",
		},
	},

	GS2U_NewBackendActivity = 
	{
	},

	U2GS_GetBackendActivity = 
	{
		fields = "id,subid,ii",
	},

	U2GS_RequestBackendActivityInfo = 
	{
		fields = "id,i",
	},

	U2GS_RequestBackendActivityList = 
	{
		fields = "seed,i",
	},

	U2GS_RequestMultiActivity = 
	{
	},

}
